#include "Pet.h"
#include <mutex>
#include "Chat.h"

#define LILDEBUG

void LilDebug(std::string str, uint32 line)
{
#ifdef LILDEBUG
    std::cout << "Line: " << line << " " << str << std::endl;
#endif
}

#define LILLOG(x) LilDebug(x, __LINE__)

namespace Lil
{
    enum
    {
        LEVENT_NONE,
        LEVENT_LEVELUP,
        LEVENT_KILLCREATURE,
        LEVENT_CREATUREKILL,
        LEVENT_DUELSTART,
        LEVENT_DUELEND,
        LEVENT_DUELWIN,
        LEVENT_DUELLOSS,
        LEVENT_ONSPELLCAST,
        LEVENT_ONLOGIN,
        LEVENT_ONLOGOUT,
        LEVENT_NEWZONE,
        LEVENT_FIRSTLOGIN,
        LEVENT_MAX,
    };

    enum
    {
        LACTION_NONE,
        LACTION_MODMONEY,
        LACTION_GIVEITEM,
        LACTION_CASTSPELL,
        LACTION_LEARNSPELL,
        LACTION_TELEPORT,
        LACTION_TEMPSUMMON,
        LACTION_SETHEALTH,
        LACTION_SETPOWER,
        LACTION_ADDTITLE,
        LACTION_GIVEXP,
        LACTION_ADDITEMSET,
        LACTION_MAX,
    };

    std::string MoneyString(uint32 incopper)
    {
        uint32 gold = incopper / 10000;
        incopper -= gold * 10000;
        uint32 silver = incopper / 100;
        incopper -= silver * 100;
        uint32 copper = incopper;

        std::ostringstream ss;

        if (gold)
            ss << gold << " Gold";
        if (gold && silver)
            ss << ", ";
        if (silver)
            ss << silver << " Silver";
        if (silver && copper)
            ss << ", ";
        if (copper)
            ss << copper << " Copper";

        if (!gold && !silver && !copper)
            ss << "NAH!";

        // #Lovestreams!

        return ss.str();
    }

    std::string GetItemLink(uint32 itemid)
    {
        auto item = sObjectMgr->GetItemTemplate(itemid);
        if (!itemid)
            return "ITEM DOESN'T EXIST";

        std::ostringstream ss;
        std::string color = "cffffffff";

        switch (item->Quality)
        {
        case 0:
            color = "cff9d9d9d";
            break;
        case 1:
            color = "cffffffff";
            break;
        case 2:
            color = "cff1eff00";
            break;
        case 3:
            color = "cff0070dd";
            break;
        case 4:
            color = "cffa335ee";
            break;
        case 5:
            color = "cffff8000";
            break;
        case 6:
        case 7:
            color = "cffe6cc80";
            break;
        default:
            break;
        }

        ss << "|" << color << "| Hitem:" << item->ItemId << " : 0 : 0 : 0 : 0 : 0 : 0 : 0 : 0 | h[" << item->Name1 << "] | h | r";

        return ss.str();

        //| cffffffff | Hitem:%d : 0 : 0 : 0 : 0 : 0 : 0 : 0 : 0 | h[%s] | h | r
    }

    std::string GetSpellLink(uint32 spellid)
    {
        auto spell = sSpellStore.LookupEntry(spellid);
        if (!spell)
            return "SPELL NOT FOUND";

        std::ostringstream ss;

        ss << spell->Id << " - |cffffffff|Hspell:" << spell->Id << "|h[" << spell->SpellName << "]|h|r";

        return ss.str();
    }
}


class LilCondition
{
public:
    bool ConditionMet(Player* pPlayer, uint32 etype, uint32 evalue)
    {
        if (CValue != evalue && CValue != 0)
        {
            LILLOG("Condition Failed! EventCondition value invalid");
            return false;
        }

        if (pPlayer->getRace() != PRace && PRace != 0)
        {
            LILLOG("Condition Failed! Wrong race");
            return false;
        }

        if (pPlayer->getClass() != PClass && PClass != 0)
        {
            LILLOG("Condition Failed! Wrong class");
            return false;
        }

        if (TCConditionType && TCConditionEntry)
        {
            auto list = sConditionMgr->GetConditionsForNotGroupedEntry(ConditionSourceType(TCConditionType), TCConditionEntry);

            if (!sConditionMgr->IsObjectMeetToConditions(pPlayer, list))
            {
                LILLOG("Condition Failed! TC Condition not met");
                return false;
            }
        }

        if (TCGameEventEntry)
        {
            auto activeEvents = sGameEventMgr->GetActiveEventList();

            if (activeEvents.find(TCGameEventEntry) == activeEvents.end())
            {
                LILLOG("Condition Failed! Game event not running");
                return false;
            }
        }

        LILLOG("Condition OK!");

        return true;
    }

    uint32 id;
    uint32 TCConditionType;
    uint32 TCConditionEntry;
    uint16 TCGameEventEntry;
    uint8 PRace;
    uint8 PClass;
    uint32 CValue;
};

class LilEvent
{
public:
    uint32 id;
    uint32 type;
    uint32 condition;
    uint32 action;
};

class LilAction
{
public:
    void PerformAction(Player* pPlayer)
    {
        bool codemsg = message.find("CODEMSG") != std::string::npos;

        ChatHandler handler = ChatHandler(pPlayer->GetSession());

        switch (type)
        {
        case Lil::LACTION_MODMONEY:
        {
                                      pPlayer->ModifyMoney(int32(avalue[0]));
                                      if (codemsg && avalue[0] >= 1)
                                          handler.PSendSysMessage("You received %s", Lil::MoneyString(uint32(avalue[0])).c_str());
        }
            break;

        case Lil::LACTION_GIVEITEM:
        {
                                      if (avalue[0] < 1 || avalue[1] < 1)
                                          return;

                                      if (auto item = sObjectMgr->GetItemTemplate(uint32(avalue[0])))
                                      {
                                          pPlayer->StoreNewItemInBestSlots(item->ItemId, uint32(avalue[1]));

                                          if (codemsg)
                                              handler.PSendSysMessage("You were rewarded with %s", Lil::GetItemLink(item->ItemId).c_str());
                                      }
        }
            break;

        case Lil::LACTION_CASTSPELL:
        {
                                       if (avalue[0] < 1)
                                           return;

                                       auto spell = sSpellStore.LookupEntry(uint32(avalue[0]));
                                       if (!spell)
                                           return;

                                       pPlayer->CastSpell(pPlayer, spell->Id, true);
                                       if (codemsg)
                                           handler.PSendSysMessage("%s was caster on you!", Lil::GetSpellLink(spell->Id).c_str());
        }
            break;

        case Lil::LACTION_LEARNSPELL:
        {
                                        if (avalue[0] < 1)
                                            return;

                                        pPlayer->LearnSpell(uint32(avalue[0]), false);
        }
            break;

        case Lil::LACTION_TELEPORT:
        {
                                      if (avalue[0] < 0)
                                          return;

                                      pPlayer->TeleportTo(uint32(avalue[0]), avalue[1], avalue[2], avalue[3], Position::NormalizeOrientation(avalue[4]));

                                      if (codemsg)
                                      {
                                          auto area = sAreaStore.LookupEntry(pPlayer->GetAreaId());
                                          //handler.PSendSysMessage("You have been teleported to %s", area->area_name);
                                      }
        }
            break;

        case Lil::LACTION_TEMPSUMMON:
        {
                                        if (avalue[0] < 0 || avalue[1] < 0 || avalue[2] < 0)
                                            return;

                                        auto creature = sObjectMgr->GetCreatureTemplate(uint32(avalue[0]));
                                        if (!creature)
                                            return;

                                        Position pos;
                                        pos.m_positionX = pPlayer->GetPositionX();
                                        pos.m_positionY = pPlayer->GetPositionY();
                                        pos.m_positionZ = pPlayer->GetPositionZ();
                                        pos.m_orientation = pPlayer->GetOrientation();

                                        pPlayer->SummonCreature(creature->Entry, pos, TempSummonType(uint32(avalue[1])), uint32(avalue[2]));

                                        if (codemsg)
                                            handler.PSendSysMessage("You have summoned %s!", creature->Name.c_str());
        }
        case Lil::LACTION_SETHEALTH:
        {
                                       pPlayer->SetHealth(float(pPlayer->GetHealth()) * (avalue[0] / 100.f));
                                       if (Pet* pPet = pPlayer->GetPet())
                                       if (avalue[1] > 0)
                                           pPet->SetHealth(float(pPet->GetHealth()) * (avalue[0] / 100.f));

                                       if (codemsg)
                                           handler.PSendSysMessage("Your health was set to %u", pPlayer->GetHealth());

        }
            break;

        case Lil::LACTION_SETPOWER:
        {
                                      pPlayer->SetPower(pPlayer->getPowerType(), pPlayer->GetPower(pPlayer->getPowerType()) * (avalue[0] / 100.f));
                                      if (Pet* pPet = pPlayer->GetPet())
                                      if (avalue[1] > 0)
                                          pPet->SetPower(pPet->getPowerType(), pPet->GetPower(pPet->getPowerType()) * (avalue[0] / 100.f));

                                      if (codemsg)
                                      {
                                          std::string powername = "power";

                                          switch (pPlayer->getPowerType())
                                          {
                                          case POWER_MANA:
                                              powername = "mana";
                                              break;
                                          case POWER_RAGE:
                                              powername = "rage";
                                              break;
                                          case POWER_ENERGY:
                                              powername = "energy";
                                              break;
                                          case POWER_RUNIC_POWER:
                                              powername = "runic power";
                                              break;
                                          default:
                                              break;
                                          }

                                          handler.PSendSysMessage("Your %s has been set to %u", powername.c_str(), pPlayer->GetPower(pPlayer->getPowerType()));
                                      }
        }
            break;

        case Lil::LACTION_ADDTITLE:
        {
                                      CharTitlesEntry const* title = sCharTitlesStore.LookupEntry(uint32(avalue[0]));
                                      if (!title)
                                          return;

                                      pPlayer->SetTitle(title);

                                      if (codemsg){}
                                          //handler.PSendSysMessage("You were awarded with |Htitle:id|h[name]|h!", title->ID, (pPlayer->getGender() == GENDER_MALE ? title->nameMale : title->nameFemale));
        }
            break;

        case Lil::LACTION_GIVEXP:
        {
                                    if (avalue[0] < 1)
                                        return;

                                    pPlayer->GiveXP(uint32(avalue[0]), NULL);

                                    if (codemsg)
                                        handler.PSendSysMessage("%u experience was given to you!", uint32(avalue[0]));
        }
            break;

        case Lil::LACTION_ADDITEMSET:
        {
                                        auto set = sItemSetStore.LookupEntry(uint32(avalue[0]));
                                        if (!set)
                                            return;

                                        for (auto i = 0; i < 10; ++i)
                                        if (auto item = sObjectMgr->GetItemTemplate(set->itemId[i]))
                                            pPlayer->StoreNewItemInBestSlots(item->ItemId, 1);

                                        if (codemsg){}
                                            //handler.PSendSysMessage("You have been rewarded with itemset |Hitemset:%u|h[%s]|h", uint32(avalue[0]), set->name);
        }
            break;

        default:
            break;
        }

        if (!message.empty() && !codemsg)
            handler.PSendSysMessage("%s", message.c_str());
    }

    uint32 id;
    uint32 type;
    float avalue[5];
    std::string message;
};

std::mutex LilMTX;

class LilEvents
{
public:
    static LilEvents* Instance()
    {
        static LilEvents instance;
        return &instance;
    }

    void HandleEvent(Player* pPlayer, uint32 etype, uint32 evalue)
    {
        std::ostringstream ss;
        ss << "HandleEvent: etype: " << etype << " evalue: " << evalue;

        LILLOG(ss.str().c_str());

        for (auto& i : m_Events) // Loop all events
        if (i.type == etype) // Find event with this type
        if (m_Conditions.find(i.condition)->second.ConditionMet(pPlayer, etype, evalue)) // Check if we fullful all conditions
            m_Actions.find(i.action)->second.PerformAction(pPlayer); // Perform the action
    }

    void ForceAction(Player* pPlayer, uint32 id)
    {
        if (m_Actions.find(id) != m_Actions.end())
            m_Actions.find(id)->second.PerformAction(pPlayer);
        else
            ChatHandler(pPlayer->GetSession()).PSendSysMessage("Event with specified id doesn't exist.");
    }

    void LoadEvents()
    {
        m_Events.clear();
        m_Actions.clear();
        m_Conditions.clear();

        auto result1 = WorldDatabase.PQuery("SELECT * FROM lil_events");
        if (!result1)
            return;

        do
        {
            auto fields = result1->Fetch();
            LilEvent curevent;
            curevent.id         = fields[0].GetUInt32();
            curevent.type       = fields[1].GetUInt32();
            curevent.condition  = fields[2].GetUInt32();
            curevent.action     = fields[3].GetUInt32();

            m_Events.push_back(curevent);
        } while (result1->NextRow());

        auto result2 = WorldDatabase.PQuery("SELECT * FROM lil_actions");
        if (!result2)
            return;

        do
        {
            auto fields = result2->Fetch();
            LilAction curaction;
            curaction.id        = fields[0].GetUInt32();
            curaction.type      = fields[1].GetUInt32();
            curaction.avalue[0] = fields[2].GetFloat();
            curaction.avalue[1] = fields[3].GetFloat();
            curaction.avalue[2] = fields[4].GetFloat();
            curaction.avalue[3] = fields[5].GetFloat();
            curaction.avalue[4] = fields[6].GetFloat();
            curaction.message   = fields[7].GetString();

            m_Actions.insert(std::make_pair(curaction.id, curaction));
        } while (result2->NextRow());

        auto result3 = WorldDatabase.PQuery("SELECT * FROM lil_conditions");
        if (!result3)
            return;

        do
        {
            auto fields = result3->Fetch();
            LilCondition curcondition;
            curcondition.id                 = fields[0].GetUInt32();
            curcondition.TCConditionType    = fields[1].GetUInt32();
            curcondition.TCConditionEntry   = fields[2].GetUInt32();
            curcondition.TCGameEventEntry   = fields[3].GetUInt32();
            curcondition.PRace              = fields[4].GetUInt8();
            curcondition.PClass             = fields[5].GetUInt8();
            curcondition.CValue             = fields[6].GetUInt32();

            m_Conditions.insert(std::make_pair(curcondition.id, curcondition));
        } while (result3->NextRow());

        bool removedentry = true;

        while (removedentry) // This will be useful when i add conditions stacking, loop useless for now.
        {
            removedentry = false;

            for (auto itr = m_Events.begin(); itr != m_Events.end();)
            {
                if (m_Actions.find(itr->action) == m_Actions.end() ||
                    m_Conditions.find(itr->condition) == m_Conditions.end())
                {
                    removedentry = true;
                    itr = m_Events.erase(itr);
                }
                else
                    ++itr;
            }
        }

        TC_LOG_INFO("server.loading", "Loaded %u Lilevent events", m_Events.size());
        TC_LOG_INFO("server.loading", "Loaded %u Lilevent actions", m_Actions.size());
        TC_LOG_INFO("server.loading", "Loaded %u Lilevent conditions", m_Conditions.size());
    }

private:
    std::vector<LilEvent> m_Events;
    std::unordered_map<uint32, LilAction> m_Actions;
    std::unordered_map<uint32, LilCondition> m_Conditions;
};

#define sLilEvents LilEvents::Instance()


class PlayerEvents : public PlayerScript
{
public:
    PlayerEvents() : PlayerScript("PlayerEvents") { }

    void OnLevelChanged(Player* pPlayer, uint8)
    {
        sLilEvents->HandleEvent(pPlayer, Lil::LEVENT_LEVELUP, pPlayer->getLevel());
    }

    void OnCreatureKill(Player* pPlayer, Creature* pCreature)
    {
        sLilEvents->HandleEvent(pPlayer, Lil::LEVENT_KILLCREATURE, pCreature->GetEntry());
    }

    void OnPlayerKilledByCreature(Creature* pCreature, Player* pPlayer)
    {
        sLilEvents->HandleEvent(pPlayer, Lil::LEVENT_CREATUREKILL, pCreature->GetEntry());
    }

    void OnDuelStart(Player* pPlayer1, Player* pPlayer2)
    {
        sLilEvents->HandleEvent(pPlayer1, Lil::LEVENT_DUELSTART, 0);
        sLilEvents->HandleEvent(pPlayer2, Lil::LEVENT_DUELSTART, 0);
    }

    void OnDuelEnd(Player* pWinner, Player* pLoser, DuelCompleteType type)
    {
        sLilEvents->HandleEvent(pWinner, Lil::LEVENT_DUELEND, type);
        sLilEvents->HandleEvent(pLoser, Lil::LEVENT_DUELEND, type);

        sLilEvents->HandleEvent(pWinner, Lil::LEVENT_DUELWIN, type);
        sLilEvents->HandleEvent(pLoser, Lil::LEVENT_DUELLOSS, type);
    }

    void OnSpellCast(Player* pPlayer, Spell* pSpell, bool)
    {
        sLilEvents->HandleEvent(pPlayer, Lil::LEVENT_ONSPELLCAST, pSpell->GetSpellInfo()->Id);
    }

    void OnLogin(Player* pPlayer, bool firstlogin)
    {
        if (firstlogin)
            sLilEvents->HandleEvent(pPlayer, Lil::LEVENT_FIRSTLOGIN, 0);
        else
            sLilEvents->HandleEvent(pPlayer, Lil::LEVENT_ONLOGIN, 0);
    }

    void OnLogout(Player* pPlayer)
    {
        sLilEvents->HandleEvent(pPlayer, Lil::LEVENT_ONLOGOUT, 0);
    }

    void OnUpdateZone(Player* pPlayer, uint32 newzone, uint32)
    {
        sLilEvents->HandleEvent(pPlayer, Lil::LEVENT_NEWZONE, newzone);
    }
};

class EventLoader : public WorldScript
{
public:
    EventLoader() : WorldScript("EventLoader") { }

    void OnStartup()
    {
        sLilEvents->LoadEvents();
    }
};

class EventCommands : public CommandScript
{
public:
    EventCommands() : CommandScript("EventCommands") { }

    ChatCommand* GetCommands() const override
    {
        static ChatCommand eventCommandTable[] =
        {
            { "reload", rbac::RBAC_PERM_COMMAND_RELOAD_GAME_TELE, true,  &HandleReloadLevelEvents, "", NULL },
            { "test",   rbac::RBAC_PERM_COMMAND_RELOAD_GAME_TELE, false, &HandleTestAction       , "", NULL },
            { NULL, 0, false, NULL, "", NULL }
        };

        static ChatCommand commandTable[] =
        {
            { "onevent", rbac::RBAC_PERM_COMMAND_RELOAD_GAME_TELE, false, NULL, "", eventCommandTable },
            { NULL, 0, false, NULL, "", NULL }
        };
        return commandTable;
    }

    static bool HandleReloadLevelEvents(ChatHandler* handler, const char*)
    {
        sLilEvents->LoadEvents();
        handler->PSendSysMessage("onlevelup reloaded");

        return true;
    }

    static bool HandleTestAction(ChatHandler* handler, const char* args)
    {
        uint32 ID = atoi(args);
        if (!ID)
            return false;

        sLilEvents->ForceAction(handler->GetSession()->GetPlayer(), ID);

        return true;
    }
};


void AddSC_LevelEvents()
{
    new PlayerEvents;
    new EventLoader;
    new EventCommands;
}
/*
 * Copyright (C) 2008-2015 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

    /* Jail by LordPsyan (Original script by Warhead) */

#include "Common.h"
#include "Chat.h"
#include "Language.h"
#include "Pet.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "AccountMgr.h"
#include "World.h"
#include "Player.h"
#include "WorldSession.h"
#include "DatabaseEnv.h"
#include "AccountMgr.h"
#include "CellImpl.h"
#include "GridNotifiersImpl.h"
#include "Log.h"
#include "ChatLink.h"

class jail_commandscript : public CommandScript
{
public:
    jail_commandscript() : CommandScript("jail_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> jailCommandTable =
        {
            { "player",      rbac::RBAC_PERM_COMMAND_JAIL_INFO,   false, &HandleJailPlayerCommand, "" }, // 901
            { "info",        rbac::RBAC_PERM_COMMAND_JAIL_INFO,   false, &HandleJailInfoCommand,   "" }, // 902
            { "release",     rbac::RBAC_PERM_COMMAND_JAIL_UN,     false, &HandleUnJailCommand,     "" }, // 903
            { "reload",      rbac::RBAC_PERM_COMMAND_JAIL_RELOAD, false, &HandleJailReloadCommand, "" }, // 904
        };
        static std::vector<ChatCommand> commandTable =
        {
            { "jail",   rbac::RBAC_PERM_COMMAND_JAIL,   false, NULL, "", jailCommandTable },
        };
        return commandTable;
    }
    static bool HandleJailPlayerCommand(ChatHandler* handler, char const* args)
    {
    std::string cname, announce, ban_reason, ban_by;
    time_t localtime;
    localtime = time(NULL);

    char *charname = strtok((char*)args, " ");
    if (charname == NULL)
    {
        handler->PSendSysMessage(LANG_JAIL_NONAME);
        return true;
    } else cname = charname;

    char *timetojail = strtok(NULL, " ");
    if (timetojail == NULL)
    {
        handler->PSendSysMessage(LANG_JAIL_NOTIME);
        return true;
    }

    uint32 jailtime = (uint32) atoi((char*)timetojail);
    if (jailtime < 1 || jailtime > sObjectMgr->m_jailconf_max_duration)
    {
        handler->PSendSysMessage(LANG_JAIL_VALUE, sObjectMgr->m_jailconf_max_duration);
        return true;
    }

    char *reason = strtok(NULL, "\0");
    std::string jailreason;
    if (reason == NULL || strlen((const char*)reason) < sObjectMgr->m_jailconf_min_reason)
    {
        handler->PSendSysMessage(LANG_JAIL_NOREASON, sObjectMgr->m_jailconf_min_reason);
        return true;
    } else jailreason = reason;

    ObjectGuid GUID = sObjectMgr->GetPlayerGUIDByName(cname.c_str());
    if (GUID == 0)
    {
        handler->PSendSysMessage(LANG_JAIL_WRONG_NAME);
        return true;
    }

    Player *chr = ObjectAccessor::FindPlayer(GUID);
    if (!chr)
    {
        ObjectGuid::LowType jail_guid = GUID.GetCounter();
        std::string jail_char = cname;
        bool jail_isjailed = true;
        uint32 jail_release = localtime + (jailtime * 60 * 60);
        uint32 jail_amnestietime = localtime +(60* 60 * 24 * sObjectMgr->m_jailconf_amnestie);
        std::string jail_reason = jailreason;
        uint32 jail_times = 0;

        SQLTransaction trans = CharacterDatabase.BeginTransaction();
        QueryResult result = CharacterDatabase.PQuery("SELECT * FROM `jail` WHERE `guid`='%u' LIMIT 1", jail_guid);
        CharacterDatabase.CommitTransaction(trans);

        if (!result)
        {
            jail_times = 1;
        }
        else
        {
            Field *fields = result->Fetch();
            jail_times = fields[5].GetUInt32()+1;
        }

        uint32 jail_gmacc = handler->GetSession()->GetAccountId();
        std::string jail_gmchar = handler->GetSession()->GetPlayerName();

        SQLTransaction trans2 = CharacterDatabase.BeginTransaction();
        if (!result) CharacterDatabase.PExecute("INSERT INTO `jail` VALUES ('%u','%s','%u','%u','%s','%u','%u','%s',CURRENT_TIMESTAMP,'%u')", jail_guid, jail_char.c_str(), jail_release, jail_amnestietime, jail_reason.c_str(), jail_times, jail_gmacc, jail_gmchar.c_str(), jailtime);
        else CharacterDatabase.PExecute("UPDATE `jail` SET `release`='%u', `amnestietime`='%u',`reason`='%s',`times`='%u',`gmacc`='%u',`gmchar`='%s',`duration`='%u' WHERE `guid`='%u' LIMIT 1", jail_release, jail_amnestietime, jail_reason.c_str(), jail_times, jail_gmacc, jail_gmchar.c_str(), jailtime, jail_guid);
        CharacterDatabase.CommitTransaction(trans2);

        handler->PSendSysMessage(LANG_JAIL_WAS_JAILED, cname.c_str(), jailtime);

        announce = handler->GetTrinityString(LANG_JAIL_ANNOUNCE1);
        announce += cname;
        announce += handler->GetTrinityString(LANG_JAIL_ANNOUNCE2);
        announce += timetojail;
        announce += handler->GetTrinityString(LANG_JAIL_ANNOUNCE3);
        announce += handler->GetSession()->GetPlayerName();
        announce += handler->GetTrinityString(LANG_JAIL_ANNOUNCE4);
        announce += jail_reason;

        sWorld->SendServerMessage(SERVER_MSG_STRING, announce.c_str());

        if ((sObjectMgr->m_jailconf_max_jails == jail_times) && !sObjectMgr->m_jailconf_ban)
        {
            PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_CHECK_GUID);
            stmt->setUInt32(0, GUID);
            PreparedQueryResult result = CharacterDatabase.Query(stmt);

            if (!result)
            {
                handler->PSendSysMessage(LANG_NO_PLAYER, cname.c_str());
                return true;
            }

            Field *fields = result->Fetch();

            Player::DeleteFromDB(GUID, fields[1].GetUInt32());
        }
        else if ((sObjectMgr->m_jailconf_max_jails == jail_times) && sObjectMgr->m_jailconf_ban)
        {
            SQLTransaction trans = CharacterDatabase.BeginTransaction();
            QueryResult result = CharacterDatabase.PQuery("SELECT * FROM `characters` WHERE `guid`='%u' LIMIT 1", ObjectGuid::LowType(GUID.GetCounter()));
            CharacterDatabase.CommitTransaction(trans);

            if (!result)
            {
                handler->PSendSysMessage(LANG_NO_PLAYER, cname.c_str());
                return true;
            }
            Field *fields = result->Fetch();
            uint32 acc_id = fields[1].GetUInt32();

            SQLTransaction trans2 = LoginDatabase.BeginTransaction();
            result = LoginDatabase.PQuery("SELECT * FROM `account` WHERE `id`='%u' LIMIT 1", acc_id);
            LoginDatabase.CommitTransaction(trans2);

            if (!result)
            {
                handler->PSendSysMessage(LANG_NO_PLAYER, cname.c_str());
                return true;
            }
            ban_reason = handler->GetTrinityString(LANG_JAIL_BAN_REASON);
            ban_by = handler->GetTrinityString(LANG_JAIL_BAN_BY);

            SQLTransaction trans3 = LoginDatabase.BeginTransaction();
            LoginDatabase.PExecute("INSERT IGNORE INTO `account_banned` (`id`,`bandate`,`bannedby`,`banreason`) VALUES ('%u',UNIX_TIMESTAMP,'%s','%s')", acc_id, ban_by.c_str(), ban_reason.c_str());
            LoginDatabase.CommitTransaction(trans3);

        }
        return true;
    }

    SQLTransaction trans = CharacterDatabase.BeginTransaction();
    QueryResult result = CharacterDatabase.PQuery("SELECT * FROM `characters` WHERE `guid`='%u' LIMIT 1", chr->GetGUID().GetCounter());
    CharacterDatabase.CommitTransaction(trans);

    if (!result)
    {
        handler->PSendSysMessage(LANG_NO_PLAYER, cname.c_str());
        return true;
    }

    Field *fields = result->Fetch();

    if (chr->GetName() == handler->GetSession()->GetPlayerName())
    {
        handler->PSendSysMessage(LANG_JAIL_NO_JAIL);
        return true;
    }

        chr->SaveToDB();

        chr->m_jail_guid = fields[0].GetUInt32();
        chr->m_jail_char = fields[3].GetString();
        chr->m_jail_isjailed = true;
        chr->m_jail_release = localtime + (jailtime * 60 * 60);
        chr->m_jail_amnestietime = localtime +(60* 60 * 24 * sObjectMgr->m_jailconf_amnestie);
        chr->m_jail_reason = jailreason;
        chr->m_jail_times = chr->m_jail_times+1;
        chr->m_jail_gmacc = handler->GetSession()->GetAccountId();
        chr->m_jail_gmchar = handler->GetSession()->GetPlayerName();
        chr->m_jail_duration = jailtime;

        chr->_SaveJail();

        handler->PSendSysMessage(LANG_JAIL_WAS_JAILED, fields[3].GetString().c_str(), jailtime);
        handler->PSendSysMessage(LANG_JAIL_YOURE_JAILED, handler->GetSession()->GetPlayerName(), jailtime);
        handler->PSendSysMessage(LANG_JAIL_REASON, handler->GetSession()->GetPlayerName(), jailreason.c_str());

        announce = handler->GetTrinityString(LANG_JAIL_ANNOUNCE1);
        announce += fields[3].GetString();
        announce += handler->GetTrinityString(LANG_JAIL_ANNOUNCE2);
        announce += timetojail;
        announce += handler->GetTrinityString(LANG_JAIL_ANNOUNCE3);
        announce += handler->GetSession()->GetPlayerName();
        announce += handler->GetTrinityString(LANG_JAIL_ANNOUNCE4);
        announce += chr->m_jail_reason;

        sWorld->SendServerMessage(SERVER_MSG_STRING, announce.c_str());

    if (sObjectMgr->m_jailconf_max_jails == chr->m_jail_times)
    {
        chr->GetSession()->KickPlayer();
        Player::DeleteFromDB(ObjectGuid(HighGuid::Player, fields[0].GetUInt32()), fields[1].GetUInt32(), true, true);
    }
    else if ((sObjectMgr->m_jailconf_max_jails == chr->m_jail_times) && sObjectMgr->m_jailconf_ban)
    {
        uint32 acc_id = chr->GetSession()->GetAccountId();
        ban_reason = handler->GetTrinityString(LANG_JAIL_BAN_REASON);
        ban_by = handler->GetTrinityString(LANG_JAIL_BAN_BY);

        SQLTransaction trans = LoginDatabase.BeginTransaction();
        LoginDatabase.PExecute("INSERT IGNORE INTO `account_banned` (`id`,`bandate`,`bannedby`,`banreason`) VALUES ('%u',UNIX_TIMESTAMP,'%s','%s')", acc_id, ban_by.c_str(), ban_reason.c_str());
        LoginDatabase.CommitTransaction(trans);

        chr->GetSession()->LogoutPlayer(false);
    }
    else chr->GetSession()->LogoutPlayer(false);
    return true;
    }
    
    static bool HandleJailInfoCommand(ChatHandler* handler, char const* args)
    {
    time_t localtime;
    localtime = time(NULL);
    Player *chr = handler->GetSession()->GetPlayer();

    if (chr->m_jail_release > 0)
    {
        uint32 min_left = (uint32)floor(float(chr->m_jail_release - localtime) / 60);

        if (min_left <= 0)
        {
            chr->m_jail_release = 0;
            chr->_SaveJail();
            handler->PSendSysMessage(LANG_JAIL_NOTJAILED_INFO);
            return true;
        }
        else
        {
            if (min_left >= 60) handler->PSendSysMessage(LANG_JAIL_JAILED_H_INFO, (uint32)floor(float(chr->m_jail_release - localtime) / 60 / 60));
            else handler->PSendSysMessage(LANG_JAIL_JAILED_M_INFO, min_left);
            handler->PSendSysMessage(LANG_JAIL_REASON, chr->m_jail_gmchar.c_str(), chr->m_jail_reason.c_str());

            return true;
        }
    }
    else
    {
        handler->PSendSysMessage(LANG_JAIL_NOTJAILED_INFO);
        return true;
    }
    return false;
    }

    static bool HandleUnJailCommand(ChatHandler* handler, char const* args)
    {
    char *charname = strtok((char*)args, " ");
    std::string cname;

    if (charname == NULL) return false;
    else cname = charname;

    ObjectGuid GUID = sObjectMgr->GetPlayerGUIDByName(cname.c_str());
    Player *chr = ObjectAccessor::FindPlayer(GUID);

    if (chr)
    {
        if (chr->GetName() == handler->GetSession()->GetPlayerName())
        {
            handler->PSendSysMessage(LANG_JAIL_NO_UNJAIL);
            return true;
        }

        if (chr->m_jail_isjailed)
        {
            chr->m_jail_isjailed = false;
            chr->m_jail_release = 0;
            chr->m_jail_times = chr->m_jail_times-1;

            chr->_SaveJail();

            if (chr->m_jail_times == 0)
            {
                SQLTransaction trans = CharacterDatabase.BeginTransaction();
                CharacterDatabase.PQuery("DELETE FROM `jail` WHERE `guid`='%u' LIMIT 1", chr->GetGUID().GetCounter());
                CharacterDatabase.CommitTransaction(trans);
            }

            handler->PSendSysMessage(LANG_JAIL_WAS_UNJAILED, cname.c_str());
            handler->PSendSysMessage(LANG_JAIL_YOURE_UNJAILED);    
            chr->CastSpell(chr,8690,false);
            //chr->GetSession()->LogoutPlayer(false);
        } else handler->PSendSysMessage(LANG_JAIL_CHAR_NOTJAILED, cname.c_str());
        return true;
    }
    else
    {
        SQLTransaction trans = CharacterDatabase.BeginTransaction();
        QueryResult jresult = CharacterDatabase.PQuery("SELECT * FROM `jail` WHERE `guid`='%u' LIMIT 1", ObjectGuid::LowType(GUID.GetCounter()));
        CharacterDatabase.CommitTransaction(trans);

        if (!jresult)
        {
            handler->PSendSysMessage(LANG_JAIL_CHAR_NOTJAILED, cname.c_str());
            return true;
        }
        else
        {
            Field *fields = jresult->Fetch();
            uint32 jail_times = fields[4].GetUInt32()-1;

            if (jail_times == 0)
            {
                SQLTransaction trans = CharacterDatabase.BeginTransaction();
                CharacterDatabase.PQuery("DELETE FROM `jail` WHERE `guid`='%u' LIMIT 1", fields[0].GetUInt32());
                CharacterDatabase.CommitTransaction(trans);
            }
            else
            {
                SQLTransaction trans = CharacterDatabase.BeginTransaction();
                CharacterDatabase.PQuery("UPDATE `jail` SET `release`='0',`times`='%u' WHERE `guid`='%u' LIMIT 1", jail_times, fields[0].GetUInt32());
                CharacterDatabase.CommitTransaction(trans);
            }

            handler->PSendSysMessage(LANG_JAIL_WAS_UNJAILED, cname.c_str());
            return true;
        }

    }
    return true;
    }

    static bool HandleJailReloadCommand(ChatHandler* handler, char const* args)
    {
    sObjectMgr->LoadJailConf();
    handler->PSendSysMessage(LANG_JAIL_RELOAD);
    return true;
    }
};

void AddSC_jail_commandscript()
{
    new jail_commandscript();
}

        
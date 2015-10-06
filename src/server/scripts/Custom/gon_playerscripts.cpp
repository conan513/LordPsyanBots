#include "ScriptMgr.h"
#include "Player.h"
#include "GuildMgr.h"

#define GUILD_ID_ALLIANCE 45 //Guild ID
#define GUILD_ID_HORDE   46 //Guild ID

class gon_playerscripts : public PlayerScript
{
    public:
        gon_playerscripts() : PlayerScript("gon_playerscripts") { }

   void OnLogin(Player* player, bool firstLogin)
    {
        if (firstLogin)
        {
            Guild* guild = sGuildMgr->GetGuildById(player->GetTeam() == ALLIANCE ? GUILD_ID_ALLIANCE : GUILD_ID_HORDE);

            if (guild)
                guild->AddMember(player->GetGUID());
        }
    }
};

void AddSC_gon_playerscripts()
{
    new gon_playerscripts();
}
#include "../../../pchdef.h"
#include "../../playerbot.h"
#include "../../PlayerbotFactory.h"
#include "ApplyLevelAction.h"


using namespace ai;

bool ApplyLevelAction::Execute(Event event)
{
    ostringstream out;
    
    Player* bot = ai->GetBot();
    PlayerbotFactory factory(bot, bot->getLevel());
    factory.ApplyLevel();
    
    out << "Level applied.";
    
    ai->TellMaster(out);
    return true;
}

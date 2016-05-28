#pragma once

#include "../Action.h"

namespace ai
{
    class ApplyLevelAction : public Action {
    public:
        ApplyLevelAction(PlayerbotAI* ai) : Action(ai, "joke") {}
        virtual bool Execute(Event event);
    };

}
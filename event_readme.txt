#### EventID:
```
Only used for debugging purposes
.onevent test ID
```

#### ConditionType:
```
Table: conditions
Column: SourceTypeOrReferenceId

Read how condition system works, or keep on 0
```

#### ConditionEntry:
```
Table: conditions
Column: SourceEntry
```

#### GameEventEntry:
```
Table: game_event
Column: eventEntry
If you enter a number here, the event & action will not be performed unless the event with specificed ID is running.
```

#### Eventtype:
|Event               | ID | Explanation                         |
|--------------------|----|-------------------------------------|
|PEVENT_LEVELUP      | 1  | Run action if player levels up      |
|PEVENT_KILLCREATURE | 2  | Run action if player kills creature |
|PEVENT_CREATUREKILL | 3  | Run action if creature kills player |
|PEVENT_DUELSTART    | 5  | Run action on duel start            |
|PEVENT_DUELEND      | 6  | Run action on duel end              |
|PEVENT_DUELWIN      | 7  | Run action on duel win              |
|PEVENT_DUELLOSS     | 8  | Run action on duel loss             |
|PEVENT_ONSPELLCAST  | 9  | Run action on spellcast             |
|PEVENT_ONLOGIN      | 10 | Run action on login                 |
|PEVENT_ONLOGOUT     | 11 | Run action on logout                |
|PEVENT_NEWZONE      | 12 | Run action when entering new zone   |
|PEVENT_FIRSTLOGIN   | 13 | Run action on first login           |

#### Here's what eventvalue means for different eventtypes:

PEVENT_LEVELUP:
```
What level you reached
```
PEVENT_KILLCREATURE:
```
Id of creature you killed
```
PEVENT_CREATUREKILL:
```
Id of creature who killed you
```
PEVENT_DUELSTART, PEVENT_DUELEND, PEVENT_DUELWIN, PEVENT_DUELLOSS:
```
DuelCompleteType:
DUEL_INTERRUPTED = 0 (/forfeit etc..)
DUEL_WON         = 1
DUEL_FLED        = 2 (Ran away from duel)
```
PEVENT_ONSPELLCAST:
```
Id of spell being casted
```
PEVENT_ONLOGIN, PEVENT_ONLOGOUT:
```
Absolutely nothing
```
PEVENT_NEWZONE:
```
Id of new zone entered!
```

NOTE: Eventvalue 0 will accept any spellid, creatureid etc...

#### Level: The level when the action will occur
#### Class: The class ID of the class this should happen to (0 means all)


|Class       | ID|
|------------|---|
|WARRIOR     | 1 |
|PALADIN     | 2 |
|HUNTER      | 3 |
|ROGUE       | 4 |
|PRIEST      | 5 |
|DEATH_KNIGHT| 6 |
|SHAMAN      | 7 |
|MAGE        | 8 |
|WARLOCK     | 9 |
|DRUID       | 11|

#### Race: The Race ID of the Race this should happen to (0 means all)

|Race     | ID|
|---------|---|
|HUMAN    | 1 |
|ORC      | 2 |
|DWARF    | 3 |
|NIGHTELF | 4 |
|UNDEAD   | 5 |
|TAUREN   | 6 |
|GNOME    | 7 |
|TROLL    | 8 |
|BLOODELF | 10|
|DRAENEI  | 11|

#### Action: The action id

|Action            | ID |
|------------------|----|
|ACTION_MODMONEY   | 1  |
|ACTION_GIVEITEM   | 2  |
|ACTION_CASTSPELL  | 3  |
|ACTION_LEARNSPELL | 4  |
|ACTION_TELEPORT   | 5  |
|ACTION_TEMPSUMMON | 6  |
|ACTION_SETHEALTH  | 7  |
|ACTION_SETPOWER   | 8  |
|ACTION_ADDTITLE   | 9  |
|ACTION_GIVEXP     | 10 |
|ACTION_ADDITEMSET | 11 |


#### Here's what valueA - valueE means for different actions:

###### ACTION_MODMONEY:
```
valueA = Amount of copper to give to player
```

###### ACTION_GIVEITEM:
```
valueA = ItemID
valueB = How many to give
```

###### ACTION_CASTSPELL:
```
valueA = Spell to cast on player
```

###### ACTION_LEARNSPELL:
```
valueA = Spell to learn to player
```

###### ACTION_TELEPORT:
```
valueA = mapid
valueB = x
valueC = y
valueD = z
valueE = orientation
```

###### ACTION_TEMPSUMMON:
```
valueA = CreatureID
valueB = TempSummonType* (I would say use 3, it's safe.)
valueC = DespawnTime (milliseconds)
```

ACTION_SETHEALTH
```
valueA = % of health to set on player
valueB = If more then 0 it affects pets as well.
```
ACTION_SETPOWER
```
valueA = % of power to set on player
valueB = If more then 0 it affects pets as well.
```
ACTION_ADDTITLE
```
valueA = TitleID
```
ACTION_GIVEXP
```
valueA = Amount of XP
```
ACTION_ADDITEMSET
```
valueA = Itemset ID
```
*

|TempSummonType                         | ID | Explanation                                                         |
|---------------------------------------|----|---------------------------------------------------------------------|
|TEMPSUMMON_TIMED_OR_DEAD_DESPAWN       | 1  | despawns after a specified time OR when the creature disappears     |
|TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN     | 2  | despawns after a specified time OR when the creature dies           |
|TEMPSUMMON_TIMED_DESPAWN               | 3  | despawns after a specified time                                     |
|TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT | 4  | despawns after a specified time after the creature is out of combat |
|TEMPSUMMON_CORPSE_DESPAWN              | 5  | despawns instantly after death                                      |
|TEMPSUMMON_CORPSE_TIMED_DESPAWN        | 6  | despawns after a specified time after death                         |
|TEMPSUMMON_DEAD_DESPAWN                | 7  | despawns when the creature disappears                               |
|TEMPSUMMON_MANUAL_DESPAWN              | 8  | despawns when UnSummon() is called                                  |


#### Message
```
A message that will be sent along with the reward.
If message contains the text CODEMSG message will be overriden by a hardcoded message with reward text.
```
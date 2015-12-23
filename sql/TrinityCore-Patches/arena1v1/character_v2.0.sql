-- Delete all 5v5 teams and members (core will crash if any 5v5 team exist)
DELETE arena_team_member, arena_team FROM arena_team_member, arena_team WHERE arena_team_member.arenaTeamId = arena_team.arenaTeamId AND arena_team.type = 5;

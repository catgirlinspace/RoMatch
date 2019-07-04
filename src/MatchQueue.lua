local t -- require t

local MatchQueue = {}
MatchQueue.__index = MatchQueue

local IMatchQueueOptions = t.interface({
	maxPlayersPerMatch = t.t.integer, -- Maximum players in a match/lobby
	minPlayersPerMatch = t.integer, -- Minimum players in a match/lobby

	startingRankReach = t.numberPositive,  -- How close players need to be to the average of the lobby to join if they haven't waited at all
	endingRankReach = t.numberPositive, -- How close players need to be to the average of the lobby to join if they have waited the maxWaitTime

	maxWaitTime = t.numberPositive, -- Used for startingRankReach and endingRankReach
	maxMatchAliveTime = t.numberPositive, -- Indicates how long a match should wait before it is forcefully begun

	defaultRank = t.number, -- The default rank for players without a rank

	teleportPlace = t.optional(t.integer), -- The place to teleport to. Used for generating an access code. If this is a non-nil value then online matchmaking is enabled (not avaliable yet)
})

function MatchQueue.new(options)
	assert(IMatchQueueOptions(options))

	local newMatchQueue = setmetatable({}, MatchQueue)

	-- TODO
	newMatchQueue.players = {}

	return newMatchQueue
end

local IPlayerOptions = t.interface({
	playerId = t.string, -- Any way to identify the player. Does not have to be a user id. 
	rank = t.optional(t.number), -- The rank of the player for matchmaking. If not specified then the match queue default is used
})

function MatchQueue:addPlayer(options)
	-- TODO
end

return MatchQueue
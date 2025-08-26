--
-- This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
-- distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
--

local HttpService = game:GetService("HttpService")
local LocalizationService = game:GetService("LocalizationService")
local RunService = game:GetService("RunService")

type ShardData = {
	{
		id: number,
		displayName: string,
		countries: { string },
	}
}

local BUILTIN_DATA = require(script.shardData) :: ShardData
local DEFAULT_SHARD_JSON = "https://oss.playcurrent.com/shards/data/shards.json"

local ShardData: ShardData = BUILTIN_DATA

local function getShardForCountry(country: string): number
	for _, shard in ShardData do
		for _, shardCountry in shard.countries do
			if shardCountry == country then
				return shard.id
			end
		end
	end

	warn("[Shards] No shard found for country", country, "defaulting to Other shard")

	return -1
end

local function getShardForPlayer(player: Player): number
	local country = LocalizationService:GetCountryRegionForPlayerAsync(player)

	return getShardForCountry(country)
end

local function getShardName(id: number): string
	for _, shard in ShardData do
		if shard.id == id then
			return shard.displayName
		end
	end

	return "Other"
end

local function loadRemoteShardData(url: string?)
	if RunService:IsClient() then
		error("can't load remote shard data on the client", 2)
	end

	local success, result = pcall(function()
		return HttpService:GetAsync(url or DEFAULT_SHARD_JSON)
	end)

	if success then
		-- we are very much just trusting this data, but the official data will always be correct, so only user-provided
		-- URLs are sketchy
		ShardData = HttpService:JSONDecode(result)
	else
		warn(`[Shards] Could not load remote shard data, will use existing data instead: {result}`)
	end
end

return {
	getShardForCountry = getShardForCountry,
	getShardForPlayer = getShardForPlayer,
	getShardName = getShardName,

	loadRemoteShardData = loadRemoteShardData,
}

# Shards

Shards is a small little utility library for aspiring matchmakers who want to be able to optimize player latency without
too much faff. This library is used in [Basketball: Zero](https://www.roblox.com/games/130739873848552/-)'s ranked
gamemode to a great degree of success.

## FAQ

### Why a package?

The biggest benefit is that the shard data can be updated remotely, so if an unexpected country code shows up or if
Roblox releases new server regions, we can quickly update games to start using the new entries without needing to release
a game update. Plus, it provides a small little API for people to use to make it easier.

### Why do shards have numerical IDs?

A lot of matchmaking systems actually have quite a hard time with strings. For instance, Amazon's GameLift FlexMatch
(funnily enough, what we use at BB:Z) really does not play nice with string equality in expansion rules, so a numerical
ID is provided as an alternative.

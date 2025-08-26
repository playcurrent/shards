# Contribution Guide

So, you wanna contribute to our data or to the package? You are very welcome to, just read the guide below to make sure
what you're doing is a-okay.

## Package Updates

### AI Generation Policy

We will not accept pull requests that are written completely with AI. These sorts of contributions signify that effort
was not put in to the pull request, and do not inspire any confidence that what is being contributed is functional. Please
put in human work to your contributions, rather than relying on an AI tool to do the work for you.

For tools such as Copilot, make sure the generated code works and has been modified to fit with the project's codestyle.
Do not blindly trust generated code to be functional.

## Data Updates

### Adding/Removing Shards

If you are adding or removing a new sharding region, please document in your pull request *why* you believe the shard
should or shouldn't exist, and make sure that you are not reusing an ID. Shard IDs are forever incremental, even if a
shard is removed, to prevent accidental cross-region mixups. Remember, this data is used in production, so we **CANNOT**
release a broken data update.

### Adding/Moving Countries

If you are moving a country around, or adding a new one that may have just come into existence, please note down sources
and reasoning for why a country should be in a specific shard. Ideally, put them in shards that are closest to the servers
Roblox will put the players in.

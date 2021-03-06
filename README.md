# Roblox Discord Webhook

Discord Webhook Libary to Sending Discord Webhooks from Roblox

## Installation 

Enable "Allow HTTP Rquests" in Game Settings or Rojo Config

### Method-1 
Use Wally -> https://wally.run/package/newspicel/discordwebhook
### Method-2
Copy [DiscordWebhook.lua](./src/DiscordWebhook.lua) in own Module Script
### Method-3
Use Builded .rbxmx and import into Serverscript Folder


## Usage

1. Import Script into your Script
```lua
local discordWebhook = require(game:GetService("ServerScriptService").DiscordWebhook.DiscordWebhook)
```

2. Import Webhook & Embed Class 
```lua
local Embed = discordWebhook.Embed
local Webhook = discordWebhook.Webhook
```
3. Use Webhook and Embed Builder, like Builder in other Discord Libraries 
```lua
local embed: Embed = Embed.new()

embed:setTitle("Title"):setDescription("Description"):setColor(0xFF0000):addField("Field 2", "Value 2", false)

local webhook_1 = Webhook.new()

webhook_1:setContent("Test"):setUsername("Test"):addEmbed(embed)

```

4. Send Webhook
```lua
local url = ""
discordWebhook.sendDiscordWebhook(url, webhook_1)
```

## Methods

### Webhook
```lua
Webhook.new()
webhook:setContent(content: string)
webhook:setUsername(username: string)
webhook:setAvatarURL(avatarURL: string)
webhook:addEmbed(embed: Embed)
```

### Embed
```lua
Embed.new()
embed:setTitle(title: string)
embed:setDescription(description: string)
embed:setUrl(url: string)
embed:setColor(color: number)
embed:setTimestamp(timestamp: string)
embed:setFooter(footer: string, icon_url: string?)
embed:setImage(url: string)
embed:setThumbnail(url: string)
embed:setAuthor(name: string, url: string?, icon_url: string?)
embed:addField(name: string, value: string, inline: boolean?)
embed:setVideo(url: string)
embed:setProvider(name: string, url: string)
```

## Proxy
When you become 403 when you sending Webhooks on Roblox server, use a Proxy like: https://webhook.lewistehminerz.dev/
Usage: Simply replace discord.com with webhook.lewistehminerz.dev in your webhook URL when sending. That's it.

Or setup your own Proxy: https://github.com/LewisTehMinerz/webhook-proxy
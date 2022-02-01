local discordWebhook = require(game:GetService("ServerScriptService").DiscordWebhook.DiscordWebhook)

local Embed = discordWebhook.Embed
local Webhook = discordWebhook.Webhook

local embed: Embed = Embed.new()

embed:setTitle("Title"):setDescription("Description"):setColor(0xFF0000):setTimestamp("2020-01-01T00:00:00Z"):setFooter("Footer", "https://example.com/footer.png"):setImage("https://example.com/image.png"):setThumbnail("https://example.com/thumbnail.png"):setAuthor("Author", "https://example.com/author.png", "https://example.com/author.png"):addField("Field 1", "Value 1", true):addField("Field 2", "Value 2", false):setVideo("https://example.com/video.mp4")

local webhook_1 = Webhook.new()


webhook_1:setContent("Test"):setUsername("Test"):addEmbed(embed)

print(webhook_1)

local url = ""
print(discordWebhook.sendDiscordWebhook(url, webhook_1))



local httpService = game:GetService("HttpService")

-- Classes

Webhook = {}

local __meta_webhook = { __index = Webhook }

Embed = {}

local __meta_embed = { __index = Embed }

type Embed = {
	title: string,
	description: string,
	url: string,
	color: number,
	timestamp: string,
	footer: table,
	image: table,
	thumbnail: table,
	author: table,
	fields: table,
	video: table,
}

type Webhook = { content: string, username: string, avatar_url: string, tts: boolean, embeds: Array<Embed> }

-- Sending Messages

function sendDiscordWebhook(url, webhook: Webhook)
	local dataString = httpService:JSONEncode(webhook)
	local response = httpService:PostAsync(url, dataString, Enum.HttpContentType.ApplicationJson, false, nil)
	return response
end

-- Webhook

function Webhook.new()
	local new_instance = {
		tts = false,
	}
	setmetatable(new_instance, __meta_webhook)
	return new_instance
end

function Webhook:setContent(content: string)
	self.content = content
	return self
end

function Webhook:setUsername(username: string)
	self.username = username
	return self
end

function Webhook:setAvatarURL(avatarURL: string)
	self.avatar_url = avatarURL
	return self
end

function Webhook:addEmbed(embed: Embed)
	if not self.embeds then
		self.embeds = {}
	end
	table.insert(self.embeds, embed)
	return self
end

-- Embed

function Embed.new()
	local new_instance = {
		type = "rich",
	}
	setmetatable(new_instance, __meta_embed)
	return new_instance
end

function Embed:setTitle(title: string)
	self.title = title
	return self
end

function Embed:setDescription(description: string)
	self.description = description
	return self
end

function Embed:setUrl(url: string)
	self.url = url
	return self
end

function Embed:setColor(color: number)
	self.color = color
	return self
end

function Embed:setTimestamp(timestamp: string)
	self.timestamp = timestamp
	return self
end

function Embed:setFooter(footer: string, icon_url: string?)
	self.footer = {
		text = footer,
		icon_url = icon_url,
	}
	return self
end

function Embed:setImage(url: string)
	self.image = {
		url = url,
	}
	return self
end

function Embed:setThumbnail(url: string)
	self.thumbnail = {
		url = url,
	}
	return self
end

function Embed:setAuthor(name: string, url: string?, icon_url: string?)
	self.author = {
		name = name,
		url = url,
		icon_url = icon_url,
	}
	return self
end

function Embed:addField(name: string, value: string, inline: boolean?)
	if not self.fields then
		self.fields = {}
	end
	table.insert(self.fields, {
		name = name,
		value = value,
		inline = inline,
	})
	return self
end

function Embed:setVideo(url: string)
	self.video = {
		url = url,
	}
	return self
end

function Embed:setProvider(name: string, url: string)
	self.provider = {
		name = name,
		url = url,
	}
	return self
end

return {
	Webhook = Webhook,
	Embed = Embed,
	sendDiscordWebhook = sendDiscordWebhook,
}

Info={}
Info.name="随机涩图"
Info.author="ooooonly"
Info.version="1.0"
Info.description="试着向机器人发送‘色图’"

Event.onLoad = function(bot)
    bot:subscribeGroupMsg(function(bot, msg, group, sender)
        if msg:find("hso") or msg:find("色图") or msg:find("不够色") then
            group:sendMsg(Image(Net.get("https://api.lolicon.app/setu/"):match('"url":"(.-)"'):gsub("\\", ""), group))
        end
    end)
end

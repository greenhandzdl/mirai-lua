Info={}
Info.name="随机涩图2"
Info.author="ooooonly"
Info.version="1.0"
Info.description="试着向机器人发送‘色图’"

Event.onLoad = function(bot)
    bot:subscribeGroupMsg(function(bot, msg, group, sender)
        if msg:find("hso") or msg:find("色图") or msg:find("不够色") then
            group:sendImg(Http.getRedirectUrl("https://api.r10086.com/%E5%8A%A8%E6%BC%AB%E7%BB%BC%E5%90%881.php","https://img.r10086.com/"))
        end
    end)
end
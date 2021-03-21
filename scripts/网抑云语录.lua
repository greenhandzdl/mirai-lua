Info={}
Info.name="网抑云"
Info.author="wyl"
Info.version="0.1"
Info.description="一个简单的网抑云语录"

Event.onLoad = 
    function (bot)

        print("载入网抑云语录bot"..bot:getId().."成功")
bot:subscribeFriendMsg(
    function(bot, msg, sender)
        if msg:find("来点网抑云") then
            api_json = net.get("http://api.heerdev.top:4995/nemusic/random")
            api_msg = api_json:match([["text":"(.-)"}]])
            sender:sendMsg(Msg():setQuote(msg)+api_msg)
        end
    end
)
bot:subscribeGroupMsg(
    function(bot, msg, group, sender)        
    	if msg:find("来点网抑云") then
            api_json = net.get("http://api.heerdev.top:4995/nemusic/random")
            api_msg = api_json:match([["text":"(.-)"}]])
            group:sendMsg(Msg():setQuote(msg)+api_msg)
        end
    end
)


end



Event.onFinish = 
function ()
print("脚本被卸载！")
end
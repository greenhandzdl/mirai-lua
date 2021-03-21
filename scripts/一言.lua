Info={}
Info.name="一言"
Info.author="wyl"
Info.version="0.1"
Info.description="一言"

Event.onLoad = 
    function (bot)

        print("载入bot"..bot:getId().."成功")
bot:subscribeFriendMsg(
    function(bot, msg, sender)
        if msg == ("一言")  then
            sender:sendMsg( Msg():setQuote(msg)+"你要的一言来了:\n"+net.get("https://api.ixiaowai.cn/ylapi/index.php"))
        end
    end
)
bot:subscribeGroupMsg(
    function(bot, msg, group, sender)        
        if msg == ("一言")  then
            group:sendMsg( Msg():setQuote(msg)+"你要的一言来了:\n"+net.get("https://api.ixiaowai.cn/ylapi/index.php"))
        end
    end
)


end



Event.onFinish = 
function ()
print("脚本被卸载！")
end
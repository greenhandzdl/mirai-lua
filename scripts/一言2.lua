Info={}
Info.name="另一个一言"
Info.author="wyl"
Info.version="0.2"
Info.description="一个简单的一言"

Event.onLoad = 
    function (bot)

        print("载入bot"..bot:getId().."成功")
bot:subscribeFriendMsg(
    function(bot, msg, sender)
        if msg:find("一言")  then
            source = net.get("https://v1.hitokoto.cn"):match([["from":"(.-)","]])
            author = net.get("https://v1.hitokoto.cn"):match([["creator":"(.-)","]])
            yiyan = net.get("https://v1.hitokoto.cn"):match([["hitokoto":"(.-)","type"]])
            sender:sendMsg( Msg():setQuote(msg)+yiyan+"\n来源:"+source+"\n作者:"+author)
        end
    end
)
bot:subscribeGroupMsg(
    function(bot, msg, group, sender)        
        if msg:find("一言")  then
            source = net.get("https://v1.hitokoto.cn"):match([["from":"(.-)","]])
            author = net.get("https://v1.hitokoto.cn"):match([["creator":"(.-)","]])
            yiyan = net.get("https://v1.hitokoto.cn"):match([["hitokoto":"(.-)","type"]])
            group:sendMsg( Msg():setQuote(msg)+yiyan+"\n来源:"+source+"\n作者:"+author)
        end
    end
)


end



Event.onFinish = 
function ()
print("脚本被卸载！")
end
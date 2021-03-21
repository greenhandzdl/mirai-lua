Info={}
Info.name="青云客聊天"
Info.author="wyl"
Info.version="0.1"
Info.description="一个简单的聊天bot"

Event.onLoad = 
    function (bot)

        print("载入青云客聊天bot"..bot:getId().."成功")

bot:subscribeFriendMsg(
    function(bot, msg, sender)
        if msg:find("##") then
            api_value = msg:gsub("##","")
            api_json = net.get("http://api.qingyunke.com/api.php?key=free&appid=0&msg=" .. api_value)
            api_msg = api_json:gsub("{\"result\":0,\"content\":\"",""):gsub("\"}",""):gsub("{br}","\n"):gsub("{\"result\":1,\"content\":\"",""):gsub("菲菲","cqname"):gsub("你特么滚！我老公是tianyu","该词条已删除")
            sender:sendMsg(Msg():setQuote(msg)+api_msg)
        end
    end
)
bot:subscribeGroupMsg(
    function(bot, msg, group, sender)		
    	if msg:find("##") then
            api_value = msg:gsub("##","")
            api_json = net.get("http://api.qingyunke.com/api.php?key=free&appid=0&msg=" .. api_value)
            api_msg = api_json:gsub("{\"result\":0,\"content\":\"",""):gsub("\"}",""):gsub("{br}","\n"):gsub("{\"result\":1,\"content\":\"",""):gsub("菲菲","cqname"):gsub("你特么滚！我老公是tianyu","该词条已删除")
            group:sendMsg(Msg():setQuote(msg)+api_msg)
        end
    end
)

end



Event.onFinish = 
function ()
print("脚本被卸载！")
end
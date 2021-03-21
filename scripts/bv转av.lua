Info={}
Info.name="B站bv转av的bot"
Info.author="wyl"
Info.version="0.1"
Info.description="一个简单bv转av bot"

Event.onLoad = 
    function (bot)

        print("载入bot"..bot:getId().."成功")
bot:subscribeFriendMsg(
    function(bot, msg, sender)
        if msg:find("bv转av") or msg:find("AV转BV") then
            sender:sendMsg("输入\"获取av号\"+BV(bv)+BV号即可获取AV号")
        end

        if msg:find("获取av号") then
            api_value = msg:gsub("获取av号","")
            api_json = net.get("https://api.tzg6.com/api/bilibv?bv=" .. api_value)
            api_msg = api_json:gsub([[{"status":"ok","av":"]],""):gsub("\"}",""):gsub([[{"status":"error","av":"Decoding failed.]],"获取AV号失败")
            sender:sendMsg(Msg():setQuote(msg)+api_msg)
        end
    end
)
bot:subscribeGroupMsg(
    function(bot, msg, group, sender)		
        if msg:find("bv转av") or msg:find("AV转BV") then
            group:sendMsg("输入\"获取av号\"+BV(bv)+BV号即可获取AV号")
        end
        
    	if msg:find("获取av号") then
            api_value = msg:gsub("获取av号","")
            api_json = net.get("https://api.tzg6.com/api/bilibv?bv=" .. api_value)
            api_msg = api_json:gsub([[{"status":"ok","av":"]],""):gsub("\"}",""):gsub([[{"status":"error","av":"Decoding failed.]],"获取AV号失败")
            group:sendMsg(Msg():setQuote(msg)+api_msg)
        end
    end
)


end



Event.onFinish = 
function ()
print("脚本被卸载！")
end
Info={}
Info.name="指定涩图"
Info.author="blackchor"
Info.version="1.1"
Info.description="试着向机器人发送‘st’+关键词"
--[[  说明：本插件根据ooooonly写的随机涩图进行了一些修改，opensourcefuture进行了一些修正
apikey的申请需要用到的工具:tg，条件：科学上网
apikey申请地址：https://t.me/loliconApiBot
_18为r18的控制开关，填写0为无r18，1为全r18，2为混合
]]
Event.onLoad = function(bot)
	print("载入涩图bot"..bot:getId().."成功")
	_apikey = ""    --请在""中输入apikey
	--私聊
    bot:subscribeFriendMsg(function(bot, msg, sender)
		_r18 = 0
        if msg:find("st") then
            api_value = msg:gsub("st","")
			api_url = ("https://api.lolicon.app/setu/?apikey=" .. _apikey .. "&r18=" .. _r18 .. "&keyword=" .. api_value)
			setu_url =net.get(api_url):match('"url":"(.-)"'):gsub("\\", "")
			--sender:sendMsg(setu_url)
            sender:sendMsg(Image(setu_url,sender))
			
        end
    end)
	--群聊
	bot:subscribeGroupMsg(function(bot, msg, group, sender)
		_r18 = 0
        if msg:find("st") then
            api_value = msg:gsub("st","")
			api_url = ("https://api.lolicon.app/setu/?apikey=" .. _apikey .. "&r18=" .. _r18 .. "&keyword=" .. api_value)
			setu_url =net.get(api_url):match('"url":"(.-)"'):gsub("\\", "")
			--group:sendMsg(setu_url)
			group:sendMsg(Image(setu_url, group))
			
        end
    end)
end

Event.onFinish = 
    function ()
        print("脚本被卸载！")
    end
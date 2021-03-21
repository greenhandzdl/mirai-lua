Info={}
Info.name="目力先辈"
Info.author="Mayuri1145141919810号机"
Info.version="1145141919810"
Info.description="目力先辈"
Event.onLoad = function(bot)
	print("出现了一股恶臭"..bot:getId())
	--等待有缘人1145141919810一下
    bot:subscribeGroupMsg(function(bot, msg, group, sender)
        if msg == ("好臭啊") or msg:find("怎么这么臭") then
			group:sendMsg("")
		end
		
		if msg:find("******") then
			group:sendMsg("********")
		end

		if msg:find("********") then
			group:sendMsg("******")
		end
		 
		if msg == ("**********") then
			group:sendMsg("**************")
		end
		 
		if msg:find("1145141919810") then
			group:sendMsg( Msg():setQuote(msg) ..  "好臭啊")
	 	end
    end)

Event.onFinish = 
    function ()
        print("臭味消失了！")
    end
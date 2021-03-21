Info={}
Info.name="未来"
Info.author="Mayuri"
Info.version="1.0"
Info.description="没有未来的未来不是我想要的未来"
Event.onLoad = function(bot)
	print("欢迎来到未来"..bot:getId())
    bot:subscribeGroupMsg(function(bot, msg, group, sender)
        if msg:find("舔") or msg:find("刘老板") then
			group:sendMsg("刘老板太强了")
		end
		
		if msg:find("了吗") then
			group:sendMsg("你去pr就有了")
		end

		if msg:find("怎么") then
			group:sendMsg("你没读未来！！！")
		end
		
		if msg:find("是不是") then
			group:sendMsg("你说是就是，不是就不是！")
		end
		
		if msg:find("tql") then
			group:sendMsg("tql")
		end

		if msg:find("爬") then
			group:sendMsg("说吧，宁又想欺负谁？")
		end
		
		if msg:find("是什么") then
			group:sendMsg("你去百度就知道了！！！")
		end
		 
		if msg == ("你去pr就有了") then
			group:sendMsg("我去pr了还是没有")
		end
		 
		if msg:find("不够色") then
			group:sendMsg( Msg():setQuote(msg) ..  "那你发")
	 	end
	end)
end

Event.onFinish = 
    function ()
        print("永别了未来！")
    end
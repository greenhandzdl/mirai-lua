Info={}
Info.name="指定色图-多图稳定版"
Info.author="chorblack"
Info.version="1.3"
Info.description="试着向机器人发送涩图帮助"

Event.onLoad = function(bot)
	print("载入涩图bot"..bot:getId().."成功")
	_apikey = "201238005f3744e4970f20"    --请在""中输入apikey
	--私聊
	r18 = 0
	master = {2029252158}        --请改为你的QQ，多管理员用,隔开
	bot:subscribeFriendMsg(function(bot, msg, sender)
		if msg:find("涩图帮助") then
			sender:sendMsg("apikey的申请需要用到的工具:tg，条件：科学上网\n来源：https://moe.best/cross.html\napikey申请地址：https://t.me/loliconApiBot\n_18为r18的控制开关，填写0为无r18，1为全r18，2为混合")
			sender:sendMsg("指令合集：#st+关键词+数量，也可以直接#st+数量得到随机涩图\n例如：#stfgo 3，#st 4，最后的数量要用空格隔开\n还有一种情况，例如#st德莉莎等不加数量时，不要加空格\nr18开启指令：私聊：开启/关闭r18，需要管理员权限，群聊：#开启/关闭r18")
			sender:sendMsg("另：不能使用（主要是timeout）时，科学上网\n无apikey时一天只有几次测试机会\n请填写apikey与master")

		end
		
		if msg:find("开启r18") then
			
			function isInArray(t, val)
				for _, v in ipairs(t) do
					if v == val then
						return true
					end
				end
				return false
			end
			
			local TF = isInArray(master,sender.id)
						
			if TF == true then
				r18 = 1
				sender:sendMsg("r18开启成功")
			else
				sender:sendMsg("请联系bot主人授权")
			end
		end
		
		if msg:find("关闭r18") then
			r18 = 0
			group:sendMsg("r18已关闭")
		end
		if msg:find("#st") then
			sender:sendMsg("start")
			api_value = msg:gsub("#st","")
			if api_value:find(" ",-3)==nil then
				api_value = api_value .. " 1"
			end
			api_num = api_value:match("%d",-2)
			api_value = api_value:sub(1,-3)
			if api_value == nil then
				api_value = ''
			end
			if api_num == nil then
				api_num = 1
			end
			api_json = ("https://api.lolicon.app/setu/?apikey=" .. _apikey .. "&r18=" .. r18 .. "&num=" .. api_num .. "keyword=" ..api_value)
            html = net.get(api_json)
			
			if html:find("没有符合条件的色图") then
				sender:sendMsg("没有符合条件的色图")
			end
			
			for i in html:gmatch('"url":"(.-)"') do
				url = i:gsub("\\","")
				sender:sendMsg(Image(url,sender))
			end
		end
	end)
	--群聊
	_r18 = 0
    bot:subscribeGroupMsg(function(bot, msg, group, sender)

		if msg:find("#开启r18") then
			
			function isInArray(t, val)
				for _, v in ipairs(t) do
					if v == val then
						return true
					end
				end
				return false
			end
			
			local TF = isInArray(master,sender.id)
			
			
			
			if TF == true then
				_r18 = 1
				group:sendMsg("r18开启成功")
			else
				group:sendMsg("请联系bot主人授权")
			end
		end
		
		if msg:find("#关闭r18") then
			_r18 = 0
			group:sendMsg("r18已关闭")
		end
		
        if msg:find("#st") then
			group:sendMsg(Image("/096708CE-21F8-3AAD-B8E5-2223D679DAE4",group))
			api_value = msg:gsub("#st","")
			if api_value:find(" ",-3)==nil then
				api_value = api_value .. " 1"
			end
			api_num = api_value:match("%d",-2)
			api_value = api_value:sub(1,-3)
			if api_value == nil then
				api_value = ''
			end
			if api_num == nil then
				api_num = 1
			end
			api_json = ("https://api.lolicon.app/setu/?apikey=" .. _apikey .. "&r18=" .. _r18 .. "&num=" .. api_num .."&keyword=" ..api_value)
            html = net.get(api_json)
			
			if html:find("没有符合条件的色图") then
				group:sendMsg("没有符合条件的色图")
			end
			--local m = Msg()
			for i in html:gmatch('"url":"(.-)"') do
				url = i:gsub("\\","")
				--m = m+Image(url,group)
				group:sendMsg(Image(url,group))   --一次发一张
			end
			--group:sendMsg(m)   --一次发多张
        end
    end)
end

Event.onFinish = 
    function ()
        print("脚本被卸载！")
    end

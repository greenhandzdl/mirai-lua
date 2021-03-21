Info={}
Info.name="p搜图"
Info.author="chorblack"
Info.version="1.0"
Info.description="试着向机器人发送搜图帮助"
Event.onLoad = function(bot)
	print("载入p搜图bot"..bot:getId().."成功")
	bot:subscribeFriendMsg(function(bot, msg, sender)
		if msg:find("搜图帮助") then
			sender:sendMsg("暂时无法分辨是否r18，介意勿用\n指令：#搜图+关键词，例如：#搜图 fgo，要不要空格都行，默认6张图，没有品质限制，以后再加")
			
		end
	end)
    bot:subscribeGroupMsg(function(bot, msg, group, sender)
        if msg:find("#搜图") then
			group:sendMsg("正在搜索")
			api_value = msg:gsub("#搜图","")
			api_value = api_value:gsub(" ","")
			
			function Table_Rand(t)
				if t == nil then
					return
				end
				local tRet = {}
				local Total = #t
				while Total > 0 do
					local i = math.random(1,Total)
					table.insert(tRet,t[i])
					t[i] = t[Total]
					Total = Total -1
				end

				return tRet

			end
			
			local urls = {}	
			local count = 0
			
			while true do
				count = count+1
				api_json = ("https://api.imjad.cn/pixiv/v2/?type=search&word=" .. api_value .. "&page=" ..count)
				html = net.get(api_json)
				if html:find('next_url":null') then
					break
				end
				
				for i in html:gmatch('"original_image_url":"(.-)"') do
					url1 = i:gsub("\\","")
					url = url1:gsub("i.pximg.net","i.pixiv.cat")
					table.insert(urls,url)
				end
				
				if count>10 then
					break
				end
			
			end
			
			group:sendMsg("解析完成")
			
			local list = Table_Rand(urls)
			local x = 0
			
			for j,k in pairs(list) do
				if x>5 then
					break
				end
				x = x+1
				group:sendMsg(Image(k,group))
				
			end
			
        end
    end)
end

Event.onFinish = 
    function ()
        print("脚本被卸载！")
    end
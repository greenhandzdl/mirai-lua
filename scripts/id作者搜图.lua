Info={}
Info.name="画师id搜图"
Info.author="chorblack"
Info.version="1.1"
Info.description="试着向机器人发送作者搜图帮助"
Event.onLoad = function(bot)
	print("载入画师搜图bot"..bot:getId().."成功")
	bot:subscribeFriendMsg(function(bot, msg, sender)
		if msg:find("作者搜图帮助") then
			sender:sendMsg("暂时无法分辨是否r18，介意勿用\n指令：#画师73152，要不要空格都行，默认6张图")
			
		end
	end)
	
    bot:subscribeGroupMsg(function(bot, msg, group, sender)
        if msg:find("#画师") then
			group:sendMsg("正在搜索")
			api_id = msg:gsub("#画师","")
			api_id = api_id:gsub(" ","")

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
				api_json = ("https://api.imjad.cn/pixiv/v2/?type=member_illust&id=" .. api_id .. "&page=" ..count)
				html = net.get(api_json)
				if html:find('next_url":null') then
					break
				end
				for i in html:gmatch('"original_image_url":"(.-)"') do
					url1 = i:gsub("\\","")
					url = url1:gsub("i.pximg.net","i.pixiv.cat")
					table.insert(urls,url)
				end
			
			end
			group:sendMsg("解析完成")
			local list = Table_Rand(urls)
			local x = 0
			
			for j,k in pairs(list) do
				x = x+1
				group:sendMsg(Image(k,group))
				if x>5 then
					break
				end
			end
						
        end
    end)
end

Event.onFinish = 
    function ()
        print("脚本被卸载！")
    end
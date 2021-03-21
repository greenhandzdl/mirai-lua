Info={}
Info.name="以图搜图"
Info.author="chorblack"
Info.version="1.0"
Info.description="试着向机器人发送以图搜图帮助"
Event.onLoad = function(bot)
	print("载入以图搜图bot"..bot:getId().."成功")
	_apikey = "114402d3c80f9726486f298accf5bb558f4429c3"    --请在""中输入apikey
	bot:subscribeFriendMsg(function(bot, msg, sender)
		if msg:find("以图搜图帮助") then
			sender:sendMsg("以图搜图apikey请去https://saucenao.com/user.php?page=search-api申请，额度一天300\n指令：#以图搜图直接加图片，暂时不能分离")
		end
	end)

	bot:subscribeGroupMsg(function(bot, msg, group, sender)
		if msg:find("#以图搜图") then
			group:sendMsg("开始搜索，请稍等")
			for i,m in ipairs(msg:toTable()) do
				if (m:find("mirai:image")) then
					x = m:getImageUrl()
					api_url = ("https://saucenao.com/search.php?db=999&output_type=2&testmode=1&numres=16&api_key=" .. _apikey .."&url=" .. x)
					local count = 0
					while true do
						count = count+1
						json,isSuccessful,code = Http.get(api_url)
						if code==200 then
							break
						end
						if count>5 then
							group:sendMsg("网络错误")
							break
						end
						
					end
					
					if json:find("Specified file no longer exists on the remote server!") then
						group:sendMsg("插件或网络错误，请重启试试")
					end
					json = json:gsub("%[","")
					json = json:gsub("%]","")
					url = json:match('"ext_urls":"(.-)"')
					url = url:gsub("\\","")
					illust_id = url:match('id=(%d+)')
					member_id = json:match('"member_id":(%d+)')
					if illust_id ==nil then
						group:sendMsg("未搜到p站图片，正在启用ascii2d搜索")
						local urls = {}
						api_json = ("https://ascii2d.net/search/url/" .. x)
						local num = 0
						while true do
							num = num+1
							html,isSuccessful,code = Http.get(api_json)
							if code==200 then
								break
							end
							if num>5 then
								group:sendMsg("网络错误")
								break
							end
						end
						pic_ids = {}
						for l in html:gmatch('<a target="_blank" rel="noopener" href="(.-)"') do
							table.insert(pic_ids,l)
						end
						for i in html:gmatch('<img loading="lazy" src="(.-)"') do
							url = ('https://ascii2d.net' ..i)
							table.insert(urls,url)
						end
						local x= 0
						local id_num = -1
						for j,k in pairs(urls) do
							x = x+1
							id_num = id_num +2
							group:sendMsg(Image(k,group) .. pic_ids[id_num])
							if x>3 then
								break
							end
						end
						
					else
						local urls = {}
						api_json = ("https://api.imjad.cn/pixiv/v2/?type=illust&id=" .. illust_id)
						local number = 0
						while true do
							number = number+1
							html,isSuccessful,code = Http.get(api_json)
							if code==200 then
								break
							end
							if number>5 then
								group:sendMsg("网络错误")
								break
							end
						end
						if html:find("error") then
							group:sendMsg("引擎错误,正在启用ascii2d搜索")
							
							api_json = ("https://ascii2d.net/search/url/" .. x)
							while true do
								html,isSuccessful,code = Http.get(api_json)
								if code==200 then
									break
								end	
							end
							by_id = html:match('<a target="_blank" rel="noopener" href="(.-)"')
							by = html:match('<img loading="lazy" src="(.-)"')
							by_url = ('https://ascii2d.net' ..by)
							group:sendMsg(Image(by_url,group) .. by_id)
							
							
						end
						
						
						for i in html:gmatch('"original_image_url":"(.-)"') do
							url1 = i:gsub("\\","")
							url = url1:gsub("i.pximg.net","i.pixiv.cat")
							table.insert(urls,url)
						end
						local x= 0
						for j,k in pairs(urls) do
							x = x+1
							group:sendMsg(Image(k,group) .. k .. "\n" .. "插画id=" .. illust_id .. "\n" .. "画师id=" .. member_id)
							if x>5 then
								break
							end
						end
						
					end
	
				end
			end
		end
	end)
end

Event.onFinish = 
    function ()
        print("脚本被卸载！")
    end
Info={}
Info.name="来点壁纸"
Info.author="wyl"
Info.version="0.1"
Info.description="一个能获取壁纸并往群里发送的脚本"

Event.onLoad = 
    function (bot)

        print("载入壁纸获取"..bot:getId().."成功")
bot:subscribeGroupMsg(
    function(bot, msg, group, sender)
        if msg:find("来点壁纸") then
            local bz = ("https://api.ixiaowai.cn/gqapi/gqapi.php")
            group:sendMsg(Msg():appendImage(bz, group) )
            local bz = ("https://api.ixiaowai.cn/gqapi/gqapi.php")
            group:sendMsg(Msg():appendImage(bz, group) )
            local bz = ("https://api.ixiaowai.cn/gqapi/gqapi.php")
            group:sendMsg(Msg():appendImage(bz, group) )
            local bz = ("https://api.ixiaowai.cn/gqapi/gqapi.php")
            group:sendMsg(Msg():appendImage(bz, group) )
            local bz = ("https://api.ixiaowai.cn/gqapi/gqapi.php")
            group:sendMsg(Msg():appendImage(bz, group) )
        end
    end
)


end



Event.onFinish = 
function ()
print("脚本被卸载！")
end
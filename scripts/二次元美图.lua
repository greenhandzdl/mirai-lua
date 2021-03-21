Info={}
Info.name="来点二次元美图"
Info.author="wyl"
Info.version="0.1"
Info.description="一个能获取二次元美图并往群里发送的脚本"

Event.onLoad = 
    function (bot)

        print("载入二次元美图获取"..bot:getId().."成功")
bot:subscribeGroupMsg(
    function(bot, msg, group, sender)
        if msg:find("来点二次元") then
            local erciyuan = ("https://api.ixiaowai.cn/api/api.php")
            group:sendMsg(Msg():appendImage(erciyuan, group) )
            local erciyuan = ("https://api.ixiaowai.cn/api/api.php")
            group:sendMsg(Msg():appendImage(erciyuan, group) )
            local erciyuan = ("https://api.ixiaowai.cn/api/api.php")
            group:sendMsg(Msg():appendImage(erciyuan, group) )
            local erciyuan = ("https://api.ixiaowai.cn/api/api.php")
            group:sendMsg(Msg():appendImage(erciyuan, group) )
            local erciyuan = ("https://api.ixiaowai.cn/api/api.php")
            group:sendMsg(Msg():appendImage(erciyuan, group) )
        end
    end
)


end



Event.onFinish = 
function ()
print("脚本被卸载！")
end
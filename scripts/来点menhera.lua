Info={}
Info.name="来点menhera"
Info.author="wyl"
Info.version="0.1"
Info.description="一个能获取menhera并往群里发送的脚本"

Event.onLoad = 
    function (bot)

        print("载入menhera图获取"..bot:getId().."成功")
bot:subscribeGroupMsg(
    function(bot, msg, group, sender)
        if msg:find("来点menhera") then
            local menhera = ("https://api.ixiaowai.cn/mcapi/mcapi.php")
            group:sendMsg(Msg():appendImage(menhera, group) )
        end
    end
)


end



Event.onFinish = 
function ()
print("脚本被卸载！")
end
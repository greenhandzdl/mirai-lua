Info={}
Info.name="戳泡机&潜水员捕捞器"
Info.author="wyl"
Info.version="0.2"
Info.description="一个能快速戳泡&捞起潜水员的bot"

Event.onLoad = 
    function (bot)

        print("载入戳泡&捞潜水员bot"..bot:getId().."成功")
bot:subscribeGroupMsg(
    function(bot, msg, group, sender)
        if not msg:find("的是") and msg:find("冒") and msg:find("泡") then
            group:sendMsg( Msg():setQuote(msg) ..  Msg("戳掉~~"))
        end
        
        if not msg:find("的是") and msg:find("潜水") or msg:find("下潜") then
            group:sendMsg( Msg():setQuote(msg)+Msg("捞起来~~"))
        end
    end
)


end



Event.onFinish = 
function ()
print("脚本被卸载！")
end
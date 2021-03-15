<?php
/*
 *影殇机器人配置写法案例
*/
$PluginType = $_GET['PluginType'];//判断当前的主程序
$groupId = $_GET['groupId'];//接收插件传来的群号
$uin = $_GET['uin'];//接收插件传来的QQ号
$uinName = $_GET['uinName'];//接收插件传来的昵称
$msg = $_GET['msg'];//接收插件传来的文本消息
$type = $_GET['type'];//接收插件传来的type值，可以判断系统状态
$status = $_GET['status'];//接收插件传来的status值，一般在自动进群检测
$value = $_GET['value'];//接收插件传来的value值，一般在自动进群检测
//以下变量值不可改，否则无法识别
$QRSpeed = "4";
$SQvx = "5";
$SQv8 = "6";
$Secluded = "7";
$Anwind = "8";
//下面的判断消息
if ($msg == "全禁")//如果消息是测试全禁
{//返回必须以json形式返回，不允许有错误，否则软件端会出现不能预料的错误
//必须包含键sendT，发送消息类型，包含msg文本，ptt语音，img图片，xml卡片，json卡片，如果是qr，还可以用闪图秀图等等
//还有sendM，代表消息内容，msg就是要发送的内容，ptt就是语音链接，图片也是链接
//do键也是必须要加的，是要执行的操作，禁言，改名，全禁撤回等等都在这个里面执行，如果没有要执行的，不允许不写，否则出错，没有要执行的，do键对应的值写null，是字符串类型
//do里面可以用改名、禁言、全禁、踢人、撤回，这五个，其他暂不支持，如果要执行多个操作，用#间隔，例如：
//add("do","改名#禁言#撤回")
//这个do里面写的要执行的内容，后面的键必须跟着，例如上面写了改名，下面必须以一个改名为键的json子串，不允许不写
//看下面的例子
//还有就是操作里面的写法，比如写改名add("改名","1108960605 2070560848 暗影之风)，这样里面的处理以空格为间隔
//撤回，add("撤回","1108960905 1")，这个1代表当前消息的上一条，2就是上两条，依次类推
//还有读写，先用php自带的fopen这些吧，如果不要在服务器读写要在本地，等以后版本更新吧
//暂时就这些
    echo json(add("sendT","msg").add("sendM","成功").add("do","全禁").add("全禁","1108960905 0"));
}
else if ($msg == "全解")
{
    echo json(add("sendT","msg").add("sendM","成功").add("do","全禁").add("全禁","1108960905 1"));
}
function add($Key,$Value)
{
    return ",\"".$Key."\":\"".$Value."\"";
}
function json($message)
{
    return str_replace_once(",","","{".$message."}");
}
function str_replace_once($needle, $replace, $haystack)
{
    $pos = strpos($haystack, $needle);
    if ($pos === false)
    {
        return $haystack;
    }
    return substr_replace($haystack, $replace, $pos, strlen($needle));
}
?>
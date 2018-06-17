@echo off
set /p a=请输入钱包地址 press your address:
:0
if not defined a ( 
	echo "未输入地址！默认配置进行测试 No addr, use default conf to test"  
	set a=0xb7af23571a74818781b023a089f54338cd187150
)
echo "挖矿开始，停止请点击右上X  Start mining, click X to stop"
webchain-miner.exe -o web.m00n.top:3333 -u %a% -p x  
goto 0
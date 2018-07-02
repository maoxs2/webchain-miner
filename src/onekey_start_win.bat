@echo off

set /p addr=请输入钱包地址 press your address:
set /p workerID=请输入设备ID press your worker-id:

echo 加速请根据您设备的L3缓存决定，程度应与大小成正比
set /p av=请输入加速程度 press your boost level(0-4):

if not defined addr ( 
	echo "未输入地址！默认配置进行测试 No addr, use default conf to test"  
	set addr=0xb7af23571a74818781b023a089f54338cd187150
)

if not defined workerID ( 
	echo "未输入设备ID！默认为0"
	set /a workerID="0"
)

if not defined av ( 
    echo "未输入加速！默认为自适配（可能不加速）"  
    set /a av=0
    goto :0      
)
if av equ 0 (
    av=1
    goto :0
)
if av equ 1 (
    av=2
    goto :0
)
set /a av=%av%+2
goto :0

:0
echo "挖矿开始，停止请点击右上X  Start mining, click X to stop"
webchain-miner.exe -o web.m00n.top:3333 --av %av% -u %addr% -p x --worker-id %workerID%  
goto 0

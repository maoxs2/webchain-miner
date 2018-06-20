#!/bin/sh
echo "请输入钱包地址 press your address:"
read addr

echo "请输入设备ID press your worker-id:"
read workerID

echo "加速请根据您设备的L3缓存决定，程度应与大小成正比"
echo "Acceleration depends on your device's L3 cache. The degree should be proportional to size"
echo "请输入加速程度 press your boost level(0-4):"
read av

if [ -z ${addr} ];then
    echo "未输入地址！默认配置进行测试 No addr, use default conf to test"  
    addr="0xb7af23571a74818781b023a089f54338cd187150"
fi

if [ -z ${workerID} ];then
    echo "未输入设备ID！默认为0"
    workerID="0"
fi

if [ -z ${av} ];then
    echo "未输入加速！默认为自适配（可能不加速）"  
    av=0
else
	if [ $av = "0" ];then
		av=1
	else
		if [ $av = "1" ];then
			av=2
		else
    		let av="$av+2" # av (3,4,5) => (5,6,7)
    	fi
    fi
fi

chmod +x webchain-miner

while true
do
    echo "挖矿开始，停止请点击右上X  Start mining, click X to stop"
    echo ./webchain-miner -o web.m00n.top:3333 --av ${av} -u ${addr} -p x --worker-id ${workerID}  
done

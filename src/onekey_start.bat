@echo off
set /p a=������Ǯ����ַ press your address:
:0
if not defined a ( 
	echo "δ�����ַ��Ĭ�����ý��в��� No addr, use default conf to test"  
	set a=0xb7af23571a74818781b023a089f54338cd187150
)
echo "�ڿ�ʼ��ֹͣ��������X  Start mining, click X to stop"
webchain-miner.exe -o web.m00n.top:3333 -u %a% -p x  
goto 0
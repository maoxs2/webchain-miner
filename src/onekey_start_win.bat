@echo off

set /p addr=������Ǯ����ַ press your address:
set /p workerID=�������豸ID press your worker-id:

echo ������������豸��L3����������̶�Ӧ���С������
set /p av=��������ٳ̶� press your boost level(0-4):

if not defined addr ( 
	echo "δ�����ַ��Ĭ�����ý��в��� No addr, use default conf to test"  
	set addr=0xb7af23571a74818781b023a089f54338cd187150
)

if not defined workerID ( 
	echo "δ�����豸ID��Ĭ��Ϊ0"
	set /a workerID="0"
)

if not defined av ( 
    echo "δ������٣�Ĭ��Ϊ�����䣨���ܲ����٣�"  
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
echo "�ڿ�ʼ��ֹͣ��������X  Start mining, click X to stop"
webchain-miner.exe -o web.m00n.top:3333 --av %av% -u %addr% -p x --worker-id %workerID%  
goto 0

@echo off

echo                                     _ooOoo_                                 
echo                                    o8888888o                               
echo                                    88" . "88                                  
echo                                     (^| ^_^ ^|)                                  
echo                                    O\  =  /O                             
echo                                 ____/`---'\____                                                   
echo                               .'  \\^|     ^|//  `.                          
echo                              /  \\^|^|^|  :  ^|^|^|//  \                             
echo                             /  _^|^|^|^|^| -:- ^|^|^|^|^|-  \                     
echo                             ^|   ^| \\\  -  /// ^|   ^|                    
echo                             ^| \_^|  ''\---/''  ^|   ^|                               
echo                             \  .-\__  `-`  ___/-. /                                
echo                           ___`. .'  /--.--\  `. . ___                          
echo                         ."" '^<  `.___\_^<^|^>_/___.'  ^>'"".                 
echo                       ^| ^| :  `- \`.;`\ _ /`;.`/ - ` : ^| ^|                  
echo                       \  \ `-.   \_ __\ /__ _/   .-` /  /                  
echo                 ========`-.____`-.__\____/___.-`____.-'========              
echo                                     '=---='                             
echo *********************************************************************************************************
echo				 ��	 ��	 ��	 ��
echo.
set CURRENT_DIR=%~dp0
cd %CURRENT_DIR%
:start
color 02
set var=
set /p var=������RSA��˽Կ��ʽ(1024��2048):
if defined var (echo �������RSA��ʽ��%var%)
if not defined var (
set var=1024
set flag=0
goto direct
)
if not %var% == 1024 (if not %var% == 2048 goto start)
:direct
if defined flag (echo Ĭ�ϵ�RSA��ʽ��%var%)
echo -------------------------------����˽Կ-----------------------------------
openssl genrsa -out %var%_rsa_private_key.pem %var%
echo -------------------------------pkcs8ת��----------------------------------
openssl pkcs8 -topk8 -inform PEM -in %var%_rsa_private_key.pem -outform PEM -nocrypt -out %var%_pkcs8.txt
echo ת���ɹ���
echo -------------------------------���ɹ�Կ-----------------------------------
openssl rsa -in %var%_rsa_private_key.pem -pubout -out %var%_rsa_public_key.pem
echo -------------------------------ִ�гɹ�-----------------------------------
set /p isContinue=�Ƿ�������ɹ�˽Կy/n:
if /i %isContinue% == Y (
goto start
)
exit
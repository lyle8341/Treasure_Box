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
echo				 阿	 弥	 陀	 佛
echo.
set CURRENT_DIR=%~dp0
cd %CURRENT_DIR%
:start
color 02
set var=
set /p var=请输入RSA公私钥格式(1024或2048):
if defined var (echo 您输入的RSA格式是%var%)
if not defined var (
set var=1024
set flag=0
goto direct
)
if not %var% == 1024 (if not %var% == 2048 goto start)
:direct
if defined flag (echo 默认的RSA格式是%var%)
echo -------------------------------生成私钥-----------------------------------
openssl genrsa -out %var%_rsa_private_key.pem %var%
echo -------------------------------pkcs8转换----------------------------------
openssl pkcs8 -topk8 -inform PEM -in %var%_rsa_private_key.pem -outform PEM -nocrypt -out %var%_pkcs8.txt
echo 转换成功！
echo -------------------------------生成公钥-----------------------------------
openssl rsa -in %var%_rsa_private_key.pem -pubout -out %var%_rsa_public_key.pem
echo -------------------------------执行成功-----------------------------------
set /p isContinue=是否继续生成公私钥y/n:
if /i %isContinue% == Y (
goto start
)
exit
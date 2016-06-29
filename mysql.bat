net stop mysql2
d:
cd D:\mysql-5.6.26-winx64\logs
del /s /q /f *.*
for /d %%i in (*) do rd /s /q "%%i"
net start mysql2
D:\mysql-5.6.26-winx64\bin\mysql -u username -p -P3306 test < C:\Users\lyle\Desktop\mysql.sql
pause
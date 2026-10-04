@echo off

set wePath=D:\Workspace\War3\Editor\KKWE
set mapPath=%~dpn1
set mapName=%~n1

cd %wePath%
bin\YDWEconfig.exe -launchwar3 -loadfile "%mapPath%\%mapName%.w3x"

exit 0

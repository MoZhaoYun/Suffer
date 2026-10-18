@echo off

set mapPath=%~dpn1
set mapName=%~n1
set saveType=%2

echo Converting %saveType% Map......
w2l.exe %saveType% "%mapPath%\%mapName%"

exit 0

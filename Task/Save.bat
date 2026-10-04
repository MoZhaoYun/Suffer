@echo off

set mapPath=%~dpn1
set mapName=%~n1

@REM echo Converting OBJ Map......
@REM w2l.exe obj "%mapPath%\%mapName%"
@REM move /Y "%mapName%.w3x" "%mapName%.obj.w3x"

echo Converting SLK Map......
w2l.exe slk "%mapPath%\%mapName%"
@REM move /Y "%mapName%.w3x" "%mapName%.slk.w3x"

exit 0

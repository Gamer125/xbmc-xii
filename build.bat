@echo off
ECHO ------------------------------
ECHO Creating "Xii" Build Folder
rmdir BUILD /S /Q
md BUILD

ECHO ------------------------------
ECHO Creating XPR Files...
CALL media\XBMCTex.bat

ECHO ------------------------------
ECHO Copying XPR Files...
xcopy "media\*.xpr" "BUILD\Xii\media\" /Q /I /Y

ECHO ------------------------------
ECHO Cleaning Up...
del "media\*.xpr"

ECHO ------------------------------
ECHO Building Skin Directory...
xcopy "1080i" "BUILD\Xii\1080i" /E /Q /I /Y
xcopy "720p" "BUILD\Xii\720p" /E /Q /I /Y
xcopy "extras" "BUILD\Xii\extras" /E /Q /I /Y
xcopy "NTSC" "BUILD\Xii\NTSC" /E /Q /I /Y
xcopy "NTSC16x9" "BUILD\Xii\NTSC16x9" /E /Q /I /Y
xcopy "PAL" "BUILD\Xii\PAL" /E /Q /I /Y
xcopy "PAL16x9" "BUILD\Xii\PAL16x9" /E /Q /I /Y
xcopy "fonts" "BUILD\Xii\fonts" /E /Q /I /Y
xcopy "sounds" "BUILD\Xii\sounds" /E /Q /I /Y
xcopy "*.xml" "BUILD\Xii\" /Q /I /Y
xcopy "*.txt" "BUILD\Xii\" /Q /I /Y
xcopy "Extra Stuff" "BUILD\Extra Stuff" /E /Q /I /Y

ECHO ------------------------------
ECHO Removing SVN directories from build...
FOR /R BUILD %%d IN (SVN) DO @RD /S /Q "%%d" 2>NUL

ECHO Build Complete - Scroll Up to check for errors.
ECHO Final build is located in the BUILD directory
ECHO Have Fun


pause
REM Build script for testbed
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files in the testbed directory
SET cFiles=
FOR /R %%f IN (*.c) DO (
    SET cFiles=!cFiles! "%%f"
)

REM echo "Files:" %cFiles%

SET assembly=testbed
SET compilerFlags=-g
REM -Wall -Wextra -Werror
SET includeFlags=-Isrc/inc -I%VULKAN_SDK%/Include
SET linkFlags=-L../lib/ -lengine.lib
SET defines=-D_DEBUG -DVIMPORT

ECHO "Building %assembly%..."
clang %cFiles% %compilerFlags% -o ../bin/%assembly%.exe %defines% %includeFlags% %linkFlags%
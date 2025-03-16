REM Build script for engine
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files in the engine directory
SET cFiles=
FOR /R %%f IN (*.c) DO (
    SET cFiles=!cFiles! "%%f"
)

REM echo "Files:" %cFiles%

SET assembly=engine
SET compilerFlags=-g -shared -Wvarargs -Wall -Wextra -Werror
REM -Wall -Wextra -Werror
SET includeFlags=-Isrc/inc -I%VULKAN_SDK%/Include
SET linkFlags=-luser32 -lvulkan-1 -L%VULKAN_SDK%/Lib
SET defines=-D_DEBUG -DVEXPORT -D_CRT_SECURE_NO_WARNINGS

ECHO "Building %assembly%..."
clang %cFiles% %compilerFlags% -o ../bin/%assembly%.dll %defines% %includeFlags% %linkFlags%
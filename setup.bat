@echo off
setlocal enabledelayedexpansion

REM Get current folder name for environment
for %%I in (.) do set ENV_NAME=%%~nxI

echo.
echo ===========================================
echo Setting up your MLOps project: %ENV_NAME%
echo ===========================================
echo.

REM Create Conda environment with dynamic name
conda env create -f environment.yml --name %ENV_NAME%

REM Activate environment
call conda activate %ENV_NAME%

REM Initialize DVC (if not already)
if not exist ".dvc" (
    dvc init
)

REM Initialize Git (if not already)
if not exist ".git" (
    git init
)

REM Create .env file if missing
if not exist ".env" (
    echo. > .env
)

echo.
echo ✅ Setup complete for environment: %ENV_NAME%
echo.
pause

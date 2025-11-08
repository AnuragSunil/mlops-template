@echo off
echo Setting up your MLOps project...

conda env create -f environment.yml
call conda activate mlops-boilerplate
dvc init
git init

echo Setup complete ✅
pause

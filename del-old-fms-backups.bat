@echo off
:: set folder path
set dump_path="C:\Program Files\FileMaker\FileMaker Server\Data\Backups\5Mins_Backups_Prod\5Minutes-Backups"

:: set min age of files and folders to delete
set max_days=2

:: remove files from %dump_path%
forfiles -p %dump_path% -m *.* -d -%max_days% -c "cmd  /c del /q @path"

:: remove sub directories from %dump_path%
forfiles -p %dump_path% -d -%max_days% -c "cmd /c IF @isdir == TRUE rd /S /Q @path"
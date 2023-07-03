#short snippet to auto delete files in folder older than 90 days. To be used with Task Scheduler
/p "C:\Desired-Folder" /s /d -90 /c "cmd /c del /q @file”

@echo off

setlocal

set "folderPath=C:\Users\ngoqu\PycharmProjects\ShopManagementWeb\shop"

echo Running autopep...

for /r "%folderPath%" %%f in (*.py) do (
    autopep8 --in-place --aggressive --aggressive "%%f"
)

echo autopep finished.

endlocal

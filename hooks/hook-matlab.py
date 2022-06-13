from PyInstaller.utils.hooks import collect_all

datas, binaries, hiddenimports = collect_all('matlab')  #matlab是在site-packages目录里面的模块名称
#pyinstaller -F -w python.py  --additional-hooks-dir=hooks
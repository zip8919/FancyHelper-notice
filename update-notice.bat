@echo off
chcp 65001 >nul
set /p commit_msg="请输入提交信息 (默认: 更新公告): "
if "%commit_msg%"=="" set commit_msg=更新公告
git add v1/notice.json
git commit -m "%commit_msg%"
git push
echo 完成！
pause
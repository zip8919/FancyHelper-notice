#!/bin/bash
read -p "请输入提交信息 (默认: 更新公告): " commit_msg
commit_msg=${commit_msg:-更新公告}
git add v1/notice.json
git commit -m "$commit_msg"
git push
echo "完成！"
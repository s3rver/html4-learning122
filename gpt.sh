#!/usr/bin/env sh

# تنظیمات
USERNAME="s3rver"
TOKEN="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"
REPO_NAME="html4-le32132ar1n232ing122"
DATE="2015-04-01T18:00:00"
CommitMsg="Initial Commit"


# ایجاد ریپازیتوری
curl -X POST \
  -H "Authorization: token $TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$REPO_NAME\"}"

# ایجاد فایل readme.md
echo "# My Project" > readme.md

# اضافه کردن فایل readme.md به گیت
git init

git add .
  GIT_AUTHOR_DATE="${DATE}" \
    GIT_COMMITTER_DATE="${DATE}" \
    git commit -m "${CommitMsg}"

# معرفی ریموت ریپازیتوری
git remote add origin "https://${ACCESS_TOKEN}@github.com/${USERNAME}/${REPO_NAME}.git"

git branch -M main
git push -u origin main -f


 cd ..
 rm -rf "${REPO_NAME}"
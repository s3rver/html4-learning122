#!/usr/bin/env sh

_() {
  YEAR="2015"
  RepoName="html-learn"
  CommitMsg="initial commit ."
  echo "GitHub Username: "
  read -r USERNAME
  echo "GitHub Access token: "
  read -r ACCESS_TOKEN

  [ -z "$USERNAME" ] && exit 1
  [ -z "$ACCESS_TOKEN" ] && exit 1  
  [ ! -d $RepoName ] && mkdir $RepoName

  cd "${RepoName}" || exit
  git init
  echo "Hello World" \
    >README.md
  git add .
  GIT_AUTHOR_DATE="${YEAR}-04-01T18:00:00" \
    GIT_COMMITTER_DATE="${YEAR}-04-01T18:00:00" \
    git commit -m "${CommitMsg}"
  git remote add origin "https://${ACCESS_TOKEN}@github.com/${USERNAME}/${RepoName}.git"
  git branch -M main
  git push -u origin main -f
  cd ..
  #rm -rf "${RepoName}"

  echo
  echo "Cool, check your profile now: https://github.com/${USERNAME}"
} && _

unset -f _
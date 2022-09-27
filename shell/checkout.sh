#!/bin/bash
path="/Volumes/develop/rrzuji/yii"

cd $path || exit

git reset --hard
git clean -f -d
git checkout develop
git fetch --all
git branch -D $1
git checkout -b $1 origin/$1

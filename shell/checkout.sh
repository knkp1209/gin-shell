#!/bin/bash

CURRENT_DIR=$(dirname "$0")
. "$CURRENT_DIR"/env.sh

if [ -z "$1" ] ;then
  echo "branch not specified"
  exit
fi

if [ -z "$YII_PATH" ] ;then
  echo "路径不存在"
  exit
fi

cd "$YII_PATH" || exit

$USER git reset --hard
$USER git clean -f -d
$USER git checkout develop
$USER git fetch --all
$USER git branch -D $1
$USER git checkout -b $1 origin/$1

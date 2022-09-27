#!/bin/bash
. ./env.sh
cd "$YII_PATH" || exit

sudo -u www-data git fetch --all
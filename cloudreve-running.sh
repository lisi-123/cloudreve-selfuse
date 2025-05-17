#!/bin/bash

pkill -f "/root/cloudreve-selfuse/cloudreve"

sleep 1

sudo apt update

sudo apt install -y screen

sudo apt install cron -y

chmod +x /root/cloudreve-selfuse/restart_wangpan.sh

(crontab -l 2>/dev/null; echo "*/10 * * * * /root/cloudreve-selfuse/restart_wangpan.sh"; echo "0 0 */3 * * rm -f /root/cloudreve-selfuse/restart_wangpan.log") | sort -u | crontab -

screen -dmS wangpan_session /root/cloudreve-selfuse/cloudreve

#!/bin/bash

# 日志文件
LOG_FILE="/root/cloudreve-selfuse/restart_wangpan.log"

# 输出当前时间和状态
echo "$(date) - Checking if cloudreve is running..." >> $LOG_FILE

# 检查 screen 会话是否存在
if screen -list | grep -q "wangpan_session"; then
    # 如果会话存在，检查是否在运行 cloudreve
    if ! screen -S wangpan_session -X stuff "pgrep -f 'cloudreve' > /dev/null" ; then
        echo "$(date) - cloudreve is not running, starting cloudreve..." >> $LOG_FILE
        screen -dmS wangpan_session /root/cloudreve-selfuse/cloudreve
        echo "$(date) - cloudreve started successfully." >> $LOG_FILE
    else
        echo "$(date) - cloudreve is already running." >> $LOG_FILE
    fi
else
    echo "$(date) - screen session not found. Starting a new session..." >> $LOG_FILE
    screen -dmS wangpan_session /root/cloudreve-selfuse/cloudreve
    echo "$(date) - cloudreve started successfully." >> $LOG_FILE
fi

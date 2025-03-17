#!/bin/bash

# 检查 screen 会话是否存在
if screen -list | grep -q "cloudreve_session"; then
    # 如果会话存在，检查是否在运行 cloudreve
    if ! screen -S cloudreve_session -X stuff "pgrep -f 'cloudreve' > /dev/null" ; then
        # 如果 cloudreve 没有运行，尝试杀死 cloudreve_session 会话
        screen -S cloudreve_session -X quit
        sleep 0.1 
        pkill cloudreve
        sleep 0.1 
        # 重新启动 cloudreve 会话
        screen -dmS cloudreve_session /root/cloudreve-selfuse/cloudreve
    fi
else
    # 如果没有 cloudreve_session 会话，直接启动
    screen -S cloudreve_session -X quit
    sleep 0.1 
    pkill cloudreve
    sleep 0.1
    screen -dmS cloudreve_session /root/cloudreve-selfuse/cloudreve
fi

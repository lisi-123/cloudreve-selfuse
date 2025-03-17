#!/bin/bash

# 检查 screen 会话是否存在
if screen -list | grep -q "cloudreve_session"; then
    # 如果会话存在，检查是否在运行 cloudreve
    if ! screen -S cloudreve_session -X stuff "pgrep -f 'cloudreve' > /dev/null" ; then
        screen -dmS cloudreve_session /root/cloudreve-selfuse/cloudreve
    fi
else
    screen -dmS cloudreve_session /root/cloudreve-selfuse/cloudreve
fi

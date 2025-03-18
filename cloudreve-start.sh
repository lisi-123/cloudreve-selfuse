#!/bin/bash

# 安装压缩程序
apt update && apt install unzip -y

# 解压缩文件
unzip /root/cloudreve-selfuse/cloudreve-arm64.zip -d /root/cloudreve-selfuse/

# 赋予执行权限
chmod +x /root/cloudreve-selfuse/cloudreve

# 启动cloudreve
sudo /root/cloudreve-selfuse/cloudreve

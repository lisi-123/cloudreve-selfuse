#!/bin/bash

# 检查 rsync 是否安装，如果未安装，则自动安装
if ! command -v rsync &> /dev/null; then
    echo "rsync 未安装，正在安装..."
    if [[ -f /etc/debian_version ]]; then
        sudo apt update && sudo apt install -y rsync
    elif [[ -f /etc/redhat-release ]]; then
        sudo yum install -y rsync
    else
        echo "无法确定系统类型，请手动安装 rsync 后重试。"
        exit 1
    fi
else
    echo "rsync 已安装。"
fi

# 检查 sshpass 是否安装，如果未安装，则自动安装
if ! command -v sshpass &> /dev/null; then
    echo "sshpass 未安装，正在安装..."
    if [[ -f /etc/debian_version ]]; then
        sudo apt update && sudo apt install -y sshpass
    elif [[ -f /etc/redhat-release ]]; then
        sudo yum install -y sshpass
    else
        echo "无法确定系统类型，请手动安装 sshpass 后重试。"
        exit 1
    fi
else
    echo "sshpass 已安装。"
fi

# 默认值
DEFAULT_USER="root"
DEFAULT_PORT=22
LOCAL_PATH="/root/cloudreve-selfuse"
REMOTE_PATH="/root/cloudreve-selfuse"

# 让用户输入 SSH 账号、端口和密码（提供默认值）
read -p "请输入远程服务器的 SSH 用户名（默认：$DEFAULT_USER）: " USERNAME
USERNAME=${USERNAME:-$DEFAULT_USER}

read -p "请输入远程服务器的 SSH 端口（默认：$DEFAULT_PORT）: " SSH_PORT
SSH_PORT=${SSH_PORT:-$DEFAULT_PORT}

read -p "请输入远程服务器 IP 地址: " REMOTE_IP

read -s -p "请输入远程服务器的 SSH 密码: " SSH_PASSWORD
echo ""

# 开始传输文件
echo "正在使用 rsync 传输文件到 $USERNAME@$REMOTE_IP:$REMOTE_PATH ..."

# 使用 sshpass 传递密码，跳过 SSH 交互
sshpass -p "$SSH_PASSWORD" rsync -avz --ignore-existing -e "ssh -p $SSH_PORT -o StrictHostKeyChecking=no" "$LOCAL_PATH/" "$USERNAME@$REMOTE_IP:$REMOTE_PATH/"

echo "文件传输完成！"

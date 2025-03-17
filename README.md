# cloudreve部署方法（amd64）

<br>
<br>

## 1.检测系统构架

```bash
uname -m

```

显示 x86_64 继续看下一步

显示 aarch64 去看分支

https://github.com/lisi-123/cloudreve-selfuse/tree/arm64

其他构架请前往Cloudreve官方寻找对应的包自行部署

Cloudreve项目地址 https://github.com/cloudreve/Cloudreve

<br>
<br>

## 2.拉取项目

```bash
apt-get update && apt install sudo -y && sudo apt install git -y && git clone https://github.com/lisi-123/cloudreve-selfuse.git

```

<br>
<br>

## 3.运行

首次运行：

```bash
sudo chmod +x /root/cloudreve-selfuse/cloudreve-start.sh && sudo /root/cloudreve-selfuse/cloudreve-start.sh

```

Cloudreve首次运行后，会自动生成配置

保存自动生成的管理员账号(Admin user name)和密码(Admin password)

在浏览器打开 http://你的ip:5212



<br>
<br>

## 4.使用screen实现持续运行

目前，ssh断开连接就会导致cloudreve停止运行

在cloudreve停止运行的情况下，执行以下内容


```bash
sudo chmod +x /root/cloudreve-selfuse/cloudreve-running.sh && sudo /root/cloudreve-selfuse/cloudreve-running.sh

```

cloudreve会在执行后自动启动,且每十分钟检测一次网盘是否运行

<br>
<br>

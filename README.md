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

```bash
sudo chmod +x /root/cloudreve-selfuse/cloudreve.sh && sudo /root/cloudreve-selfuse/cloudreve.sh

```


<br>
<br>

## 4.使用screen实现持续运行

目前，ssh断开连接就会导致cloudreve停止运行

在cloudreve停止运行的情况下，执行以下内容


```bash
sudo apt update && sudo apt install -y screen && sudo apt install cron -y && chmod +x /root/cloudreve-selfuse/cloudreves-cript.sh && (crontab -l 2>/dev/null; echo "* * * * * /root/cloudreve-selfuse/cloudreves-script.sh") | sort -u | crontab -

```

Pmail会在执行后的一分钟内自动启动

<br>
<br>

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

执行后，cloudreve会在后台后自动启动（断开ssh连接也能保持运行）

且每十分钟检测一次网盘是否运行，如果网盘没有运行，则启动网盘

<br>

## 5.使用nginx开启https

如果已经有域名，给域名添加一条A记录，ip填vps的ip，然后执行以下命令即可

```bash
sudo chmod +x /root/cloudreve-selfuse/nginx.sh && sudo /root/cloudreve-selfuse/nginx.sh

```
<br>

如果没有域名，可以去 https://www.cloudns.net 获取免费的域名

cloudns 支持中文界面，记得去右上角切换

前往 cloudns 注册一个账号（需要邮箱验证）

注册登录后，点击“创建区域”，选择“免费区域”

如果提示创建不了，大概率是节点ip风控

换干净的节点，浏览器开隐私模式，然后登录重试




<br>
<br>

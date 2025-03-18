#!/bin/bash

# 获取用户输入的域名和 Cloudreve 端口
read -p "输入你的域名（确认已解析ip）: " DOMAIN
read -p "输入 Cloudreve 运行端口: " CLOUDREVE_PORT

# 安装 Nginx 和 Certbot
apt update && apt install -y nginx certbot python3-certbot-nginx

# 创建 Nginx 配置文件
NGINX_CONF="/etc/nginx/sites-available/cloudreve"
echo "server {
    listen 80;
    server_name $DOMAIN;

    location / {
        proxy_pass http://127.0.0.1:$CLOUDREVE_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}" > $NGINX_CONF

# 启用 Nginx 配置
ln -s $NGINX_CONF /etc/nginx/sites-enabled/
nginx -t && systemctl restart nginx

# 申请 SSL 证书并自动配置 Nginx
certbot --nginx --agree-tos --redirect --hsts --staple-ocsp --register-unsafely-without-email -d $DOMAIN


# 设置自动续期
(crontab -l 2>/dev/null; echo "0 3 * * * certbot renew --quiet && systemctl reload nginx") | crontab -

# 输出完成信息
echo "Nginx 已安装并配置完成，域名 $DOMAIN 现在支持 HTTPS 访问！"

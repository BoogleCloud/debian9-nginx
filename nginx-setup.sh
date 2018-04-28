# Specific system setup
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx

# Default webroot is /var/www/html
if ! [ -L /var/www/html ]; then
  mv /tmp/index.html /var/www/html
fi
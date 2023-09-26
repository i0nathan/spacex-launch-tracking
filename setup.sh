# https://www.youtube.com/watch?v=lwquHLH958w
# Deploy application
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install nginx git

sudo apt-get install python3-pip -y  # To Download dependencies

pip3 install Flask requests gunicorn -y

git clone https://github.com/i0nathan/SpaceX-Launch-Visualization.git

cd ./SpaceX-Launch-Visualization

# Setup firewall
# TODO

# Start Flask server
gunicorn app:app

# Nginx proxy data through a port for the service
sudo rm /etc/nginx/sites-enabled/default

sudo vim /etc/nginx/sites-available/flask
# server {
# 	listen 80:
# 	server_name <domain_or_ip>;
#
# 	location / {
# 		proxy_pass http://127.0.0.1:5000;
# 		proxy_set_header Host $host;
# 		proxy_set_header X-Real-IP $remote_addr;
# 		proxy_set_haeder X-Forwarded-For $proxy_add_x_forwarded_for;
# 	}
# }

sudo ln -s /etc/nginx/sites-available/flask /etc/nginx/sites-enabled/
sudo systemctl restart nginx

nohup gunicorn app:app -b 127.0.0.1:5000


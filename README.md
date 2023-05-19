# elbit-project

# sudo yum install snapd -y  # installs snapd downloader
# sudo systemctl enable --now snapd.socket  # enables snapd socket 
# sudo ln -s /var/lib/snapd/snap /snap  # enables classic snap support
# sudo snap install core
# sudo snap refresh core  # checks for latest snapd version
# sudo snap install --classic certbot  # installs certbot for certification creation
# sudo ln -s /snap/bin/certbot /usr/bin/certbot  # prepares certbot command
# sudo certbot certonly --nginx --non-interactive --agree-tos --register-unsafely-without-email --domains ${domain_name}  # creates nginx certificate

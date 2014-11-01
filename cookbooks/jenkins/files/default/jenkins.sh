sudo a2enmod proxy
echo "a2enmod proxy - Done"
sudo a2enmod proxy_http
sudo a2ensite jenkins
sudo service apache2 reload
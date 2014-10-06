#sudo rm -rf /prime_factors_kata
#git clone https://github.com/Pandurang1024/prime_factors_kata.git

#git clone https://github.com/Pandurang1024/prime_factors_kata.git
#sudo mv -R prime_factors_kata /var/lib/jenkins/workspace/primefactor/

sudo bundle update sqlite3
#sudo mkdir tmp
sudo chmod 677 -R tmp
sudo chmod 677 -R db
rake db:migrate
#rails s
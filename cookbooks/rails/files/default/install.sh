sudo bundle update sqlite3
sudo mkdir tmp
sudo chmod 677 -R tmp
sudo chmod 677 -R db
rake db:migrate
rails s
# Encoding: utf-8
#
# Cookbook Name:: jenkinsstack
# Recipe:: default
#
# Copyright 2014, Rackspace
#
# Gracefully handle the failure for an invalid installation type
begin
  include_recipe "jenkins::_master_#{node['jenkins']['master']['install_method']}"
rescue Chef::Exceptions::RecipeNotFound
  raise Chef::Exceptions::RecipeNotFound, "The install method " \
    "`#{node['jenkins']['master']['install_method']}' is not supported by " \
    "this cookbook. Please ensure you have spelled it correctly. If you " \
    "continue to encounter this error, please file an issue."
end

cookbook_file "/etc/apache2/sites-available/jenkins.conf" do
  source "jenkins.conf"
  mode "0644"
end


directory "/var/lib/jenkins/.ssh" do
 owner 'root'
 group 'root'
 mode '0755'
 action :create
end



cookbook_file "/var/lib/jenkins/.ssh/id_dsa.pub" do
  source "id_dsa.pub"
  mode "0677"
end


#git ls-remote -h git@github.com:Pandurang1024/demo.git HEAD

#execute 'gitConfig' do
 # cwd '/var/lib/jenkins/.ssh'
  #command 'git ls-remote -h git@github.com:Pandurang1024/demo.git HEAD'
#end




cookbook_file "/opt/jenkins.sh" do
  source "jenkins.sh"
  mode "0677"
end

cookbook_file "/opt/jenkins.sh" do
  source "jenkins.sh"
  mode "0677"
end

bash "jenkins" do
  guard_interpreter :bash
  code "opt/jenkins.sh"
end

chef_gem 'cucumber' do
  action :install
 end

chef_gem 'rvm' do
  action :install
  version '>= 1.11.3.6'
end



#execute 'rvmkey' do
 # cwd '/var/lib/jenkins/.ssh'
  #command 'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3'
#end


#execute 'rvmInstall' do
 # cwd '/var/lib/jenkins/.ssh'
  #command '\curl -sSL https://get.rvm.io | bash -s stable --ruby'
#end


#execute 'gemCucumber' do
 # cwd '/var/lib/jenkins/.ssh'
  #command 'gem install cucumber'
#end





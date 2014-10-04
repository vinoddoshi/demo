#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.default['app']['dir'] = '/var/chef/prime_factors_kata'

include_recipe "ruby"
#include_recipe "myApp"

%w{ rails actionmailer actionpack activerecord activesupport activeresource }.each do |rails_gem|
  gem_package rails_gem do
    if node[:rails][:version]
      version node[:rails][:version]
      action :install
    else
      action :install
    end
  end
end



directory "/var/chef/prime_factors_kata/tmp" do
 owner 'root'
 group 'root'
 mode '0755'
 action :create
end


%w[ /var/chef/prime_factors_kata/db  /var/chef/prime_factors_kata/tmp /var/chef/prime_factors_kata/Gemfile.lock ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0677'
  end
end




#Star pimefact rail server
cookbook_file "/etc/init.d/primefact.sh" do
  source "primefact.sh"
  mode "0677"
end

cookbook_file "/opt/reqfiles.sh" do
  source "reqfiles.sh"
  mode "0677"
end

package "ruby-railties" do
  action :install
end

#execute 'apt-get update' do
 # command 'apt-get update && sudo apt-get upgrade'
  #ignore_failure true
  #action :nothing
#end

execute 'apt-get_install0' do
  command 'apt-get install sqlite3 libsqlite3-dev'
  ignore_failure true
  action :nothing
end

#execute 'apt-get_install1' do
 # command 'apt-get install ruby-railties-4.0 -y'
  #ignore_failure true
  #action :nothing
#end

bash "foo" do
  command "source /opt/reqfiles.sh"
end





#bash "reqfiles" do
 ## guard_interpreter :bash
 #code "opt/reqfiles.sh"
#end

#sudo gem install sqlite3 -v '1.3.9'

#gem_package "sqlite3" do
#	action :install
#end


#bash "bundle_install" do
 # user "root"
  #cwd "/prime_factors_kata"
  #code <<-EOH
   # bundle install
  #EOH
  #action :nothing
#end

#bash "install_program" do
 # user "root"
  #cwd "/prime_factors_kata/bin"
  #code <<-EOH
   # rake db:migrate
  #EOH
  #action :nothing
#end




#cookbook_file "/opt/startapp.sh" do
 # source "startapp.sh"
  #mode "0677"
#end

#bash "startapp" do
 # guard_interpreter :bash
  #code "opt/startapp.sh"
 #end
 
 
 
 cookbook_file "/var/chef/prime_factors_kata/install.sh" do
   source "install.sh"
   mode "0677"
 end
 
  bash "install" do
   guard_interpreter :bash
   code "/var/chef/prime_factors_kata/install.sh"
 end
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



include_recipe "ruby"
#include_recipe "myApp"

#execute 'install rails gem' do
 # command 'gem install rails'
#end

package "rails" do
  action :install
end

directory "/var/chef/prime_factors_kata/tmp" do
 owner 'root'
 group 'root'
 mode '0755'
 action :create
end

%w[ /var/chef/prime_factors_kata/db /var/chef/prime_factors_kata/db/migrate /var/chef/prime_factors_kata/tmp /var/chef/prime_factors_kata/log /var/chef/prime_factors_kata/Gemfile.lock ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0777'
  end
end


%w[ /var/chef/prime_factors_kata/db/seeds.rb /var/chef/prime_factors_kata/db/schema.rb ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0777'
  end
end



#Star pimefact rail server
cookbook_file "/var/chef/prime_factors_kata/db/development.sqlite3" do
  source "development.sqlite3"
  mode "0677"
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

package "libsqlite3-dev" do
  action :install
end

execute 'updatesqlite' do
  cwd '/var/chef/prime_factors_kata'
  command 'bundle update sqlite3'
end

execute 'updatedb' do
  cwd '/var/chef/prime_factors_kata'
  command 'rake db:migrate'
end

cookbook_file "/opt/startapp.sh" do
  source "startapp.sh"
  mode "0677"
end

#bash "startapp" do
 # guard_interpreter :bash
 #code "opt/startapp.sh"
 #end
#Start Rails Server
execute 'startRailServer' do
  cwd '/var/chef/prime_factors_kata'
  command 'rails s -d'
end
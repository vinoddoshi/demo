#
# Cookbook Name:: myApp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git"

#cookbook_file "/opt/myapp.sh" do
#	source "myapp.sh"
#	mode "0677"
#end

#bash "myapp" do
 # guard_interpreter :bash
 # code "opt/myapp.sh"
 #end

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



cookbook_file "/var/chef/prime_factors_kata/myapp.sh" do
	source "myapp.sh"
	mode "0677"
end

bash "myapp" do
  guard_interpreter :bash
  code "/var/chef/prime_factors_kata/myapp.sh"
end



#Star pimefact rail server
#cookbook_file "/etc/init.d/primefact.sh" do
 # source "primefact.sh"
  #mode "0677"
#end




#cookbook_file "/opt/startapp.sh" do
 # source "startapp.sh"
  #mode "0677"
#end

#bash "startapp" do
 # guard_interpreter :bash
 #code "opt/startapp.sh"
 #end
 
 
 

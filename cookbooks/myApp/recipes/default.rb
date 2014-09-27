#
# Cookbook Name:: myApp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git"
cookbook_file "/opt/myapp.sh" do
	source "myapp.sh"
	mode "0677"
end

bash "myapp" do
  guard_interpreter :bash
  code "opt/myapp.sh"
 end
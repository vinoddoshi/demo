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
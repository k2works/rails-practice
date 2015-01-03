#
# Cookbook Name:: rails_book_cookbook
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'rails_book_cookbook::ops_user'
include_recipe 'rails_book_cookbook::keys'
include_recipe 'rails_book_cookbook::nginx_setting'
include_recipe 'rails_book_cookbook::iptables'

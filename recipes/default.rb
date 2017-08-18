#
# Cookbook Name:: jenkins
# Recipe:: default
# Author:: Eric Bordeleau < ebordeleau@myfastmail.com>
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
#

package "wget" do
	action :install
end

execute 'Adding GPG key' do
      command  "wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -"
      action :run
end

template "/etc/apt/sources.list.d/jenkins.list" do
	source 'jenkins.list.erb'
	owner 'root'
	group 'root'
	mode '0644'
end

include_recipe 'apt'

package "jenkins" do
      action :install
end
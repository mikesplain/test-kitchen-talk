#
# Cookbook Name:: consul_test
# Recipe:: default
#
# Copyright (C) 2014 Mike Splain
#
# All rights reserved - Do Not Redistribute
#

node.override['consul']['serve_ui'] = true
node.override['consul']['service_mode'] = 'cluster'
node.override['consul']['init_style'] = 'runit'
node.override['consul']['bootstrap_expect'] = 2

servers = search(:node, "recipes:consul_test\\:\\:server").sort.map{ |server| server['ipaddress']}

log "Consul servers found: #{servers}"

node.override['consul']['servers'] = servers


include_recipe 'consul'
include_recipe 'consul::ui'

#
# Cookbook:: st2
# Recipe:: default
#
# Copyright (c) 2017 Brian Clark <brian@clark.zone>

include_recipe 'st2::install'
include_recipe 'st2::htpasswd'
include_recipe 'st2::user'
include_recipe 'st2::configure'

# This sample recipe installs apache... because why not?

case node["platform"]
when "debian", "ubuntu"
  include_recipe 'apt'
when "redhat", "centos", "fedora"
  include_recipe 'yum'
end

include_recipe 'apache2'

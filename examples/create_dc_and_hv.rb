require 'rubygems'
require 'abiquo'
require 'pp'

auth = Abiquo::BasicAuth.new('Abiquo', 'admin', 'xabiquo')
api = Abiquo::Resource('http://abiquo-server-ip:8080/api', auth)


#
# Create a DataCenter
#
#puts "Creating DC1 in BCN..."
api.datacenters.create :name => 'DC1', :location => 'BCN'

#
# Create Remote Services
# 
api.datacenters.first.remoteServices.create :type => 'VIRTUAL_FACTORY', :uri => 'http://localhost:8080/virtualfactory'
api.datacenters.first.remoteServices.create :type => 'STORAGE_SYSTEM_MONITOR', :uri => 'http://localhost:8080/ssm'
api.datacenters.first.remoteServices.create :type => 'VIRTUAL_SYSTEM_MONITOR', :uri => 'http://localhost:8080/vsm'
api.datacenters.first.remoteServices.create :type => 'NODE_COLLECTOR', :uri => 'http://localhost:8080/nodecollector'
api.datacenters.first.remoteServices.create :type => 'APPLIANCE_MANAGER', :uri => 'http://localhost:8080/am'
api.datacenters.first.remoteServices.create :type => 'DHCP_SERVICE', :uri => 'http://localhost:7911'
api.datacenters.first.remoteServices.create :type => 'BPM_SERVICE', :uri => 'http://localhost:7911'

#
# Create a new Rack
#
puts "Creating rack 'myrack01'..."
api.datacenters.first.racks.create :name => 'myrack01'

#
# Iterate over all the racks and print the rack name
#
puts "Listing racks.."
api.datacenters.first.racks.each do |rack|
  pp rack.name
end

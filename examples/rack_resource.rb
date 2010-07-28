require 'rubygems'
require 'abiquo'
require 'pp'

auth = Abiquo::BasicAuth.new('Abiquo', 'admin', 'admin')
api = Abiquo::Resource('http://as-testing.bcn.abiquo.com:8080/api', auth)

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

#
# Delete the rack myrack01
# 
puts "Deleting rack 'myrack01'..."
api.datacenters.first.racks.each do |r|
  r.delete if r.name == 'myrack01'
end

#
# Iterate over all the racks and print the rack name
#
# NOT SUPPORTED IN ABIQUO1.6
# puts "Listing racks..."
# api.datacenters.first.racks.each do |rack|
#   pp rack.name
# end

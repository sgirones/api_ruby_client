require 'rubygems'
gem 'activesupport', '2.3.8'
require 'abiquo'
require 'pp'

auth = Abiquo::BasicAuth.new('Abiquo', 'admin', 'xabiquo')
api = Abiquo::Resource('http://foo-server:8080/api', auth)

#
# Create a new Rack
#
dc = api.datacenters.first

# Create the rack
rack = dc.racks.create :name => 'myrack05'

#
# This is weird
#
# Create the machine
machine = rack.machines.create :name => 'foo', :cpu => '2', :description => 'foo', :hd => '100000', :ram => '1024', :virtualSwitch => 'eth2', :state => 'STOPPED'

# Create the HV
hv = machine.hypervisors.create :type => 'KVM', :ip => '10.60.1.80'

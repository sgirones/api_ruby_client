require 'spec_helper'

feature "Deleting resources" do
  
  scenario "Deleting a resource" do
    datacenter = Abiquo::Resource("http://abiquo.example.com/api/admin/datacenters/1", auth)
    
    stub_auth_request(:delete, "http://admin:admin@abiquo.example.com/api/admin/datacenters/1").to_return(:status => 200)
    
    datacenter.delete
    
    auth_request(:delete, "http://admin:admin@abiquo.example.com/api/admin/datacenters/1").should have_been_made.once
  end
  
end

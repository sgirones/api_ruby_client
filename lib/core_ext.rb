module Resourceful
  class Resource
    def host_with_port
      add = Addressable::URI.parse(uri)
      !add.port.blank? && add.port != 80 ? [add.host, add.port].join(':') : add.host
    end

    alias_method_chain :host, :port
  end
end

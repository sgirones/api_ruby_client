require 'net/http'

module Resourceful
  class Resource
    def options(header = {})
      request(:options, nil, header)
    end

    def host_with_port
      add = Addressable::URI.parse(uri)
      !add.port.blank? && add.port != 80 ? [add.host, add.port].join(':') : add.host
    end

    alias_method_chain :host, :port
  end

  class NetHttpAdapter
    def net_http_request_class_with_options(method)
      if method == :options
        Net::HTTP::Options
      else
        net_http_request_class_without_options(method)
      end
    end

    alias_method_chain :net_http_request_class, :options
  end
end

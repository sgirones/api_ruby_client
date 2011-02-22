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

    alias_method :host_without_port, :host
    alias_method :host, :host_with_port
  end

  class NetHttpAdapter
    def net_http_request_class_with_options(method)
      if method == :options
        Net::HTTP::Options
      else
        net_http_request_class_without_options(method)
      end
    end

    alias_method :net_http_request_class_without_options, :net_http_request_class
    alias_method :net_http_request_class, :net_http_request_class_with_options
  end
end

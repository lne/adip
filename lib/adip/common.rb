require "#{File.dirname(File.expand_path(__FILE__))}/queue"
require "#{File.dirname(File.expand_path(__FILE__))}/logger"
require 'yaml'
  
module Adip
  module Config
    module_function
    def load(opt)
      case opt
      when Hash
        opt
      when File
        YAML.load_file opt.path
      when String
        File.exist?(opt) ? YAML.load_file(opt) : YAML.load(opt)
      else
        raise Adip::Exception::ConfigError.new("can't load config from #{opt.inspect}")
      end
    end
  end

  module Exception
    class ConfigError < StandardError; end
    class QueueError < StandardError; end
  end
end


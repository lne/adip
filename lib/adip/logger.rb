require 'logger'
module Adip
  class Logger < ::Logger
    def self.debug(msg)
      puts "[D] " + msg
    end
    def self.warn(msg)
      puts "[W] " + msg
    end
    def self.fatal(msg)
      puts "[F] " + msg
    end
    def self.info(msg)
      puts "[I] " + msg
    end
    def self.error(msg)
      puts "[E] " + msg
    end
  end
end

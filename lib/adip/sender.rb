require "#{File.dirname(File.expand_path(__FILE__))}/common"
require "#{File.dirname(File.expand_path(__FILE__))}/qstore"
require "#{File.dirname(File.expand_path(__FILE__))}/server"

module Adip
  class Sender

    R_MODE = ['receiver',  'sender-receiver',  'sr', 'r']
    S_MODE = ['store',     'sender-store',     'ss', 's']
    F_MODE = ['forbidden', 'sender-forbidden', 'sf', 'f']
    
    attr_reader :configurations, :mode

    def initialize(conf)
      configurations = Adip::Config.load conf
      mode = configurations[:mode]
      Adip::Logger.info "*** Initialize Adip sender ***"
      Adip::Logger.info "Adip sender configurations: #{configurations.inspect}"
      Adip::Logger.info "Adip sender mode: #{mode}"
      case mode
      when *R_MODE
        @server = Adip::Server.new configurations[:servers]
      when *S_MODE
        @qstore = Adip::QStore.new configurations[:databases]
      when *F_MODE
        Adip::Logger.warn "Adip will not work on this mode"
      else
        raise Adip::Exception::ConfigError.new("unknown mode: #{mode}")
      end
    end

    def push(q)
      queue = Adip::Queue.create q
      if queue.nil?
        raise Adip::Exception::QueueError.new("can't create queue from: #{q.inspect}")
      end
      case mode
      when *R_MODE
        @server.save queue
      when *S_MODE
        @qstore.save queue
      end
    end

    private

  end
end

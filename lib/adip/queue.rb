module Adip
  class Queue

    ATTRS = [:id, :type, :priority, :status, :result, :delivery, :max_delivery, :expired_at,
             :created_at, :udpated_at, :owner, :body, :details] 

    attr_accessor *ATTRS

    def initialize(opts = {})
      @attrs = opts
    end


    def update(opts)
      @attrs.merge!(opts)
    end

    # To hash
    def to_h
      @attrs
    end

    def to_s
      "#{super}<Attributes:#{@attrs.inspect}>"
    end

    def self.create(q)
      case q
      when Queue
        q
      when Hash
        new(q)
      else
        nil
      end
    end
  end
end

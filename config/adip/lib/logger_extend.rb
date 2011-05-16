# logger_extend: Overroad ActiveSupport::BufferdLogger#add.

module ActiveSupport
  class BufferedLogger
    def port=(port_number)
      @port = port_number
    end
    def uid=(uid)
      @uid = uid
    end

    def add(severity, message = nil, progname = nil, &block)
      return if @level > severity
      message = (message || (block && block.call) || progname).to_s
      message = "#{message}\n" unless message[-1] == ?\n
      seve = ["DBG","INF","WRN","ERR","FTL"][severity] || "???"
      header = "[#{seve}:#{@port}:#{@uid}] "

      buffer << "[#{Time.now.strftime("%m%d%H%M%S")}]"
      buffer << header
      buffer << message
      auto_flush
      message
    end
  end
end

# Setup port-number to logger
class ActionController::Base
private
  def set_logger_uid(uid = 0)
    logger.uid = uid || 0
  end

  def set_logger_port
    logger.port = request.port
  end
end


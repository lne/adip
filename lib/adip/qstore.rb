require "#{File.dirname(File.expand_path(__FILE__))}/common"

module Adip
  class QStore
    attr_reader :engine, :configs
    
    def initialize(conf)
      @configs = Adip::Config.load conf
      init_engine
    end

    def save(q)
      create(q)
    end

    def create(q)
      @engine.insert q
    end

    def update(q)
      @engine.update q
    end

    def delete(q)
      @engine.delete q
    end

    def search(conditions)
      @engine.search conditions
    end

    def count(conditions)
      @engine.count conditions
    end

    private

    #TODO: 
    def init_engine
      puts "init_engine"
      if @engine.nil?
        $ae = {}
        @engine = Object.new
        class << @engin
          def create(q)
            $ae[q.id.to_sym] = q
          end
          def update(q)
            $ae[q.id.to_sym] = q
          end
          def delete(q)
            $ae.delete = q.id.to_sym
          end
          def search(c)
            $ae[c[:id]]
          end
        end
      end
    end


    #=============== Engine ===============
    module Engine
      class Mysql
        class ActiveQueue < ActiveRecord::Base
          
        end

        def initialize(conf)
          @configs = conf
          @default_db = @configs.first
          ActiveRecord::Base.configurations = @default_db
        end

      
      end
    end
  end
end

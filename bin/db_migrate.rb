require 'rubygems'
require 'yaml'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)
config_path = "#{File.dirname(File.expand_path(__FILE__))}/config/database.yml"
config = YAML.load_file(config_path) []
ActiveRecord::Base.establish_connection(database_config)
ActiveRecord::Migrator.migrate("lib/ap4r/db/migrate/")


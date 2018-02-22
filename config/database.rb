Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.plugin :json_serializer
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("mysql2://root:@127.0.0.1/auditbook_development", :loggers => [logger])
  when :production  then Sequel.connect("mysql2://localhost/auditbook_production",  :loggers => [logger])
  when :test        then Sequel.connect("mysql2://root:@127.0.0.1/auditbook_test",        :loggers => [logger])
end
Sequel::Model.db.extension(:pagination)

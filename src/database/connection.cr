require "../configuration/variable.cr"
require "pg"

module Database
  class Connection
    INSERT = "INSERT INTO "
    FIND = "SELECT * FROM "
    DESTROY = "DELETE FROM "
    DUPLICATE = "A #{MODEL} with that attribute exists already"
    DB = PG.connect("postgres://#{Variable::POSTGRES_USERNAME}:#{Variable::POSTGRES_PASSWORD}@#{Variable::POSTGRES_HOST}:#{Variable::POSTGRES_PORT}/#{Variable::POSTGRES_DB}")


    def self.connect(type_tuple, command)
      DB.exec(type_tuple, command)
    end
  end
end

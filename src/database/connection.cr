require "../configuration/variable.cr"
require "pg"

module Database
  class Connection
    INSERT = "INSERT INTO "
    FIND = "SELECT * FROM "
    UPDATE = "UPDATE "
    DESTROY = "DELETE FROM "
    DUPLICATE = "A record with that attribute exists already"
    NOT_FOUND = "No record with that ID"
    DB = PG.connect("postgres://#{Variable::POSTGRES_USERNAME}:#{Variable::POSTGRES_PASSWORD}@#{Variable::POSTGRES_HOST}:#{Variable::POSTGRES_PORT}/#{Variable::POSTGRES_DB}")


    def self.connect(command)
      DB.exec(command).to_hash
    end
  end
end

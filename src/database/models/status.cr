require "../connection.cr"

class Status < Database::Connection
  MODEL = "statuses"

  def self.create_table
    statement = "CREATE TABLE statuses (id SERIAL PRIMARY KEY, name varchar(50));"
    Database::Connection.connect(statement)
  end

  def self.create
    check = find_by(name)

    unless check.size > 0
    else
      p DUPLICATE
    end
  end

  def self.all
    Database::Connection.connect(FIND + MODEL)
  end

  def self.query(where)
    Database::Connection.connect(FIND + MODEL + " WHERE #{where};")
  end

  def self.find_by(name = "", id = 0)
    where = case
    when id != 0
      "id = #{id}"
    when name != ""
      "name = #{name}"
    end
    statement = FIND + MODEL +  " WHERE #{where};"
    Database::Connection.connect(statement)
  end

  def self.destroy(name = "", id = 0)
    where = case
    when id != 0
      "id = #{id}"
    when name != ""
      "name = #{name}"
    end
    statement = DESTROY + MODEL +  " WHERE #{where};"
    Database::Connection.connect(statement)
  end
end

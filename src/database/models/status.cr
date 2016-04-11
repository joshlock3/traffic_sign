require "../connection.cr"

class Status < Database::Connection
  MODEL = "statuses"
  TYPE_TUPLE = {Int32, String}

  def self.create_table
    type_tuple =  { Int32, String }
    statement = "CREATE TABLE statuses (id SERIAL PRIMARY KEY, name varchar(50));"
    Database::Connection.connect(type_tuple, statement)
  end

  def self.create
    check = find_by(name)

    unless check.size > 0
    else
      p DUPLICATE
    end
  end

  def self.all
    Database::Connection.connect(TYPE_TUPLE, FIND + MODEL)
  end

  def self.query(where)
    Database::Connection.connect(TYPE_TUPLE, FIND + MODEL + " WHERE #{where};")
  end

  def self.find_by(name = "", id = 0)
    where = case
    when id != 0
      "id = #{id}"
    when name != ""
      "name = #{name}"
    end
    statement = FIND + MODEL +  " WHERE #{where};"
    Database::Connection.connect(TYPE_TUPLE, statement)
  end

  def self.destroy(name = "", id = 0)
    where = case
    when id != 0
      "id = #{id}"
    when name != ""
      "name = #{name}"
    end
    statement = DESTROY + MODEL +  " WHERE #{where};"
    Database::Connection.connect(TYPE_TUPLE, statement)
  end
end

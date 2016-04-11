require "../connection.cr"

class Team < Database::Connection
  MODEL = "teams"
  TYPE_TUPLE = {Int32, String}

  def self.create_table
    statement = "CREATE TABLE teams (id SERIAL PRIMARY KEY, name varchar(50));"
    Team.connect(TYPE_TUPLE, statement)
  end

  def self.create(user_id = 0, card_number = 0)
    check = find(user_id: user_id, card_number: card_number)

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

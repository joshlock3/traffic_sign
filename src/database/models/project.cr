require "../connection.cr"

class Project < Database::Connection
  # name, team_id, due_date, adjusted_due_date, status_id, completed

  MODEL = "projects"
  TYPE_TUPLE = {Int32, String, String, String, Int32, Int32}

  def self.create_table
    statement = "CREATE TABLE projects (id SERIAL PRIMARY KEY, name varchar(50), due_date date, adjusted_due_date date, status_id int, completed bit);"
    Database::Connection.connect(TYPE_TUPLE, statement)
  end

  def self.create(name = "", due_date = "", adjusted_due_date = "", status_id = 0, completed = 0)
    check = find(name: name)

    statement = INSERT + MODEL + " (name, due_date, adjusted_due_date, status_id, completed) VALUES('#{name}', '#{due_date}', '#{adjusted_due_date}', '#{status_id}', '#{completed}');"

    unless check.size > 0
      Database::Connection.connect(TYPE_TUPLE, statement)
    else
      puts DUPLICATE
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

require "../connection.cr"

class Project < Database::Connection
  # name, team_id, due_date, adjusted_due_date, status_id, completed

  MODEL = "projects"
  TYPE_TUPLE = {Int32, String, String, String, Int32, Int32, Int32}

  def self.create_table
    statement = "CREATE TABLE projects (id SERIAL PRIMARY KEY, name varchar(50), due_date date, adjusted_due_date date, status_id int, completed bit, team_id int);"
    Database::Connection.connect(statement)
  end

  def self.create(name = "", due_date = "", adjusted_due_date = "", status_id = 0, completed = 0, team_id = 0)
    check = find_by(name: name)

    statement = INSERT + MODEL + " (name, due_date, adjusted_due_date, status_id, completed, team_id) VALUES('#{name}', '#{due_date}', '#{adjusted_due_date}', '#{status_id}', '#{completed}', '#{team_id}');"

    unless check.size > 0
      Database::Connection.connect(statement)
    else
      puts DUPLICATE
    end
  end

  def self.create(arg = {} of String => String)
    check = find_by(name: name)

    columns = arg.map{ |k, v| k }.join(", ")
    values = arg.map{ |k, v| "'#{v}'" }.join(", ")

    statement = INSERT + MODEL + " (#{columns}) VALUES(#{values});"

    unless check.size > 0
      Database::Connection.connect(statement)
    else
      puts DUPLICATE
    end
  end

  def self.update(id, arg = {} of String => String)
    check = find_by(id: id)
    values = arg.map{ |k, v| "#{k} = #{v}" }.join(", ")

    statement = UPDATE + MODEL + " SET #{values} WHERE id = #{id};"

    case check.size
    when 0
      p Database::Connection::NOT_FOUND
    else
      Database::Connection.connect(statement)
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
      "name = '#{name}'"
    end

    statement = FIND + MODEL +  " WHERE #{where};"

    Database::Connection.connect(statement)
  end

  def self.destroy(name = "", id = 0)
    where = case
    when id != 0
      "id = #{id}"
    when name != ""
      "name = '#{name}'"
    end
    statement = DESTROY + MODEL +  " WHERE #{where};"
    Database::Connection.connect(statement)
  end
end

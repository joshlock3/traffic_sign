require "../../libs/sqlite3"

module Database::Connection
  INSERT = "INSERT INTO "
  FIND = "SELECT * FROM "
  DESTROY = "DELETE FROM "
  DUPLICATE = "A #{MODEL} with that attribute exists already"

  def self.connect(command)
    db = SQLite3::Database.new("traffic_sign.db")
    results = Array(Int32 | String | Nil).new
    stmt = db.prepare(command)
    result_set = stmt.execute
    while result_set.next
      results = result_set.to_a
    end
    stmt.close
    db.close

    return results
  end

  class Project
    # name, team_id, due_date, adjusted_due_date, status_id, completed
    MODEL = "projects"

    def self.table
      Database::Connection.connect("CREATE TABLE projects (id INTEGER PRIMARY KEY ASC, name, due_date, adjusted_due_date, status_id, completed);")
    end

    def self.create(name = "", due_date = "", adjusted_due_date = "", status_id = 0, completed = 0)
      check = find(name: name)

      unless check.size > 0
        statement = INSERT + MODEL + " (name, due_date, adjusted_due_date, status_id, completed) VALUES('#{name}', '#{due_date}', '#{adjusted_due_date}', '#{status_id}', '#{completed}');"
        Database::Connection.connect(statement)
      else
        p DUPLICATE
      end
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


    def self.destroy
      statement = DESTROY + MODEL +  " WHERE name = '#{name}';"
      Database::Connection.connect(statement)
    end
  end

  class Team
    # name

    MODEL = "teams"

    def self.table
      Database::Connection.connect("CREATE TABLE teams (id INTEGER PRIMARY KEY ASC, name);")
    end

    def self.create(user_id = 0, card_number = 0)
      check = find(user_id: user_id, card_number: card_number)

      unless check.size > 0
      else
        p DUPLICATE
      end
    end

    def self.find
    end

    def self.destroy
    end
  end


  class Status
    #name

    MODEL = "statuses"

    def self.table
      Database::Connection.connect("CREATE TABLE statuses (id INTEGER PRIMARY KEY ASC, name);")
    end

    def self.create
      check = find(name)

      unless check.size > 0
      else
        p DUPLICATE
      end
    end

    def self.find
    end

    def self.destroy
    end
  end

end

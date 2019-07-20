require 'sqlite3'
require 'singleton'
require_relative 'aa_questions'

class User
  def self.find_by_name(fname, lname)
    person = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
        SELECT
          *
        FROM
          users
        WHERE
          fname = ?, lname = ?
      SQL
      return nil if person.length < 0
  end

  def self.find_by_id(id)
    users = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    
    return nil unless users.length > 0

    User.new(users.first) # 
  end

  attr_accessor :id, :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
     authored_questions = QuestionsDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        title, body
      FROM
        questions
      WHERE
        author_id = ?
    SQL
  end

  def authored_replies
  end

end
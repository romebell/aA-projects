require 'sqlite3'
require 'singleton'
require_relative 'users'
require_relative 'reply'

class QuestionsDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('aa_questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Questions
  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |data_hash| Questions.new(data_hash) }
  end

  def self.find_by_id(id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    
    return nil unless questions.length > 0

    Questions.new(questions.first) # 
  end

  def self.find_by_author_id(author_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
  end

  attr_accessor :id

  def initialize(options)
   @id = options['id']
  end

  def author
    Questions.find_by_id(@id) 
  end

  def replies
  end 
end



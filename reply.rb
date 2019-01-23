require 'sqlite3'
require 'singleton'
require_relative 'aa_questions'
require_relative 'users'

class Reply
  def self.all
    replies = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    replies.map { |data_hash| Reply.new(data_hash) }
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
  end

  def self.find_by_question_id(question_id)
  end

  attr_reader :id, :parent_id, :question_id, :author_id, :body

  def initialize(options)
    @id = options['id']
    @parent_id = @id
    @question_id = options['question_id']
    @author_id = options['author_id']
    @body = options['body']
  end


  def author
    User.find_by_id(@author_id)
  end

  def question 
    Questions.find_by_id(@question_id)
  end

  def parent_reply
    
  end

  def child_replies
  end
  
end
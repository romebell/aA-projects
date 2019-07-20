class AnswerChoice < ApplicationRecord
  belongs_to :question,
    primary_key: :id,
    
end
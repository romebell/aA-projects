class Response < ApplicationRecord
  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :responder_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll
end
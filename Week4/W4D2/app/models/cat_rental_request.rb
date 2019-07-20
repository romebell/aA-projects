class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING),
    message: "%{value} is not a valid status" }
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  belongs_to :cat,  
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat   
end

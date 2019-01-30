class Cat < ApplicationRecord
    validates :color, inclusion: { in: %w(White Black Red Blue Orange Green),
      message: "%{value} is not a valid color" }
    validates :sex, inclusion: { in: %w(M F),
      message: "%{value} is not a valid sex" }
    validates :color , presence: true
    validates :birth_date , presence: true
    validates :name , presence: true
    validates :sex , presence: true
    validates :description , presence: true

    has_many :cat_rental_requests, :dependent :destroy,
      primary_key: :id,
      foreign_key: :cat_id,
      class_name: :CatRentalRequest 

    def age
      now = Time.now.utc.to_date
      if birth_date
        now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
      end
    end
end

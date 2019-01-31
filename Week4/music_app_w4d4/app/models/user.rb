# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 8, allow_nil: true }

    def self.generate_session_token
        self.session_token = SecureRandom::urlsafe_base64 
    end

    def reset_session_token!
        User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token || User.generate_session_token
    end

    
end

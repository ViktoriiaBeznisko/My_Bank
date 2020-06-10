class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :money_requests
    has_many :loans, through: :money_requests
    has_many :payments


    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash['info']['email']).first_or_create do |user|
            user.password = SecureRandom.hex
            user.uid = auth_hash['uid']
            user.name = auth_hash['info']['name']
        end
    end

end


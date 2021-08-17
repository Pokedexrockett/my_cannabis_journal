class User < ApplicationRecord
    has_many :reviews
    has_many :user_strains, through: :reviews, source: :strain

    has_many :growers
    has_many :growers, through: :strains

    has_secure_password

    validates :user_name, :email, presence: true
    validates :email, uniqueness: true
end

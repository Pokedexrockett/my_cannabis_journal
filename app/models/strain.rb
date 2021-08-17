class Strain < ApplicationRecord
    belongs_to :user
    belongs_to :grower
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, :category, :thc, :cbd, presence: true
end

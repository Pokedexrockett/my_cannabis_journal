class Grower < ApplicationRecord
  #belongs_to :user
  has_many :strains
  #has_many :users, through: :strains

  validates :name, presence: true

  scope :alpha, -> {order(:name)} 
end

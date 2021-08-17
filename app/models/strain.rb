class Strain < ApplicationRecord
    belongs_to :user
    belongs_to :grower
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, :category, :thc, :cbd, presence: true

    scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(pot_leaves) desc')}

    def self.alpha
        order(:name) 
    end

    def grower_attributes=(attributes)
        self.grower = Grower.find_or_create_by(attributes) if !attributes['name'].empty?
        self.grower 
    end

 

    def grower_name
        grower.try(:name)
    end
    
    def name_and_grower
        "#{name} - #{grower.try(:name)}"
    end

end

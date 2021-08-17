class Review < ApplicationRecord
    belongs_to :user
    belongs_to :strain

    validates :form, presence: true  
    validates :form, length: {maximum: 25}
    validates :note, length: {maximum: 250} 
    validates :pot_leaves, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
    
    validates :strain, uniqueness: { scope: :user, message: "has already been reviewed by you"  }

end

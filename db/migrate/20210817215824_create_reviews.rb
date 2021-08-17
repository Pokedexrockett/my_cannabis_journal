class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :form
      t.string :notes
      t.integer :user_id
      t.integer :strain_id
      t.string :no--test-framework

      t.timestamps
    end
  end
end

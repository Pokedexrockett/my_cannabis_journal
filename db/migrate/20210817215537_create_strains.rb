class CreateStrains < ActiveRecord::Migration[6.1]
  def change
    create_table :strains do |t|
      t.string :name
      t.string :category
      t.integer :thc
      t.integer :cbd
      t.integer :user_id
      t.integer :grower_id

      t.timestamps
    end
  end
end

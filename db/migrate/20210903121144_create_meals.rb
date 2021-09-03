class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.date :last_day, null: false
      t.integer :price_id, null: false
      t.integer :calorie_id, null: false
      t.references :user, foreign_key: true
      t.text :link
      t.timestamps
    end
  end
end

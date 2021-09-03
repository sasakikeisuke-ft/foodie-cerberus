class CreateMealTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_tag_relations do |t|
      t.references :meal, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end

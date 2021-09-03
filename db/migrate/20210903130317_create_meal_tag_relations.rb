class CreateMealTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_tag_relations do |t|

      t.timestamps
    end
  end
end

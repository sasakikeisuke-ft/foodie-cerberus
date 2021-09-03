class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.references :meal, foreign_key: true
      t.timestamps
    end
  end
end

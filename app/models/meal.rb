class Meal < ApplicationRecord
  with_options presence: true do
    with_options numericality: { other_than: 0, message: 'を選択してください' } do
      validates :category_id
      validates :price_id
      validates :calorie_id
      validates :labor_id
    end
    validates :name, uniqueness: { case_sensitive: false, scope: :user_id }
    validates :last_day
  end
  belongs_to :user
  has_many :meal_tag_relations, dependent: :destroy
  has_many :tags, through: :meal_tag_relations
  has_many :logs, dependent: :destroy

  # ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :price
  belongs_to_active_hash :calorie
  belongs_to_active_hash :labor
end

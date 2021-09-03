class MealTagRelation < ApplicationRecord
  validates :meal, uniqueness: { case_sensitive: false, scope: :tag_id }
  validates :tag, uniqueness: { case_sensitive: false, scope: :meal_id }
  belongs_to :meal
  belongs_to :tag
end

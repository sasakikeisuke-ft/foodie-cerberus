class Tag < ApplicationRecord
  with_options presence: true do
    validates :category_id, numericality: { other_than: 0, message: "を選択してください" }
    validates :name, uniqueness: { case_sensitive: false, scope: :user_id }
  end
  belongs_to :user
  has_many :meal_tag_relations, dependent: :destroy
  has_many :meals, through: :meal_tag_relations

  # ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end

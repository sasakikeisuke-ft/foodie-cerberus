require 'rails_helper'

RSpec.describe MealTagRelation, type: :model do
  before do
    @meal_tag_relation = FactoryBot.build(:meal_tag_relation)
    sleep 0.1 # エラーを防ぐために休止時間を入れています。不要なら削除してください。
  end

  describe 'MealTagRelationモデルの登録機能' do
    context '入力内容が適切であれば登録できる' do
      it '入力内容が全て適切であれば登録できる' do
        expect(@meal_tag_relation).to be_valid
      end
    end

    context '不適切な内容があり登録できない' do
      it 'mealが紐づけられていないと登録できない' do
        @meal_tag_relation.meal = nil
        @meal_tag_relation.valid?
        expect(@meal_tag_relation.errors.full_messages).to include("Mealを入力してください")
      end
      it 'meal_idの重複があり登録できない' do
        @meal_tag_relation.save
        another_meal_tag_relation = FactoryBot.build(:meal_tag_relation, meal_id: @meal_tag_relation.meal_id, tag: @meal_tag_relation.tag)
        another_meal_tag_relation.valid?
        expect(another_meal_tag_relation.errors.full_messages).to include("Mealはすでに存在します")
      end
      it 'tagが紐づけられていないと登録できない' do
        @meal_tag_relation.tag = nil
        @meal_tag_relation.valid?
        expect(@meal_tag_relation.errors.full_messages).to include("Tagを入力してください")
      end
      it 'tag_idの重複があり登録できない' do
        @meal_tag_relation.save
        another_meal_tag_relation = FactoryBot.build(:meal_tag_relation, tag_id: @meal_tag_relation.tag_id, meal: @meal_tag_relation.meal)
        another_meal_tag_relation.valid?
        expect(another_meal_tag_relation.errors.full_messages).to include("Tagはすでに存在します")
      end
    end
  end
end

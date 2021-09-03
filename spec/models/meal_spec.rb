require 'rails_helper'

RSpec.describe Meal, type: :model do
  before do
    @meal = FactoryBot.build(:meal)
    sleep 0.1 # エラーを防ぐために休止時間を入れています。不要なら削除してください。
  end

  describe 'Mealモデルの登録機能' do
    context '入力内容が適切であれば登録できる' do
      it '入力内容が全て適切であれば登録できる' do
        expect(@meal).to be_valid
      end
      it 'linkが空欄でも登録できる' do
        @meal.link = ''
        expect(@meal).to be_valid
      end
    end

    context '不適切な内容があり登録できない' do
      it 'nameが空欄だと登録できない' do
        @meal.name = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include("料理名を入力してください")
      end
      it 'nameの重複があり登録できない' do
        @meal.save
        another_meal = FactoryBot.build(:meal, name: @meal.name, user: @meal.user)
        another_meal.valid?
        expect(another_meal.errors.full_messages).to include("料理名はすでに存在します")
      end
      it 'last_dayが空欄だと登録できない' do
        @meal.last_day = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include("最後に食べた日を入力してください")
      end
      it 'price_idが空欄だと登録できない' do
        @meal.price_id = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include("Priceを入力してください")
      end
      it 'calorie_idが空欄だと登録できない' do
        @meal.calorie_id = ''
        @meal.valid?
        expect(@meal.errors.full_messages).to include("Calorieを入力してください")
      end
      it 'userが紐づけられていないと登録できない' do
        @meal.user = nil
        @meal.valid?
        expect(@meal.errors.full_messages).to include("Userを入力してください")
      end
      it 'price_idが未選択だと登録できない' do
        @meal.price_id = 0
        @meal.valid?
        expect(@meal.errors.full_messages).to include("Priceを選択してください")
      end
      it 'calorie_idが未選択だと登録できない' do
        @meal.calorie_id = 0
        @meal.valid?
        expect(@meal.errors.full_messages).to include("Calorieを選択してください")
      end
    end
  end
end

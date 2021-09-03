require 'rails_helper'

RSpec.describe Log, type: :model do
  before do
    @log = FactoryBot.build(:log)
    sleep 0.1 # エラーを防ぐために休止時間を入れています。不要なら削除してください。
  end

  describe 'Logモデルの登録機能' do
    context '入力内容が適切であれば登録できる' do
      it '入力内容が全て適切であれば登録できる' do
        expect(@log).to be_valid
      end
    end

    context '不適切な内容があり登録できない' do
      it 'userが紐づけられていないと登録できない' do
        @log.user = nil
        @log.valid?
        expect(@log.errors.full_messages).to include('Userを入力してください')
      end
      it 'mealが紐づけられていないと登録できない' do
        @log.meal = nil
        @log.valid?
        expect(@log.errors.full_messages).to include('Mealを入力してください')
      end
    end
  end
end

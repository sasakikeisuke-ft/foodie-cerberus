require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = FactoryBot.build(:tag)
    sleep 0.1 # エラーを防ぐために休止時間を入れています。不要なら削除してください。
  end

  describe 'Tagモデルの登録機能' do
    context '入力内容が適切であれば登録できる' do
      it '入力内容が全て適切であれば登録できる' do
        expect(@tag).to be_valid
      end
    end

    context '不適切な内容があり登録できない' do
      it 'nameが空欄だと登録できない' do
        @tag.name = ''
        @tag.valid?
        expect(@tag.errors.full_messages).to include('タグ名を入力してください')
      end
      it 'nameの重複があり登録できない' do
        @tag.save
        another_tag = FactoryBot.build(:tag, name: @tag.name, user: @tag.user)
        another_tag.valid?
        expect(another_tag.errors.full_messages).to include('タグ名はすでに存在します')
      end
      it 'category_idが空欄だと登録できない' do
        @tag.category_id = ''
        @tag.valid?
        expect(@tag.errors.full_messages).to include('Categoryを入力してください')
      end
      it 'userが紐づけられていないと登録できない' do
        @tag.user = nil
        @tag.valid?
        expect(@tag.errors.full_messages).to include('Userを入力してください')
      end
      it 'category_idが未選択だと登録できない' do
        @tag.category_id = 0
        @tag.valid?
        expect(@tag.errors.full_messages).to include('Categoryを選択してください')
      end
    end
  end
end

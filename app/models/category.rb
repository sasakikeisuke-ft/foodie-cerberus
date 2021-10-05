class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '----', name_ja: '----' },
    { id: 1, name: 'meat', name_ja: 'お肉' },
    { id: 2, name: 'fish', name_ja: 'お魚' },
    { id: 3, name: 'vegetable', name_ja: '野菜' },
    { id: 4, name: 'rice', name_ja: '米・穀物' },
    { id: 5, name: 'dairy', name_ja: '乳製品' },
    { id: 6, name: 'noodles', name_ja: '麺類' },
    { id: 7, name: 'outside', name_ja: '外食・中食' },
    { id: 8, name: 'microwave', name_ja: '電子レンジ' },
    { id: 9, name: 'retort', name_ja: 'レトルト' },
    { id: 10, name: 'free', name_ja: 'フリー' }
  ]
  include ActiveHash::Associations
  has_many :meals
  has_many :tags
end

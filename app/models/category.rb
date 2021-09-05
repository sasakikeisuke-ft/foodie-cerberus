class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '----', name_ja: '----' },
    { id: 1, name: 'meat', name_ja: 'お肉' },
    { id: 2, name: 'fish', name_ja: 'お魚' },
    { id: 3, name: 'vegetable', name_ja: '野菜' },
    { id: 4, name: 'rice', name_ja: '米・穀物' },
    { id: 5, name: 'noodles', name_ja: '麺類' },
    { id: 6, name: 'eating_out', name_ja: '外食・' },
    { id: 7, name: 'microwave', name_ja: '電子レンジ' },
    { id: 8, name: 'retort_food', name_ja: 'レトルト' },
    { id: 9, name: 'free', name_ja: 'フリー' }
  ]
  include ActiveHash::Associations
  has_many :tags
end

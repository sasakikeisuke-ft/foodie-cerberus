class Labor < ActiveHash::Base
  self.data = [
    { id: 1, select: '簡単' },
    { id: 2, select: '普通' },
    { id: 3, select: '大変' },
    { id: 4, select: '選択せず登録' }
  ]
    include ActiveHash::Associations
  has_many :meals
end

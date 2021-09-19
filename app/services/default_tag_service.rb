class DefaultTagService
  def self.set(current_user_id)
    default_tags = [
      { name: '牛肉', category_id: 1 },
      { name: '豚肉', category_id: 1 },
      { name: '鶏肉', category_id: 1 },
      { name: '魚', category_id: 2 },
      { name: '野菜', category_id: 3 },
      { name: 'チャーハン', category_id: 4 },
      { name: 'そば', category_id: 5 },
      { name: 'レストラン', category_id: 6 },
      { name: '冷凍食品', category_id: 7 },
      { name: 'レトルト', category_id: 8 },
      { name: '中華料理', category_id: 9 }
    ]
    default_tags.each do |tag|
      tag = tag.merge(user_id: current_user_id)
      Tag.create(tag)
    end
  end
end

class SearchMealsService
  def self.search(search, user_id)
    case search
    when 'last_day_asc'
      meals = Meal.where(user_id: user_id).order(:last_day)
      comment = '昔に食べた順番で表示しています。'
    when 'last_day_desc'
      meals = Meal.where(user_id: user_id).order(last_day: "DESC")
      comment = '最近食べた順番で表示しています。'
    when 'price_cheap'
      meals = Meal.where(user_id: user_id, price_id: 1).order(:last_day)
      comment = '検索: 価格が安い'
    when 'price_normal'
      meals = Meal.where(user_id: user_id, price_id: 2).order(:last_day)
      comment = '検索: 価格は普通'
    when 'price_expensive'
      meals = Meal.where(user_id: user_id, price_id: 3).order(:last_day)
      comment = '検索: 価格が高い'
    when 'labor_little'
      meals = Meal.where(user_id: user_id, labor_id: 1).order(:last_day)
      comment = '検索: 手間はかからない'
    when 'labor_normal'
      meals = Meal.where(user_id: user_id, labor_id: 2).order(:last_day)
      comment = '検索: 手間は普通'
    when 'labor_lot'
      meals = Meal.where(user_id: user_id, labor_id: 3).order(:last_day)
      comment = '検索: 価格がかかる'
    else # 名前で検索
      puts '名前で検索まだ未実装'
    end
    content = {
      meals: meals,
      comment: comment
    }
    content
  end
end

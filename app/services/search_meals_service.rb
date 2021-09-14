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
    end
    content = {
      meals: meals,
      comment: comment
    }
    content
  end
end

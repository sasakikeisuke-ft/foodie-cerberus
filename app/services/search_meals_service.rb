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

    when 'price_normal'

    when 'price_expensive'

    end
    content = {
      meals: meals,
      comment: comment
    }
    content
  end
end

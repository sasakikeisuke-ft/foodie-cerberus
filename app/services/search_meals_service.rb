class SearchMealsService
  def self.search(name, search, user_id)
    if search.nil?
      if name == ''
        meals = Meal.where(user_id: user_id).order(:id)
        comment = '検索ワードが空欄でした。登録した順番に表示しています。'
       else
        meals = Meal.where(user_id: user_id).where('name LIKE(?)', "%#{name}%")
        comment = "検索: 料理名 #{name}"
      end
    else
      case search
      when 'last_day_asc'
        meals = Meal.where(user_id: user_id).order(:last_day)
        comment = '食べたのが古い順番で表示しています。'
      when 'last_day_desc'
        meals = Meal.where(user_id: user_id).order(last_day: "DESC")
        comment = '食べたのが最近である順番で表示しています。'
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
      when 'calorie_row'
        meals = Meal.where(user_id: user_id, calorie_id: 1).order(:last_day)
        comment = '検索: カロリーが低い'
      when 'calorie_normal'
        meals = Meal.where(user_id: user_id, calorie_id: 2).order(:last_day)
        comment = '検索: カロリーは普通'
      when 'calorie_high'
        meals = Meal.where(user_id: user_id, calorie_id: 3).order(:last_day)
        comment = '検索: カロリーが高い'
      when 'meat'
        meals = Meal.where(user_id: user_id, category_id: 1).order(:last_day)
        comment = '検索: お肉'
      when 'fish'
        meals = Meal.where(user_id: user_id, category_id: 2).order(:last_day)
        comment = '検索: お魚'
      when 'vegetable'
        meals = Meal.where(user_id: user_id, category_id: 3).order(:last_day)
        comment = '検索: 野菜'
      when 'rice'
        meals = Meal.where(user_id: user_id, category_id: 4).order(:last_day)
        comment = '検索: 米・穀物'
      when 'noodles'
        meals = Meal.where(user_id: user_id, category_id: 5).order(:last_day)
        comment = '検索: 麺類'
      when 'eating_out'
        meals = Meal.where(user_id: user_id, category_id: 6).order(:last_day)
        comment = '検索: 外食'
      when 'microwave'
        meals = Meal.where(user_id: user_id, category_id: 7).order(:last_day)
        comment = '検索: 電子レンジ'
      when 'retort_food'
        meals = Meal.where(user_id: user_id, category_id: 8).order(:last_day)
        comment = '検索: レトルト'
      when 'free'
        meals = Meal.where(user_id: user_id, category_id: 9).order(:last_day)
        comment = '検索: Free'
      else
        tag = Tag.where(user_id: user_id).find(search)
        meals = tag.meals
      end  
    end
    content = {
      meals: meals,
      comment: comment
    }
    content
  end
end

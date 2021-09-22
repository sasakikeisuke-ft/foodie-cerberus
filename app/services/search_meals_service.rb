class SearchMealsService
  def self.search(name, search, user_id)
    icon = ''
    if search.nil?
      if name == ''
        meals = Meal.where(user_id: user_id).order(:id)
        comment = '検索ワードが空欄でした。登録した順番に表示しています。'
       else
        meals = Meal.where(user_id: user_id).where('name LIKE(?)', "%#{name}%")
        comment = "#{name}を含む料理名"
      end
    else
      case search[:type]
      when 'last_day'
        meals = Meal.where(user_id: user_id).order(last_day: search[:id])
        case search[:id]
        when 'ASC'
          comment = '最後に食べた日: 昔の順番'
        when 'DESC'
          comment = '最後に食べた日: 最近の順番'
        end
      when 'price'
        meals = Meal.where(user_id: user_id, price_id: search[:id]).order(:last_day)
        comment = "価格: #{Price.find(search[:id]).select}"
      when 'labor'
        meals = Meal.where(user_id: user_id, labor_id: search[:id]).order(:last_day)
        comment = "大変さ: #{Labor.find(search[:id]).select}"
      when 'calorie'
        meals = Meal.where(user_id: user_id, calorie_id: search[:id]).order(:last_day)
        comment = "カロリー: #{Calorie.find(search[:id]).select}"
      when 'category'
        meals = Meal.where(user_id: user_id, category_id: search[:id]).order(:last_day)
        comment = "カテゴリー: #{Category.find(search[:id]).name_ja}"
        icon = Category.find(search[:id]).name
      when 'tag'
        tag = Tag.where(user_id: user_id).find(search[:id])
        meals = tag.meals
        comment = "#{tag.name}タグ"
        icon = tag.category.name
      end
    end
    content = {
      meals: meals,
      comment: comment,
      icon: icon
    }
    content
  end
end

module LogsHelper
  # 本日の献立を表示するための配列をハッシュで作成するメソッド
  def make_menu(logs)
    menu = { meals: [], tags: [] }
    logs.each do |log|
      menu[:meals] << log.meal
      log.meal.tags.each do |tag|
        menu[:tags] << tag
      end
    end
    menu
  end

  # 献立の提案を作成するメソッド。mealsはすでに古い順番となっている。
  def make_suggestion(meals)
    category_index = Category.where.not(id: 0)
    oldest_meals = make_oldest_meals(meals)
    suggestion = {
      category_index: category_index,
      random: meals[rand(0..meals.length - 1)],
      oldest: oldest_meals[rand(0..oldest_meals.length - 1)]
    }

    end_count = Category.where.not(id: 0).length
    count = 0
    meals.each do |meal|
      break if count == end_count

      if suggestion[meal.category.name.to_sym].nil?
        suggestion[meal.category.name.to_sym] = meal
        count += 1
      end
    end
    suggestion
  end

  def make_oldest_meals(meals)
    oldest_meals = []
    oldest_day = meals[0].last_day
    meals.each do |meal|
      break unless meal.last_day == oldest_day

      oldest_meals << meal
    end
    oldest_meals
  end
end

module LogsHelper
  def make_menu(logs)
    contents = {meals: [], tags: []}
    logs.each do |log|
      contents[:meals] << log.meal
      log.meal.tags.each do |tag|
        contents[:tags] << tag
      end
    end
    contents
  end



end

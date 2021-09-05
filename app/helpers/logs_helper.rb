module LogsHelper
  # 本日の献立を表示するための配列をハッシュで作成するメソッド
  def make_menu(logs)
    menu = {meals: [], tags: []}
    logs.each do |log|
      menu[:meals] << log.meal
      log.meal.tags.each do |tag|
        menu[:tags] << tag
      end
    end
    menu
  end



end

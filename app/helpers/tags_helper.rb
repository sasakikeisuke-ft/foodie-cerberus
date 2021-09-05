module TagsHelper
  # @tagsをcategoryごとに分類しハッシュで返すメソッド
  def distribution_tags(tags)
    contents = make_tag_contents_base
    tags.each do |tag|
      contents[tag.category.name.to_sym] << tag
    end
    contents
  end

  def make_tag_contents_base
    contents = {category_index: Category.where.not(id: 0)}
    contents[:category_index].each do |category|
      contents[category.name.to_sym] = []
    end
    contents
  end

end

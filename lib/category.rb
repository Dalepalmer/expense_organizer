class Category

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_categories.each() do |category|
      name = category.fetch("name")
      id = category.fetch("id").to_i()
      categories.push(Category.new({:name => name, :id => id}))
    end
    categories
  end

  define_singleton_method(:find) do |id|
    found_category = nil
    Category.all().each() do |category|
      if category.id().eql?(id)
        found_category = category
      end
    end
    found_category
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:expenses) do |id|
    results = DB.exec("SELECT amount FROM expenses;")
  end

  define_method(:==) do |another_category|
    self.name().==(another_category.name()).&(self.id().==(another_category.id()))
  end

end

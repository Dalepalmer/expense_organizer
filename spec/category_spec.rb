require('spec_helper')

describe(Category) do

  describe('.all') do
    it("is an empty list of spending categories") do
      expect(Category.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save categories to the database") do
      category = Category.new({:name => "Booze", :id => nil})
      category.save()
      expect(Category.all()).to(eq([category]))
    end
  end

  describe('#name') do
    it("tells you the category name") do
      category = Category.new({:name => "Booze", :id => nil})
      expect(category.name()).to(eq("Booze"))
    end
  end

  describe('#id') do
    it("sets the ID when you save it") do
      category = Category.new({:name => "Booze", :id => nil})
      category.save()
      expect(category.id()).to(be_an_instance_of(Fixnum))
    end
  end

  # describe("#add_category") do
  #   it("associates an expense with a category") do
  #     category = Category.new({:name => "Pizza", :id => nil})
  #     category.save()
  #     expense = Expense.new({:id => nil, :amount => 25.00})
  #     expense.save()


  describe("#==") do
    it("makes sure categories are equal if the share a name") do
    category1 = Category.new({:id => nil, :name => "Food"})
    category2 = Category.new({:id => nil, :name => "Food"})
    expect(category1).to(eq(category2))
    end
  end

end

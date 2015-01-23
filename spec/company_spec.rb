require('spec_helper')

describe(Company) do

  describe(".all") do
    it("starts with an empty array of stops") do
      expect(Company.all()).to(eq([]))
    end
  end

  # describe(".find_category_expenses") do
  #   it("return a list of expenses for a category") do
  #     test_category = Category.new({:name => "Bills", :id => nil})
  #     test_category.save()
  #     test_expense1 = Expense.new({:amount => 32.50, :id => nil, :date => 20150105})
  #     test_expense1.save()
  #     test_expense2 = Expense.new({:amount => 100.99, :id => nil, :date => 20150104})
  #     test_expense2.save()
  #     test_expense3 = Expense.new({:amount => 522.44, :id => nil, :date => 22150104})
  #     test_expense3.save()
  #     test_category.add_expense(test_expense1.id())
  #     test_category.add_expense(test_expense3.id())
  #     expect(Company.find_category_expenses(test_category.id())).to(eq([test_expense1.amount(), test_expense3.amount()]))
  #   end
  # end

  describe("#save") do
    it("pairs a categories ID to a expenses ID") do
      test_category = Category.new({:name => "Food", :id => nil})
      test_category.save()
      test_expense = Expense.new({:amount => 32.50, :id => nil, :date => 20150119})
      test_expense.save()
      test_company = Company.new({:id => nil, :category_id => test_category.id(), :expense_id => test_expense.id()})
      test_company.save()
      expect(Company.all()).to(eq([test_company]))
    end
  end

  describe("#==") do
    it("makes sure company is equal if they share a category_id and expense_id") do
      company1 = Company.new({:category_id => 1, :expense_id => 1})
      company2 = Company.new({:category_id => 1, :expense_id => 1})
      expect(company1).to(eq(company2))
    end
  end



end

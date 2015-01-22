require('spec_helper')

describe(Expense) do

  describe('.all') do
    it("is an empty list of expenses") do
      expect(Expense.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an expense to the database") do
      test_expense = Expense.new({:id => nil, :amount => 1.50})
      test_expense.save()
      expect(Expense.all()).to(eq([test_expense]))
    end
  end

  describe('#id') do
    it("set the ID when you save the expense") do
      test_expense = Expense.new({:id => nil, :amount => 31.50})
      test_expense.save()
      expect(test_expense.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#amount') do
    it("tells you the amount of the expense") do
      test_expense = Expense.new({:id => nil, :amount => 100.45})
      expect(test_expense.amount()).to(eq(100.45))
    end
  end

  describe('#==') do
    it("makes sure expenses are equal if they share a name") do
      expense1 = Expense.new({:id => nil, :amount => 1.50})
      expense2 = Expense.new({:id => nil, :amount => 1.50})
      expect(expense1).to(eq(expense2))
    end
  end
end

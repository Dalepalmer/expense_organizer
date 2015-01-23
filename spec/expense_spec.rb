require('spec_helper')
require('pry')

describe(Expense) do

  describe('.all') do
    it("is an empty list of expenses") do
      expect(Expense.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an expense to the database") do
      test_expense = Expense.new({:id => nil, :amount => 1.50, :date => 20150115})
      test_expense.save()
      expect(Expense.all()).to(eq([test_expense]))
    end
  end

  describe('#id') do
    it("set the ID when you save the expense") do
      test_expense = Expense.new({:id => nil, :amount => 31.50, :date => 20140423})
      test_expense.save()
      expect(test_expense.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#add_company') do
    it("associates a company with a category") do
      category = Category.new({:name => "Entertainment", :id => nil})
      category.save()
      expense = Expense.new({:amount => 154.45, :id => nil, :date => 20140423})
      expense.save()
      the_company = Company.new({:category_id => category.id(), :expense_id => expense.id()})
      the_company.save()
      expect(Company.all()).to(eq([the_company]))
    end
  end

  describe('#date') do
    it("tells you the date of the transaction") do
      test_expense = Expense.new({:id => nil, :amount => 24.34, :date => 20150120})
    end
  end


  describe('#amount') do
    it("tells you the amount of the expense") do
      test_expense = Expense.new({:id => nil, :amount => 100.45, :date => 20140423})
      expect(test_expense.amount()).to(eq(100.45))
    end
  end

  describe '#get_expense' do
    it 'returns the expense associated with its id' do
      test_expense = Expense.new({:amount => 54.31, :date => 20010101, :id => nil})
      test_expense.save
      expect(Expense.get_expense(test_expense.id)).to(eq(test_expense))
    end
  end

  describe('#==') do
    it("makes sure expenses are equal if they share a name") do
      expense1 = Expense.new({:id => nil, :amount => 1.50, :date => nil})
      expense2 = Expense.new({:id => nil, :amount => 1.50, :date => nil})
      expect(expense1).to(eq(expense2))
    end
  end
end

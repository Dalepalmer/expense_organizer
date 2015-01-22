class Expense
  attr_reader(:id, :amount)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @amount =  attributes.fetch(:amount)
  end

  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      id = expense.fetch("id").to_i()
      amount = expense.fetch("amount").to_f()
      expenses.push(Expense.new({:id => id, :amount => amount}))
    end
    expenses
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (amount) VALUES (#{@amount}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_expense|
    self.amount().eql?(another_expense.amount()).&(self.id().eql?(another_expense.id()))
  end
end

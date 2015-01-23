class Expense
  attr_reader(:id, :amount, :date,)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @amount =  attributes.fetch(:amount)
    @date = attributes.fetch(:date)
  end

  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      id = expense.fetch("id").to_i()
      amount = expense.fetch("amount").to_f()
      date = expense.fetch("expense_date")
      expenses.push(Expense.new({:id => id, :amount => amount, :date => date}))
    end
    expenses
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (amount, expense_date) VALUES (#{@amount}, '#{@date}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

 define_singleton_method :get_expense do |search_id|
    query = DB.exec("SELECT * FROM expenses;")
    result = nil
    query.each() do |expense|
      amount = expense.fetch('amount').to_f
      date = expense.fetch("expense_date")
      id = expense.fetch('id').to_i
      if search_id == id
        result = Expense.new({:amount => amount, :date => date, :id => id})
      end
    end
    result
  end

  define_method(:add_company) do |category_id|
    the_company = Company.new({:category_id => category.id(), :expense_id => expense.id()})
    the_company.save()
  end

  define_method(:==) do |another_expense|
    self.amount().eql?(another_expense.amount()).&(self.id().eql?(another_expense.id()))
  end
end

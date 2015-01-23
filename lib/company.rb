class Company

  attr_reader(:id, :category_id, :expense_id)

  define_method(:initialize) do |attributes|
    @category_id = attributes.fetch(:category_id).to_i()
    @expense_id = attributes.fetch(:expense_id).to_i()
    @id = nil
  end

  define_singleton_method(:all) do
    returned_companies = DB.exec("SELECT * FROM companies;")
    companies = []
    returned_companies.each() do |company|
      category_id = company.fetch("category_id")
      expense_id = company.fetch("expense_id")
      companies.push(Company.new({:category_id => category_id, :expense_id => expense_id}))
    end
    companies
  end

   define_singleton_method(:find_category_expenses) do |category_id|
     category_expenses = []
     returned_companies = DB.exec("SELECT * FROM companies WHERE category_id = #{category_id};")
     returned_companies.each() do |company|
       expense_id = company.fetch("expense_id").to_i
       expense_amount = DB.exec("SELECT amount FROM expenses WHERE id = #{expense_id};")
       expense_amount = expense_amount.first().fetch("amount").to_f()
       category_expenses.push(expense_amount)
     end
     category_expenses
   end


  define_method(:save) do
    result = DB.exec("INSERT INTO companies (category_id, expense_id) VALUES (#{@category_id}, #{@expense_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_company|
    self.category_id().eql?(another_company.category_id()).&(self.expense_id.eql?(another_company.expense_id()))
  end

end

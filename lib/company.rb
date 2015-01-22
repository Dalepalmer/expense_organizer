class Company

  attr_reader(:id, :category_id, :expense_id)

  define_method(:initialize) do |attributes|
    @category_id = attributes.fetch(:station_id).to_i()
    @expense_id = attributes.fetch(:expense_id).to_i()
    @id = nil
  end

  define_singleton_method(:all) do
    returned_companies = DB.exec("SELECT * FROM companies;")
    companies = []
    returned_companies.each() do |company|
      category_id = company.fetch("category_id")
      expense_id = expense.fetch("expense_id")
      companies.push(Company.new({:category_id => category_id, :expense_id => expense_id}))
    end
    companies
  end
  
end

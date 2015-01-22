require('rspec')
require('pg')
require('expense')
require('category')
require('company')

DB = PG.connect({:dbname => "expense_org_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM categories *;")
  end
end

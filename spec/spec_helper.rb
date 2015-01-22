require('rspec')
require('pg')
require('expense')
require('category')

DB = PG.connect({:dbname => "expense_org_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
  end
end

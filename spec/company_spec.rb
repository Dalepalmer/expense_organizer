require('spec_helper')

describe(Company) do

  describe(".all") do
    it("starts with an empty array of stops") do
      expect(Company.all()).to(eq([]))
    end
  end

  describe(".find_expense_category") do
    

end

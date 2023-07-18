class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal] # instance of a meal
    @customer = attributes[:customer] # instance of a customer
    @employee = attributes[:employee] # instance of an employee
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end

require_relative '../views/orders_view'
require_relative '../views/sessions_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repo, customer_repo, employee_repo, order_repo)
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @order_repo = order_repo
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @sessions_view = SessionsView.new
    @customers_view = CustomersView.new
  end

  def list_undelivered_orders
    # get all the undelivered orders from the repo
    order = @order_repo.undelivered_orders
    # display them
    @orders_view.display(order)
  end

  def add
    meal = select_meal # Sudo code in the method defintion as private method
    customer = select_customer # Sudo code in the method defintion as private method
    employee = select_employee # Sudo code in the method defintion as private method
    # create an instance of an order
    order = Order.new(meal: meal, employee: employee, customer: customer)
    # ask the repo tp store it
    @order_repo.create(order)
  end

  def list_my_orders(current_user)
    list_my_underlivered_orders(current_user)
  end

  def mark_as_delivered(current_user)
    # get a list of the current user orders
    orders = @order_repo.my_undelivered_orders(current_user)
    # Display the order
    @orders_view.display(orders)
    # Ask for an index
    index = @orders_view.ask_for_index
    # find the order to mark
    order = orders[index]
    # mark as devilered and save csv
    @order_repo.mark_as_delivered(order)
  end

  private

  def select_meal
    # Get the meals from the meals repo
    meals = @meal_repo.all
    # Display the list (meals view)
    @meals_view.display(meals)
    # Ask the user for an index
    index = @orders_view.ask_for_index
    # store the instance in a vriable
    return meals[index]
  end

  def select_customer
    # Get the customers from the customers repo
    customers = @customer_repo.all
    # Display the list (customers view)
    @customers_view.display(customers)
    # Ask the user for an index
    index = @orders_view.ask_for_index
    # store the instance in a vriable
    return customers[index]
  end

  def select_employee
    # Get the employee from the employee repo
    employees = @employee_repo.all_riders
    # Display the list (employee view)
    @sessions_view.display(employees)
    # Ask the user for an index
    index = @orders_view.ask_for_index
    # store the instance in a vriable
    return employees[index]
  end

  def list_my_underlivered_orders(user)
    # get a list of the current user orders
    orders = @order_repo.my_undelivered_orders(user)
    # Display the order
    @orders_view.display(orders)
  end
end

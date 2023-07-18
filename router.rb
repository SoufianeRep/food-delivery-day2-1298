class Router
  def initialize(meals_controller, customers_controller, employees_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @employees_controller = employees_controller
    @running = true
  end

  def run
    while @running
      @current_user = @employees_controller.login
      while @current_user
        if @current_user.manager?
          manager_menu
          choice = gets.chomp.to_i
          manager_action(choice)
        else
          rider_menu
          choice = gets.chomp.to_i
          rider_action(choice)
        end
      end
    end
  end

  private

  def manager_menu
    puts "--------------------"
    puts "-- MANAGER MENU ----"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "5. Add a new order."
    puts "6. List all undelivered orders"
    puts "7. Logout"
    puts "8. Exit"
    print "> "
  end

  def rider_menu
    puts "--------------------"
    puts "-- RIDER MENU ------"
    puts "--------------------"
    puts "1. Mark order as delivered"
    puts "2. List all undelivered orders"
    puts "7. Logout"
    puts "8. Exit"
    print "> "
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then puts "TODO"
    when 6 then puts "TODO"
    when 7 then logout!
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def rider_action(choice)
    case choice
    when 1 then puts "TODO"
    when 2 then puts "TODO"
    when 7 then logout!
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def stop!
    logout!
    @running = false
  end

  def logout!
    @current_user = nil
  end
end

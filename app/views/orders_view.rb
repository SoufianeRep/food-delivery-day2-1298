class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - #{order.employee.username} must deliver #{order.meal.name} to #{order.customer.name}"
    end
  end

  def ask_for_index
    puts "Which number?"
    gets.chomp.to_i - 1
  end
end

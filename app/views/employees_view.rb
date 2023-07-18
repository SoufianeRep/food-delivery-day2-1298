class EmployeesView
  def ask_for(thing)
    puts "Please enter your #{thing}"
    return gets.chomp
  end

  def signed_in
    puts "Logged in successfuly."
  end

  def wrong_credentials
    puts "Wrong credentials... Try again"
  end
end

require_relative '../views/employees_view'

class SessionsController
  def initialize(employee_repo)
    @employee_repo = employee_repo
    @view = EmployeesView.new
  end

  def login
    # Ask the user for a username
    username = @view.ask_for("username")
    # Ask the user for a password
    password = @view.ask_for("password")
    # check is the employee exists (if the username exists) and if the password is correct
    employee = @employee_repo.find_by_username(username)
    # if exist and pass correct
    if employee && employee.password == password
      # login and give welcome message
      @view.signed_in
      return employee
    else
      # wrong credentials
      @view.wrong_credentials
      login
    end
  end
end

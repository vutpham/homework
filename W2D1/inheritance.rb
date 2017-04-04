class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name, @title, @salary = name, title, salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employees(self) unless boss.nil?
    boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees, :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_employees(employee)
    @employees << employee
    employee
  end

  def bonus(multiplier)
    employee_total_salary * multiplier
  end

  def employee_total_salary
    salaries = []
    @employees.each do |employee|
      salaries << employee.salary
    end
    salaries.inject(:+)
  end

end

ned = Manager.new('Ned', 'Founder', 1_000_000)
darren = Manager.new('Darren', 'TA Manager', 78_000, ned)
shawna = Employee.new('Shawna', 'TA', 12_000, darren)
david = Employee.new('David', 'TA', 10_000, darren)

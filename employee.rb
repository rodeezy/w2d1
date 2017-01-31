class Employee

  attr_reader :salary
  attr_accessor :boss
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    # @boss.add_employee(self) if @boss
  end

  def bonus(multiplier)
      @salary * multiplier
  end


end

class Menu

  attr_reader :menu_list

  def initialize(dishes)
    @menu_list = dishes
  end

  def printed_list
    formatted = []
    @menu_list.each do |dish|
      dish.each do |name, price|
        formatted << "#{name}, £#{price}"
      end
    end
    formatted.join(", ")
  end

end

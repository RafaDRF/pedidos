class Product
  attr_reader :category, :price

  def initialize(category: '', price: 0.00)
    @category = category
    @price = price
  end

  def household_appliance?
    category == 'eletrodoméstico'
  end

  def for_kids?
    category == 'infantil'
  end
end

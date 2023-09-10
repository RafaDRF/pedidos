class Order
  attr_reader :product, :payement, :labels, :full_price

  def initialize(product, payement)
    @product = product
    @payement = payement
    @full_price = product.price
    @labels = []
  end

  def perform
    add_free_shipping_label if product.price > 1000
    add_fragile_label if product.household_appliance?
    add_gift_label if product.for_kids?
    self
  end

  def add_free_shipping_label
    labels << 'frete-gratis'
  end

  def add_fragile_label
    labels << 'frágil'
  end

  def add_gift_label
    labels << 'presente'
  end

  def price
    payement.boleto_method? ? ten_percent_discount_price : full_price
  end

  def ten_percent_discount_price
    full_price - (0.01 * full_price)
  end
end

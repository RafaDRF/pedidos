class Payement
  attr_reader :method

  def initialize(method: '', value: 0.00)
    @method = method
    @value = value
  end

  def boleto_method?
    method == 'boleto'
  end
end

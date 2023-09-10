require_relative 'order'

describe Order do
  let(:perform) { described_class.new(FakeProduct.new, FakePayment.new).perform }

  context 'Quando a compra for de um produto com valor superior a 1000 reais' do
    it 'adiciona uma label `frete-gratis` no pedido' do
      expect(perform.labels).to include('frete-gratis')
    end
  end

  context 'Quando o produto for da categoria `eletrodoméstico`' do
    it 'adiciona uma label `frágil` no pedido' do
      expect(perform.labels).to include('frágil')
    end
  end

  context 'Quando o produto for da categoria `infantil`' do
    it 'adiciona uma label `presente` no pedido' do
      expect(perform.labels).to include('presente')
    end
  end

  context 'Quando o método de pagamento for Boleto' do
    it 'da um desconto de 10%' do
      expect(perform.price).to eq(1980)
    end
  end
end

class FakeProduct
  def price
    2000.00
  end

  def household_appliance?
    true
  end

  def for_kids?
    true
  end
end

class FakePayment
  def boleto_method?
    true
  end
end

require_relative 'payement'

describe Payement do
  context 'Implementa a interface Pagamento' do
    let(:model) { described_class.new }

    it { expect { model.boleto_method? }.to_not raise_error(NoMethodError) }
  end

  context 'Quando o metodo de pagamento for Boleto' do
    let(:model) { described_class.new(method: 'boleto') }

    it { expect(model.boleto_method?).to eq(true) }
  end
end

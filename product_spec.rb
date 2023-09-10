require_relative 'product'

describe Product do
  context 'implementa a interface Produto' do
    let(:model) { described_class.new }

    it { expect { model.price }.to_not raise_error(NoMethodError) }
    it { expect { model.household_appliance? }.to_not raise_error(NoMethodError) }
    it { expect { model.for_kids? }.to_not raise_error(NoMethodError) }
  end

  context 'Quando o produto for um eletrodoméstico' do
    let(:model) { described_class.new(category: 'eletrodoméstico') }

    it { expect(model.household_appliance?).to eq(true) }
  end

  context 'Quando o produto for infantil' do
    let(:model) { described_class.new(category: 'infantil') }

    it { expect(model.for_kids?).to eq(true) }
  end
end

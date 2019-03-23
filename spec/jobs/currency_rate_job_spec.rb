require 'rails_helper'

RSpec.describe CurrencyRateJob, type: :job do
  let(:service) { double('Services::CurrencyRate') }

  before do
    allow(Services::CurrencyRate).to receive(:new).and_return(service)
  end

  it 'calls Services::CurrencyRate#call' do
    expect(service).to receive(:call)
    CurrencyRateJob.perform_now
  end
end

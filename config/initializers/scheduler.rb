scheduler = Rufus::Scheduler.new

scheduler.every '6h' do
  CurrencyRateJob.perform_later
end

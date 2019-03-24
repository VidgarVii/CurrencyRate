scheduler = Rufus::Scheduler.new

scheduler.every '1h' do
  CurrencyRateJob.perform_later
end

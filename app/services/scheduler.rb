class Services::Scheduler

  def update_currency_rate(date)
    return if Rails.env.test?

    handle.at_jobs.map(&:unschedule)

    handle.in date do
      CurrencyRateJob.perform_later
    end
  end

  def handle
    Rufus::Scheduler.singleton
  end
end

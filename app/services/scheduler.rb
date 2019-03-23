class Services::Scheduler

  def update_currency_rate(pair)
    return if Rails.env.test?

    handle.at_jobs.map(&:unschedule)

    handle.in pair.date_force do
      pair.clear_date_force
      CurrencyRateJob.perform_later
    end
  end

  private

  def handle
    Rufus::Scheduler.singleton
  end
end

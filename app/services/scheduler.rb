class Services::Scheduler

  def update_currency_rate(pair)
    return if Rails.env.test?

    handle.at_jobs.map(&:unschedule)

    take_date_for(pair) if pair.date_force

    handle.in pair.date_force do
      pair.clear_date_force
      CurrencyRateJob.perform_later
    end
  end

  private

  def take_date_for(pair)
    pair.date_force = Time.zone.now + 10.minute
  end

  def handle
    @handle ||= Rufus::Scheduler.singleton
  end
end

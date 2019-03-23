class Admin::CurrencyPairsController < Admin::BaseController
  after_action :scheduler_in, only: :update
  after_action :publish_course, only: :update

  def edit; end

  def update
    if pair.update(pair_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  helper_method :pair

  def pair
    @pair ||= CurrencyPair.find_by(pair: 'USDRUB')
  end

  def pair_params
    params.require(:currency_pair).permit(:price, :date_force)
  end

  def scheduler_in
    return if pair.errors.any?

    Services::Scheduler.new.update_currency_rate(pair.date_force)
  end

  def publish_course
    return if pair.errors.any?

    ActionCable.server.broadcast(
        'publish_course',
        { pair_price: pair.price}
    )
  end
end

class Admin::CurrencyPairsController < Admin::BaseController
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
    params.require(:currency_pair).permit(:price)
  end
end

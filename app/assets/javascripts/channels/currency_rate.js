document.addEventListener('turbolinks:load', () => {
  if (App.currency_rate) return subscribeToCurrencyRate();

  App.currency_rate = App.cable.subscriptions.create("CurrencyRateChannel", {
    connected() {
      subscribeToCurrencyRate();
    },

    received(data) {
      var currencyPrice = document.getElementsByClassName('currency__price')[1];
      currencyPrice.innerHTML = data.pair_price;
      console.log(data);
    }
  });

  subscribeToCurrencyRate = () => {
    if (document.getElementsByClassName('currency-pair')[0]) {
      return App.currency_rate.perform('subscribed');
    } else {
      return App.currency_rate.perform('unsubscribed');
    }

  }
});

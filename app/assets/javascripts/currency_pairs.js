document.addEventListener('turbolinks:load', () => {

  let selectPair  = document.getElementsByClassName('currency__code'),
      formPair    = document.getElementsByClassName('currency_pair')[0],
      priceBase    = document.getElementsByClassName('currency__price')[0],
      priceQuote    = document.getElementsByClassName('currency__price')[1],
      signBase    = document.getElementsByClassName('currency__sign')[0],
      signQuote    = document.getElementsByClassName('currency__sign')[1],
      btnForm     = document.getElementsByClassName('btn-form')[0];

  let submitForm = () => { btnForm.click(); };

  for (let item of selectPair) {
    item.addEventListener('change', submitForm)
  }

  let updateCurrencyRate = (e) => {
    priceBase.value = 1;
    priceQuote.value = e.detail[0].price;
    signBase.innerText = e.detail[0].base.sign;
    signQuote.innerText = e.detail[0].quote.sign;
    console.log(e.detail[0])
  };

  formPair.addEventListener('ajax:success', updateCurrencyRate)
});

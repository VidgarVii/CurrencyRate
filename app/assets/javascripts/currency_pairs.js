document.addEventListener('turbolinks:load', () => {

  let currencyList  = document.getElementsByClassName('currency_list')[0],
      currencyPair  = document.getElementsByClassName('currency_pair')[0],
      currencyBase  = document.getElementById('base'),
      currencyQuote = document.getElementById('quote');

  let isCode = (e) => {
    return e.target.classList.contains('currency__code') ? true : false
  };

  let isBase = (e) => {
    return (e.target.parentElement == currencyBase && isCode(e)) ? true : false
  };

  let isQuote = (e) => {
    return (e.target.parentElement == currencyQuote && isCode(e)) ? true : false
  };

  let editBase = (e) => {
    currencyBase.children[0].innerText = e.target.innerText;

    hiddenCurrencyList();
  };

  let editQuote = (e) => {
    currencyQuote.children[0].innerText = e.target.innerText;
    hiddenCurrencyList();
  };

  let hiddenCurrencyList = () => {
    currencyList.classList.toggle('hidden');
    currencyList.removeEventListener('click', editBase);
    currencyList.removeEventListener('click', editQuote);
  };

  let showCurrencyList = (position) => {
    currencyList.classList.toggle('hidden');
    currencyList.classList.remove('base_position', 'quote_position');
    currencyList.classList.add(position);
  };

  let eventPairs = (e) => {
    if (isBase(e)) {
      showCurrencyList('base_position');
      currencyList.addEventListener('click', editBase)
    }
    else if (isQuote(e)) {
      showCurrencyList('quote_position');
      currencyList.addEventListener('click', editQuote)
    }
  };

  currencyPair.addEventListener('click', eventPairs);
});

// document.addEventListener('turbolinks:load', () => {
//
//   var currentCurrency = {
//     code:  null,
//     sign:  null,
//     price: null
//   };
//   let currencyList  = document.getElementsByClassName('currency_list')[0],
//       currencyPair  = document.getElementsByClassName('currency_pair')[0],
//       currencyBase  = document.getElementById('base'),
//       currencyQuote = document.getElementById('quote');
//
//   let isCode = (e) => {
//     return e.target.classList.contains('currency__code') ? true : false
//   };
//
//   let isBase = (e) => {
//     return (e.target.parentElement == currencyBase && isCode(e)) ? true : false
//   };
//
//   let isQuote = (e) => {
//     return (e.target.parentElement == currencyQuote && isCode(e)) ? true : false
//   };
//
//   let editBase = (e) => {
//     var code = e.target.innerText;
//     currencyBase.children[0].innerText = code;
//     currentCurrency.code = code;
//
//     hiddenCurrencyList();
//   };
//
//   let editQuote = (e) => {
//     var code = e.target.innerText;
//     currencyQuote.children[0].innerText = code;
//     currentCurrency.code = code;
//
//     hiddenCurrencyList();
//   };
//
//   let hiddenCurrencyList = () => {
//     currencyList.classList.toggle('hidden');
//     currencyList.removeEventListener('click', editBase);
//     currencyList.removeEventListener('click', editQuote);
//   };
//
//   let showCurrencyList = (position) => {
//     currencyList.classList.toggle('hidden');
//     currencyList.classList.remove('base_position', 'quote_position');
//     currencyList.classList.add(position);
//   };
//
//   let eventPairs = (e) => {
//     if (isBase(e)) {
//       showCurrencyList('base_position');
//       currencyList.addEventListener('click', editBase)
//     }
//     else if (isQuote(e)) {
//       showCurrencyList('quote_position');
//       currencyList.addEventListener('click', editQuote)
//     }
//   };
//
//   let getCurrencyBlock = (code) => {
//     if (currencyBase.children[0].innerText == code) {
//       return currencyBase;
//     } else {
//       return currencyQuote;
//     }
//   };
//
//   let foundPair = () => {
//
//   };
//
//   let updateExchange = (e) => {
//     var block = getCurrencyBlock(currentCurrency.code);
//     block.children[1].innerText = foundPair + e.detail[0].sign
//     console.log(e.detail[0].sign)
//   };
//
//   currencyPair.addEventListener('click', eventPairs);
//   currencyPair.addEventListener('ajax:success', updateExchange)
// });
//

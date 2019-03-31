document.addEventListener('turbolinks:load', () => {

  let selectPair  = document.getElementsByClassName('currency__code'),
      formPair    = document.getElementsByClassName('currency_pair')[0],
      btnForm     = document.getElementsByClassName('btn-form')[0];

  let submitForm = () => {
    btnForm.click();
  };

  for (let item of selectPair) {
    item.addEventListener('change', submitForm)
  }
});


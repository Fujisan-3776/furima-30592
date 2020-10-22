function calculation(){

  const priceInput = document.getElementById("item-price");
  const sellFee = document.getElementById("add-tax-price");
  const sellMargin = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    sell_fee_calculation = inputValue *0.1
    sellFee.innerHTML = sell_fee_calculation;
    sellMargin.innerHTML = inputValue - sell_fee_calculation;

  })
}

window.addEventListener('load', calculation)
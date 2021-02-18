window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);
    const profitPrice = document.getElementById("profit");
    const tax = inputValue * 0.1
    console.log(tax);
    profitPrice.innerHTML = (Math.floor(inputValue - tax));
    console.log(profitPrice)
  });
});

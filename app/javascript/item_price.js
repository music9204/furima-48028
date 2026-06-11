window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const tax = Math.floor(inputValue * 0.1);
    
    const profit = inputValue - tax;

    if (!isNaN(tax) && inputValue >= 300 && inputValue <= 9999999) {
      addTaxDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    } else {
      addTaxDom.innerHTML = "---";
      profitDom.innerHTML = "---";
    }
  });
});
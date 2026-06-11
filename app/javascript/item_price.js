window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const taxPrice = Math.floor(inputValue * 0.1);
    const profitPrice = inputValue - taxPrice;

    if (!isNaN(taxPrice) && inputValue !== "") {
      addTaxDom.innerHTML = taxPrice.toLocaleString();
      profitDom.innerHTML = profitPrice.toLocaleString();
    } else {
      addTaxDom.innerHTML = "0";
      profitDom.innerHTML = "0";
    }
  });
});
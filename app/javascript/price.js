if (document.URL.match(/new/)) {
  function price() {
    const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener("keyup", () => {
      const taxPrice = document.getElementById("add-tax-price");
      const taxPriceCal = Math.floor(itemPrice.value * 0.1);

      const profit = document.getElementById("profit");
      const profitCal = itemPrice.value - taxPriceCal;

      taxPrice.innerHTML = taxPriceCal;
      profit.innerHTML = profitCal;
    });
  }

  window.addEventListener('load', price);
}
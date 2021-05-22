function price (){
  if ( document.getElementById("item-price")) {
  const itemPrice = document.getElementById("item-price");
  const priceTax = document.getElementById("add-tax-price");
  const proFit = document.getElementById("profit")
  itemPrice.addEventListener("input", function(){
    const itemPriceValue = itemPrice.value * 0.1;
    const itemProfit = itemPrice.value - itemPriceValue;
    priceTax.innerHTML = itemPriceValue;
    proFit.innerHTML = itemProfit;
  });
};
};

window.addEventListener('load', price);
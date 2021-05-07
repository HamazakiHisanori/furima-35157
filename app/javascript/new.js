function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", function(){
    const itemPriceValue = itemPrice.value * 0.1
    console.log(itemPriceValue)
  });
};
window.addEventListener('load', price);
// TODO: Write your gambling application here.
const allScratchcards = document.querySelectorAll(".scratchcard");
const balance = document.querySelector("#balance");

allScratchcards.forEach((scratchcard) => {
  scratchcard.addEventListener("click", (event) => {
    let balanceValue = balance.innerText;
    if (balanceValue <= 0 || isNaN(balanceValue)) {
      balance.innerText = "Game Over!";
    } else if (scratchcard.dataset.scratched === "false") {
      balanceValue -= 10;
      balanceValue += Number.parseInt(scratchcard.dataset.amount, 10);
      scratchcard.dataset.scratched = true;
      balance.innerText = balanceValue;
      scratchcard.innerHTML = scratchcard.dataset.amount;
    }
  });
});

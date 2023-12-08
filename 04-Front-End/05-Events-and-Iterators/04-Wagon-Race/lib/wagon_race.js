// TODO: write your code here
const player1 = document.querySelectorAll("#player1-race td");
const player2 = document.querySelectorAll("#player2-race td");
document.addEventListener("keyup", (event) => {
  if (event.key === "q") {
    const active1 = document.querySelector("#player1-race td.active");
    const nextactive1 = active1.nextElementSibling;
    if (nextactive1) {
      active1.classList.remove("active");
      nextactive1.classList.add("active");
    }
    // const lastposition = player1[0];
    // console.log(lastposition);
  }
});

document.addEventListener("keyup", (event) => {
  if (event.key === "p") {
    const active2 = document.querySelector("#player2-race td.active");
    const nextactive2 = active2.nextElementSibling;
    if (nextactive2) {
      active2.classList.remove("active");
      nextactive2.classList.add("active");
    }
  }
});

// TODO: write your code here
const player1 = document.querySelectorAll("#player1-race td");
const player2 = document.querySelectorAll("#player2-race td");
const restart = () => {
  document.querySelectorAll("td.active").forEach((element) => {
    element.classList.remove("active");
  });
  player1[0].classList.add("active");
  player2[0].classList.add("active");
}

document.addEventListener("keyup", (event) => {
  if (event.key === "q") {
    const active1 = document.querySelector("#player1-race td.active");
    const nextactive1 = active1.nextElementSibling;
    if (nextactive1) {
      active1.classList.remove("active");
      nextactive1.classList.add("active");
    }
     const lastposition = player1[player1.length - 1];
     if (lastposition.classList.contains("active")){
      alert("Red car WIN!!!");
      restart();
     }
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
    const lastposition = player2[player2.length - 1];
     if (lastposition.classList.contains("active")){
      alert("Yellow car WIN!!!");
      restart();
     }
  }
});

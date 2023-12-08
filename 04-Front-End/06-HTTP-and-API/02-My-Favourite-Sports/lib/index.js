// TODO: write your code here!
const sports = document.querySelectorAll(".clickable");
const activeSports = (sport) => {
  sport.addEventListener("click", (event) => {
    sport.classList.toggle("active");
  });
};

sports.forEach(activeSports);

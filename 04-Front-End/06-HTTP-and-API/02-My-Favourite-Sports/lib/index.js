// TODO: write your code here!
const toggleActiveClass = (card) => {
    card.classList.toggle("active");
}

const bindSportToClick = (element) => {
  element.addEventListener('click', (event) => {
    toggleActiveClass(element);
  });
}

const sports = document.querySelectorAll('.clickable');
sports.forEach(bindSportToClick);

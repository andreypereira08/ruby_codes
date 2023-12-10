// TODO: Autocomplete the input with AJAX calls.
const urlDictionary = "https://wagon-dictionary.herokuapp.com/autocomplete/";
const ulDisplay = document.querySelector("#results");

const input = document.querySelector("#search");
input.addEventListener("keyup", (event) => {
  const url = urlDictionary + input.value;

  fetch(url)
    .then(response => response.json())
    .then((data) => {
      ulDisplay.innerHTML = "";
      data.words.forEach((element) => {
        ulDisplay.insertAdjacentHTML("beforeend", `<li>${element}</li>`);
      });
    });
  console.log(input.value);
});

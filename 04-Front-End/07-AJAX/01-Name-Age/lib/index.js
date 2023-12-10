const agifyApiUrl = "https://api.agify.io/";
const ageDisplay = document.querySelector("#your-age");

const displayAge = (event) => {
  event.preventDefault();
  const firstName = document.getElementById("first-name").value;
  // TODO: Display your age with an AJAX call instead of the console.log()
  const url = `${agifyApiUrl}?name=${firstName}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      ageDisplay.innerText = `You're ${data.age} years old.`;
      console.log(data);
      console.log(firstName);
    });
};

const form = document.getElementById("fetch-age");
form.addEventListener("submit", displayAge);

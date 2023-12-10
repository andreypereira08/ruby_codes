// TODO: Call the Weather API when the form is submitted
// TODO: Create a function to get the weather info
// TODO: Replace the following line with the correct url
// TODO: prevent default behavior of the form
// set dateformat
// TODO: Insert the weather info in the DOM (description, date, temperature...)
// TODO: Add an event listener to the form
// TODO: On submit, in the callback, call the getWeatherInfo function

const elementsWeather = (data) => {
  document.querySelector("#city").innerText = data.name;
  document.querySelector("#description").innerText = data.weather[0].description;
  document.querySelector("#temperature").innerText = data.main.temp;
  document.querySelector("#icon").src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
  const date = new Date(data.dt * 1000);
  document.querySelector("#date").innerText = date.toUTCString();
}

const apiKey = "c723d7b1ffe4663915956ad6b3990027";
const fetchWeather = () => {
  const cityValue = document.querySelector("#input");
  const url = `https://api.openweathermap.org/data/2.5/weather?q=${cityValue.value}&appid=${apiKey}&units=metric`;
  fetch(url)
    .then(response => response.json())
    .then((data) => elementsWeather(data));
};

const getWeatherInfo = (lat, lon) => {
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiKey}&units=metric`;
  fetch(url)
    .then(response => response.json())
    .then((data) => elementsWeather(data));
};

const submitForm = document.querySelector("form");
submitForm.addEventListener("click", (event) => {
  event.preventDefault();
  fetchWeather();
});

const iconCurrentLocation = document.querySelector("#currentLocation");
iconCurrentLocation.addEventListener("click", (event) => {
  navigator.geolocation.getCurrentPosition((data) => {
    getWeatherInfo(data.coords.latitude, data.coords.longitude);
  });
});

// TODO: Call the Weather API when the form is submitted
// "https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}";
const cityValue = document.querySelector("#input");
const submitbtn = document.querySelector("#submitbtn");
const showCity = document.querySelector("#city");
const showDate = document.querySelector("#date");
const showDescription = document.querySelector("#description");
const showTemperature = document.querySelector("#temperature");
const showIcon = document.querySelector("#icon");
const iconCurrentLocation = document.querySelector("#currentLocation");
const apiKey = "c723d7b1ffe4663915956ad6b3990027";

// TODO: Create a function to get the weather info
const fetchWeather = () => {
  // TODO: Replace the following line with the correct url
  // TODO: prevent default behavior of the form
  const url = `https://api.openweathermap.org/data/2.5/weather?q=${cityValue.value}&appid=${apiKey}&units=metric`;

  fetch(url)
    .then(response => response.json())
    .then((data) => {
      showCity.innerText = data.name;
      showDescription.innerText = data.weather[0].description;
      showTemperature.innerText = data.main.temp;
      showIcon.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
      const date = new Date(data.dt * 1000);
      showDate.innerText = date.toUTCString(); // set dateformat
      // TODO: Insert the weather info in the DOM (description, date, temperature...)
    });
};

const getWeatherInfo = (lat, lon) => {
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiKey}&units=metric`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      showCity.innerText = data.name;
      showDescription.innerText = data.weather[0].description;
      showTemperature.innerText = data.main.temp;
      showIcon.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
      const date = new Date(data.dt * 1000);
      showDate.innerText = date.toUTCString();
    });
};

submitbtn.addEventListener("click", (event) => {
  fetchWeather();
});
// TODO: Add an event listener to the form
// TODO: On submit, in the callback, call the getWeatherInfo function


iconCurrentLocation.addEventListener("click", (event) => {
  navigator.geolocation.getCurrentPosition((data) => {
    getWeatherInfo(data.coords.latitude, data.coords.longitude);
  });
});

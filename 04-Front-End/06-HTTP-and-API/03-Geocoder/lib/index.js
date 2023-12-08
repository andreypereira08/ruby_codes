// TODO: Create a function to get the coordinates from an address and display a map
// with a marker on it
const form = document.querySelector("form");
const apiKey = "pk.eyJ1IjoibGVvdnNmIiwiYSI6ImNqc2VvNW9qcjE4M2czeWwxeHhjMnI5NWcifQ.iRvACR64aV88KLvOszpj_Q";

const showMap = (userInput) => {
  // TODO: Construct the URL (with apiKey & userInput) and make the fetch request to the mapbox API
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${userInput}.json?access_token=${apiKey}`;

  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      console.log(data);
      // TODO: Insert the info into the DOM
      // - Extract the coordinates from the parsed JSON response (lang, lat)
      // - Display the coordinates in the element where the coordinates will be displayed
      // - Create a map using the Mapbox API and the coordinates
      // - Add a marker to the map at the coordinates
      const coordinates = data.features[0].geometry.coordinates;
      const lang = coordinates[0];
      const lat = coordinates[1];
      document.querySelector("p").innerText = `${lang}, ${lat}`;
      // const mapUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${lang},${lat}.json?access_token=${apiKey}`;

      mapboxgl.accessToken = "pk.eyJ1IjoibGVvdnNmIiwiYSI6ImNqc2VvNW9qcjE4M2czeWwxeHhjMnI5NWcifQ.iRvACR64aV88KLvOszpj_Q";
      const map = new mapboxgl.Map({
        container: "map",
        style: "mapbox://styles/mapbox/streets-v9",
        center: [lang, lat],
        zoom: 12
      });
    });
};

form.addEventListener("submit", (event) => {
  const local = document.querySelector('input[type=text]').value;
  showMap(local);
  event.preventDefault();
});
//
// TODO: Select the form element
// TODO: Add event listener to the form that:
// - Prevents the default form submission behavior
// - Get the user input
// - Calls the showMap function with the user input as an argument

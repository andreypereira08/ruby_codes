// Todo: Use the Fork Api to get a filtered list of restaurants, depending on
// the category selected (and as a bonus, the location)
const searchForm = document.getElementById("searchForm");
const restaurantList = document.querySelector("#restaurant-list");
// Todo: select the HTML elements you need

const buildSearchUrl = (category, location) => {
  return `https://the-fork-api.students.lewagon.co/api/v1/restaurants?category=${category}&location=${location}`;
};

const insertResult = (element) => {
  restaurantList.insertAdjacentHTML("beforeend", `<li class="list-group-item">${element.name} in ${element.address}</li>`);
};

searchForm.addEventListener("submit", (event) => {
  // Todo: Find the category selected and build the URL you will send your request to
  // Todo: Replace "the-endpoint-url" with the URL you built
  event.preventDefault();
  const categoryValue = document.querySelector("input:checked").value;
  const locationValue = document.querySelector("#location").value;
  fetch(buildSearchUrl(categoryValue, locationValue))
    .then(response => response.json())
    .then((data) => {
      // Todo: Insert results into the list
      console.log(data);
      data.forEach((element) => insertResult(element));
    });
  });

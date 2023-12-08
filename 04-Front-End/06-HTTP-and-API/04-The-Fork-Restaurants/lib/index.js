// Todo: Use the Fork Api to get a filtered list of restaurants, depending on
// the category selected (and as a bonus, the location)
const searchForm = document.getElementById("searchForm");
const searchSubmit = document.getElementById("submitBtn");
// Todo: select the HTML elements you need

searchSubmit.addEventListener("click", (event) => {
  // Todo: Find the category selected and build the URL you will send your request to
  const categoryValue = document.querySelector("input:checked");
  const locationValue = document.querySelector("#location");
  // Todo: Replace "the-endpoint-url" with the URL you built
  fetch(`https://the-fork-api.students.lewagon.co/api/v1/restaurants?category=${categoryValue.value}&location=${locationValue.value}`)
    .then(response => response.json())
    .then((data) => {
      // Todo: Insert results into the list
      const restaurantList = document.querySelector("#restaurant-list");
      console.log(data);
      data.forEach((element) => {
        restaurantList.insertAdjacentHTML("beforeend", `<li class="list-group-item">${element.name} in ${element.address}</li>`);
      });
    });
});

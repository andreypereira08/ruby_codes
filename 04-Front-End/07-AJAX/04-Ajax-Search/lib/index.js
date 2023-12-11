const omdbapiUrl = "https://www.omdbapi.com/";
const apiKey = "adf1f2d7";

// Here is 2 other API key if the one above doesn't work anymore:
// - 48727053
// - 8691812a
const card = (moviePoster, movieYear, movieTitle) => {
  return `
  <div class="col-lg-3 col-md-4 col-sm-6 col-12">
  <div class="card mb-2">
    <img src="${moviePoster}" class="card-img-top" alt="${movieTitle}">
    <div class="card-body">
      <span class="badge bg-primary mb-2">${movieYear}</span>
      <h5 class="card-title">${movieTitle}</h5>
    </div>
  </div>
  </div>
  `;
};

const movieCards = document.querySelector("#movie-cards");

const formSearch = document.querySelector("#search-movies");
formSearch.addEventListener("submit", (event) => {
  console.log("clicked");
  event.preventDefault();
  const movieSearch = document.querySelector("#movie-name").value;
  const url = `${omdbapiUrl}?s=${movieSearch}&apikey=${apiKey}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      movieCards.innerHTML = "";
      if (data.Response === "True") {
        data.Search.forEach((movie) => {
          const moviePoster = movie.Poster;
          const movieYear = movie.Year;
          const movieTitle = movie.Title;
          movieCards.insertAdjacentHTML("beforeend", card(moviePoster, movieYear, movieTitle));
        });
      } else {
        movieCards.insertAdjacentHTML("afterend", "<h2>Movie unfound ;/</h2>");
      }
    });
});

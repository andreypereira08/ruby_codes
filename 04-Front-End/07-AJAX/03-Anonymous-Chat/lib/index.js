const batch = 1; // change to your own batch id
const baseUrl = "https://wagon-chat.herokuapp.com/";
const displayMessagesUrl = `${baseUrl}:channel/messages`;

// Your turn to code!
const refreshBtn = document.querySelector("#refresh");
refreshBtn.addEventListener("click", (event) => {
  const messages = document.querySelector("#messages ul");
  messages.innerHTML = "";
  console.log("funcionando");
  fetch(displayMessagesUrl)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      data.messages.forEach((message) => {
        const minutesNow = new Date(Date.now()).getMinutes();
        const minutesCreate = new Date(message.created_at).getMinutes();
        messages.insertAdjacentHTML("beforeend", `<li>${message.content} (posted <span class="date">${minutesNow - minutesCreate} mins ago</span>) by ${message.author}</li>`);
      });
    });
});


const commentForm = document.querySelector("#comment-form");
commentForm.addEventListener("submit", (event) => {
  event.preventDefault();
  const message = document.querySelector("#your-message").value;
  const name = document.querySelector("#your-name").value;
  const messageBody = { author: name, content: message };

  fetch(displayMessagesUrl, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(messageBody)
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });
});

// TODO: Dynamically generate a list of to-dos based on `todos` array, and display them

const todos = [
  { title: "Code a to-do list", done: false },
  { title: "Eat breakfast", done: true },
  { title: "Do some exercise", done: false },
  { title: "Water the plants", done: true }
];

const cardTodo = (title, done) => {
  let checked = "";
  if (done) {
    checked = "checked";
  }

  return `
  <div class="shadow-sm rounded px-4 py-3 mb-2 border d-flex">
     <input class="d-flex form-check-input me-1" type="checkbox" ${checked}>
     <div>${title}</div>
   </div>`;
};

const container = document.querySelector("#todosContainer");
console.log(todos);
todos.forEach((todo) => {
  console.log(todo);
  container.insertAdjacentHTML("beforeend", cardTodo(todo.title, todo.done)); // cardTodo(todo.title);
});

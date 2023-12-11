import { createApp } from "vue";

createApp({
  data() {
    return {
      newTodo: null,
      todos: [
        { title: "Code a to-do list", done: false },
        { title: "Eat breakfast", done: true },
        { title: "Do some exercise", done: false },
        { title: "Water the plants", done: true }
      ]
    };
  },
  methods: {
    addTodo() {
      if (this.newTodo !== "") {
        this.todos.push({ title: this.newTodo, done: false });
      }
      this.newTodo = "";
    },
    removeTodo(todo) {
      const index = this.todos.indexOf(todo);
      console.log(index);
      this.todos.splice(index, 1);
    }
  }
}).mount('#todosContainer');

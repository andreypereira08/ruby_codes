import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["textarea", "counter"];

  connect() {
    // TODO: console.log something!
    console.log("conectado!");
  }

  updateCounter() {
    this.counterTarget.innerText = this.textareaTarget.value.length;
  }
}

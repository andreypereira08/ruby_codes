import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // TODO: console.log something!
    console.log('conctado!');
  }

  disable() {
    console.log("clicado");
    this.element.classList.add("disabled");
    this.element.innerText = "BINGO!";
    const audio = new Audio('../../sound.mp3');
    audio.play();
  }
}

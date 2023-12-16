import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "input"];

  static values = {
    feedbackText: String
  }

  copy() {
    navigator.clipboard.writeText(this.feedbackTextValue).then(
      () => {
        /* clipboard successfully set */
        this.buttonTarget.innerText = "Copied!";
        this.buttonTarget.setAttribute("disabled", "");
        this.inputTarget.value = this.feedbackTextValue;
        console.log("copiado com sucesso");
      },
      () => {
        /* clipboard write failed */
        console.log("failed!");
      },
    );
  }

//   connect() {
//     // TODO: console.log something!
//     console.log("conectado");
//   }
}

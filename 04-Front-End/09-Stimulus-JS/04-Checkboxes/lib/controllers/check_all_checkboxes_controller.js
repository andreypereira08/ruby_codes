import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkboxall", "checkboxs"];

  connect() {
    // TODO: console.log something!
    console.log("conectado");
  }

  checkAll() {
    this.checkboxsTargets.forEach((checkbox) => {
      checkbox.checked = this.checkboxallTarget.checked;
    });
  }
}

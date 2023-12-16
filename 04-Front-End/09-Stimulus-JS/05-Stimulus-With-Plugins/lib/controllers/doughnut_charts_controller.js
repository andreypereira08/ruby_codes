import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

export default class extends Controller {
  static targets = ["canvas"];

  connect() {
    console.log("conectado");
    return new Chart(this.canvasTarget, {
      type: 'doughnut',
      data: {
        labels: ["men", "women"],
        datasets: [{
          label: 'My First Dataset',
          data: [504, 496],
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(255, 205, 86)'
          ],
          hoverOffset: 4
        }]
      }
    });
  }
}

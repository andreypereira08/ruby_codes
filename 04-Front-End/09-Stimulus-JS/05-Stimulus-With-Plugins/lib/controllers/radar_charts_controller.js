import { Controller } from "@hotwired/stimulus";
import { Chart } from "chart.js";

export default class extends Controller {
  static targets = ["canvas"];

  connect() {
    const worldReligions = {
      Chistianity: 2382000000,
      Islam: 1907000000,
      Atheist: 1193000000,
      Hinduism: 1161000000,
      Buddhism: 506000000,
      ChineseTraditional: 394000000,
      EthnicReligions: 300000000,
      AfricanTraditional: 100000000,
      Sikhism: 26000000,
      Spiritism: 15000000
    };
    const data = {
      labels: Object.keys(worldReligions),
      datasets: [{
        label: 'My First Dataset',
        data: Object.values(worldReligions),
        backgroundColor: [
          'rgb(255, 99, 132)',
          'rgb(75, 192, 192)',
          'rgb(255, 205, 86)',
          'rgb(201, 203, 207)',
          'rgb(54, 162, 235)'
        ]
      }]
    };

    const config = {
      type: 'polarArea',
      data: data,
      options: {}
    };

    return new Chart(this.canvasTarget, config);
  }
}

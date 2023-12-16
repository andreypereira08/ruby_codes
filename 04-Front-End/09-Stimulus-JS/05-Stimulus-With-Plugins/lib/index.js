/* eslint-disable import/extensions */
import { Application } from "@hotwired/stimulus";

// TODO: Import Chartjs external library
import { Chart } from "chart.js";
import * as Chartjs from "chart.js";
import DoughnutChartsController from "./controllers/doughnut_charts_controller.js";
import worldPopulationGrowth from "./controllers/line_charts_controller.js";
import worldReligions from "./controllers/radar_charts_controller.js";
// TODO: Import the Stimulus Controller here
window.Stimulus = Application.start();
// TODO: Register all Chartjs controllers
window.Stimulus.register("doughnut-charts", DoughnutChartsController);
window.Stimulus.register("line-charts", worldPopulationGrowth);
window.Stimulus.register("radar-charts", worldReligions);
// TODO: Register your Stimulus Controller below

const controllers = Object.values(Chartjs).filter(
  (chart) => chart.id !== undefined
);
Chart.register(...controllers);

console.log(Chart);
console.log(Chartjs);

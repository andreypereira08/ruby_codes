/* eslint-disable import/extensions */
import { Application } from "@hotwired/stimulus";

// TODO: Import the Stimulus Controller here
import CheckAllCheckboxesController from "./controllers/check_all_checkboxes_controller.js";

window.Stimulus = Application.start();
// TODO: Register your Stimulus Controller below
window.Stimulus.register("checkall", CheckAllCheckboxesController);

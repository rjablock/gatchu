// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"

import '@fortawesome/fontawesome-free/js/all'

import Chart from 'chart.js/auto';

import { Tooltip } from "bootstrap";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

global.Chart = Chart;

// Tooltipsの初期化
$.fn.tooltip = Tooltip._jQueryInterface;

$(document).on('turbolinks:load', function() {
  $('[data-toggle="tooltip"]').tooltip();
});

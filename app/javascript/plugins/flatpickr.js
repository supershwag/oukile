import flatpickr from "flatpickr"
import "flatpickr/dist/themes/confetti.css"// Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const French = require("flatpickr/dist/l10n/fr.js").default.fr;
// or import { Russian } from "flatpickr/dist/l10n/ru.js"
flatpickr.localize(French); // default locale is now Russian


flatpickr(".datepicker", {
  altInput: true,
  altFormat: "j F Y",
  dateFormat: "d-m-Y"
} )

flatpickr(".range", {
  mode: "range",
  minDate: "today",
  altInput: true,
  altFormat: "j F Y",
  dateFormat: "d-m-Y"
} )


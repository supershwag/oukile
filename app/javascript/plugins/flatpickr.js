import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"



flatpickr(".datepicker", {
  altInput: true,
  altFormat: "j F Y",
  dateFormat: "d-m-Y"
} )

flatpickr(".range", {
  mode: "range"
} )


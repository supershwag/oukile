function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var locationFound = document.getElementById('item_location');

    if (locationFound) {
      var autocomplete = new google.maps.places.Autocomplete(locationFound, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(locationFound, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };

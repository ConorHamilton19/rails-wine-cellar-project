
  $.get(`/wines.json`), function(data) {
    $("#drank").text(data)
    }

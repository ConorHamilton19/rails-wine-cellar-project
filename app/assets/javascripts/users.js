$(document).ready(function() {
  attachListeners()
})

function attachListeners() {
  getWines()
}

function getWines(){
  $('#wines').on('click', function(e) {
    $.get("/wines.json").success(function(response) {
      $("div.corked ul").html("");
      response.forEach(function(wine){
        $("div.corked ul").append("<li>" + wine.name + "</li>")
      })
    })
    e.preventDefault();
  })
}

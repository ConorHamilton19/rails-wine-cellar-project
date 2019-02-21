$(document).ready(function() {
  attachListeners()
})

function attachListeners() {
  nextType()
}

function nextType(){
  $('#type').on('click', function() {

    
    $.get("/wines.json").success(function(response) {
      $("div.corked ul").html("");
      response.forEach(function(wine){
        $("div.corked ul").append("<li>" + wine.name + "</li>")
      })
    })
  })
}

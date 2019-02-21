$(document).ready(function() {
  attachListeners()
})

function attachListeners() {
  getWines()
  newWines()
}

function getWines(){
  $('#wines').on('click', function() {
    $.get("/wines.json").success(function(response) {
      $("div.corked ul").html("");
      response.forEach(function(wine){
        $("div.corked ul").append("<li>" + wine.name + "</li>")
      })
    })
  })
}


function newWines(){
  $('form#new_wine').on('submit', function(e) {
    e.preventDefault();
    console.log("stop")
    const $form = $(this);
    const action = $form.attr("action");
    const params = $form.serialize();

    $.post(action, params);
  })
}

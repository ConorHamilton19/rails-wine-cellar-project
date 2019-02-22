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
    const $form = $(this);
    const action = $form.attr("action");
    const params = $form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json){
      console.log(json)
    })
    .error(function(response){
      console.log("broke", response)
    })
  })
}

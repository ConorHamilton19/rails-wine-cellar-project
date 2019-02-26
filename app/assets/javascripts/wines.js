$(document).ready(function() {
  attachListeners()
})

function attachListeners() {
  getWines()
  newWines()
  nextWine()
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

function Wine(attributes) {
    this.name = attributes.name
    this.year = attributes.year
    this.price = attributes.price
  }

$(function(){
  Wine.templateSource = document.getElementById("wine-template").innerHTML
  Wine.template = Handlebars.compile(Wine.templateSource)
})

Wine.prototype.renderLI = function() {
    return Wine.template(this)
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
      let wine = new Wine(json);
      let wineLi = wine.renderLI()

      $("ul.wine-list").append(wineLi)
      $form[0].reset()
    })
    .error(function(response){
      console.log("broke", response)
    })
  })
}

function nextWine () {
  $(".js-next").on("click", function(e) {
    e.preventDefault()
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/wines/" + nextId + ".json", function(data) {
      $(".wineName").text(data["name"]);
      $(".typeName").text(data["type"]["name"]);
      $(".winePrice").text(data["price"]);
      $(".wineYear").text(data["year"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
}

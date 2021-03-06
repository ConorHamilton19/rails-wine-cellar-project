$(document).ready(function() {
  attachListeners()
})

function attachListeners() {
  getWines()
  newWines()
  nextWine()
  getWinesIndex()
}

// Render User Show- User has_many Wines through UserWines //
function getWines(){
  $('#wines').on('click', function() {
    var userId = parseInt($("#wines").attr("user_id"))
    $.get("/users/"+ userId + ".json").success(function(response) {
      console.log(response)
      $("div.corked ul").html("");
      response.wines.forEach(function(wine){
        $("div.corked ul").append("<li>" + wine.name + "</li>")
      })
    })
  })
}

// Render Wine Index with sort by name //
function getWinesIndex(){
  $('#wine_index').on('click', function() {
    $.get("/wines.json").success(function(response) {
      console.log(response)
      $("div.corked ul").html("");
      response.sort(function(a, b) {
        var nameA = a.name.toUpperCase();
        var nameB = b.name.toUpperCase();
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
        return 0;
        }).forEach(function(wine){
        $("div.corked ul").append("<li>" + wine.name + "</li>")
      })
    })
  })
}

// JS Model Object Constructor //
function Wine(attributes) {
    this.name = attributes.name
    this.year = attributes.year
    this.price = attributes.price
  }

// Handlebars template set-up //
//  $(function(){
//  Wine.templateSource = document.getElementById("wine-    template").innerHTML
//    Wine.template = Handlebars.compile(Wine.templateSource)
  //})

// Prototype Function For Passing Object To Template //
// Wine.prototype.renderLI = function() {
//    return Wine.template(this)
// }

Wine.prototype.renderLI = function() {
  return `
  <h3> Recent Wines... </h3>
  <li> Name: ${this.name}, ${this.year}  Cost: ${this.price}$ </li>
  `
}

// Hijacking and posting current new wine form via AJAX //
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
    .done(function(json){
      let wine = new Wine(json);
      let wineLi = wine.renderLI();

      $("ul.wine-list").append(wineLi);

      $form[0].reset();
    })
    .error(function(response){
      alert("Did not post.")
    })
  })
}

// Rendering show page via AJAX and next button//

function nextWine () {
  $(".js-next").on("click", function(e) {
    e.preventDefault()
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/wines/" + nextId + ".json").success( function(data) {
      $(".wineName").text(data["name"]);
      $(".typeName").text(data["type"]["name"]);
      $(".winePrice").text(data["price"]);
      $(".wineYear").text(data["year"]);
      $(".js-next").attr("data-id", data["id"]);
      $(".nextClear").text("")
    }).error(function(data){
      alert("No More Wines!")
    })
  });
}

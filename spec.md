
Specs:

 [x] Using Ruby on Rails for the project
 -Used Ruby on Rails

 [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
 - Type has_many Wines

 [x]Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
 -Wine belongs_to Type

 [x]Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
 - Users to Wines Through userwines and the opposite

 [x]Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  - Users to Wines Through userwines and the opposite

 [x]The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
 -uncorked is an user accesible attribute on my join table

 [x]Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
 -Validations on User(presence: name and password, name must be unique), Wine(must have a name and type)

 [x]Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 -Scoped to see wines that have been uncorked and wines that are still corked.

 [x]Include signup (how e.g. Devise)
[x] Include login (how e.g. Devise)
 [x]Include logout (how e.g. Devise)
 [x]Include third party signup/login (how e.g. Devise/OmniAuth)
-github

 [x]Include nested resource show or index (URL e.g. users/2/recipes)
 - type/type_id/wine/:id

 Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
 - create new wine in type without having to fill type in

 Include form display of validation errors (form URL e.g. /recipes/new)
 -on creation of new wine and new user errors are displayed if validation fails

Confirm:

 [x]The application is pretty DRY
 [x]Limited logic in controllers
 [x]Views use helper methods if appropriate
 [x]Views use partials if appropriate
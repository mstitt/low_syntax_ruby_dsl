module RecipeDsl

  @recipes = []
  @current_recipe = nil

  Struct.new('Recipe', :title, :description, :ingredients)
  Struct.new('Ingredient', :name, :quantity)

  def self._recipes()
    return @recipes
  end

  def self.recipe(title)
    @current_recipe = Struct::Recipe.new(title, "", [])
    @recipes << @current_recipe
  end

  def self.description(v)
    @current_recipe.description = v
  end

  def self.ingredient(name, quantity)
    @current_recipe.ingredients << Struct::Ingredient.new(name, quantity)
  end
end

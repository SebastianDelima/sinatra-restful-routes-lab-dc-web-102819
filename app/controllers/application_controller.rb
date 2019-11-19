class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @all_recipes = Recipe.all
    erb :index
  end
   
  get '/recipes/new' do
    erb :new
  end

  post '/recipes'do
  @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  redirect to "/recipes/#{@recipe.id}"
end


  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end


  patch '/recipies/:id' do
    recipe = params[:id]
    name = params[:name]
    ingredients = params[:ingredients]
    cook_time = params[:cook_time]
  Recipie.uptade(name: name, ingredients: ingredients, cook_time: cook_time)
  redirect '/recipies/#{recipe.id}'
end


  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
   erb :edit
  end
 
  

end

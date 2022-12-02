class RecipesController < ApplicationController
    # skip_before_action :authorize, only: [:create]

    def index
        # user = User.find_by(id: session[:user_id])
        # if user
        # render json: user.recipes
        # else
        #    render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        # end
        render json: Recipe.all
    end

    def create
        user = User.find_by(id: session[:user_id])
        recipe = user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    private

    def recipe_params
       params.permit(:title, :instructions, :minutes_to_complete)
    end

end

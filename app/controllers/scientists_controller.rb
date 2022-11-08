class ScientistsController < ApplicationController

    # GET /scientists
    def index
        scientists= Scientist.all
        render json: scientists
    end
    # GET /scientists/:id
    def show
        scientist=Scientist.find(params[:id])
        render json: scientist, serializer: ScientistWithPlanetsSerializer
    end

    # POST
    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end
    # PATCH /scientist
    # UPDATE

    def update 
        scientist=Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    # DELETE
    def destroy
        scientist=Scientist.find(params[:id])
        scientist.destroy
        head :no_content
    end
    
    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end

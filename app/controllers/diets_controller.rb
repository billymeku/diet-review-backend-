class DietsController < ApplicationController
  before_action :set_diet, only: [:show, :update, :destroy]

  # GET /diets
  def index
    @diets = Diet.all

    render json: @diets
  end

  # GET /diets/1
  def show
    render json: @diet
  end

  # POST /diets
  def create
    @diet = Diet.new(diet_params)

    if @diet.save
      render json: @diet, status: :created, location: @diet
    else
      render json: @diet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diets/1
  def update
    # if @diet.update(diet_params)
    #   render json: @diet
    # else
    #   render json: @diet.errors, status: :unprocessable_entity
    # end
     @diet = Account.find(params[:id])
     @diet.update(name: params["diet"]["name"]["age"]["height"]["diet_type"]["start_weight"]["lost_weight"]["duration"])
     @diet.save
     render json: @diet
  end

  # DELETE /diets/1
  def destroy
    @diet.destroy
    render json: @diet
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet
      @diet = Diet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diet_params
      params.require(:diet).permit(:name, :gender, :height, :age, :diet_type, :start_weight, :lost_weight, :duration)
    end
end

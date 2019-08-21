class PlantsController < ApplicationController
  def create
    @garden = Garden.find(params[:garden_id])
    # Alternative to lines 7 and 8:
    # @plant = @garden.plants.build(plant_params)

    @plant = Plant.new(plant_params)
    @plant.garden = @garden
    if @plant.save
      # alternative: redirect_to @garden
      redirect_to garden_path(@garden),
                  notice: "Plant #{@plant.name} created successfully"
    else
      render 'garden/show'
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to @plant.garden
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end

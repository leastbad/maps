class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  def index
    @maps = Map.all
  end

  def show
  end

  def new
    @map = Map.new
  end

  def edit
  end

  def create
    @map = Map.new(map_params)

    if @map.save
      redirect_to @map, notice: "Map was successfully created."
    else
      render :new
    end
  end

  def update
    if @map.update(map_params)
      redirect_to @map, notice: "Map was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @map.destroy
    redirect_to maps_url, notice: "Map was successfully destroyed."
  end

  private

  def set_map
    @map = Map.find(params[:id])
  end

  def map_params
    params.require(:map).permit(:name, :coordinates, :zoom)
  end
end

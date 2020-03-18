class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
    @amenities = Amenity.all
    @cities = City.all
  end

  def create
    # @city = City.find_by(params[:city_id])
    @amenities_id = params[:flat][:amenity_ids]
    @amenities_id.map! do |amenity_id|
      Amenity.find(amenity_id.to_i)
    end
    @flat = Flat.new(params_flat)
    @flat.amenities = @amenities_id
    @flat.user = current_user
    respond_to do |format|
      if @flat.save
        format.html { redirect_to flat_path(@flat), notice: "Successfully created flat"}
        format.json {}
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    @flat.update(params_flat)
    respond_to do |format|
      if @flat.save
        format.html { redirect_to flat_path(@flat), notice: "Successfully created flat"}
        format.json {}
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    redirect_to flats_path
  end

  private

  def params_flat
    params.require(:flat).permit(:name, :city_id, :description, :number_of_guests, :price_per_night, :date_check_in, :date_check_out, :address_name, :host, :city, :amenity_ids, photos: [])
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end

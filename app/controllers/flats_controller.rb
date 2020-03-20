class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @results = []
    if params[:query].present?
      sql_query = " \
        cities.name ILIKE :query \
      "
      @queried_city = params[:query]
      @result_arr = Flat.joins(:city).where(sql_query, query: "%#{params[:query]}%")
    else
      @results = Flat.joins(:city).group_by{|flat| flat.city.name}
      @host_flats = Flat.all.select {|flat| flat.user == current_user }
    end
  end


  def show
    @flats = []
    @flats << Flat.find(params[:id]) #returns flats with coordinates
    @markers = []
    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
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
    params.require(:flat).permit(:name, :city_id, :description, :number_of_guests, :type_of_flat, :price_per_night, :date_check_in, :date_check_out, :address_name, :host, :city, :amenity_ids, photos: [])
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end

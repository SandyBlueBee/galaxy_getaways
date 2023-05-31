class StarshipsController < ApplicationController
  before_action :set_starship, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index
  before_action :authorize_starship, only: %i[show new create edit update destroy]
  def index
    @starships = policy_scope(Starship)
  end

  def show
    @starship = Starship.find(params[:id])
  end

  def new
    @starship = Starship.new
  end

  def create
    @starship = Starship.new(starship_params)
    @starship.user = current_user
    if @starship.save
      redirect_to starship_path(@starship)
    else
      render :new
    end
  end

  def edit
    @starship = Starship.find(params[:id])
  end

  def update
    @starship = Starship.find(params[:id])
    if @starship.update(starship_params)
      redirect_to starship_path(@starship)
    else
      render :edit
    end
  end

  def destroy
    @starship = Starship.find(params[:id])

    @starship.destroy
    redirect_to starships_path
  end

  private

  def authorize_starship
    authorize @starship
  end

  def starship_params
    params.require(:starship).permit(:name, :model, :manufacturer, :price, :starship_class, :length, :passangers, :max_speed, :hyperdrive_rating, :location, photos: [])
  end

  def set_starship
    @starship = Starship.find(params[:id])
  end

end

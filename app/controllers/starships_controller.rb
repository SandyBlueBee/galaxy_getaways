class StarshipsController < ApplicationController
  before_action :set_starship, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @starships = policy_scope(Starship)
  end

  def show
    authorize @starship
  end

  def new
    @starship = Starship.new
    authorize @starship
  end

  def create
    @starship = Starship.new(starship_params)
    @starship.user = current_user
    authorize @starship
    if @starship.save
      redirect_to starship_path(@starship)
    else
      render :new
    end
  end

  def edit
    authorize @starship
  end

  def update
    authorize @starship
    if @starship.update(starship_params)
      redirect_to starship_path(@starship)
    else
      render :edit
    end
  end

  def destroy
    authorize @starship

    @starship.destroy
    redirect_to starships_path
  end

  private

  def starship_params
    params.require(:starship).permit(:name, :model, :price, :starship_class, :length, :crew, :max_speed, :location, photos: [])
  end

  def set_starship
    @starship = Starship.find(params[:id])
  end

end

class PetsController < ApplicationController
  before_action :set_pet, only: %i[show destroy]
  before_action :set_owner, only: %i[new create]

  def show; end

  def new
    @owner = Owner.find(params[:owner_id])
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owner = @owner
    if @pet.save
      redirect_to pet_path(@pet), notice: 'Pet adicionado com sucesso'
    else
      render :new
    end
  end

  private

  def set_owner
    @owner = Owner.find(params[:owner_id])
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :monthly_cost, :pet_type)
  end
end

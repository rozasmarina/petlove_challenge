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
    if @owner.name[0].downcase == 'a' && @pet.pet_type.downcase == 'gato'
      redirect_to new_owner_pet_path(@owner), alert: 'Você não está autorizado a ter gatos, escolha outro pet'
    elsif DateTime.now - DateTime.new(@owner.birthday[0..3].to_i, @owner.birthday[5..6].to_i, @owner.birthday[8..9].to_i) >= 18 && @pet.pet_type.downcase == 'andorinha'
      redirect_to new_owner_pet_path(@owner), alert: 'Você não está autorizado a ter andorinhas, escolha outro pet'
    elsif cant_have_new_pet?
      redirect_to new_owner_pet_path(@owner), alert: 'Você já passou do limite mensal de R$ 1.000 e não pode ter novos animais'
    elsif @pet.save
      redirect_to pet_path(@pet), notice: 'Pet adicionado com sucesso'
    else
      render :new
    end
    # raise
  end

  def destroy
    @pet.destroy
    redirect_to root_path
  end

  private

  def cant_have_new_pet?
    sum = 0
    @owner.pets.each do |pet|
      sum += pet.monthly_cost
    end

    !(sum < 1000)
  end

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

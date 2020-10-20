class OwnersController < ApplicationController
  before_action :set_owner, only: %i[show destroy]

  def index
    @owners = Owner.all
  end

  def show; end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to owner_path(@owner)
    else
      render :new
    end
  end

  def destroy
    @owner.destroy
    redirect_to root_path
  end

  private

  def set_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:name, :birthday, :document)
  end
end

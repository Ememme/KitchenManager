class StorageController < ApplicationController

  before_action :authenticate_user!
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @storages = current_user.storages.all
  end

  def new
    @storage  = current_user.storages.new
  end

  def create
    @storage = current_user.storage.new(storage_params)
      if @storage.save
        flash[:notice] = 'You have created a new storage'
        redirect_to storages_path
      else
        flash[:error] = 'There were some problems with saving your storage'
        render :new
      end
  end

  def show
    @fridge = current_user.storage.where(storage_name: 'Fridge')
    @refrigerator = current_user.storage.where(storage_name: 'Refrigerator')
    @pantry = current_user.storage.where(storage_name: 'Pantry')
  end

  def destroy
    @storage.destroy
    flash[:notice] = "Storage @storage.storage_name has been deleted."
    redirect_to storages_path
  end

  private

  def storage_params
    params.require(:storage).permit(:storage_name)
  end

  def set_storage
    @storage = current_user.storage.find(params[:id])
  end
end

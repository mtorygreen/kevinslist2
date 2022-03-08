class AssetsController < ApplicationController

  def index
    @assets = Asset.all
  end

  def show
    # @review = Review.new
    @booking = Booking.new
  end

  def new
    @asset = Asset.new
    authorize @asset
  ends

  def create
    @asset = Asset.new(asset_params)
    @asset.user = current_user
    authorize @asset
    if @asset.save
      redirect_to asset_path(@asset)
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @asset.update(asset_params)
      redirect_to asset_path(@asset)
    else
      render :edit
    end
  end

  def destroy
    if @asset.destroy
      redirect_to assets_path(@asset)
    else
      render :index
    end
  end

  private

  def set_asset
    @asset = Asset.find(params[:id])
    authorize @asset
  end

  def asset_params
    params[:asset].permit(:user, :name, :game, :description, :price, :rental_length)
  end
end


end

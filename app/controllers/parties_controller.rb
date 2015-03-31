class PartiesController < ApplicationController
  def index
    @parties = Party.paginate(page: params[:page], per_page: 10)
    #authorize @parties
  end

  def new
    @party = Party.new
    #authorize @parties
  end

  def show
    @party = Party.find(params[:id])
    @guests = @party.guests.paginate(page: params[:page], per_page: 10)
    #authorize @parties
  end

  def edit
    @party = Party.find(params[:id])
    #authorize @party
  end

  def create
    @party = Party.new(params.require(:party).permit(:title, :starttime, :endtime, :address, :city, :state, :zip, :phone, :email, :public))
    #authorize @party
    if @party.save
      redirect_to @party, notice: "Party was saved successfully."
    else
      flash[:error] = "Error creating party. Please try again."
      render :new
    end
  end

  def update
    @party = Party.find(params[:id])
    #authorize @party
    
    if @party.update_attributes(params.require(:party).permit(:title, :starttime, :endtime, :address, :city, :state, :zip, :phone, :email, :public))
    else
      flash[:error] = "Error saving party. Please try again."
      render :edit
    end
  end

  def destroy
    @party = Party.find(params[:id])
    title = @party.title

    #authorize @party
    
    if @party.destroy
      redirect_to parties_path, notice: "\"#{title}\" was deleted successfully."
    else
      flash[:error] = "Error deleting party. Please try again."
      render :show
    end
  end
end

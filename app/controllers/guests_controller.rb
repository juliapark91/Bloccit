class GuestsController < ApplicationController
  before_action :set_party

  def index
    @guests = Guest.paginate(page: params[:page], per_page: 10)
  end

  def new
    @guest = @party.guests.build
  end

  def create
    @guest = @party.guests.build(guest_params)
    if @guest.save
      flash[:notice] = "Guest was saved."
      redirect_to @party
    else
      flash[:error] = "There was an error saving the guest. Please try again."
      render :new
    end
  end

  def update
    @guest = Guest.find(params[:id])

    if @guest.update_attributes(guest_params)
      flash[:notice] = "Guest was updated."
      redirect_to [@party, @guest]
    else
      flash[:error] = "There was an error saving the guest. Please try again."
      render :edit
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    name = [@guest.firstname, @guest.lastname]

    if @guest.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to @party
    else
      flash[:error] = "There was an error deleting the guest."
      render :show
    end
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @guest = Guest.find(params[:id])
  end
end

private

def guest_params
  params.require(:guest).permit(:firstname, :lastname, :phone, :email)
end

def set_party
  @party = Party.find(params[:party_id])
end

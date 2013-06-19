class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:succes] = "Servis"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
    @verses = @user.verses.paginate(page: params[:page])
  end

  def add_favourite
    @fav = Favourite.where("song_id = ? AND user_id = ?", params[:song_id], current_user.id).all
    if @fav.empty?
      @fav = Favourite.new(:song_id => params[:song_id], :user_id => current_user.id)
      @fav.save
    end
    redirect_to song_path(:id => params[:song_id])
  end

  def remove_favourite
    @fav = Favourite.find(params[:fav_id])
    user_id = @fav.user.id 
    @fav.destroy
    redirect_to user_path(user_id)
  end

  def unchecked
    if current_user.role_id != 2
      redirect_to root_path
    end
    @user = User.find(params[:id])
    if @user.role_id != 2
      redirect_to root_path
    end
    @reports = Report.find_all_by_status(1);
  end

  def checked
    if current_user.role_id != 2
      redirect_to root_path
    end

    @user = User.find(params[:id])

    @reports = Report.find_all_by_status(2);
  end
  
end

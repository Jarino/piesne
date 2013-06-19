class AlphabetController < ApplicationController

	def index
		@list = Song.find_by_sql("SELECT distinct substring(title, 1, 1) as letter FROM songs order by substring(title, 1, 1)");
	end

	def show
		@list = Song.find_by_sql("SELECT distinct substring(title, 1, 1) as letter FROM songs order by substring(title, 1, 1)");
		@songs = Song.where("title like ?", "#{params[:let]}%" ).paginate(page: params[:page])
	end

end


class RegionsController < ApplicationController

  	def create

  		#najprv zistime ci dany region uz neexistuje
  		@region = Region.search_by_name(params[:name]).first

  		if @region == nil

	  		@region = Region.new(:name => params[:name])
	  		@region.save

  		end

  		@occur = Occurence.new(:region_id => @region.id, :song_id => params[:song_id])
  		@occur.save

  		redirect_to song_path(params[:song_id])
	end

	def index
		@regions = Region.order('id')
	end


	def map
		@region = Region.order('id')
	end

	def show
		@region = Region.find(params[:id])
		@occur = @region.songs.paginate(page: params[:page]).order(:title)
		@kinds = Region.get_kinds(params[:id])
	end


	def edit
		@region = Region.find(params[:id])
	end

	def update
		@region = Region.find(params[:id])

		@region.update_attributes(params[:region])
		redirect_to regions_path
	end

	def search
		region = Region.find(params[:region_id])
		@songs = region.songs.search_by_title(params[:title])
		@region_name = region.name
	end

end
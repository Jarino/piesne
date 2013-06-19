# encoding: utf-8
class MapController < ApplicationController

	def index
		@regions = Region.order('id')
	end

end
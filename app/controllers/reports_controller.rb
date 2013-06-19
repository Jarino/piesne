# encoding: utf-8
class ReportsController < ApplicationController

	def index
		@song = Song.find(params[:id])
		@report = Report.new
	end

	def create
		@report = Report.new(params[:report])

		if @report.save
			flash[:notice] = "hlásenie bolo úspešne odoslané"
			redirect_to song_url @report.song_id
		else

		end
	end

	def check
		@report = Report.find(params[:report_id])

		@report.update_attribute(:status, 2)

		redirect_to unchecked_path(:id => params[:user_id])
	end

	def destroy
		@report = Report.find(params[:report_id])

		@report.destroy

		redirect_to checked_path(:id => params[:user_id])
	end
end
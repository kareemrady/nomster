class PlacesController < ApplicationController
	def index
		@places = Place.paginate(:page => params[:page], :per_page => 4)
	end
end

class MansionsController < ApplicationController
    def index
        @mansions = Mansion.all
    end
    
    def show
        @mansion = Mansion.find(params[:id])
    end
    
    def new
        @mansion = Mansion.new
    end
    
    def create
        @mansion =  Mansion.new(mansion_params)
        if @mansion.save
          redirect_to mansion_path(@mansion)
        else
          render 'new'
        end
    end
    
      
    private
    
    def mansion_params
        params.require(:mansion).permit(:address, :price, :capacity, :title, :description )
    end

end
class CitiesController < ApplicationController
    def new
        render '/cities/new'
    end
    def view
        @param = params[:city]
        @city = $cities[:@param]
        @cities = $cities.values
    end
    def create
        @city = params[:city].downcase
        if !$cities.key? @city.to_sym
            if params[:population] && params[:population].to_i != 0 || params[:population]== "0"
                @population = params[:population]
            else
                @population = "Not Specified"
            end
            if params[:landmark]
                @landmark = params[:landmark]
            else
                @landmark = "Not Specified"
            end
            if @city
                city = City.new(
                    name: @city,
                    population: @population,
                    landmark: @landmark
                )
                city.save
            end
        end
        redirect_to '/cities/view'
    end
    def update
        render '/cities/update'
    end
    def createupdate
        @city = params[:city].downcase.to_sym
        @population = params[:population]
        @landmark = params[:landmark]
        if $cities.key? @city
            if @population && @population.to_i != 0 || @population == "0"
                $cities[@city].population = @population
            end
            if @landmark
                $cities[@city].landmark = @landmark
            end
        end
        redirect_to '/cities/view'
    end

end

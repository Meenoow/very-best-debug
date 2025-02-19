class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    #@the_venue = matching_venues.order(:created_at)
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    #{"an_id"=>"24"}
    venue_id = params.fetch("an_id")
    #("venue_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    venue = Venue.new
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.id = params.fetch("query_id").at(0)

    a_new_venue.new_id = venue.id

    venue.save

      redirect_to("/venues/#{venue.id}")
  
  end
  
  def update
    #Parameters: {"query_address"=>"6879 Lebsack River, Rauton, MI 35009", "query_name"=>"Sugar Swoon", "query_neighborhood"=>"Royal Court", "the_id"=>"5"}
    #the_id = params.fetch("venue_id")
    the_id = params.fetch("the_id")
    #@venue = Venue.where({ :id => the_id })
    venue = Venue.where({ :id => the_id }).at(0)
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save
    
    redirect_to("/venues/#{venue.id}")
  end

  def destroy
    the_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues
    venue.destroy

    redirect_to("/venues")
  end

end

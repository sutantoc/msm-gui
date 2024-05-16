class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    d = Actor.new
    d.name = params.fetch("name_field")
    d.dob = params.fetch("dob_field")
    d.bio = params.fetch("bio_field")
    d.image = params.fetch("image_field")
    d.save

    redirect_to("/actors")
  end

  def delete
    a_id = params.fetch("actor_id")
    matching_results = Actor.where({ :id => a_id})
    the_act = matching_results.at(0)
    the_act.destroy
    redirect_to("/actors")
  end
end

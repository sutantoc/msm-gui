class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def delete
    d_id = params.fetch("director_id")
    matching_results = Director.where({ :id => d_id})
    the_dir = matching_results.at(0)
    the_dir.destroy
    redirect_to("/directors")
  end

  def modify
    dir_id = params.fetch("director_id")
    matching_dir = Director.where({ :id => dir_id})
    the_dir = matching_dir.at(0)

    the_dir.name = params.fetch("name_field")
    the_dir.dob = params.fetch("dob_field")
    the_dir.bio = params.fetch("bio_field")
    the_dir.image = params.fetch("image_field")
    the_dir.save

    redirect_to("/directors/#{the_dir.id}")
  end

  def create
    d = Director.new
    d.name = params.fetch("name_field")
    d.dob = params.fetch("dob_field")
    d.bio = params.fetch("bio_field")
    d.image = params.fetch("image_field")
    d.save

    redirect_to("/directors")
  end


  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
end

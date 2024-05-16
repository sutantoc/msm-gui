Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/insert_director", { :controller => "directors", :action => "create"})
  get("/delete_director/:director_id", { :controller => "directors", :action => "delete"})
  post("/modify_director/:director_id", { :controller => "directors", :action => "modify"})

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/insert_movie", { :controller => "movies", :action => "create"})
  get("/delete_movie/:movie_id", { :controller => "movies", :action => "delete"})
  post("/modify_movie/:movie_id", { :controller => "movies", :action => "modify"})

  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor", { :controller => "actors", :action => "create" })
  get("/delete_actor/:actor_id", { :controller => "actors", :action => "delete"})
end

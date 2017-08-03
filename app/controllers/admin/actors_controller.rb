class Admin::ActorsController < Admin::BaseController
  before_filter :find_actor, only: [:show, :edit, :update, :destroy]
  
  def index
    @actors = Actor.all.page(params[:page]).per(3)
  end
  
  def new
    @actor = Actor.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @actor = Actor.create(actor_params)
    
    respond_to do |format|
      if @actor.save
        format.html { redirect_to admin_actors_path, notice: "New Actor Successfully Created." }
        format.js
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    @actor.update_attributes(actor_params)
    
    respond_to do |format|
      if @actor.save
        format.html { redirect_to admin_actors_path, notice: "Actor is Successfully Updated." }
        format.js
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
  end
  
  def destroy
    respond_to do |format|
      if @actor.destroy
        format.html { redirect_to admin_actors_path, notice: "Actor is Successfully Deleted." }
        format.js
      else
        format.html { redirect_to admin_actors_path, notice: "Some Problem Occured while deleting Actor." }
        format.js
      end
    end
  end
  
  private
  
    def find_actor
      @actor = Actor.find(params[:id])
    end
    
    def actor_params
      params.require(:actor).permit(:name, :description)
    end
end

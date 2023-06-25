class BirdsController < ApplicationController
   rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = find_bird
    render json: birds
    end
  end

  # PATCH /birds/:id
  def update
    bird = find_bird
     bird.update(bird_params)
    render json: birds
  end

  # PATCH /birds/:id/like
  def increment_likes
    bird = find_bird
     bird.update(bird_params)
    render json: birds
  end

  # DELETE /birds/:id
  def destroy
    bird = find_bird
     bird.destroy
    render json: birds
  end

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

  def render_not_found_response
    render json:{ error: "Bird not found" }, status: :not_found
  end

  def find_bird
   Bird.find(params[:id])
  end



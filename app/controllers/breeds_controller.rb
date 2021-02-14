class BreedsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @breeds = BreedService.new(index_params).fetch
  end

  def destroy
    Breed.find(destroy_id).destroy

    redirect_to breeds_path
  end

  private

  def index_params
    @index_params ||= params.permit :search_string, :rarity
  end

  def destroy_id
    params.require :id
  end
end

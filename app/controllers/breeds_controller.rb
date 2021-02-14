class BreedsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  after_action -> { delete_related_cats }, only: :destroy

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

  def delete_related_cats
    Cat.delete_by(breed_id: destroy_id)
  end
end

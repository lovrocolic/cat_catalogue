class BreedsController < ApplicationController
  def index
    @breeds = BreedService.new(index_params).fetch
  end

  private

  def index_params
    @index_params ||= params.permit :search_string, :rarity
  end
end

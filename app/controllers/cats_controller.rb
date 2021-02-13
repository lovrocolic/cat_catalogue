class CatsController < ApplicationController
  def index
    @cats = CatService.new(index_params).fetch
  end

  private

  def index_params
    @index_params ||= params.permit :page, :breed_code
  end
end

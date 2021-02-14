class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cats = CatService.new(index_params).fetch
  end

  private

  def index_params
    @index_params ||= params.permit :page, :breed_code
  end
end

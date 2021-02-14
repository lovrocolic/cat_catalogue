class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cats = CatService.new(index_params).fetch
  end

  def destroy
    Cat.find(destroy_id).destroy

    redirect_to cats_path
  end

  private

  def index_params
    @index_params ||= params.permit :page, :breed_code
  end

  def destroy_id
    params.require :id
  end
end

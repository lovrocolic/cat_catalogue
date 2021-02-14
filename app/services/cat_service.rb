class CatService
  def initialize(cat_params)
    @cat_params = cat_params
  end

  def fetch
    Cat.order(created_at: :desc).includes(:breed)
       .where(criteria).page @cat_params[:page]
  end

  private

  def criteria
    return {} unless @cat_params[:breed_code]

    { breed: {code: @cat_params[:breed_code]} }
  end
end
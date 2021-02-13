class CatService
  def initialize(cat_params)
    @cat_params = cat_params
  end

  def fetch
    cats = @cat_params[:breed_code] ? filtered_query : base_query

    cats.page @cat_params[:page]
  end

  private

  def base_query
    Cat.order(created_at: :desc).includes(:breed)
  end

  def filtered_query
    Cat.order(created_at: :desc).includes(:breed)
       .where(breed: {code: @cat_params[:breed_code]})
  end
end
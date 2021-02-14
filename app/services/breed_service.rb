class BreedService
  def initialize(breed_params)
    @breed_params = breed_params
  end

  def fetch
    query = Breed.joins(:cats)
                 .select('breeds.*, count(cats.id) as cats_count')
                 .group('breeds.id')
                 .order(name: :asc)
                 .where(rarity_criteria)

    if @breed_params[:search_string]
      query.where(*search_criteria)
    else
      query
    end
  end

  def search_criteria
    ['name LIKE ?', "%#{@breed_params[:search_string]}%"]
  end

  def rarity_criteria
    return {} unless @breed_params[:rarity]

    {rarity: @breed_params[:rarity].to_i}
  end
end
class CatImporter
  CATS_API = 'https://api.thecatapi.com/v1/images/search'.freeze

  def execute
    breeds.each do |breed|
      response = process_first_page breed
      total_count = response.headers[:pagination_count].to_i

      next if total_count <= 25

      remaining_pages = (total_count / 25.to_f).ceil - 1
      process_remaining_pages remaining_pages, breed
    end
  end

  private

  def import_cats(query_params)
    begin
      RestClient::Request.execute(
        method: :get,
        url: CATS_API + query_params,
        timeout: 30,
        headers: {
          'x-api-key' => "#{Rails.application.credentials.cat_api[:key]}"
        }
      )
    rescue RestClient::ExceptionWithResponse => _e
      raise
    end
  end

  def query_params(page, id)
    "?limit=25&page=#{page}&order=ASC&breed_id=#{id}"
  end

  def process_response(response, breed)
    cats = JSON.parse response.body

    cats.each do |cat|
      db_cat = Cat.find_by(code: cat['id'])

      Cat.create!(url: cat['url'], code: cat['id'], breed: breed) unless db_cat
    end
  end

  def process_first_page(breed)
    response = import_cats query_params 0, breed.code
    process_response response, breed

    response
  end

  def process_remaining_pages(remaining_pages, breed)
    remaining_pages.times do |page|
      response = import_cats query_params page + 1, breed.code
      process_response response, breed
    end
  end

  def breeds
    @breeds ||= Breed.all
  end
end
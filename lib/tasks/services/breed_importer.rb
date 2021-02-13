class BreedImporter
  ALLOWED_BREEDS = %w[char emau norw].freeze
  BREEDS_API = 'https://api.thecatapi.com/v1/breeds/'.freeze

  def execute
    ALLOWED_BREEDS.each do |id|
      breed = JSON.parse import_breed id

      db_breed = Breed.find_by(code: breed['id'])
      unless db_breed
        Breed.create!(name: breed['name'], code: breed['id'], rarity: breed['rare'])
      end
    end
  end

  private

  def import_breed(id)
    begin
      RestClient::Request.execute(
        method: :get,
        url: BREEDS_API + id,
        timeout: 30,
        headers: {
          'x-api-key' => "#{Rails.application.credentials.cat_api[:key]}"
        }
      ).body
    rescue RestClient::ExceptionWithResponse => _e
      raise
    end
  end
end
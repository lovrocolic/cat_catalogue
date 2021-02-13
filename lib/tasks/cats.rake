namespace :cat_api do
  task import_breeds: :environment do
    require 'tasks/services/breed_importer'

    BreedImporter.new.execute
  end

  task import_cats: :environment do
    require 'tasks/services/cat_importer'

    CatImporter.new.execute
  end
end
class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :code
      t.string :url
      t.belongs_to :breed

      t.timestamps
    end
  end
end

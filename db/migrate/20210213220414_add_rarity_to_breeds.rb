class AddRarityToBreeds < ActiveRecord::Migration[6.1]
  def change
    add_column :breeds, :rarity, :integer
  end
end

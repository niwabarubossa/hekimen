class CreateProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :productions do |t|
      t.string :production_title
      t.string :production_picture
      t.string :production_information
      t.string :production_genre
      t.string :production_season
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

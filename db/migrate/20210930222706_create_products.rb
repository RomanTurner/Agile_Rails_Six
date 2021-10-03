# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :img_url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end

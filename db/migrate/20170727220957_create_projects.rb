class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title, :excerpt, :description, :cover, :screenshot, :gif
      t.text :features, array: true, default: []
      t.text :development, array: true, default: []
      t.text :tests, array: true, default: []
      t.text :deploy, array: true, default: []
      t.boolean :highlight, default: false
    end
  end
end

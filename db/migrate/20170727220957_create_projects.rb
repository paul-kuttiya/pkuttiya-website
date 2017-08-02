class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title, :excerpt, :link
      t.string :banner
      t.string :cover, :logo, :screenshot, :gif, :test_gif
      t.text :description
      t.text :features, array: true, default: []
      t.text :developments, array: true, default: []
      t.text :tests, array: true, default: []
      t.text :deploys, array: true, default: []
      t.boolean :highlight, default: false
      t.timestamps
    end
  end
end

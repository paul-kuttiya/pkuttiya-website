class CreateProjectTags < ActiveRecord::Migration[5.1]
  def change
    create_table :project_tags do |t|
      t.integer :project_id, :tag_id
    end
  end
end

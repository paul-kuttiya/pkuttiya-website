
ActiveRecord::Schema.define(version: 20170727220957) do
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "excerpt"
    t.string "description"
    t.string "cover"
    t.string "screenshot"
    t.string "gif"
    t.text "features", default: [], array: true
    t.text "development", default: [], array: true
    t.text "tests", default: [], array: true
    t.text "deploy", default: [], array: true
    t.boolean "highlight", default: false
  end

end

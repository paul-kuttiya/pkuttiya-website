class Project < ActiveRecord::Base
  has_many :project_tags
  has_many :tags, through: :project_tags

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates_presence_of :excerpt, :description

  def to_param
    title.downcase.gsub(/\s/, "_")
  end
end
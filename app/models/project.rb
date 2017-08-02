class Project < ActiveRecord::Base
  has_many :project_tags
  has_many :tags, through: :project_tags

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates_presence_of :excerpt, :description

  def to_param
    lowcase_name.gsub(/\s/, "_")
  end

  def lowcase_name
    title.downcase
  end
end
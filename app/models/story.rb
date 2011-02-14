class Story < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :time_logs

  scope :active, where("stories.current_state <> ?", "accepted")
end

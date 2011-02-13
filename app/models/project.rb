class Project < ActiveRecord::Base
  has_many :stories

  def to_s
    name
  end
end

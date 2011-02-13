class User < ActiveRecord::Base
  has_many :stories

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable,
         :registerable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :pivotal_initials, :default_project_id,
                  :default_labels, :pivotal_token

  validates_presence_of :first_name, :pivotal_initials, :pivotal_token, :on => :update

  # validate :validate_pivotal_token

  def validate_pivotal_token
    unless pivotal_token.blank?
      PivotalTracker::Client.token = self.pivotal_token
      begin
        PivotalTracker::Project.all
        return true
      rescue Exception => e
        errors.add(:base, "Pivotal Tracker token you provided is incorrect.")
      end
    end
  end

  def full_name
    name = ""
    name << first_name + " " unless first_name.blank?
    name << last_name unless last_name.blank?
    name.strip
  end

  def to_s
    full_name || email
  end

  def is_not_integrated?
    first_name.blank? || last_name.blank? || pivotal_initials.blank? || pivotal_token.blank?
  end

end

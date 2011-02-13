class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable,
         :registerable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :pivotal_initials, :default_project_id,
                  :default_labels

  def full_name
    first_name + " " + last_name
  end

  def to_s
    full_name || email
  end
end

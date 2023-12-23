class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #  enum role: %i[user admin]
  after_initialize :set_default_role, :if =>:new_record?
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def set_default_role
      self.role||=:user
    end

end
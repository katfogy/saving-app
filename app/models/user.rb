class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   enum role: %i[user admin]
  after_initialize :set_default_role, :if =>:new_record?
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_one :account, dependent: :destroy

    after_create :create_account

    private

    def set_default_role
      self.role||=:user
    end

    private

  def create_account
    account_number = generate_account_number
    Account.create(user: self, account_number: account_number, balance: 0) if role == 'user'
  end

  def generate_account_number
    rand.to_s[2..11] # Generating an 10-digit account number
  end

end

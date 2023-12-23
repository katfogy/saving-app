class Account < ApplicationRecord
  belongs_to :user
  validates :account_number, uniqueness: true
end

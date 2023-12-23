class AccountsController < ApplicationController
  def index
    @accounts=Account.accessible_by(current_ability)
  end
end

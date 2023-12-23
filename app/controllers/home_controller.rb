class HomeController < ApplicationController
  before_action :authenticate_user!
def index
  @accounts=Account.accessible_by(current_ability)
end
end

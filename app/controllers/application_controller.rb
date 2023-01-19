class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authorized
end

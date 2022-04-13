# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken

  alias current_user current_api_v1_user
  alias authenticate_user! authenticate_api_v1_user!
end

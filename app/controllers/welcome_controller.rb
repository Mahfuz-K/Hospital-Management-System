# frozen_string_literal: true

# this is a controller
class WelcomeController < ApplicationController
  before_action :require_user
  def homepage; end
end

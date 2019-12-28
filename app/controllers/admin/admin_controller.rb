# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController
    before_action :authenticate_user!
  end
end

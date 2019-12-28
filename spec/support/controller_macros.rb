# frozen_string_literal: true

module ControllerMacros
  def login_user
    before do
      sign_out :user
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user)
    end
  end
end

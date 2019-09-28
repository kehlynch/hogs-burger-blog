class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: 'admin',
                               password: 'password',
                               only: :destroy

  layout 'admin'
end

class Admin::BaseController < ApplicationController
  include HttpAuthConcern

  layout 'admin'
end

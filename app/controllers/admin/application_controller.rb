class Admin::ApplicationController < ApplicationController
  before_filter :current_admin

  layout 'admin'
end

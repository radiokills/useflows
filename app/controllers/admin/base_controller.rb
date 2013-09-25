class Admin::BaseController < ApplicationController

  respond_to :json, :html

  layout "admin"

  http_basic_authenticate_with name: "admin", password: "notsleep"

end

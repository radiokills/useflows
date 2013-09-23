class Admin::BaseController < ApplicationController

  layout "admin"

  http_basic_authenticate_with name: "admin", password: "notsleep"

end

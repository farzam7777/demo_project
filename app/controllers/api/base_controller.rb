class Api::BaseController < ActionController::API
  respond_to :json
  serialization_scope :view_context
end

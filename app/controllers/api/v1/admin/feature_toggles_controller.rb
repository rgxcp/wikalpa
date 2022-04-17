class Api::V1::Admin::FeatureTogglesController < ApplicationController
  before_action :authenticate_admin_request

  def create
    feature_toggle = FeatureToggle.new(feature_toggle_params)
    feature_toggle.user = @auth_admin

    unprocessable_entity_response(errors: feature_toggle.errors.messages) unless feature_toggle.save
  end

  private

  def feature_toggle_params
    params.require(:feature_toggle).permit(:name)
  end
end

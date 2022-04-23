class Api::V1::Admin::FeatureTogglesController < ApplicationController
  before_action :authenticate_admin_request, only: [:index, :create, :update]

  def index
  end

  def create
    feature_toggle = FeatureToggle.new(feature_toggle_params)
    feature_toggle.user = @auth_admin

    if feature_toggle.save
      created_response(data: { feature_toggle: feature_toggle })
    else
      unprocessable_entity_response(errors: feature_toggle.errors.messages)
    end
  end

  def update
    feature_toggle = FeatureToggle.find(params[:id])
    feature_toggle.update(feature_toggle_update_params)

    ok_response(data: { feature_toggle: feature_toggle })
  rescue ArgumentError => error
    unprocessable_entity_response(errors: error)
  end

  private

  def feature_toggle_params
    params.require(:feature_toggle).permit(:name)
  end

  def feature_toggle_update_params
    params.require(:feature_toggle).permit(:status)
  end
end

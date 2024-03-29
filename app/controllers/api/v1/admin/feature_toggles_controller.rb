class Api::V1::Admin::FeatureTogglesController < ApplicationController
  before_action { authenticate_request(as_admin: true) }
  before_action :set_feature_toggle, only: [:show, :update]

  def index
    feature_toggles = FeatureToggle.all

    if feature_toggles.present?
      ok_response(data: { feature_toggles: feature_toggles })
    else
      not_found_response
    end
  end

  def show
    ok_response(data: { feature_toggle: @feature_toggle })
  end

  def create
    feature_toggle = FeatureToggle.new(feature_toggle_params)
    feature_toggle.user = @auth_user

    if feature_toggle.save
      created_response(data: { feature_toggle: feature_toggle })
    else
      unprocessable_entity_response(errors: feature_toggle.errors.messages)
    end
  end

  def update
    @feature_toggle.update(feature_toggle_update_params)

    ok_response(data: { feature_toggle: @feature_toggle })
  rescue ArgumentError => error
    unprocessable_entity_response(errors: error)
  end

  private

  def set_feature_toggle
    @feature_toggle = FeatureToggle.find(params[:id])
  end

  def feature_toggle_params
    params.require(:feature_toggle).permit(:name)
  end

  def feature_toggle_update_params
    params.require(:feature_toggle).permit(:status)
  end
end

# frozen_string_literal: true

class Api::V1::Users::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  # include Devise::Controllers::Rememberable
  # after_action :update_auth_header, only: :omniauth_success

  # def update_auth_header

  #   binding.pry

  # end

  def omniauth_success
    get_resource_from_auth_hash
    set_token_on_resource
    create_auth_params

    if confirmable_enabled?
      # don't send confirmation email!!!
      @resource.skip_confirmation!
    end

    sign_in(:user, @resource, store: false, bypass: false)

    @resource.save!

    yield @resource if block_given?

    response.set_header('X-HEADERNAME', 'HEADERVALUE')
    @auth_params.each do |key, value|
      response.set_header(key.to_s, value)
    end

    # binding.pry
    redirect_to DeviseTokenAuth::Url.generate('https://bantutemu.now.sh', {resource: @resource, auth_params: @auth_params})

    # render json: {
    #   message: 'success, check header',
    #   resource: @resource,
    #   auth: @auth_params
    # }
  end
end

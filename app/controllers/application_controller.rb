class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :redirect_to_default_locale
  before_action :setup_locale

  rescue_from ActiveRecord::RecordNotFound, with: :error404

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end

  private

  def redirect_to_default_locale
    redirect_to controller: params[:controller], action: params[:action], locale: I18n.default_locale if params[:locale].blank?
  end

  def setup_locale
    locale =
      if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
        params[:locale].to_sym
      else
        I18n.default_locale
      end
    I18n.locale = locale
  end

  def error404
    render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
  end
end

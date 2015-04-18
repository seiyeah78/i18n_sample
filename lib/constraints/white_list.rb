module Constraints
  class WhiteList
    def initialize
    end

    def matches?(request)
      request.params[:locale].present? && I18n.available_locales.include?(request.params[:locale].to_sym)
    end
  end
end

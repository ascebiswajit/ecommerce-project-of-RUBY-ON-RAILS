class ApplicationController < ActionController::Base
    # include ApplicationHelper
    before_action :initialize_session 
    before_action :load_product

    private
    def initialize_session
        session[:product] ||= []
    end
    def load_product
        @product =Cart.find(session[:product])
    end
end

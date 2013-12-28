class ListsController < ApplicationController
  respond_to :json
  
  def create
    render json: { status: 'success' }.to_json
  end

end

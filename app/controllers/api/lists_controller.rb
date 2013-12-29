class Api::ListsController < Api::BaseController
  
  def create
    render json: { status: 'success' }.to_json
  end

end

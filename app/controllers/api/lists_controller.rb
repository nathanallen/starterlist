class Api::ListsController < Api::BaseController
  
  def create
    owner_email = params['owner_email']
    owner = User.find_or_create_by(email: owner_email)

    requested_name = params['requested_name']
    list = List.new(url: requested_name, owner: owner)

    if list.save  
      render json: { status: 'success' }.to_json
    else
      render json: {"status" => "failed", "error_message" => "Name not available"}.to_json
    end
  end

end

class Api::ListsController < Api::BaseController
  
  def create
    email = params['email']
    owner = User.find_or_create_by(email: email)

    requested_name = params['list_name']
    list = List.new(url: requested_name, owner: owner)

    if list.save  
      render json: { status: 'success' }.to_json
    else
      render json: {"status" => "failed", "error_message" => "Name not available"}.to_json
    end
  end

  def subscribe
    list_name = params['list_name']
    list = List.find_by(url: list_name)

    if list
      email = params['email']
      user = User.find_or_create_by(email: email)
      list.subscribe(user)
      render json: { status: 'success' }.to_json
    else
      render json: {"status" => "failed", "error_message" => "List does not exist"}.to_json
    end
  end

end

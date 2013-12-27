class ListController < ApplicationController
  respond_to :json
  
  #GET /list/new.json
  # def new
  #   render json: { list: 'success' }.to_json
  # end

  #POST /list/
  def create
    p params
    render json: { status: 'posted successfully' }.to_json
  end

  #GET /list/:custom_url
  def show
    list = params['custom_url']
    render json: { name: list }.to_json
  end

  #UPDATE /list/:custom_url
  def update
    render json: { status: 'updated successfully' }.to_json
  end

  # #DELETE /list/:custom_url
  # def destroy

  # end

end

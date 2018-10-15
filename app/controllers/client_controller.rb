class ClientController < ApplicationController
  def create
    @client = Client.new(client_params)
    client.save!
    render json: client.as_json(only: [:id])
  end

  private
  def client_params
    params.require(:client).permit(:client_number, :client_dob)
  end
end

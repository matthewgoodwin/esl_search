class ClientsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    @client.destroy
    # flash[:notice] = "your message was deleted!"
  end
end

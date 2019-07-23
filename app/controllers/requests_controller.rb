class RequestsController < ApplicationController

  # GET /requests
  # GET /requests.json
  def index
    @users = current_user.requesters.where('requests.accepted = ?', 0)
  end

  # POST /requests
  # POST /requests.json
  def create
    @friend_request = current_user.sent_requests.build(request_params)
    if @friend_request.save
       redirect_to root_url, notice: 'Friend request sent!'
    else
      render root_url, notice: 'Friend request was not sent!'
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @friend_request = Request.find(params[:id])
    @friend_request.accept
    redirect_to User.find(params[:request][:requester_id]).profile, notice: 'Friend Request Accepted!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
       params.require(:request).permit(:requestee_id)
  end
end

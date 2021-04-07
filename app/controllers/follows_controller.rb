class FollowsController < ApplicationController
    
    def create 
        # requester = current_user.id
        # requestee = params[:requestee_id]
        @follow = Follow.new(request_params)
        # @request.requester_id = requester
        # @request.requestee_id = requestee
        @previously_exists = Follow.where(request_params)
        # @previously_exists_flag = false
        
        # unless (@previously_exists.nil?)
        #     # @previously_exists_flag = true
        #     redirect_back fallback_location: posts_url
        #     return
        # end

    respond_to do |format|
        if @follow.save
    
            # redirect_back fallback_location: posts_url
            format.html { redirect_back fallback_location: cryptocurrencies_url, notice: 'Successfully Followed' }
            # format.json { render :show, status: :created, location: @user }
        else
            format.html { redirect_back fallback_location: cryptocurrencies_url, notice: 'Error in following' }
            format.json { render json: @request.errors, status: :unprocessable_entity }
        end
        end
    end

    private 

    def request_params
        params.require(:follow).permit(:follower_id, :followable_type, :followable_id)
    end
   
   
end
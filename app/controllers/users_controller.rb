class UsersController < ApplicationController
    def index 
        @users = User.all

        # # require 'httpclient'
        # # require 'json'

        # client = HTTPClient.new

        # response = client.get('https://chain.so/api/v2/get_info/DOGE')

        # if response.status_code == 200 then
        # # everything went swimmingly

        # content = JSON.parse response.content
        # @content = content

        # @name = "Name: "+content['data']['name']
        # @blocks = "Total Blocks: "+content['data']['blocks'].to_s

        # end
    end

    def show 
        @user = User.find(params[:id])
        @follows = @user.follows
        @cryptocurrencies = @user.cryptocurrencies 
        @wallets = @user.wallets
    end
end

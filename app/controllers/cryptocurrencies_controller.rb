class CryptocurrenciesController < ApplicationController
  before_action :set_cryptocurrency, only: %i[ show edit update destroy ]

  # GET /cryptocurrencies or /cryptocurrencies.json
  def index
    @cryptocurrencies = Cryptocurrency.all
    @follow = Follow.new
  end

  # GET /cryptocurrencies/1 or /cryptocurrencies/1.json
  def show
    # @coin = params[:symbol]
    # @base_currency = params[:currency]
    @cryptocurrency = Cryptocurrency.find(params[:id])
    @coin = @cryptocurrency.symbol
    @base_currency = "USD"
        require 'httpclient'
        require 'json'

        client = HTTPClient.new #default_header: {"Accepts" => "application/json", 'X-CMC_PRO_API_KEY:' => 'b50921e9-ed4f-4cd7-9e9f-8a5de029f8f3' }

        query = {
          'convert' => 'USD', 
          'CMC_PRO_API_KEY' => 'b50921e9-ed4f-4cd7-9e9f-8a5de029f8f3', 
          'symbol' => "#{@coin}"
        }
        headers = ['Accepts: application/json', 'X-CMC_PRO_API_KEY: b50921e9-ed4f-4cd7-9e9f-8a5de029f8f3']
        # response = client.get('https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest', query)
        response = client.get('https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest', query)
        # response = client.get("https://chain.so//api/v2/get_price/#{@coin}/#{@base_currency}")

        if response.status_code == 200 then
        # everything went swimmingly

        content = JSON.parse response.content
        @content = content

        @price = content['data']["#{@coin}"]['quote']['USD']['price']
        # @price = content['data']['prices'][1]['price']
        # @name = "Name: "+content['data']['name']
        # @blocks = "Total Blocks: "+content['data']['blocks'].to_s
        @percent_change_1h = content['data']["#{@coin}"]['quote']['USD']['percent_change_1h']
        @percent_change_24h = content['data']["#{@coin}"]['quote']['USD']['percent_change_24h']
        @percent_change_7d = content['data']["#{@coin}"]['quote']['USD']['percent_change_7d']
        @percent_change_30d = content['data']["#{@coin}"]['quote']['USD']['percent_change_30d']
        @market_cap = content['data']["#{@coin}"]['quote']['USD']['market_cap']
        @volume_24h = content['data']["#{@coin}"]['quote']['USD']['volume_24h']

        else 
          # @error = response.error
          content = JSON.parse response.content
          @content = content
        end
  end

  # GET /cryptocurrencies/new
  def new
    @cryptocurrency = Cryptocurrency.new
  end

  # GET /cryptocurrencies/1/edit
  def edit
  end

  # POST /cryptocurrencies or /cryptocurrencies.json
  def create
    @cryptocurrency = Cryptocurrency.new(cryptocurrency_params)

    respond_to do |format|
      if @cryptocurrency.save
        format.html { redirect_to @cryptocurrency, notice: "Cryptocurrency was successfully created." }
        format.json { render :show, status: :created, location: @cryptocurrency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cryptocurrency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cryptocurrencies/1 or /cryptocurrencies/1.json
  def update
    respond_to do |format|
      if @cryptocurrency.update(cryptocurrency_params)
        format.html { redirect_to @cryptocurrency, notice: "Cryptocurrency was successfully updated." }
        format.json { render :show, status: :ok, location: @cryptocurrency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cryptocurrency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cryptocurrencies/1 or /cryptocurrencies/1.json
  def destroy
    @cryptocurrency.destroy
    respond_to do |format|
      format.html { redirect_to cryptocurrencies_url, notice: "Cryptocurrency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cryptocurrency
      @cryptocurrency = Cryptocurrency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cryptocurrency_params
      params.require(:cryptocurrency).permit(:name)
    end
end

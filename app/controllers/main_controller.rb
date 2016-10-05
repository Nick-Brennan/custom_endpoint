class MainController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  require 'fuelsdk'

  def index
  end

  def listen

    email = #GET EMAIL ADDRESS
    news = #GET NEWSLETTER OPT_IN STATUS
    
    myclient = ET_Client.new auth
    p myclient

    dataextensionrow = FuelSDK::DataExtension::Row.new
    dataextensionrow.authStub = myclient
    dataextensionrow.Name = 'VBA_Website_Referral_List'
    dataextensionrow.props = {"EmailAddress" => email,
                              "Newsletter" => news}
    results = dataextensionrow.post

    p results.results
    
  end

  def auth
      {
        'client' => {
          'id' => [CLIENT_ID],
          'secret' => [CLIENT_SECRET]
        }
      }
    end
end

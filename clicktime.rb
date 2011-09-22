require 'savon'

class ClickTime

  def initialize(credentials)
    @key      = credentials[:key]
    @password = credentials[:password]
  end


  def actions
    client.wsdl.soap_actions  
  end 


  def exec(action, body)
    response = client.request action do
      soap.header = header
      soap.body = body
    end
    return response.to_hash
  end  


  private


  def client 
    Savon::Client.new do
      wsdl.document = 'http://app.clicktime.com/webservices/2_2/UserDataExchange.asmx?WSDL'
    end    
  end

  
  def header
    { 'CredentialsSoapHeader' => { 
        'Key' => @key, 
        'Password' => @password 
      }, 
      :attributes! => { 
        'CredentialsSoapHeader' => { 
          'xsi:type' => 'WebServiceKeyCredentials', 
          'xmlns' => 'http://clicktime.com/webservices/2.2/' 
        }
      }
    }    
  end  
end
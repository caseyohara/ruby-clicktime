ruby-clicktime
=============

A Ruby wrapper for the ClickTime SOAP API

**Requirements**

ruby-clicktime uses [Savon](http://savonrb.com/), so be sure to install that first:

	$ gem install savon

**Usage**

	require 'clicktime'

	clicktime = ClickTime.new :key => 'your-api-key', :password => 'your-api-password'
	
The ClickTime class has two methods: 

`ClickTime#actions` will return a list of all actions available to the ClickTime SOAP API

	clicktime.actions  # un_sync_all, get_sync_id, set_sync_id, get_employment_types, ... 

`ClickTime#exec` will execute an API call and return a hash of results

	clicktime.exec :api_action, {params}


**Example**

First, create an instance of the ClickTime class:

	require 'clicktime'

	clicktime = ClickTime.new :key => 'your-api-key', :password => 'your-api-password'

The GetEmployeeList and GetClientList API methods, as defined in the ClickTime API docs: 

	<GetEmployeeList xmlns="http://clicktime.com/webservices/2.2/">
  		<UserID>string</UserID>
  		<ActiveOnly>boolean</ActiveOnly>
	</GetEmployeeList>

	<GetClientList xmlns="http://clicktime.com/webservices/2.2/">
  		<UserID>string</UserID>
	</GetClientList>
	
To execute these queries, you would call the following:
	
	employees = clicktime.exec :get_employee_list, {"UserID" => 'your-user-id', "ActiveOnly" => 'true'}
	clients = clicktime.exec :get_client_list, {"UserID" => 'your-user-id'}
	
Notice the action is passed as a snake_case symbol from the list of available actions. (`clicktime.actions` to list them)


ClickTime SOAP API Documentation:
============

[http://app.clicktime.com/documentation/webservices/2_2/WebServicesDocumentation_2_2.asp](http://app.clicktime.com/documentation/webservices/2_2/WebServicesDocumentation_2_2.asp)
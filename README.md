# README

* Rails Installer with Ruby 2.3

* Update config/application.rb with preferred values for the following parameters:
	
	* Timezone (Update value for the config parameter "config.time_zone" which is currently set to Indian timezone)

* Update initializers/billingapp_config.rb with preferred values for Branding and other business related configurations (Update values only within the double quotes("") and do not update anything else). If you do this change when the application is already started, then you will have to restart the server (stop and start again)

* If you intend to use Mysql instead of SQLite database
	
	* Install Mysql community version developer/full install (Mysql 8 but during installation choose the Legacy authentication method that support Mysql 5.x - https://dev.mysql.com/doc/mysql-installer/en/server-authentication-method.html)
	
	* Create database in Mysql for the app with preferred name

	* Update database.yml with correct database credentials (database name, root username and password)

* For fresh new database, goto the application code (billingapp folder) on commandline and run "rake db:setup" to create the initial tables


* LOCAL MACHINE INSTRUCTIONS:

	* Goto the application code (billingapp folder) on commandline and run "rails s" to start the server

	* Usually the rails server would run on 3000 port by default. So your application would be available on http://localhost:3000. If you want to chang ethe port then change the rails s command to this while starting the server : "rails s -p 4000"

	* Usually the rails server would run in development environment. If you want to use the production environment, change the rails s command to this while starting the server : "rails s -e production"

	* If you want to use your own DNS name for the url, then update the httpd.conf file or hosts file and map 127.0.0.1 to the name who would prefer. 
	Eg: 127.0.0.1  mybillingapp.com 
	
	With this, you will be able to access the app using the url http://mybillingapp.com:3000
	
	If you want to skip the port number as well, then you will have to start the rails server on port 80 (rails s -p 80)

	(For windows - Update the file c:/windows/system32/drives/hosts file. Please note that you would need adminstrator permission)
 	

* Cloud or other Physical servers:
	
	* Goto the application code (billingapp folder) on commandline and run "rails s -p production -d" to start the server with production environment and run the process in the background

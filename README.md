# README

* Rails Installer with Ruby 2.3

* Mysql community version developer/full install (Mysql 8 but during installation choose the Legacy authentication method that support Mysql 5.x - https://dev.mysql.com/doc/mysql-installer/en/server-authentication-method.html)

* Update config/application.rb with preferred values for the following parameters:
	
	* Timezone (Update value for the config parameter "config.time_zone" which is currently set to Indian timezone)

	* 

* Create database in Mysql for the app with preferred name

* Update database.yml with correct database credentials (database name, root username and password)

* For fresh new database, goto the application code (billingapp folder) on commandline and run "rake db:setup" to create the initial tables

* Create following triggers in the database:

	# To update the amount in bill_items table based on quanity and unit_price

	CREATE TRIGGER bill_item_amount_update 
	BEFORE INSERT 
	ON `bill_items` FOR EACH ROW 
	SET NEW.amount = NEW.quantity * NEW.unit_price

	# To update the total in bills table based on the sum of amounts of the bill items

	CREATE TRIGGER bill_total_update 
	AFTER INSERT 
	ON `bill_items` FOR EACH ROW 
	UPDATE bills SET total = (SELECT SUM(amount) 
	FROM bill_items WHERE bill_items.bill_id=bills.id)

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

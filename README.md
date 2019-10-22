# README

* Rails Installer with Ruby 2.3

* Mysql community version developer/full install (Mysql 8 but during installation choose the Legacy authentication method that support Mysql 5.x - https://dev.mysql.com/doc/mysql-installer/en/server-authentication-method.html)

* Update database.yml with correct database credentials (database name, root username and password)

* For fresh new database, goto the application code (billingapp folder) on commandline and run "rake db:setup" to create the initial tables

* Goto the application code (billingapp folder) on commandline and run "rails s" to start the server

* Only local machine, usually the rails server would run on 3000 port by default (http://localhost:3000)


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Requirements
Ruby version: 3.0.2
Rails: 7.0.3
Bundler: 2.2.22
Mysql is required to run this

* Instructions to run the application on local
1. Run Command: `bundle install`
2. Setup `config/database.yml` file with your database credentials
3. Run Command: `rails db:create`
4. Run Command: `rails db:migrate`
5. Run Command: `rails server`
6. You can access the appliction on `http://localhost:3000`


* Implementation instructions
1. Root URL will take you to invoice batches index page
2. You can upload a new file from the root page, uploading a new file will create an entry inside invoice_batches table
3. A background job will be enqued on creation of invoice batch, which will create invoices and set selling price (According to given formula) for the records present inside the file
4. You can download error file and the complete file you uploaded from the invoice_batch page

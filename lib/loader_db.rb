require 'SQLite3'

class LoaderDB
  attr_reader :db

  def initialize(csv_loaders) # needs an array and headers array accessible via loader_csv
                              #    object
    @db = create_db
    add_tables(csv_loaders)
    populate_tables(csv_loaders)
  end

  def create_db
    SQLite3::Database.new " :memory: "
  end

  def add_tables(csv_loaders)
    self.db.execute(create_customer_table)
    self.db.execute(create_merchant_table)
    self.db.execute(create_item_table)
    self.db.execute(create_invoice_item_table)
    self.db.execute(create_invoice_table)
    self.db.execute(create_transaction_table)
  end

  def populate_tables(csv_loaders)
    populate_customer_table(csv_loaders)
    populate_merchant_table(csv_loaders)
    populate_item_table(csv_loaders)
    populate_invoice_item_table(csv_loaders)
    populate_invoice_table(csv_loaders)
    populate_transaction_table(csv_loaders)
  end

  def create_customer_table
build_table = <<-EOF
CREATE TABLE customer_repository (
      "id" int PRIMARY KEY,
      "first_name" varchar(30),
      "last_name" varchar(30),
      "created_at" datetime,
      "updated_at" datetime
      );
EOF
  end

  def create_merchant_table
build_table = <<-EOF
CREATE TABLE merchant_repository (
      "id" int PRIMARY KEY,
      "name" varchar(30),
      "created_at" datetime,
      "updated_at" datetime
      );
EOF
  end

  def create_item_table
build_table = <<-EOF
CREATE TABLE item_repository (
      "id" int PRIMARY KEY,
      "name" varchar(30),
      "description" varchar(300),
      "unit_price" int,
      "merchant_id" int,
      "created_at" datetime,
      "updated_at" datetime
      );
EOF
  end

  def create_invoice_item_table
build_table = <<-EOF
CREATE TABLE invoice_item_repository (
      "id" int PRIMARY KEY,
      "item_id" int,
      "invoice_id" int,
      "quantity" int,
      "unit_price" int,
      "created_at" datetime,
      "updated_at" datetime
      );
EOF
  end

  def create_invoice_table
build_table = <<-EOF
CREATE TABLE invoice_repository (
      "id" int PRIMARY KEY,
      "customer_id" int,
      "merchant_id" int,
      "status" varchar(20),
      "unit_price" int,
      "created_at" datetime,
      "updated_at" datetime
      );
EOF
  end

  def create_transaction_table
build_table = <<-EOF
CREATE TABLE transaction_repository (
      "id" int PRIMARY KEY,
      "invoice_id" int,
      "credit_card_number" int,
      "credit_card_expiration_date" date,
      "result" varchar(20),
      "created_at" datetime,
      "updated_at" datetime
      );
EOF
  end

  def populate_customer_table(csv_loaders)
    statement = db.prepare( "INSERT INTO customer_repository
      (id, first_name, last_name, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?)" )
    csv_loaders[:customer_repository].db.each do |row|
      statement.execute(row)
    end
  end

  def populate_merchant_table(csv_loaders)
    statement = db.prepare( "INSERT INTO merchant_repository
      (id, name, created_at, updated_at)
      VALUES (?, ?, ?, ?)" )
    csv_loaders[:merchant_repository].db.each do |row|
      statement.execute(row)
    end
  end

  def populate_item_table(csv_loaders)
    statement = db.prepare( "INSERT INTO item_repository
      (id, name, description, unit_price, merchant_id, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?)" )
    csv_loaders[:item_repository].db.each do |row|
      statement.execute(row)
    end
  end

  def populate_invoice_item_table(csv_loaders)
    statement = db.prepare( "INSERT INTO invoice_item_repository
      (id, item_id, invoice_id, quantity, unit_price, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?)" )
    csv_loaders[:invoice_item_repository].db.each do |row|
      statement.execute(row)
    end
  end

  def populate_invoice_table(csv_loaders)
    statement = db.prepare( "INSERT INTO invoice_repository
      (id, customer_id, merchant_id, status, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?)" )
    csv_loaders[:invoice_repository].db.each do |row|
      statement.execute(row)
    end
  end

  def populate_transaction_table(csv_loaders)
    statement = db.prepare( "INSERT INTO transaction_repository
      (id, invoice_id, credit_card_number, credit_card_expiration_date, result, 
        created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?)" )
    csv_loaders[:transaction_repository].db.each do |row|
      statement.execute(row)
    end
  end

end
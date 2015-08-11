require "csv"

class Repository
  attr_accessor :engine,
                :headers

  def initialize(engine)
    @engine   = engine
  end

  def headers
    result = engine.search(headers_query)
     # ["Customer", "id,first_name,last_name,created_at,updated_at"]
    # want result to be this=> "id,name,created_at,updated_at"
    result.next.last.split.map {|x| x.to_sym}
  end

  def headers_query
    "SELECT * FROM Headers WHERE repo = #{self.class}"
  end

  def all
    query = "SELECT * FROM #{self.class}"
    results = engine.search(query)
    objects(results)
  end

  def random
   my_type.new(all.sample)
  end

  #what is this for??
  # def id (id_number)
  #   database[id_number]
  # end

  def inspect
    "#<#{self.class}"
  end

  def find_by(category, item)
    objects = find_all_by(category, item)
    objects.first if !(objects.empty?)
  end

  def find_all_by(category, item)
    query = "SELECT * FROM #{self.class} WHERE #{category.to_s} = #{item}"
    rows = engine.search(query)
    objects(rows) if !(rows.empty?)
  end

  def objects(data)
    data.map do |row|
      attributes = self.headers.zip(data).to_h
      my_type.new(attributes, self)
    end
  end

  # def get(what, source_key_value, remote_key_name)
  #   foreign_repo = repo_map[what.to_sym]
  #   engine.send(foreign_repo).find_all_by(remote_key_name, source_key_value)
  # end

  # # factored out of get.. not yet retested/used
  # def foreign_key_for(repo, class_name)
  #   engine.send(repo).holds_type.foreign_keys[class_name]
  # end

  # def repo_map
  #   {
  #     :item => :item_repository,
  #     :items => :item_repository,
  #     :invoice => :invoice_repository,
  #     :invoices => :invoice_repository,
  #     :transactions => :transaction_repository,
  #     :invoice_items => :invoice_item_repository,
  #     :customer => :customer_repository,
  #     :merchant => :merchant_repository
  #   }
end
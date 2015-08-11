require "csv"

class Repository
  attr_accessor :engine,
                :headers

  def initialize(engine)
    @headers = []
    @engine   ||= engine
  end

  def all
    database
  end

  def random
    id = database.keys.sample
    database[id]
  end

  def find_by(search_attribute)
    find_all_by(search_attribute)[0]
  end

  def find_all_by(search_attribute)
    table = get_table(self)
    key = search_attribute.keys[0]
    value = search_attribute.values[0]
    out = {}
    database.each do |id, attributes|
      out[id] = attributes if attributes.send(key) == value
    end
    out.values
  end

  def id (id_number)
    database[id_number]
  end

  def inspect
    "#<#{self.class}"
  end

  def get_table(repo)
    self.class.to_lower.insert("_", -11)
  end

end




# module RepositoryLike
#   def column_name(method)
#     method.slice(find_prefix..-1)
#   end

#   def create_table(rows, columns)
#     rows.each_with_object([]) do |csv_line, table|
#       table << columns.zip(csv_line).to_h
#     end
#   end

#   def random
#     holds_type.new(repository.sample)
#   end

#   def all
#     objects(repository)
#   end

#   def get(what, source_key_value, remote_key_name)
#     foreign_repo = repo_map[what.to_sym]
#     engine.send(foreign_repo).find_all_by(remote_key_name, source_key_value)
#   end

#   # factored out of get.. not yet retested/used
#   def foreign_key_for(repo, class_name)
#     engine.send(repo).holds_type.foreign_keys[class_name]
#   end

#   def repo_map
#     {
#       :item => :item_repository,
#       :items => :item_repository,
#       :invoice => :invoice_repository,
#       :invoices => :invoice_repository,
#       :transactions => :transaction_repository,
#       :invoice_items => :invoice_item_repository,
#       :customer => :customer_repository,
#       :merchant => :merchant_repository
#     }
#   end

#   def find_by(category, item)
#     rows = repository.select do |row|
#       row[category.to_sym].downcase == item.downcase
#     end
#     objects(rows).first if !(rows.empty?)
#   end

#   def find_all_by(category, item)
#     rows = repository.select do |row|
#       unless row[category.to_sym].nil?
#         row[category.to_sym].downcase == item.downcase
#       end
#     end
#     objects(rows) if !(rows.empty?)
#   end

#   def objects(data)
#     data.map do |row|
#       row[:repository] = self
#       holds_type.new(row)
#     end
#   end

#   def find_prefix
#     "find_by_".length
#   end

#   def find_all_prefix
#     "find_all_by_".length
#   end
# end

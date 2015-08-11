require 'csv'

class LoaderCSV
  attr_reader :path, :db
  attr_accessor :headers

  def initialize(path)
    @path = path
    @headers = []
    @db = load(path)
  end

  def load(from = path)
    # require 'pry'; binding.pry
    cur_path = Dir.pwd
    db = CSV.read(path, :headers => true).to_a
    self.headers = [].concat(db.shift)
    db
  end

end
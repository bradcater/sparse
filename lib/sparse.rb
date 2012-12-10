require 'sparse/version'
require 'sparse/sp_array'

module Sparse
end

class Array
  def to_sparse_array
    SpArray.new(self)
  end
  alias_method :to_spa, :to_sparse_array
end

class SpArray
  DEFAULTS = {
    :sparse_value => 0
  }.freeze
  def eql?(o)
    self.class == o.class && [:data, :size, :sparse_value].all?{|attr| self.send(attr) == o.send(attr)}
  end
  def check_rep
    ok = true
    if self.data.size > 0
      ok &&= self.size >= self.data.last
      self.data.each do |datum|
        ok &&= datum.size == 2
      end
    end
    ok
  end; private :check_rep
  def index_from_datum(datum)
    datum.first
  end; private :index_from_datum
  def value_from_datum(datum)
    datum.last
  end; private :value_from_datum
  attr_reader :data, :size, :sparse_value
  def initialize(a_or_h, opts={})
    if a_or_h.is_a?(Hash)
      @data = a_or_h[:data]
      @size = a_or_h[:size]
      @sparse_value = a_or_h[:sparse_value] || DEFAULTS[:sparse_value]
    else
      @data = a_or_h.map.with_index do |o, idx|
        o == 0 ? nil : [idx, o]
      end.compact
      @size = a_or_h.size
      @sparse_value = opts[:sparse_value] || DEFAULTS[:sparse_value]
    end
  end
  def to_array
    a = Array.new(self.size, self.sparse_value)
    self.data.each do |datum|
      a[index_from_datum(datum)] = value_from_datum(datum)
    end
    a
  end
  alias_method :to_a, :to_array
  def to_raw
    {:data         => self.data,
     :size         => self.size,
     :sparse_value => self.sparse_value}
  end
  alias_method :to_r, :to_raw
end

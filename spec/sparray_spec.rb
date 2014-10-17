require 'sparse'

describe SpArray do
  DEFAULT_ARRAY = [1, 0, 2, 0, 3, 0, 4, 0, 0, 0]
  it "should load from an Array" do
    a = DEFAULT_ARRAY.dup
    sa = SpArray.new(a)
    sa.size.should eql(a.size)
    sa.to_a.should eql(a)
  end

  it "should load from a Hash" do
    a = DEFAULT_ARRAY.dup
    sa_0 = SpArray.new(a)
    sa_1 = SpArray.new(sa_0.to_r)
    sa_0.should eql(sa_1)
  end

  it "should work for a different sparse value" do
    new_sparse_value = 1
    a = DEFAULT_ARRAY.dup.map{|o| o == 0 ? new_sparse_value : o}
    sa = SpArray.new(a, :sparse_value => new_sparse_value)
    sa.to_a.should eql(a)
  end

  it "should test equality correctly" do
    a = DEFAULT_ARRAY.dup
    sa_0 = SpArray.new(a)
    sa_1 = SpArray.new(a)
    (sa_0 == sa_1).should eql(true)
    (sa_0.eql?(sa_1)).should eql(true)
  end
end

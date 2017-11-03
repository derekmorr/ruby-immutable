require 'spec_helper.rb'
require './immutable.rb'

describe "reverse" do
  it "reverses an empty list" do
    expect(reverse([])).to eq([])
  end

  it "reverses a non-empty list" do
    expect(reverse([1,2,3,4])).to eq([4,3,2,1])
  end
end

describe "length" do
  it "returns 0 for the empty list" do
    expect(length([])).to eq(0)
  end

  it "returns the correct length for non-empty lists" do
    expect(length([1,2,3,4])).to eq(4)
  end
end


describe "drop" do
  it "returns the original list when count is 0" do
    expect(drop(0, [1,2,3,4])).to eq([1,2,3,4])
  end

  it "drops the number of elements when count < length of list" do
    expect(drop(3, [1,2,3,4,5,6,7,8])).to eq([4,5,6,7,8])
  end

  it "returns an empty list when count >= length of the list" do
    expect(drop(10, [1,2,3,4])).to eq([])
  end
end

describe "take" do
  it "returns an empty list when count is 0" do
    expect(take(0, [1,2,3,4,5])).to (eq([]))
  end

  it "returns the prefix when count < length of list" do
    expect(take(3, [1,2,3,4,5])).to eq([1,2,3])
  end

  it "returns the entire input list when count > length of the list" do
    expect(take(10, [1,2,3,4])).to eq([1,2,3,4])
  end
end

describe "include?" do
  it "returns false when the list is empty" do
    expect(include?([], 4)).to be_falsey
  end

  it "returns false when the element is not in the list" do
    expect(include?([1,2,3,4], "banana")).to be_falsey
  end

  it "returns true when the element is in the list" do
    expect(include?([1,2,3,4], 3)).to be_truthy
  end
end

describe "map" do
  it "returns an empty list if the input list is empty" do
    output = map([]) { |x| x + 1 }  
    expect(output).to eq([])
  end

  it "applies the function to all elements in the list" do
    output = map([1,2,3,4]) { |x| x + 1 }  
    expect(output).to eq([2,3,4,5])
  end
end

describe "select" do
  it "returns an empty list if the input list is empty" do
    output = select([]) { |x| x % 2 == 0 }  
    expect(output).to eq([])
  end

  it "returns all the values that match the predicate" do
    output = select([1,2,3,4]) { |x| x % 2 == 0 }   
    expect(output).to eq([2,4])
  end
end
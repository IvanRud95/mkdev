RSpec::Matchers.define :be_sorted_by do |expected|
  match do |actual|
    actual == actual.sort_by(&expected)
  end
end

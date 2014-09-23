require 'rspec'
require './diffable_array'

describe DiffableArray do

  it 'merges arrays with the same length and one differing element' do
    array1 = DiffableArray.new(['grapefruit', 'banana', 'lemon'])
    array2 = ['grapefruit', 'apple', 'lemon']

    expected_result = ['grapefruit', 'banana', 'apple', 'lemon']

    merged_array = array1.diff_merge(array2)

    expect(merged_array).to eq(expected_result)
  end

  it 'merges arrays with different lengths and different numbers of differing elements' do
    array1 = DiffableArray.new(['grapefruit', 'banana', 'lemon'])
    array2 = ['grapefruit', 'apple', 'orange', 'lemon']

    expected_result = ['grapefruit', 'banana', 'apple', 'orange', 'lemon']

    merged_array = array1.diff_merge(array2)

    expect(merged_array).to eq(expected_result)
  end

  it 'merges entirely different arrays' do
    array1 = DiffableArray.new(['grapefruit', 'banana', 'lemon'])
    array2 = ['orange', 'plum', 'kiwi']

    expected_result = ['grapefruit', 'banana', 'lemon', 'orange', 'plum', 'kiwi']

    merged_array = array1.diff_merge(array2)

    expect(merged_array).to eq(expected_result)
  end

  it 'merges arrays with the same start and end element' do
    array1 = DiffableArray.new(['grapefruit', 'banana', 'lemon'])
    array2 = ['orange', 'plum', 'grapefruit']

    expected_result = ['orange', 'plum', 'grapefruit', 'banana', 'lemon']

    merged_array = array1.diff_merge(array2)

    expect(merged_array).to eq(expected_result)
  end

  it 'merges arrays with the same elements in a different order' do
    array1 = DiffableArray.new(['grapefruit', 'banana', 'lemon'])
    array2 = DiffableArray.new(['lemon', 'grapefruit', 'banana'])

    expected_result = ['grapefruit', 'banana', 'lemon']

    merged_array = array1.diff_merge(array2)
    expect(merged_array).to eq(expected_result)

    expected_result = ['lemon', 'grapefruit', 'banana']

    merged_array = array2.diff_merge(array1)
    expect(merged_array).to eq(expected_result)
  end
end

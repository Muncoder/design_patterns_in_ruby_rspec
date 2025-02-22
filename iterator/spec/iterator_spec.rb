require 'spec_helper'
require_relative '../lib/iterator'

describe "Iterator Pattern" do
  describe Inventory do
    let(:inventory) { Inventory.new }

    before :each do
      @item1 = Item.new
      @item1.cost = 20

      @item2 = Item.new
      @item2.cost = 10

      inventory.add(@item1)
      inventory.add(@item2)
    end

    it "provides most expensive item" do
      expensive = Item.new
      expensive.cost = 100
      inventory.add(expensive)

      expect(inventory.max).to eq(expensive)
      expect(inventory.sort).to eq([@item2, @item1, expensive])
    end

    it "can iterate through items and get the total cost" do
      # 1
      # iterator = InventoryIterator.new(inventory)
      # result = 0
      # while iterator.has_next?
      #   result += iterator.next.cost
      # end

      # 2
      # result = 0
      # inventory.each { |item| result += item.cost }
      result = inventory.inject(0) { |sum, item| sum += item.cost }
      expect(result).to eq(30)
    end

    it "add items to the collection" do
      expect(inventory.items.size).to eq(2)
    end
  end

  describe Item do
    let(:item) { Item.new }

    it "has cost" do
      expect(item.cost).to eq(0)
    end
  end
end
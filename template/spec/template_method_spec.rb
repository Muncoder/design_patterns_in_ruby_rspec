require 'spec_helper'
require_relative '../lib/template_method'

describe "Template method pattern" do
  context "Default Hero" do
    let(:hero) { Hero.new }

    it "has default damage rating of 10" do
      expect(hero.damage).to eq(10)
    end

    it "can attach" do
      expect(hero.attach).to eq("Attacked dealing 10 damage")
    end
  end

  context "Warrior" do
    let(:hero) { Warrior.new }

    it "has default damage of 15" do
      expect(hero.damage).to eq(15)
    end

    it "has Strike special ability" do
      expect(hero.abilities).to include(:strike)
    end

    it "greets other characters" do
      expect(hero.greet).to eq(["Hello", "Warrior is ready to fight"])
    end
  end

  context "Mage" do
    let(:hero) { Mage.new }

    it "has default damage of 7" do
      expect(hero.damage).to eq(7)
    end

    it "has Magic Arrow special ability" do
      expect(hero.abilities).to include(:magic_arrow)
    end

    it "greets other characters" do
      expect(hero.greet).to eq(["Hello", "Mage is ready to show magic"])
    end
  end
end
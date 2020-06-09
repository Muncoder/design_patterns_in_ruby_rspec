require 'spec_helper'
require_relative '../lib/factory'

describe "Factory pattern" do

  it "is a part of warriors" do
    party = Party.new(3)
    expect(party.members.count { |member| member.class == Warrior }).to eq(3)
  end

end
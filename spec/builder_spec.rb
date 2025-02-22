require 'spec_helper'
require_relative '../lib/builder'

describe "Builder Pattern" do

  it "validates creation of the board" do
    builder = BoardBuilder.new(2, 5, :easy)
    builder.add_tiles(:plain, 5)

    expect { builder.board }.to raise_exception
  end


  it "uses builder to create board" do
    builder = BoardBuilder.new(2, 5, :easy)
    builder.add_tiles(:plain, 5)
    builder.add_tiles(:trap, 5)
    builder.add_monsters(:orc, 3)
    builder.add_monsters(:goblin, 5)

    board = builder.board

    expect(board.width).to eq(2)
    expect(board.height).to eq(5)
    expect(board.difficulty).to eq(:easy)
    expect(board.tiles.size).to eq(10)
    expect(board.monsters.size).to eq(8)
  end

end

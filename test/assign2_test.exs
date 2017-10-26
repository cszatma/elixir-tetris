defmodule Assign2Test do
  use ExUnit.Case
  doctest Assign2

  test "Board Values" do
    commands = Assign2.readFrom("board 4 4
dice 1 2 3
moves lLrR
powerup 2 2")
    assert [Board.getNumRows(commands[:board]), Board.getNumCols(commands[:board])] == [4,4]
  end


  test "Dice Values" do
   commands = Assign2.readFrom("board 4 4
dice 1 2 3
moves lLrR
powerup 2 2")
  assert commands[:dice] == [1,2,3]

  end


  test "Move Values" do
    commands = Assign2.readFrom("board 4 4
dice 1 2 3
moves lLrR
powerup 2 2")
    assert commands[:moves] == ["l", "L", "r", "R"]
  end


  test "Powerup Values" do
    commands = Assign2.readFrom("board 4 4
dice 1 2 3
moves l
powerup 2 2")
    assert commands[:powerup] == [2, 2]
  end

  test "Powerup location" do
    commands = Assign2.readFrom("board 4 4
dice 1 2 3
moves l
powerup 2 2")
    board = commands[:board]
    assert board[2][2] == "x"
  end

  test "Full Game Test" do
    commands = Assign2.readFrom("board 4 4
dice 1 1
moves ll
powerup 1 2")
    board = Convert.boardToString(commands[:board], commands[:score])
    
    result = "|yy  | 1 Pieces
|yy  |
|x   |
|    |
+----+"
    
    assert board == result
  end 
end

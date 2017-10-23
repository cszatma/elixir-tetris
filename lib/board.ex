defmodule Board do
  
  def set([ _ | tail ]) do
    axis = Convert.stringListToInt(tail, [])
    numCols = Enum.at(axis, 0)
    numRows = Enum.at(axis, 1)
    createBoard(numCols, numRows, %{})
  end


  def createBoard(numCols, numRows, board) do
    createRows(numCols, numRows, board)    
  end

  def createRows(numCols, numRows, board) when numRows > 0 do
    row = createCols(%{}, numCols)
    board = Map.put_new(board, numRows, row)
    createRows(numCols, numRows - 1, board) 
  end

  def createRows(_, 0, board) do
    board
  end

  def createCols(map, numCols) when numCols > 0 do
    map = Map.put_new(map, numCols, " ")
    createCols(map, numCols - 1)
  end

  def createCols(map, 0) do
    map
  end

  def getNumCols(board) do
   board
    |> Map.to_list 
    |> List.last
    |> Tuple.to_list
    |> Enum.at(1)
    |> Map.to_list
    |> List.last
    |> Tuple.to_list
    |> Enum.at(0)
  end

  def getNumRows(board) do
   board
    |> Map.to_list 
    |> List.last
    |> Tuple.to_list
    |> Enum.at(0)
  end

  # Returns the values to the given positions
  # Positions in a 2D list where each sublist represents a point with a x and y coordinate
  def valuesAtPositions(board, positions) do
    Enum.map(positions, fn([x, y]) ->
      board[x][y]
    end)
  end

  # Check if a value other than a space is present at any of the given positions on a board
  def blockAtPositions?(board, positions) do
    valuesAtPositions(board, positions)
    |> Enum.any?(&(&1 != " "))
  end
end  

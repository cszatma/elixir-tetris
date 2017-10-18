defmodule Convert do

  def stringListToInt([ head | tail], list) do
   newList = list ++ [ String.to_integer(head) ]
   stringListToInt(tail, newList)
  end

  def stringListToInt([], list) do
    list
  end

  def boardToString(board) do
    numRows = Board.getNumRows(board)
    numCols = Board.getNumCols(board)
    rowsToString(board, numRows, numCols, "", numRows)
  end

  
  def rowsToString(board, numRows, numCols, _, _) do
    newLine = colsToString(board, numRows, 1, numCols, "")
    result = newLine <> " This is the top row!\n"
    rowsToString(board, numRows - 1, numCols, result) 
  end


  def rowsToString(board, numRows, numCols, result) when numRows > 0 do
    newLine = colsToString(board, numRows, 1, numCols, "")
    result = result <> newLine <> "\n"
    rowsToString(board, numRows - 1, numCols, result) 
  end

  def rowsToString(_, 0, _, result) do
    result
  end


  def colsToString(board, numRows, currentCol, maxCols, line) when currentCol <= maxCols do
    line = line <> board[numRows][currentCol] 
    colsToString(board, numRows, currentCol + 1, maxCols, line)
  end

  def colsToString(_, _, _, _, line) do
    "|" <> line <> "|"
  end

end

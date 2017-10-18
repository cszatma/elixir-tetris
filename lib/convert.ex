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

  def rowsToString(board, 0, _, result) do
    totalCols = Board.getNumCols(board)
    lastLine = colsToString(totalCols, "")
    result <> lastLine
  end


  def colsToString(board, numRows, currentCol, maxCols, line) when currentCol <= maxCols do
    line = line <> board[numRows][currentCol] 
    colsToString(board, numRows, currentCol + 1, maxCols, line)
  end

  def colsToString(_, _, _, _, line) do
    "|" <> line <> "|"
  end

  def colsToString(currentCol, line) when currentCol > 0 do
    line = line <> "-"
    colsToString(currentCol - 1, line)
  end

  def colsToString(_, line) do
  "+" <> line <> "+"
  end
  
  # Converts a map to a list
  def mapMatrixToListMatrix(mapMatrix) do
    Map.values(mapMatrix)
    |> Enum.map(&Map.values(&1))
  end
  
  # Converts a list to a map
  def listMatrixToMapMatrix(listMatrix) do
    vectorsToMap(%{}, listMatrix, 1)
  end
  
  # Converts a given 1d list (vector) to a map and adds
  # it to a given map with the given index as the key
  def addVectorToMap(map, vector, index) do
    mapVector = (
      1..length(vector)
      |> Enum.zip(vector)
      |> Enum.into(%{})
    )
    Map.put(map, index, mapVector)
  end

  # Recursive function that loops through a 2d list and
  # converts each sub list to a map, then appends it to
  # the given map with the given index as the key
  defp vectorsToMap(map, list, index) when index <= length(list) do
    newMap = addVectorToMap(map, Enum.at(list, index - 1), index)
    vectorsToMap(newMap, list, index + 1)
  end

  # Base case for the recursive call
  # Returns the map once list has been fully iterated
  defp vectorsToMap(map, _, _) do
    map
  end

end

defmodule Matrix do
  
  def transpose(matrix) do
    matrix
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  def dotProduct(vectorA, vectorB) do
    Enum.zip(vectorA, vectorB)
    |> Enum.map(fn({x, y}) -> x * y end)
    |> Enum.sum
  end
  
  def multiply(matrixA, matrixB) do
    transposedA = transpose(matrixA)
    Enum.map(matrixB, fn(rowVector) ->
      Enum.map(transposedA, &dotProduct(rowVector, &1))
    end)
  end

end

defmodule Convert do

  def stringListToInt([ head | tail], list) do
   newList = list ++ [ String.to_integer(head) ]
   stringListToInt(tail, newList)
  end

  def stringListToInt([], list) do
    list
  end
  
end

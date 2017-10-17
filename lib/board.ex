defmodule Board do
  
  def set([ _ | tail ]) do
   result = Convert.stringListToInt(tail, [])
   result
  end

end  

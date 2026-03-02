defmodule Util do
  def ingresar_texto(texto)do
    IO.gets(texto)
    |> String.trim()
  end
end

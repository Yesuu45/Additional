defmodule Util do
  def ingresar_texto(mensaje) do
    IO.gets(mensaje)
    |> String.trim()
  end

  def ingresar_numero(mensaje) do
    IO.gets(mensaje)
    |> String.trim()
    |> String.to_integer()
  end


end

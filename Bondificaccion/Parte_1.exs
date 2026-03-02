defmodule Parte_1 do
  def main do
    nombre = Util.ingresar_texto("Ingrese el nombre: ")

    {{anio, mes, dia}, {hora, min, seg}} = :calendar.local_time()

    IO.puts("---------Datos-------")
    IO.puts("Fecha : #{anio}/#{mes}/#{dia}")
    IO.puts("Hora exacta : #{hora}:#{min}:#{seg}")

    # Llamamos a la función y mostramos el resultado
    resultado = obtener_hora(hora, nombre)
    IO.puts(resultado)
    IO.puts("-----------------------")
  end

  # Arquitectura de una sola línea (Syntax: , do:)
  def obtener_hora(hora, nombre) when hora >= 0 and hora < 12, do: "Buenos días #{nombre}, la hora es #{hora}"
  def obtener_hora(hora, nombre) when hora >= 12 and hora <= 18, do: "Buenas tardes #{nombre}, la hora es #{hora}"
  def obtener_hora(hora, nombre) when hora > 18 and hora <= 24, do: "Buenas noches #{nombre}, la hora es #{hora}"
  def obtener_hora(_, nombre), do: "Hola #{nombre}, la hora es desconocida"

end

Parte_1.main()

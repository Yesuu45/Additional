defmodele Parte_1 do
  def main do
    nombre = Util.ingresar_texto("Im¿ngrese el nombre ")

    {{anio , mes , dia} {hora , min , seg}} = :calendar.local_time()

    IO.puts("---------Datos-------")
    IO.puts("Fecha :#{anio }/#{mes }/#{dia }")
    IO.puts("Hora exacta :#{hora }/#{min }/#{seg }")
    IO.puts("-----------------------")


  def obtener_hora(hora, nombre) when hora >= 0 and hora <= 12:do("Hola #{nombre} , la hora es #{hora}")
  def obtener_hora(hora, nombre) when hora > 12 and hora <= 18:do("Hola #{nombre} , la hora es #{hora}")
  def obtener_hora(hora, nombre) when hora > 18 and hora <= 24:do("Hola #{nombre} , la hora es #{hora}")
  def obtener_hora(_, nombre):do("Hola #{nombre} , la hora es desconocida")

  end

end

Parte_1.main()

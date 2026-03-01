defmodule Parquedero do

  def main do
    menu([])
  end

  def menu(lista) do
    IO.puts("\n1. Ingresar un nuevo vehiculo")
    IO.puts("2. Mostrar los vehiculos ingresados")
    IO.puts("3. Calcular pago de un vehiculo")
    IO.puts("4. Salir")

    opcion = Util.ingresar("Ingrese una opcion: ", :texto)

    case opcion do
      "1" ->
        lista_actualizada = ingresar_vehiculo(lista)
        menu(lista_actualizada)

      "2" ->
        IO.inspect(lista)
        menu(lista)

      "3" ->
        calcular_pago(lista)
        menu(lista)

      "4" ->
        IO.puts("Saliendo del programa...")

      _ ->
        IO.puts("Opción inválida")
        menu(lista)
    end
  end

  # ----------------------------------
  # INGRESAR VEHICULO
  # ----------------------------------

  def ingresar_vehiculo(lista) do
    nombre = Util.ingresar("Ingrese el nombre del propietario: ", :texto)
    placa = Util.ingresar("Ingrese la placa del vehiculo: ", :texto)

    IO.puts("Tipo de vehiculo:")
    IO.puts("1. Electrico (20% descuento)")
    IO.puts("2. Convencional")

    opcion_tipo = Util.ingresar("Seleccione opcion: ", :texto)

    tipo =
      case opcion_tipo do
        "1" -> {:electrico, 20}
        "2" -> {:convencional, 0}
        _ -> {"error", mensaje: "Opción inválida, se asignará tipo convencional"}
      end

    opcion_cliente = Util.ingresar("¿Es cliente frecuente? (si/no): ", :texto)

    cliente =
      case String.downcase(opcion_cliente) do
        "si" -> {:frecuente, 10}
        "no" -> {:normal, 0}
        _ -> {:normal, 0}
      end

    {{anio, mes, dia}, {hora, min, seg}} = :calendar.local_time()
    fecha_ingreso = {{anio, mes, dia}, {hora, min, seg}}

    nuevo_vehiculo = %{
      nombre: nombre,
      placa: placa,
      tipo: tipo,
      cliente: cliente,
      fecha_ingreso: fecha_ingreso
    }

    IO.puts("Vehiculo registrado correctamente ✅")

    [nuevo_vehiculo | lista]
  end

  # ----------------------------------
  # TARIFA POR HORAS
  # ----------------------------------

  def tarifa(horas) do
    cond do
      horas <= 2 ->
        3000

      horas > 2 ->
        3000 + (horas - 2) * 2500
    end
  end

  # ----------------------------------
  # CALCULAR PAGO
  # ----------------------------------

  def calcular_pago(lista) do
    placa_buscar = Util.ingresar("Ingrese la placa del vehiculo: ", :texto)

    vehiculo = Enum.find(lista, fn v -> v.placa == placa_buscar end)

    if vehiculo == nil do
      IO.puts("Vehiculo no encontrado ❌")
    else
      horas = Util.ingresar("Ingrese horas que estuvo parqueado: ", :texto)
              |> String.to_integer()

      total = tarifa(horas)

      # Sacar descuentos
      {_, desc_tipo} = vehiculo.tipo
      {_, desc_cliente} = vehiculo.cliente

      descuento_total = desc_tipo + desc_cliente

      descuento_valor = total * descuento_total / 100
      total_final = total - descuento_valor

      IO.puts("\n----- FACTURA -----")
      IO.puts("Total sin descuento: #{total}")
      IO.puts("Descuento aplicado: #{descuento_total}%")
      IO.puts("Total a pagar: #{round(total_final)}")
      IO.puts("-------------------")
    end
  end

end

Parquedero.main()

defmodule Parte3 do
  def main do
    usuario = Util.ingresar_texto("Ingrese el nombre de usuario a validar: ") |> String.trim()

    case validar_usuario(usuario) do
      {:ok, mensaje} ->
        IO.puts("✅ #{mensaje}")

      {:error, errores} ->
        IO.puts("❌ Errores encontrados:")
        # Imprimimos cada error en una línea nueva
        Enum.each(errores, fn err -> IO.puts("- #{err}") end)
    end
  end

  def validar_usuario(usuario) do
    # Iniciamos con una lista vacía de errores y pasamos el usuario por cada filtro
    []
    |> validar_longitud(usuario)
    |> validar_minusculas(usuario)
    |> validar_sin_espacios(usuario)
    |> validar_caracteres_especiales(usuario)
    |> validar_al_menos_una_letra(usuario)
    |> responder()
  end

  # --- Funciones de validación ---

  defp validar_longitud(errores, u) do
    caja = String.length(u)
    if caja >= 5 and caja <= 12 do
      errores
    else
      errores ++ ["El nombre debe tener entre 5 y 12 caracteres"]
    end
  end

  defp validar_minusculas(errores, u) do
    if u == String.downcase(u) do
      errores
    else
      errores ++ ["El nombre debe estar completamente en minúsculas"]
    end
  end

  defp validar_sin_espacios(errores, u) do
    if String.contains?(u, " ") do
      errores ++ ["El nombre no debe contener espacios"]
    else
      errores
    end
  end

  defp validar_caracteres_especiales(errores, u) do
    # Usamos String.replace para quitar lo que NO es especial y ver si queda algo
    especiales = ["@", "#", "$", "%"]
    tiene_especial = Enum.any?(especiales, fn char -> String.contains?(u, char) end)

    if tiene_especial do
      errores ++ ["No debe contener caracteres especiales (@, #, $, %)"]
    else
      errores
    end
  end

  defp validar_al_menos_una_letra(errores, u) do
    # Quitamos números y vemos si queda texto
    solo_letras = String.replace(u, ~r/[0-9]/, "")

    if String.length(solo_letras) > 0 do
      errores
    else
      errores ++ ["Debe contener al menos una letra"]
    end
  end

  # --- Función de respuesta final ---

  defp responder([]) do
    {:ok, "Usuario válido"}
  end

  defp responder(errores) do
    {:error, errores}
  end
end

# Para ejecutarlo directamente
Parte3.main()

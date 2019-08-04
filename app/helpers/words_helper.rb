module WordsHelper
  def change_word(accion, clase)
    puts "#{clase}"
    masculino = %w[Libro]
    femenino = %w[Tienda]
    word = ''
    if masculino.include?(clase.to_s)
      if accion == 'create'
        word = 'creado'
      elsif accion == 'update'
        word = 'actualizado'
      elsif accion == 'destroy'
        word = 'eliminado'
      end
    end
    if femenino.include?(clase.to_s)
      if accion == 'create'
        word = 'creada'
      elsif accion == 'update'
        word = 'actualizada'
      elsif accion == 'destroy'
        word = 'eliminada'
      end
    end
    word
  end
end
## Roulette
## Ejercicio 3: Ruleta.
#
# Se tiene un array que contiene los números de una ruleta.
#
# ~~~
#
# ~~~
#
# Se pide:
#
# - Crear una clase llamada *Roulette*.
#
# - Crear un método de instancia llamado *play* que reciba como argumento un número al cual se está apostando. Luego debe tomar un valor -del array- al azar y compararlo con el número al cual se apostó.
#
# - Crear un método de instancia que:
#
#     - Debe almacenar el número generado al azar en un archivo llamado *roulette_history.txt*
#
#     - Si el número al cual se apostó **corresponde** al generado al azar entonces, debe además almacenar ese número en un archivo llamado *winners.txt*
#
# - Crear un método que lea el archivo *rouletter_history.txt* y retorne el valor que más ha generado la ruleta históricamente.

class Roulette
  @winner = false
  @winner_number = 0
  def play(number)
    r = (1..10).to_a
    @winner_number = rand(r[0]..r[9])
    if number == @winner_number
      @winner = true
      puts "You win !!  =>  You: #{number}, Roulette: #{@winner_number}"
    else
      puts "You lose :( => You: #{number}, Roulette: #{@winner_number}"
    end
  end

  def roulette_history
    file = File.open('./E9CP2A1/roulette_history.txt', 'a')
    file.puts @winner_number
    file.close
    if @winner == true
      file = File.open('./E9CP2A1/winners.txt', 'a')
      file.puts @winner_number
      file.close
    end
  end
end


game = Roulette.new
game.play(8)
game.roulette_history


def history_mode
  file = File.open('./E9CP2A1/roulette_history.txt', 'r')
  data = file.readlines.map(&:to_i)
  file.close
  print data
  puts ''
  print data.uniq!
end

history_mode

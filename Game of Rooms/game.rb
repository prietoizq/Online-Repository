class Game

    attr_accessor :character, :rooms, :actual_room

    def initialize character
        @character = character
        @rooms = []
        @actual_room
    end

    def add_room room
        @rooms << room
    end

    def show_room id
           @actual_room = @rooms.find{|x| id === x.id }
           puts @actual_room.message
    end

    def start
        end_game = false
        while end_game === false
            play
            if @character.position === 7
                end_game = true
            end
        end
    end


    def play

        playing = true
        show_room @character.position

        while playing
            puts '>'
            direction = gets.chomp.upcase
            target = execute_direction direction
            if target === nil
                puts "Eso no es una dirección válida. Prueba a poner W/E/N/S"
            else
                @character.position = target
                playing = false
            end
        end
    end

    def execute_direction direction

        @actual_room.paths[direction.to_sym]

    end
end


class Room

    attr_accessor :id, :paths, :message

    def initialize id, paths, message
        @id = id
        @paths = paths
        @message = message
    end
end


class Character

    attr_accessor :position

    def initialize position
        @position = position # el numero de habitacion donde se encuentra
    end
end


room = []

room[0] = Room.new 1, {:O => 2, :N => 3}, "Estás en una casa. Hay una puerta hacia la calle al Norte y otra puerta que va hacia un sótano al Oeste."
room[1] = Room.new 2, {:E => 1}, "Bajas a un sótano oscuro. Puedes volver a la planta principal de la casa por el Este."
room[2] = Room.new 3, {:S => 1, :N => 4, :E => 5}, "Estás en el patio de la casa. Hay una puerta que entra en la casa al Sur, un camino que va hacia el bosque al Este, y otro camino que va al Norte."
room[3] = Room.new 4, {:S => 3, :O => 9, :E => 8}, "Llegas a un lago. Hay un camino hacia el Sur para volver a la casa, otro camino hacia el Oeste y otro hacia el Este."
room[4] = Room.new 5, {:E => 6, :O => 3, :N => 8}, "Estás en un bosque. Hay un camino que vuelve a la casa al Oeste, un camino hacia el Norte, y otro camino hacia el Este."
room[5] = Room.new 6, {:O => 5, :S => 7}, "Vas por un bosque muy oscuro. Hay un camino al Oeste y otro hacia el Sur."
room[6] = Room.new 7, {:N => 5}, "Esta parte del bosque está muy muy oscura. No crees que puedas seguir andando sin perderte. Solo podrás regresar por el Norte a la Casa."
room[7] = Room.new 8, {:O => 4, :S => 5}, "Estás en una montaña desde donde puedes verlo todo. Al suroeste puedes observar la casa. Por el Oeste hay un camino para ir al lago, y por el Sur otro que lleva hacia el bosque."
room[8] = Room.new 9, {:E => 4}, "Has llegado a una cueva. Cuando te canses de verla puedes volver por el Este."


player = Character.new 1

game = Game.new player

room.each {|x| game.add_room x}

=begin
game.show_room 4

puts game.actual_room

puts game.actual_room.paths[:W]

=end

game.start
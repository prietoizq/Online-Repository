class Game

    attr_accessor :character, :rooms, :actual_room

    def initialize character
        @character = character
        @rooms = []
        @objects = []
        @actual_room
    end

    def add_room room
        @rooms << room
    end

    def add_objects object
        @objects << object 
    end

    def show_room id
           @actual_room = @rooms.find{|x| id === x.id }
           puts @actual_room.message
    end

    def start
        puts "\n \n ************** BIENVENIDO A GAME OF ROOMS *************** \n ********** Pulsa cualquier tecla para empezar ***********"
        puts " ***** Escribe INVENTORY para acceder al inventario ****** \n *** Pulsa SAVE o LOAD para cargar o guardar la partida **"
        wait = gets.chomp
        end_game = false
        while end_game === false
            play
            if @character.position === 7
                puts "*******Felicidades! has acabado el juego*********"
                end_game = true
            end
        end
    end

    def play

        playing = true

        while playing

            puts " "
            show_room @character.position
            show_objects
            show_exits
            puts '>'

            direction = gets.chomp.upcase
            target = execute_direction direction
            if direction === "COGER"
                pick_up_objects
            elsif direction === "INVENTORY"
                show_inventory
            elsif direction.include?("SOLTAR")
                drop_objects direction
            elsif direction === "SAVE"
                save_game
            elsif direction === "LOAD"
                load_game
            elsif target === nil
                puts "\n Eso no es una dirección válida. Prueba a poner N(NORTE) S(SUR) E(ESTE) O(OESTE)"
            else
                @character.position = target
                playing = false
            end
        end
    end

    def execute_direction direction
        @actual_room.paths[direction.to_sym]

    end

    def show_exits
        @actual_room.paths.each_key do |exit|
            puts "Salida: " + exit.to_s
        end     
    end

    def show_objects
        @objects.each do |object|
            if object.position === @character.position
                puts "Puedes ver un #{object.name.to_s} tirado en el suelo. Si quieres puedes COGER-lo"
            end
        end
    end

    def pick_up_objects
        @objects.each do |object|
            if object.position === @character.position
                @character.inventory.push(object.name)
                puts "Recoges el #{object.name.to_s} del suelo"
                object.position = -1
            end
        end
    end 

    def drop_objects string
        object = string.split("SOLTAR ")[1].downcase.to_sym

            if @character.inventory.include?(object)
                object_to_drop = @objects.find{|x| object === x.name }
                object_to_drop.position = @character.position
                puts "Sueltas el #{object_to_drop.name}"
                @character.inventory.delete(object_to_drop.name)
            end
    end

    def show_inventory
        if @character.inventory != []
            puts "\n Tus posesiones son: #{@character.inventory}."
            puts "*Escribe SOLTAR OBJETO para soltar un objeto. Escribe USAR OBJETO para usarlo*"
        else
            puts "No tienes nada."
        end
    end

    def save_game
        array_objects_position = []
        @objects.each do |x|
            array_objects_position << x.position
        end

        IO.write('save_character_position.txt', @character.position)
        IO.write('save_object_position.txt', array_objects_position)
        IO.write('save_inventory.txt', @character.inventory)      
        puts "PARTIDA GUARDADA"
    end

    def load_game
        @character.position = IO.read('save_character_position.txt').to_i
        @character.inventory = IO.read('save_inventory.txt')
        array_objects_position = IO.read('save_object_position.txt')
        n = 0
        @objects.each do |object|
            object.position = array_objects_position[n]
            n += 1
        end
        @actual_room = @rooms.find{|x| @character.position === x.id }
        puts "PARTIDA CARGADA"
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

    attr_accessor :position, :inventory

    def initialize position
        @position = position # el numero de habitacion donde se encuentra
        @inventory = []
    end
end


class Object

    attr_accessor :name, :position

    def initialize name, position
        @name = name
        @position = position
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

objects = []
objects[0] = Object.new :mapa, 1
objects[1] = Object.new :pico, 8
objects[2] = Object.new :farol, 3
objects[3] = Object.new :llavero, 9
objects[4] = Object.new :palo, 5
objects[5] = Object.new :cuchillo, 2


mapa = Object.new :map, 1


player = Character.new 1

game = Game.new player

room.each {|x| game.add_room x}
objects.each {|x| game.add_objects x}

game.start

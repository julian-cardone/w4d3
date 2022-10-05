class Pawn < Piece

        FORWARD_STEPS = [
            [1,0],
            [2,0]
        ].freeze

        SIDE_ATTACKS = [
            [1, -1], 
            [1, 1]
        ].freeze

    def moves

    end

    private
    def at_start_row?
        row = self.pos[0]
        color = self.color
        if color == :white
            row == 6 ? return true : return false
        else
            row == 1 ? return true : return false 
        end
    end

    def forward_dir
        self.color == :white ? -1 : 1
    end

    def forward_steps

        dir = self.forward_dir

        steps = FORWARD_STEPS.map {|step| dir * step}

        if self.at_start_row?
            return steps
        else
            return [steps[0]]
        end

    end

    def side_attacks
       
        dir = self.forward_dir

        attacks = SIDE_ATTACKS.map {|step| dir * step}

        attacks.each do |attack|
            new_pos = [pos[0] + attack[0], pos[1] + attack[1]]
            if !self[new_pos].empty? && self[new_pos].color != color 
                result << new_pos
            end
        end
        return result
    end
end
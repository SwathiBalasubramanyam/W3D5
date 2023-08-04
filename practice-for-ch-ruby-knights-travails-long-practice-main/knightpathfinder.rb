class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new([0,0])
        self.build_move_tree
        @considered_positions = [pos]
    end

    def find_path(pos)

    end

    #builds tree of moves, move paths
    def build_move_tree

    end

    #checks to see if it's on the board/valid
    def self.valid_moves(pos)

    end

    #only returns new positions
    def new_move_positions(pos)
        new_move_pos = KnightPathFinder.valid_moves(pos).select {|new_pos| !considered_positions.include?(new_pos)}
        @considered_positions += new_move_pos 
        return new_move_pos
    end
end
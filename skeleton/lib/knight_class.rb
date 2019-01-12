require_relative '00_tree_node.rb'
class KnightPathFinder
    def initialize(starting_pos_node)
        @starting_pos = starting_pos_node
        @move_tree = [starting_pos]
    end
    
    def build_move_tree(root)
end
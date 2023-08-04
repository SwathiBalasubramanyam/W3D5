require "set"

class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    attr_reader :parent, :children, :value

    attr_writer :children

    def parent=(node_instance)
        if node_instance 
            @parent = node_instance
            node_instance.children << self if node_instance.children.each {|child| child.value != self.value}
        end
    end
end
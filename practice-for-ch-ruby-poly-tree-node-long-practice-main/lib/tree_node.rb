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
        current_parent = @parent
        @parent = node_instance
        node_instance.children << self if node_instance && !node_instance.children.include?(self)
        current_parent.children.delete(self) if current_parent && current_parent != node_instance
    end
end
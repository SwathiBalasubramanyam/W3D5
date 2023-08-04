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

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if !@children.include?(child_node)
            raise "given node is not a child of the parent"
        end
        child_node.parent = nil
    end
end
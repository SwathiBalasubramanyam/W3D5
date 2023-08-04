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

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each{|child_node| 
            res = child_node.dfs(target_value)
            return res if res
        }
        return nil
    end

    def inspect
        # puts "#<PloyTreeNode: #{self.object_id}, @value=#{self.value}, @children=#{self.children.each{|child| child.value}}"
    end

    def bfs(target_value)
        return self if self.value == target_value
        return nil if self.children.empty?

        queue = self.children.dup
        target_node = nil
        while !target_node && !queue.empty?
            child_node = queue.shift
            if child_node.value == target_value
                target_node = child_node
            elsif !child_node.children.empty?
                queue += child_node.children
            end
        end
        return target_node
    end

end
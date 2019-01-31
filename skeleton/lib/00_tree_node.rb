class PolyTreeNode
    # def initialize(value)
    #     @value = value
    #     @parent = nil
    #     @children = []
    # end 
    # def parent 
    #     @parent
    # end
    # def children 
    #     children
    # end 
    # def value 
    #     value
    # end 

    # def parent=(parent_node)
    #     parent.children.delete(self) unless parent.nil?
    #     @parent = parent_node

    #     unless self.parent.nil?
    #         parent_node.children << self unless parent_node.children.include?(self)
    #     end 

    # end
    
    # def add_child(child_node)
    #     child_node.parent=(self)
    # end

    # def remove_child(child_node)
    #     raise "error" unless children.include?(child_node)
    #     child_node.parent=(nil)
    # end 

    # def dfs(target_value)
    #     return self if self.value == target_value 
    #     self.children.each do |child|
    #         result = child.dfs(target_value)
    #         return result unless result.nil?
    #     end 
    #     nil
    # end

    # def bfs(target_value)
    #     q = Array.new
    #     q << self 
    #     until q.empty?
    #         curr_node = q.shift
    #         return curr_node if curr_node.value == target_value
    #         curr_node.children.each { |child| q << child }
    #     end
    #     nil
    # end 
   
    # attr_reader :value, :parent, :children
    # attr_accessor :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end
    def parent
        @parent
    end 
    def children 
        @children
    end
    
    def value 
        @value
    end 
    def parent=(parent_node)
        parent.children.delete(self) unless parent.nil?
        @parent = parent_node
        parent.children << self unless parent.nil? || parent.children.include?(self)

    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        raise "error" unless self.children.include?(child_node)
        child_node.parent=(nil)
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil 
    end

    def bfs(target_value)
        q = []
        q << self
        until q.empty?
            el = q.shift
            return el if el.value == target_value 
            el.children.each {|child| q << child}
        end
        return nil
    end


        
end
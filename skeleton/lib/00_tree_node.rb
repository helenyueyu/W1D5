require 'byebug'
class Ptn

  def initialize(value) # initializing a node
    @parent = nil
    @children = []
    @value = value 
  end

  def parent 
    @parent
  end
  
  def parent=(node)
    if !self.parent.nil? 
      self.parent.children.delete_if{|x| x==self}
    end

    @parent = node 
    
    if !node.nil? && !node.children.include?(self)
      node.children.push(self) 
    end 
  end

  def children 
    @children
  end

  def value
    @value 
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    if !child_node.nil? 
      child_node.parent=nil 
    end
    if !self.children.include?(child_node)
      raise "Not a child."
    end
  end

  def dfs(target_value)
    # return nil if self.value != target_value && self.children.empty?

    return self if self.value == target_value
    
    self.children.each do |child|
      child.dfs(target_value)
    end
    nil
  end



end
class Item < ApplicationRecord

  belongs_to :parent,   class_name: 'Item', optional: true
  has_many   :children, class_name: 'Item', foreign_key: 'parent_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validate  :parent_is_not_self, :parent_is_not_own_child

  def parent_is_not_self
    if parent_id && parent_id == id
      errors.add(:parent_id, :parent_is_self)
    end
  end

  def parent_is_not_own_child
    if all_children.collect(&:id).include?(parent_id)
      errors.add(:parent_id, :parent_is_own_child)
    end
  end

  def has_children?
    children.exists?
  end

  def all_children(children_array = [])
    children_array += self.children
    self.children.each do |child|
      children_array = child.all_children(children_array)
    end
    children_array
  end

  def possible_parents
    if new_record?
      Item.all
    elsif has_children?
      Item.all.where("id != ? AND id NOT IN (?)", id, all_children.collect(&:id))
    else
      Item.all.where("id != ?", id)
    end
  end
end
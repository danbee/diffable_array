require "diffable_array/version"

class DiffableArray < Array
  def diff_merge(array)
    me = self.dup
    other = array.dup
    new_array = DiffableArray.new

    until me.length == 0 && other.length == 0
      new_array |= me + other if me.empty? || other.empty?
      break if other.empty? || me.empty?

      element = if other[1..-1].include?(me.first) && !me[1..-1].include?(other.first)
                  other.slice!(0)
                else
                  me.slice!(0)
                end

      new_array << element
    end

    new_array.uniq
  end
end

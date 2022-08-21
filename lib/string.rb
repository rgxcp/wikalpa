class String
  def integer?
    Integer(self) != nil
  rescue
    false
  end
end

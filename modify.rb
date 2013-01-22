class A
  def to_modify
    puts "print from not modified method"
  end
end

A.new.to_modify #=> "print from not modified method"

def redefine_method(klass, &block)
  if klass.new.respond_to?(:to_modify)
    klass.send(:define_method, :to_modify, &block)
  end  
end

redefine_method(A) do
  puts "print from modified method, yeah!!!"
end

A.new.to_modify #=> "print from modified method, yeah!!!"

#Special thanks to Mikhail Bortnyk

class AttrAccessorObject
  def self.my_attr_accessor(*names)


    names.each do |name|
    # Set reader method #name
      define_method(name) do
        instance_variable_get("@#{name}")
      end

    # Set writer method #name= != #@name=
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end

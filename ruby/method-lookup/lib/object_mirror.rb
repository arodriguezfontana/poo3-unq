class ObjectMirror
  def self.pointing_at(an_object)
    new(an_object)
  end

  def initialize(an_object)
    @target = an_object
  end

  def lookup_selector(selector)
    current_search_place = @target.class

    while current_search_place
      begin
        unbound_method = current_search_place.instance_method(selector)

        return unbound_method.bind(@target)
      rescue NameError
        current_search_place = current_search_place.superclass
      end
    end

    raise NameError, "undefined method `#{selector}' for #{@target.inspect}"
  end
end
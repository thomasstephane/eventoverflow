module FormHelper

  def invalid_form(params, context)
    errors = []
    ignored = [ "extern_id", 
                "phone", 
                "guid", 
                "link", 
                "creator", 
                "string", 
                "lat", 
                "long",
                "venue_name",
                "country",
                "recurrence",
                "image_url"]
    params.each do |key, value|
      if (value.nil? || value == "" || value == "\n") && !ignored.include?(key)
        errors << "Your #{context} should have a #{key}"
      end
    end
    errors
  end

  def time_now
    Time.now
  end
end
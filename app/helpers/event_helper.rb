module EventHelper

  def invalid_event(params)
    errors = []
    params.each do |key, value|
      # p key
      # p value
      if value.nil? || value == ""
        errors << "Your event should have a #{key}"
      end
      # p errors
    end
    errors
  end
end
module FormHelper

  def invalid_form(params)
    errors = []
    params.each do |key, value|
      if value.nil? || value == ""
        errors << "Your event should have a #{key}"
      end
    end
    errors
  end
end
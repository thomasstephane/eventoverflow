module FormHelper

  def invalid_form(params, context)
    errors = []
    params.each do |key, value|
      if value.nil? || value == "" || value == "\n"
        errors << "Your #{context} should have a #{key}"
      end
    end
    errors
  end
end
module FormHelper

  def invalid_form(params)
    errors = []
    p "*********"
    p params    
    params.each do |key, value|
      if value.nil? || value == "" || value == "\n"
        errors << "Your event should have a #{key}"
      end
    end
    errors
  end

  def invalid_form_comment(params)
    errors = []
    params.each do |key, value|
      if value.nil? || value == "" || value == "\n"
        errors << "Your comment should have a #{key}"
      end
    end
    errors
  end
end
class ApplicationController < ActionController::Base

  def blank_square_form

    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    #params = {"girrafe" => "42"}
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_sqrt_form

    render({ :template => "calculation_templates/sqroot_form.html.erb"})
  end

  def calculate_sqrt
    @num = params.fetch("user_number").to_f
    @sqroot_of_num = @num ** (0.5)
    render({ :template => "calculation_templates/sqroot_results.html.erb"})
  end

  def blank_payment_form
      render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_monthly_payment
    @apr = params.fetch("user_apr").to_f
    @yrs = params.fetch("user_years").to_i
    @prin = params.fetch("user_pv").to_f
    rate = @apr / 100 / 12
    numerator = rate * @prin
    denominator = 1 - ((1 + rate)) ** - (@yrs * 12)
    @mon_payment = numerator / denominator
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @rand_num = rand(@min..@max)
    render ({ :template => "calculation_templates/random_result.html.erb"})
  end
end

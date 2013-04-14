
module RegisterDialog
	def free_plan_link()  @data_xpath[:register_page][:free_plan]  end
	def paid_plan_link()  @data_xpath[:register_page][:paid_plan]  end
	def contact_us_link() @data_xpath[:register_page][:contact_us] end

	def warning_message() @data_xpath[:register_page][:warning_message] end
	def do_not_match_waring 
		@driver.find_element(:xpath => @data_xpath[:register_page][:do_not_match_warning]).text
	end

	def adobe_id_btn()	@data_xpath[:register_page][:adobe_id_btn]	end
	def github_btn() @data_xpath[:register_page][:github_btn] end

	def sign_in_btn() 
		@driver.find_element(:xpath => @data_xpath[:register_page][:sign_in_btn])
	end

	def read_accept_terms_checkbox() @data_xpath[:register_page][:accept_the_term]  end
	def accept_btn()	@data_xpath[:register_page][:accept_btn]	end

	def click_create_an_adobe_id_btn
		@driver.find_element(:xpath => @data_xpath[:register_page][:create_adobe_id_btn]).click
	end

	def enter_email(email)
		@field = @driver.find_element(:xpath => @data_xpath[:register_page][:email_address])
		clear_and_type(@field, email)
	end

	def enter_password(password)
		@field = @driver.find_element(:xpath => @data_xpath[:register_page][:password])
		clear_and_type(@field, password)
	end

	def enter_retype_password(password)
		@field = @driver.find_element(:xpath => @data_xpath[:register_page][:retype_password])
		clear_and_type(@field, password)
	end

	def enter_first_name(first_name)
		@field = @driver.find_element(:xpath => @data_xpath[:register_page][:first_name])
		clear_and_type(@field, first_name)
	end

	def enter_last_name(last_name)
		@field = @driver.find_element(:xpath => @data_xpath[:register_page][:last_name])
		clear_and_type(@field, last_name)
	end

	def select_country_region(region)
		@country_select = @driver.find_element(:xpath => @data_xpath[:register_page][:country_region])
		countries = @country_select.find_elements(:tag_name => "option")
		countries.each do |el| 
		    if(el.text == region)
		        el.click
		        puts el.text
		        break
		    end
		end
		set_region(region)
	end

	def accept_terms()
		read_accept_terms.click
	end

	def accept_and_go_on
		accept_btn.click
	end

	def clear_and_type(field, text)
		field.clear
		field.send_keys(text)
	end

	def get_all_fields
		@fields = []
		@fields << @driver.find_element(:xpath => @data_xpath[:register_page][:email_address])
		@fields << @driver.find_element(:xpath => @data_xpath[:register_page][:password])
		@fields << @driver.find_element(:xpath => @data_xpath[:register_page][:retype_password])
		@fields << @driver.find_element(:xpath => @data_xpath[:register_page][:first_name])
		@fields << @driver.find_element(:xpath => @data_xpath[:register_page][:last_name])
	end

end
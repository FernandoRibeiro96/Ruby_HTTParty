Given('for the user to consult employee information') do
    @get_url = 'http://dummy.restapiexample.com/api/v1/employees'
  end
  
  When('he carry out the research') do
    @list_employee = HTTParty.get(@get_url)         
  end
  
  Then('a list of employees must return') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'       
  end
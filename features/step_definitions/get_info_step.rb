Given('for the user to consult employee information') do
    @get_url = 'http://dummy.restapiexample.com/api/v1/employees'
  end
  
When('he carry out the research') do
    @list_employee = HTTParty.get(@get_url)        
end
  
Then('a list of employees must return') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK' 
    
    parsed_employee = JSON.parse(@list_employee.body)
    employee_id_to_find = 3
    employee = parsed_employee['data'].find {|emp| emp['id'] == employee_id_to_find}

    if employee
        puts "Nome do funcionário: #{employee['employee_name']}"
        puts "Salário do funcionário: #{employee['employee_salary']}"
        puts "Idade do funcionário: #{employee['employee_age']}"
    else
        puts 'Funcionário não encontrado'
    end
end
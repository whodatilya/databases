INSERT INTO department(name)
values (generate_series(0, 1000000));




INSERT INTO employee(department_id, chief_id, name, salary, phone_number)
values (floor(random()*(1000-1+1))+1, floor(random()*(10-1+1))+1 , generate_series(0, 1000000), floor(random()*(1000-1+1))+1, floor(random()*(99999999999-10000000000+1))+10000000000)

package org.led.simba.user.repository;

import java.util.List;

import org.core.repository.BaseRepository;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import org.led.simba.user.Employee;

@Repository("employeeDao")
public class EmployeeRepositoryImpl extends BaseRepository<Employee> implements EmployeeRepository {

    public void saveEmployee(Employee employee) {
        create(employee);
    }

    @SuppressWarnings("unchecked")
    public List<Employee> findAllEmployees() {
        Criteria criteria = getCurrentActiveSession().createCriteria(Employee.class);
        return (List<Employee>) criteria.list();
    }

    public void deleteEmployeeBySsn(String ssn) {
        Query query = getCurrentActiveSession().createSQLQuery("delete from Employee where ssn = :ssn");
        query.setString("ssn", ssn);
        query.executeUpdate();
    }

    public Employee findBySsn(String ssn) {
        Criteria criteria = getCurrentActiveSession().createCriteria(Employee.class);
        criteria.add(Restrictions.eq("ssn", ssn));
        return (Employee) criteria.uniqueResult();
    }

    public void updateEmployee(Employee employee) {
        getCurrentActiveSession().update(employee);
    }

}

# 1st Solution
SELECT
    C.company_code,
    C.founder,
    COUNT(DISTINCT LM.lead_manager_code) AS total_lead_managers,
    COUNT(DISTINCT SM.senior_manager_code) AS total_senior_managers,
    COUNT(DISTINCT M.manager_code) AS total_managers,
    COUNT(DISTINCT E.employee_code) AS total_employees
FROM Company C
LEFT JOIN Lead_Manager LM ON C.company_code = LM.company_code
LEFT JOIN Senior_Manager SM ON LM.lead_manager_code = SM.lead_manager_code AND LM.company_code = SM.company_code
LEFT JOIN Manager M ON SM.senior_manager_code = M.senior_manager_code AND LM.lead_manager_code = M.lead_manager_code AND LM.company_code = M.company_code
LEFT JOIN Employee E ON M.manager_code = E.manager_code AND SM.senior_manager_code = E.senior_manager_code AND LM.lead_manager_code = E.lead_manager_code AND LM.company_code = E.company_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code;

#2nd Solution
SELECT e.company_code, c.founder,
    COUNT(DISTINCT e.lead_manager_code),
    COUNT(DISTINCT e.senior_manager_code),
    COUNT(DISTINCT e.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM Employee e
LEFT JOIN Company c ON e.company_code = c.company_code
GROUP BY e.company_code, c.founder
ORDER BY e.company_code;
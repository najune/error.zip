-- join x
-- 1. 직원정보를 출력 한다. 직원의 연봉 정보와 연봉의 세금 정보를 같이 출력 한다.세금은 10%
 SELECT empname, salary,(salary*0.10)AS tax FROM emp;
 
-- 2. 직원정보 중 2001 이전에 입사 하였고 월급이 4000만원 미만인 직원을 조회
 SELECT * FROM emp where date_format(hDate,'%Y') < '2001'
 and salary < '4000';
-- 3. manager가 있는 직원 중 이름에 '자' 가 들어가 있는 직원정보 조회
 SELECT * FROM emp where manager IS NOT NULL
 AND empname Like '%자%';
 ;
--  4. 월급이 2000미만은 '하' 4000미만은 '중' 4000이상은 '고' 를 출력
SELECT empname, salary,
CASE
when salary >= 4000 THEN '고'
when salary >= 2000 AND salary < 4000 THEN '중'
ELSE  '저'
end as level
FROM  emp;


-- 5. 부서 별 월급의 평균을 구하시오 단, 평균이 3000 이상인 부서만 출력
SELECT detno, AVG(salary)  from emp
GROUP BY deptno 
HAVING AVG(salary) >= 3000;
 
-- 6. 부서 별 대리와 사원 연봉의 평균을 구하시오 단, 평균이 2500 이상인 부서만 출력
select d.deptname, AVG(e.salary) from emp e
inner join title t on e.titleno = t.titleno 
inner join dept d on e.deptno = d.deptno
WHERE titlename IN ('대리','사원')
group by d.deptname
HAVING AVG(salary) >= 2500;

-- 7. 2000년 부터 2002년에 입사는 직원들의 월급의 평균을 구하시오
SELECT AVG(salary) from emp 
where year(hdate) BETWEEN 2000 AND 2002;

-- 8. 부서 별 월급의 합의 ranking을 1위부터 조회 하시오
SELECT detpno, SUM(salary) AS FROM emp
GROUP BY detpno
ORDER BY SUM(salary) desc;
 

-- 9. 서울에서 근무하는 직원들을 조회 하시오
SELECT * FROM emp
INNER JOIN dept d ON d.deptno = d.deptno
-- INNER JOIN title t ON t.titleno = t.titleno
WHERE  d.deptloc = '서울';

-- 10. 이영자가 속한 부서의 직원들을 조회 하시오
SELECT * FROM  emp
WHERE deptno = (SELECT deptno FROM emp WHERE empname = '이영자');

-- 11. 김강국의 타이틀과 같은 직원들을 조회 하시오
SELECT * FROM  emp
WHERE titleno = (SELECT titleno FROM emp WHERE empname = '김강국');


-- 1. 2000 년 이후 입사 한 사원들의 정보를 출력 사번, 이름, 타이틀, 부서, 지역
SELECT e.empno, e.empname, t.titlename, d.deptname, d.deptloc, e.hdate FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
INNER JOIN title t ON e.titleno = t.titleno
WHERE YEAR(e.hdate) > 2000;

-- 2. 부서 이름 별 월급의 평균을 구하시오 단, 평균이 3000 이상인 부서만 출력
SELECT d.deptname, AVG(salary) AS dsalary  from emp
INNER JOIN dept d ON d.deptno = d.deptno
GROUP BY deptname
HAVING dsalary >= 3000;

-- 3.  대구 지역의 직원 들의 평균 연봉을 구하시오
SELECT d.deptloc, AVG(e.salary)  from emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE d.deptloc = '대구';


-- 4. 홍영자 직원와 같은 부서 직원들의 근무 월수를 구하시오 
SELECT deptno, empname, PERIOD_DIFF(DATE_FORMAT(NOW(), "%Y%m"), DATE_FORMAT(hdate, "%Y%m")) AS wMonth FROM emp
WHERE deptno = (SELECT deptno FROM emp
WHERE empname = '홍영자'); 

-- 5. 입사 년수가 가장 많은 직원 순으로 정렬 하여 순위를 정한다.
-- 이름, 부서명, 직위, 년수
SELECT e.empname, d.deptname, t.titlename, e.hdate FROM emp e
LEFT OUTER JOIN dept d ON e.deptno = d.deptno
LEFT OUTER JOIN title t ON e.titleno = t.titleno
ORDER BY e.hdate;











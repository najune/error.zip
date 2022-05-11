-- 사원 정보를 출력하시오.
-- 사원번호, 사원이름, 부서명, 직급명
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM title;

INSERT INTO emp VALUES('1011',NULL,NULL,'이말자',NULL,3000,SYSDATE());
INSERT INTO title VALUES ('50','인턴');


SELECT e.empname, d.deptname, t.titlename FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
INNER JOIN title t ON e.titleno = t.titleno;

SELECT  d.deptname, AGV(e.salary) FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
INNER JOIN title t ON e.titleno = t.titleno
GROUP BY d.deptname;

-- OUTTOR JOIN(어느 한쪽에 데이터 존재 x, 방향 기준 들어가야 함)
SELECT * FROM emp e
LEFT OUTER JOIN title t ON e.titleno = t.titleno
UNION -- ( full outer join)
SELECT * FROM emp e
RIGHT OUTER JOIN title t ON e.titleno = t.titleno;

-- 사원 정보를 출력하시오.
-- 이름 부서명 직급명을 출력한다
-- 단 이말자도 출력한다. 

SELECT e.empname, d.deptname, t.titlename FROM emp e
LEFT OUTER JOIN dept d ON e.deptno = d.deptno
LEFT OUTER JOIN title t ON e.titleno = t.titleno;


-- CROSS JOIN -- (별로 쓸 일 없음)
SELECT * FROM emp e
CROSS JOIN title t;

-- SELF JOIN
SELECT * FROM emp;
-- 사원 이름과 매니저 이름을 출력하시오
-- 단, 모든 직원을 출력하시오.
SELECT e1.empname, e2.empname FROM emp e1
LEFT OUTER JOIN emp e2 ON e1.manager = e2.empno;

-- 직원 정보를 출력한다.
-- 이름 부서명 직급명 매니저명
-- 단 모든 직원 정보를 출력한다. 
SELECT e.empname, d.deptname, t.titlename 
FROM emp e
LEFT OUTER JOIN dept d ON e.deptno = d.deptno
LEFT OUTER JOIN title t ON e.titleno = t.titleno
LEFT OUTER JOIN emp e2 ON e.manager = e2.empno;

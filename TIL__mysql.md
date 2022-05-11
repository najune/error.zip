#  TIL__mysql 

## erdcloud 

## 테이블 조인하기

- 다른 테이블에 있는 내용을 함께 출력할 때 사용함 

> 1. INNER JOIN 
>
> - 테이블이 모두 존재해야 하는데, 그 중 매칭된 부분을 출력
>
> - ~~~
>   SELECT e.empname, d.deptname, t.titlename FROM emp e
>   INNER JOIN dept d ON e.deptno = d.deptno
>   INNER JOIN title t ON e.titleno = t.titleno;
>   ~~~
>
> OUTER JOIN  
>
> - 기존  테이블에만 존재를 하면 그 부분을 출력
>
> LEFT,RIGHT JOIN
>
> - 각, 각 기준된 테이블을 기준으로 나머지 테이블의 값을 출력함
>
> FULL JOIN
>
> - 
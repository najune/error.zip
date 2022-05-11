### mysql -u admin1 -p

1.  show database;

2.  show tables;
3.  use shopdb;

4. desc itemdb;



join해서 출력할 때 값 지정하는 방법과 오류 피하는 법

- foreign key로 지정한 값을 넣어서 해야함

  ```
  SELECT * FROM cart c
   INNER JOIN meat m ON c.id = m.mid
   INNER JOIN cust cu ON c.id2 = cu.id;
  ```

  위 처럼 id ,id2,  m.id, cu.id는 

  ```
  ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (id) REFERENCES meat(mid);
  ALTER TABLE cart ADD CONSTRAINT FOREIGN KEY (id2) REFERENCES cust(id);
  ```

  에서 가져와야한다. 

- id, id2등 비슷한 이름의 혼동으로 인해 오류가 발생할 수 있으므로 각각의 이름을 제대로 지정해주자
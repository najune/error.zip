SELECT * FROM cust;
SELECT * FROM order1;
SELECT * FROM meat;
SELECT * FROM cart;
SELECT * FROM shipping;


INSERT INTO cust VALUES('id11','김준구','pwd08','서울','2022-03-07');
INSERT INTO order1 VALUES('1111','id11','100000','준비중','준비중','2022-03-04','1111','1112','0512');
INSERT INTO meat VALUES('11','10000','A','국내산','2021-03-04');
INSERT INTO cart VALUES('1','11','10000','id11');
INSERT INTO shipping VALUES
('1111','서울시',null,'05451','김준구','01083432567','조심히 와주세요');

SELECT * FROM cart c
 INNER JOIN meat m ON c.id = m.mid
 INNER JOIN cust cu ON c.id2 = cu.id;
 
 SELECT * FROM order1 o
 INNER JOIN cust c ON c.id = c.id
 INNER JOIN shipping s ON s.shipno = s.shipno;


 

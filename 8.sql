-- cust data
SELECT * FROM cust;
INSERT INTO cust VALUES ('id01','lee','Busan','2019-03-02');
INSERT INTO cust (id,name,regdate) VALUES ('id02','kim','2020-05-02');

-- cate data
SELECT * FROM cate;
INSERT INTO cate VALUES (10, 'pants', NULL);
INSERT INTO cate VALUES (11, 'short pants', 10);

INSERT INTO cate VALUES (20, 'shirts', NULL);
INSERT INTO cate VALUES (21, 'short shirts', 20);


SELECT * FROM cate c1
INNER JOIN cate c2 ON c1.pid = c2.id;

-- product data
SELECT * FROM product;
INSERT INTO product VALUES 
(NULL, 'levis',10000,curdate(),11);
INSERT INTO product VALUES 
(NULL, 'bang',20000,curdate(),11);
INSERT INTO product VALUES 
(NULL, 'levis',10000,curdate(),21);
INSERT INTO product VALUES 
(NULL, 'bang',20000,curdate(),21);

-- 제품의 정보를 출력 한다.
-- 카테고리 명도 출력 한다.
SELECT * FROM product p
INNER JOIN cate c ON p.cid = c.id;

-- cart data
SELECT * FROM cart;
INSERT INTO cart VALUES (NULL, 'id01',1000,CURDATE());
INSERT INTO cart VALUES (NULL, 'id01',1001,CURDATE());
INSERT INTO cart VALUES (NULL, 'id01',1003,CURDATE());

-- cart 정보 출력 하시오
-- 사용자 이름, 상품 이름 가격, 카테고리 이름
SELECT * FROM cart c
INNER JOIN cust cu ON c.uid = cu.id
INNER JOIN product p ON c.pid = p.id
INNER JOIN cate ca ON ca.id = p.cid;

-- DELETE FROM cart;
-- DELETE FROM cust WHERE id = 'id001';
-- UPDATE cust SET id='id001' WHERE id='id01';

 -- Make View Table
CREATE VIEW v_cart
AS
SELECT ca.id, c.id AS uid, c.name AS uname,  p.id AS pid ,p.name AS pname ,p.price, ct.name AS ctname, ca.regdate FROM cart ca
INNER JOIN cust c on ca.uid = c.id
INNER JOIN product p on ca.pid = p.id
INNER JOIN cate ct on p.cid = ct.id;

UPDATE cart SET regdate = '2020-02-30' WHERE id = 1000;
SELECT * FROM v_cart;
UPDATE v_cart SET regdate = '2021-02-04' WHERE id = 1001;

SELECT * FROM v_cart
WHERE uid = 'id01';




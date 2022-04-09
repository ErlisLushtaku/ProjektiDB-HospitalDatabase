-- emrat e pacienteve qe nuk e kane paguar faturen
delimiter $$
CREATE PROCEDURE Faturat_null()
BEGIN 
SELECT pEmri
FROM Pacienti p
INNER JOIN Faturat f 
ON p.SSN =  f.fSSN WHERE
fPagesa IS NULL;
END $$
delimiter $$
CALL Faturat_null();

-- funksioni qe kthen llojet e vaksinave
delimiter $$
CREATE FUNCTION llojet(numri INTEGER) RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
DECLARE vaksina VARCHAR(20);
IF numri=1 THEN
SET vaksina = "BSZH";
ELSEIF numri=2 THEN
SET vaksina = "Eupenta, Polio";
ELSEIF numri=3 THEN
SET vaksina = "MMR,Polio,DTP";
ELSEIF numri=4 THEN
SET vaksina = "DT,Polio";
ELSEIF numri=5 THEN
SET vaksina = "TD-Pro Adult, Polio";
ELSE
SET vaksina = "TT";
END IF;
RETURN (vaksina);
END $$
delimiter $$

-- emrat e personave qe kane marrur vaksinen
CREATE VIEW PersonatEvaksinuar AS
SELECT v.InNrPersonal AS 'Numri personal i pacientit', p.pEmri AS 'Emri i pacientit', llojet(v.vaAktuale) AS 'Emrat e vaksinave'
FROM Vaksinimi v 
INNER JOIN Pacienti p
WHERE p.SSN = v.vaSSN;
SELECT * FROM PersonatEvaksinuar;
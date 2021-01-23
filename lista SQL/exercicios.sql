--------------------------------------------------------------------
1)
SELECT A.MATRICULA
FROM Alunos AS A
  INNER JOIN Historico AS H ON H.MATRICULA = A.MATRICULA
  INNER JOIN Disciplinas AS D ON D.COD_DISC = A.COD_DISC
WHERE A.COD_DISC = DB
  AND A.nota < 5
  AND A.ANO = 2018;
--------------------------------------------------------------------
2)
SELECT A.MATRICULA,
      A.nome,
      H.nota
FROM Alunos AS A
  INNER JOIN Historico AS H ON H.MATRICULA = A.MATRICULA
  INNER JOIN Disciplinas AS D ON D.COD_DISC = A.COD_DISC
WHERE A.COD_DISC = DB
  AND A.nota < 5
  AND A.ANO = 2016;
--------------------------------------------------------------------
3)
SELECT P.nome
FROM Professores AS P
  INNER JOIN Historico AS H ON P.COD_PROF = H.COD_PROF
WHERE H.COD_DISC = BD;
--------------------------------------------------------------------
4)
SELECT A.nome,
       A.endereço,
       A.cidade,
       D.COD_DISC,
FROM Alunos AS A
  INNER JOIN Historico AS H ON H.MATRICULA = A.MATRICULA
  INNER JOIN Disciplinas AS D ON D.COD_DISC = A.COD_DISC
WHERE A.nota < 5
  AND A.ANO = 2016;
--------------------------------------------------------------------
5)
SELECT A.MATRICULA,
       A.nome
FROM Alunos AS A
  INNER JOIN Disciplinas AS D ON D.COD_DISC = A.COD_DISC
  INNER JOIN Professores AS P ON P.COD_DISC = A.COD_DISC
WHERE P.nome = "Raimundo"
  AND A.ANO = 2018;
--------------------------------------------------------------------
6)
SELECT A.MATRICULA,
       A.nome
FROM Alunos AS A
  INNER JOIN Disciplinas AS D ON D.COD_DISC = A.COD_DISC
  INNER JOIN Professores AS P ON P.COD_DISC = A.COD_DISC
WHERE P.nome = "Raimundo"
  AND A.ANO = 2018
  OR A.ANO = 2017
  AND MATRICULA in (
    SELECT *
    FROM Alunos AS A
      INNER JOIN Disciplinas AS D ON D.COD_DISC = A.COD_DISC
      INNER JOIN Professores AS P ON P.COD_DISC = A.COD_DISC
    WHERE P.nome = "Marcio"
  );
-------------------------------------------------------------------------
1)
INSERT INTO Alunos VALUES(MATRICULA,nome,endereço,cidade);
INSERT INTO Historico VALUES (MATRICULA,BD,A,JC,2018,80,8.2),(MATRICULA,LPI,A,RC,2018,75,7.5);
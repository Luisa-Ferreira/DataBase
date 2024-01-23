
--ex 1*********************************************************

DECLARE @TrasactionName VARCHAR(20) = 'Exercicio1';

BEGIN TRY
    BEGIN TRAN @TrasactionName

    CREATE DATABASE gestao;

    USE gestao;

    CREATE SCHEMA tfc;

     COMMIT TRAN @TrasactionName;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRAN @TrasactionName;

    SELECT
  ERROR_NUMBER() AS ErrorNumber,
  ERROR_MESSAGE() AS ErrorMessage,
  ERROR_SEVERITY() AS ErrorSeverity,
  ERROR_STATE() AS ErrorState,
  ERROR_PROCEDURE() AS ErrorProcedure,
  ERROR_LINE() AS ErrorLine;
END CATCH;

--*********************************************************************************


--ex 2 fizemos com o "Import wizard" ***********************************************


-- ex 3 ****************************************************************************
--como os ids sao primary keys nao necessitam de index.

DECLARE @TrasactionName3 VARCHAR(20) = 'Exercicio3';

BEGIN TRY
    BEGIN TRANSACTION @TrasactionName3;


CREATE INDEX IDCursoAsso ON tfc.Disciplina (cursoAssociado);

CREATE INDEX IDTFCurso ON tfc.TFCCurso (idTFC);
CREATE INDEX IDCursoTFC ON tfc.TFCCurso (idCurso);

CREATE INDEX IDTFCTecnologia ON tfc.TFCTecnologia (idTFC);
CREATE INDEX IDTecnologia ON tfc.TFCTecnologia (IDTecnologia);

CREATE INDEX IDNumeroDisciplina  ON tfc.TFCDisciplina (IDNumeroDisciplina);
CREATE INDEX IDTFCDisciplina  ON tfc.TFCDisciplina (numeroTFC);

CREATE INDEX IdAlunoAvaliacao ON tfc.AvaliacaoDisciplinaAluno (idNumeroAluno);
CREATE INDEX IdDisciplinaAvaliacao ON tfc.AvaliacaoDisciplinaAluno (IDNumeroDisciplina);

CREATE INDEX IDNumeroAluno ON tfc.Aluno (numeroAluno);

CREATE INDEX IDNumGrupoInscricao ON tfc.Inscricao (idNumeroGrupo);
CREATE INDEX IDTFCInscricao ON tfc.Inscricao (idTFC);
CREATE INDEX IDGrupoInscricao ON tfc.Inscricao (numeroAluno);

CREATE INDEX IDTFCHistorico ON tfc.HistoricoTFC (idTFC);
CREATE INDEX IDTFCNumericoHistorico ON tfc.HistoricoTFC (idTFCNumerico);

CREATE INDEX IDnumeroAluno1 ON tfc.Grupo (idnumeroAluno1);
CREATE INDEX IDnumeroAluno2 ON tfc.Grupo (idnumeroAluno2);

CREATE INDEX IDCoorientadorTFC  ON tfc.TFC (coorientador);
CREATE INDEX IDGrupoTFC  ON tfc.TFC (idGrupo);
CREATE INDEX IDTFC  ON tfc.TFC (idtfc);
CREATE INDEX IDOrientadorTFC  ON tfc.TFC (orientador);
CREATE INDEX IDOrientadorPropTFC ON tfc.TFC (orientadorProposto);

CREATE INDEX IDProfProfessorNDEISI ON tfc.ProfessorNDEISI (idProfessor);

CREATE INDEX IDEmpresa ON tfc.Empresa_EntidadeExtrema (idEmpresa);

CREATE INDEX numeroProfProfessorDEISI ON tfc.ProfessorDEISI (numeroProfessor);

CREATE INDEX coordenadorUtilizador ON tfc.ProfessorNDEISI (coordenador);
CREATE INDEX IDIdentificacaoUtilizador ON tfc.ProfessorNDEISI (idIdentificacao);
   
    COMMIT TRANSACTION @TrasactionName3;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName3;
END CATCH;

--***********************************************************************************



--ex 4*******************************************************************************

-- 4.1 e 4.2``````````````````````````````````````````````````````````````````````````

DECLARE @TrasactionName4 VARCHAR(20) = 'Exercicio4';

BEGIN TRY
    BEGIN TRAN @TrasactionName4

UPDATE tfc.Curso
SET nome = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.Tecnologia
SET nome = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.Disciplina
SET nome = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.Aluno
SET curso = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(curso)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Aluno
SET email = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(email)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Aluno
SET nome = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Aluno
SET numeroAluno = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroAluno)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.Inscricao
SET idNumeroGrupo = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idNumeroGrupo)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Inscricao
SET numeroAluno = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroAluno)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Inscricao
SET anoLetivo = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(anoLetivo)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.HistoricoTFC
SET avaliacao = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(avaliacao)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.HistoricoTFC
SET dataMudancaEstado = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(dataMudancaEstado)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.HistoricoTFC
SET idTFC = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idTFC)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.HistoricoTFC
SET utilizador = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(utilizador)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.Grupo
SET idNumeroAluno1 = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idNumeroAluno1)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Grupo
SET idNumeroAluno1 = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idNumeroAluno2)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.ProfessorNDEISI
SET departamentoAfeto = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(departamentoAfeto)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.ProfessorNDEISI
SET email = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(email)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.ProfessorNDEISI
SET idProfessor = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idProfessor)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.ProfessorNDEISI
SET nome = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.Empresa_EntidadeExterna
SET email = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(email)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Empresa_EntidadeExterna
SET idEmpresa = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idEmpresa)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Empresa_EntidadeExterna
SET interlocutor = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(interlocutor)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Empresa_EntidadeExterna
SET morada = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(morada)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.Empresa_EntidadeExterna
SET nome = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.ProfessorDEISI
SET email = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(email)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.ProfessorDEISI
SET nome = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '[', ''), ']', ''), '“', ''), '”', '')
UPDATE tfc.ProfessorDEISI
SET numeroProfessor = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroProfessor)), '[', ''), ']', ''), '“', ''), '”', '')

UPDATE tfc.Utilizador
SET idIdentificacao = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(idIdentificacao, ']', ''), '[', ''), '"', '')))
UPDATE tfc.Utilizador
SET tipoUtilizador = REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(tipoUtilizador)), '[', ''), ']', ''), '“', ''), '”', '')


/*--visualizador da resoluçao do exercicio-----------------------------------------------

SELECT *
FROM TFC.Curso

SELECT *
FROM TFC.Tecnologia

SELECT *
FROM TFC.Disciplina

SELECT *
FROM TFC.Aluno

SELECT *
FROM TFC.Inscricao

SELECT *
FROM TFC.HistoricoTFC

SELECT *
FROM TFC.Grupo

SELECT *
FROM tfc.ProfessorNDEISI

SELECT *
FROM tfc.Empresa_EntidadeExterna

SELECT *
FROM tfc.ProfessorDEISI

SELECT *
FROM tfc.Utilizador
---------------------------------------------------------------------------------------*/



  COMMIT TRANSACTION @TrasactionName4;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName4;
END CATCH;


--````````````````````````````````````````````````````````````````````````````````````````````````````````````````````

-- 4.3`````````````````````````````````````````````````````````````````````````````````````````````````````````````````

DECLARE @TrasactionName43 VARCHAR(20) = 'Exercicio43';

BEGIN TRY
    BEGIN TRAN @TrasactionName43

UPDATE TFC.TFC
SET estado = 
  CASE 
    WHEN Estado IN ('A Aguardar Aprovação', 'Recusado', 'A Aguardar Atribuição','Atribuido','Publicado','Indisponivel','Anulado') THEN Estado
    ELSE '[Anulado]'
  END;

UPDATE TFC.Inscricao
SET estado = 
  CASE 
    WHEN Estado IN ('A Aguardar Atribuição','Atribuido','Nao Atribuido','Anulado') THEN Estado
    ELSE '[Anulado]'
  END;

UPDATE TFC.HistoricoTFC
SET estado = 
  CASE 
    WHEN Estado IN ('Em Validação', 'Valido', 'Excluido') THEN Estado
    ELSE '[Anulado]'
  END;

  COMMIT TRANSACTION @TrasactionName43;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName43;
END CATCH;


/*--visualizador da resoluçao do exercicio-----------------------------------------------

SELECT estado AS TFCestado
FROM TFC.TFC

SELECT TFC.HistoricoTFC.estado AS HistoricoTFCestado
FROM TFC.HistoricoTFC

SELECT estado AS Inscricao_estado
FROM tfc.Inscricao
---------------------------------------------------------------------------------------*/



--````````````````````````````````````````````````````````````````````````````````````````````````````


--ex 5**********************************************************************************************

--ex 5.1````````````````````````````````````````````````````````````````````````````````````````````

DECLARE @TrasactionName51 VARCHAR(20)= 'Exercicio51';

BEGIN TRAN @TrasactionName51

SELECT idtfc
FROM tfc.TFC
ORDER BY idtfc;

SELECT numeroAluno
FROM tfc.Aluno
ORDER BY numeroAluno;

SELECT numeroProfessor
FROM tfc.ProfessorDEISI
ORDER BY numeroProfessor;

SELECT idProfessor
FROM tfc.ProfessorNDEISI
ORDER BY idProfessor;

SELECT idNumeroAluno1, idNumeroAluno2
FROM tfc.Grupo
ORDER BY idNumeroAluno1;

COMMIT TRAN @TrasactionName51;

--``````````````````````````````````````````````````````````````````````````````````````````


--ex 5.2.1``````````````````````````````````````````````````````````````````````````````````

DECLARE @Exercicio52 VARCHAR(20) = 'Exercicio52';
BEGIN TRY
BEGIN TRANSACTION @Exercicio52; 
WITH
  RankedRows
  AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER (PARTITION BY idtfc ORDER BY idtfc) AS RowNum
    FROM
      tfc.TFC
  )


SELECT
  id,
  Titulo,
  anoLetivo,
  avaliacaoProposta,
  coorientador,
  dataEstado,
  dataProposta,
  descricao,
  entidade,
  estado,
  idGrupo,
  idtfc,
  motivoRecusa,
  numeroInscricoes,
  orientador,
  orientadorProposto,
  preponente,
  semestre,
  tecnologias
Into Temporaria
FROM
  RankedRows
WHERE 
  RowNum = 1;


TRUNCATE TABLE tfc.TFC

INSERT into tfc.TFC
SELECT *
from dbo.Temporaria

Drop Table dbo.Temporaria

/*--visualizador da resoluçao do exercicio-----------------------------------------------
SELECT idtfc
FROM tfc.TFC
ORDER BY idtfc;
----------------------------------------------------------------------------------------*/

COMMIT TRAN @Exercicio52;
END TRY

BEGIN CATCH
ROLLBACK TRAN @Exercicio52;
END CATCH


--``````````````````````````````````````````````````````````````````````````````



--5.2.2`````````````````````````````````````````````````````````````````````````

DECLARE @Exercicio522 VARCHAR(20) = 'Exercicio522';
BEGIN TRY
BEGIN TRANSACTION @Exercicio522; 
WITH
  RankedRows
  AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER (PARTITION BY numeroAluno ORDER BY numeroAluno) AS RowNum
    FROM
      tfc.Aluno
  )


SELECT
  id,
  curso,
  email,
  nome,
  numeroAluno,
  numeroContato
Into Temporaria
FROM
  RankedRows
WHERE 
  RowNum = 1;
  

TRUNCATE TABLE tfc.Aluno

INSERT into tfc.Aluno
SELECT *
from dbo.Temporaria

Drop Table dbo.Temporaria

/*--visualizador da resoluçao do exercicio-----------------------------------------------
SELECT numeroAluno
FROM tfc.Aluno
ORDER BY numeroAluno;
----------------------------------------------------------------------------------------*/

COMMIT TRAN @Exercicio522;
END TRY

BEGIN CATCH
ROLLBACK TRAN @Exercicio522;
END CATCH

--````````````````````````````````````````````````````````````````````````````````````````



--5.2.3````````````````````````````````````````````````````````````````````````````````````

DECLARE @Exercicio523 VARCHAR(20) = 'Exercicio523';
BEGIN TRY
BEGIN TRANSACTION @Exercicio523; 
WITH
  RankedRows
  AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER (PARTITION BY numeroProfessor ORDER BY numeroProfessor) AS RowNum
    FROM
      tfc.ProfessorDEISI
  )


SELECT
  id,
  email,
  nome,
  numeroContato,
  numeroProfessor
Into Temporaria
FROM
  RankedRows
WHERE 
  RowNum = 1;


TRUNCATE TABLE tfc.ProfessorDEISI

INSERT into tfc.ProfessorDEISI
SELECT *
from dbo.Temporaria

Drop Table dbo.Temporaria

/*--visualizador da resoluçao do exercicio-----------------------------------------------
SELECT numeroProfessor
FROM tfc.ProfessorDEISI
ORDER BY numeroProfessor;
----------------------------------------------------------------------------------------*/

COMMIT TRAN @Exercicio523;
END TRY

BEGIN CATCH
ROLLBACK TRAN @Exercicio523;
END CATCH

--``````````````````````````````````````````````````````````````````````````````````````




--5.2.4`````````````````````````````````````````````````````````````````````````````````````

DECLARE @Exercicio524 VARCHAR(20) = 'Exercicio524';
BEGIN TRY
BEGIN TRANSACTION @Exercicio524; 
WITH
  RankedRows
  AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER (PARTITION BY idProfessor ORDER BY idProfessor) AS RowNum
    FROM
      tfc.ProfessorNDEISI
  )


SELECT
  id,
  departamentoAfeto,
  email,
  idProfessor,
  nome,
  numeroContato
Into Temporaria
FROM
  RankedRows
WHERE 
  RowNum = 1;


TRUNCATE TABLE tfc.ProfessorNDEISI

INSERT into tfc.ProfessorNDEISI
SELECT *
from dbo.Temporaria

Drop Table dbo.Temporaria

/*--visualizador da resoluçao do exercicio-----------------------------------------------
SELECT idProfessor
FROM tfc.ProfessorNDEISI
ORDER BY idProfessor;
----------------------------------------------------------------------------------------*/

COMMIT TRAN @Exercicio524;
END TRY

BEGIN CATCH
ROLLBACK TRAN @Exercicio524;
END CATCH

--``````````````````````````````````````````````````````````````````````````````````````````


--5.2.5````````````````````````````````````````````````````````````````````````````````````

DECLARE @Exercicio526 VARCHAR(20) = 'Exercicio526';
BEGIN TRANSACTION Exercicio526

BEGIN TRY

Delete FROM tfc.Grupo where idNumeroAluno1 = idNumeroAluno2;

SELECT *
from tfc.Grupo;

WITH
  RankedRows
  AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER (PARTITION BY idNumeroAluno1 ORDER BY id) AS RowNum
    FROM
      tfc.Grupo
  )


SELECT
  id,
  confirmaAluno1,
  confirmaAluno2,
  idNumeroAluno1,
  idNumeroAluno2
Into Temporaria
FROM
  RankedRows
WHERE 
  RowNum = 1;


TRUNCATE TABLE tfc.Grupo

INSERT into tfc.Grupo

SELECT *
from dbo.Temporaria

Drop Table dbo.Temporaria


/*--visualizador da resoluçao do exercicio-----------------------------------------------
SELECT idNumeroAluno1, idNumeroAluno2
FROM tfc.Grupo
ORDER BY idNumeroAluno1;
----------------------------------------------------------------------------------------*/

COMMIT TRAN @Exercicio526;
END TRY

BEGIN CATCH
ROLLBACK TRAN Exercicio526;
END CATCH







DECLARE @Exercicio52Group VARCHAR(20) = 'Exercicio52Group';
BEGIN TRANSACTION Exercicio52Group

BEGIN TRY

WITH
  RankedRows
  AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER (PARTITION BY idNumeroAluno2 ORDER BY id) AS RowNum
    FROM
      tfc.Grupo
  )


SELECT
  id,
  confirmaAluno1,
  confirmaAluno2,
  idNumeroAluno1,
  idNumeroAluno2
Into Temporaria
FROM
  RankedRows
WHERE 
  RowNum = 1;


TRUNCATE TABLE tfc.Grupo

INSERT into tfc.Grupo

SELECT *
from dbo.Temporaria


/*--visualizador da resoluçao do exercicio-----------------------------------------------
SELECT idNumeroAluno1, idNumeroAluno2
FROM tfc.Grupo
ORDER BY idNumeroAluno1;
----------------------------------------------------------------------------------------*/

COMMIT TRAN Exercicio52Group;
END TRY

BEGIN CATCH
ROLLBACK TRAN Exercicio52Group;
END CATCH

--```````````````````````````````````````````````````````````````````````````````````````

--***************************************************************************************



--5.3************************************************************************************

--5.3.1````````````````````````````````````````````````````````````````````````````````````

DECLARE @TrasactionName531 VARCHAR(20) = 'Exercicio531';

BEGIN TRY
    BEGIN TRAN @TrasactionName531


DELETE tfc.Inscricao
FROM tfc.Inscricao
  LEFT JOIN tfc.TFC ON tfc.TFC.idtfc = tfc.Inscricao.idTFC
WHERE tfc.TFC.idtfc IS NULL



DELETE tfc.HistoricoTFC
FROM tfc.HistoricoTFC
  LEFT JOIN tfc.TFC ON tfc.TFC.idtfc = tfc.HistoricoTFC.idTFC
  WHERE tfc.TFC.idtfc IS NULL



-- "Todos os valores de [idTFC] em qualquer tabelas têm que existir em [TFC].[idTFC]"
-- Portanto vamos ver idTFC (varchar), existentes no Historico e Inscricao, e depois os bigint usando a coluna HistoricoTFC.idTFCNumerico. 
-- Pois agora sabendo que HistoricoTFC ja temos os valores todos a existir no tfc.TFC vamos tratar dos idtfc do tipo bigints.


DELETE tfc.TFCCurso
  FROM tfc.TFCCurso
  LEFT JOIN tfc.HistoricoTFC ON tfc.HistoricoTFC.idTFCNumerico = tfc.TFCCurso.idTFC
  WHERE tfc.HistoricoTFC.idTFCNumerico IS NULL


DELETE tfc.TFCTecnologia
  FROM tfc.TFCTecnologia
  LEFT JOIN tfc.HistoricoTFC ON tfc.HistoricoTFC.idTFCNumerico = tfc.TFCTecnologia.idTFC
  WHERE tfc.HistoricoTFC.idTFCNumerico IS NULL


DELETE tfc.TFCDisciplina
  FROM tfc.TFCDisciplina
  LEFT JOIN tfc.HistoricoTFC ON tfc.HistoricoTFC.idTFCNumerico = tfc.TFCDisciplina.numeroTFC
  WHERE tfc.HistoricoTFC.idTFCNumerico IS NULL


/*--visualizador da resoluçao do exercicio-----------------------------------------------

SELECT tfc.Inscricao.idTFC AS idtfc_Inscricao, tfc.TFC.idtfc AS idTFC_TFC
FROM tfc.Inscricao
  LEFT JOIN tfc.TFC ON tfc.TFC.idtfc = tfc.Inscricao.idTFC
WHERE tfc.TFC.idtfc IS NULL


SELECT tfc.TFC.idtfc AS idtfc_TFC, tfc.HistoricoTFC.idTFC AS idTFC_Historico
FROM tfc.HistoricoTFC
  LEFT JOIN tfc.TFC ON tfc.TFC.idtfc = tfc.HistoricoTFC.idTFC
WHERE tfc.TFC.idtfc IS NULL



SELECT tfc.TFCCurso.idtfc AS idtfc_Curso, tfc.HistoricoTFC.idTFC AS idTFC_Historico
  FROM tfc.TFCCurso
  LEFT JOIN tfc.HistoricoTFC ON tfc.HistoricoTFC.idTFCNumerico = tfc.TFCCurso.idTFC
  WHERE tfc.HistoricoTFC.idTFCNumerico IS NULL

SELECT tfc.TFCTecnologia.idtfc AS idtfc_Tecnologia, tfc.HistoricoTFC.idTFC AS idTFC_Historico
  FROM tfc.TFCTecnologia
  LEFT JOIN tfc.HistoricoTFC ON tfc.HistoricoTFC.idTFCNumerico = tfc.TFCTecnologia.idTFC
  WHERE tfc.HistoricoTFC.idTFCNumerico IS NULL

SELECT tfc.TFCDisciplina.numeroTFC AS idtfc_TFCDisciplina, tfc.HistoricoTFC.idTFC AS idTFC_Historico
FROM tfc.TFCDisciplina
  LEFT JOIN tfc.HistoricoTFC ON tfc.HistoricoTFC.idTFCNumerico = tfc.TFCDisciplina.numeroTFC
WHERE tfc.HistoricoTFC.idTFCNumerico IS NULL

---------------------------------------------------------------------------------------*/


    COMMIT TRANSACTION @TrasactionName531;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName531;
END CATCH;

--````````````````````````````````````````````````````````````````````````````````````````````



--5.3.2``````````````````````````````````````````````````````````````````````````````````````````

DECLARE @TrasactionName532 VARCHAR(20) = 'Exercicio532';

BEGIN TRY
    BEGIN TRAN @TrasactionName532


DELETE tfc.TFC
  FROM tfc.TFC
  LEFT JOIN tfc.ProfessorDEISI ON tfc.ProfessorDEISI.numeroProfessor = tfc.TFC.orientador
  WHERE tfc.ProfessorDEISI.numeroProfessor IS NULL


/*--visualizador da resoluçao do exercicio-----------------------------------------------

SELECT tfc.TFC.orientador AS orientador_TFC, tfc.ProfessorDEISI.numeroProfessor AS idTFC_ProfessorDEISI
FROM tfc.TFC
  LEFT JOIN tfc.ProfessorDEISI ON tfc.ProfessorDEISI.numeroProfessor = tfc.TFC.orientador
WHERE tfc.ProfessorDEISI.numeroProfessor IS NULL

-------------------------------------------------*/


  COMMIT TRANSACTION @TrasactionName532;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName532;
END CATCH;

--````````````````````````````````````````````````````````````````````````````````


--5.3.3````````````````````````````````````````````````````````````````````````

DECLARE @TrasactionName533 VARCHAR(20) = 'Exercicio533';

BEGIN TRY
    BEGIN TRAN @TrasactionName533

DELETE tfc.AvaliacaoDisciplinaAluno
  FROM tfc.AvaliacaoDisciplinaAluno
  LEFT JOIN tfc.Aluno ON tfc.Aluno.numeroAluno = tfc.AvaliacaoDisciplinaAluno.idNumeroAluno
  WHERE tfc.Aluno.numeroAluno IS NULL


DELETE tfc.Inscricao
  FROM tfc.Inscricao
  LEFT JOIN tfc.Aluno ON tfc.Aluno.numeroAluno = tfc.Inscricao.numeroAluno
  WHERE tfc.Aluno.numeroAluno IS NULL


DELETE tfc.Grupo
  FROM tfc.Grupo
  LEFT JOIN tfc.Aluno ON tfc.Aluno.numeroAluno = tfc.Grupo.idNumeroAluno1 
  WHERE tfc.Grupo.idNumeroAluno1 IS NULL 


  DELETE tfc.Grupo
  FROM tfc.Grupo
  LEFT JOIN tfc.Aluno ON tfc.Aluno.numeroAluno = tfc.Grupo.idNumeroAluno2
  WHERE tfc.Aluno.numeroAluno IS NULL 




  DELETE tfc.TFC
  FROM tfc.TFC
  LEFT JOIN tfc.Grupo ON tfc.TFC.idGrupo = tfc.Grupo.id
  WHERE tfc.TFC.idGrupo IS NULL 


/*--visualizador da resoluçao do exercicio-----------------------------------------------
SELECT tfc.Inscricao.numeroAluno AS numeroAluno, tfc.Aluno.numeroAluno AS numeroAluno
FROM tfc.Inscricao
  LEFT JOIN tfc.Aluno ON tfc.Aluno.numeroAluno = tfc.Inscricao.numeroAluno
WHERE tfc.Aluno.numeroAluno IS NULL 


SELECT tfc.Grupo.idNumeroAluno1 AS idNumeroAluno2, tfc.Aluno.numeroAluno AS numeroAluno
FROM tfc.Grupo
  LEFT JOIN tfc.Aluno ON tfc.Aluno.numeroAluno = tfc.Grupo.idNumeroAluno1
WHERE tfc.Grupo.idNumeroAluno1 IS NULL 


SELECT tfc.Grupo.idNumeroAluno2 AS idNumeroAluno2, tfc.Aluno.numeroAluno AS numeroAluno
FROM tfc.Grupo
  LEFT JOIN tfc.Aluno ON tfc.Aluno.numeroAluno = tfc.Grupo.idNumeroAluno2
WHERE tfc.Aluno.numeroAluno IS NULL 



SELECT tfc.Grupo.id AS idGrupo, tfc.TFC.idGrupo AS idTFCGrupo
FROM tfc.TFC
  LEFT JOIN tfc.Grupo ON tfc.TFC.idGrupo = tfc.Grupo.id
WHERE tfc.TFC.idGrupo IS NULL 
---------------------------------------------------------------------------------------*/


COMMIT TRANSACTION @TrasactionName533;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName533;
END CATCH;
--`````````````````````````````````````````````````````````````````````````

--**********************************************************************************************


--=====================================================
--1 ETAPA
--=====================================================

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

CREATE INDEX IDEmpresa ON tfc.Empresa_EntidadeExterna (idEmpresa);

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

--=====================================================
--2 ETAPA
--=====================================================


--Exercicio 6*********ja feita na etapa 1 no importa wizard*****


--Exercicio 7****************************************************


DECLARE @TrasactionName7 VARCHAR(20) = 'Exercicio7';
BEGIN TRY
    BEGIN TRAN @TrasactionName7



ALTER TABLE tfc.Aluno
ADD ECTS INT NOT NULL DEFAULT 0;

;WITH AlunosParaAtualizar AS (
    SELECT TOP (5) *
    FROM tfc.Aluno
    ORDER BY id
)

UPDATE AlunosParaAtualizar
SET ECTS = 6


COMMIT TRANSACTION @TrasactionName7;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName7;
END CATCH;


--**********************************************


--Exercicio 8****************************************************

DECLARE @TrasactionName8 VARCHAR(20) = 'Exercicio8';
BEGIN TRY
    BEGIN TRAN @TrasactionName8


DELETE tfc.Curso
WHERE id=1;

-- Ir da tabela aluno por curso para tabela curso por o nome do curso 
DECLARE @idAluno nvarchar(255)
DECLARE @idCurso bigint

SELECT TOP (1) 
    @idAluno = c.numeroAluno,
    @idCurso = 
        CASE 
            WHEN c.curso = 'LEI' THEN '2'
            WHEN c.curso = 'LIG' THEN '3'
            ELSE NULL 
        END
FROM tfc.Aluno AS c
WHERE c.ECTS > 0;

-- Obter o id da tabela Disciplina a partir do id do curso obtido anteriormente
DECLARE @idDisciplina bigint
DECLARE cur CURSOR FOR
SELECT @idDisciplina= d.id
FROM tfc.Disciplina AS d
WHERE d.cursoAssociado = @idCurso;

OPEN cur;
FETCH NEXT FROM cur INTO @idDisciplina;

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO tfc.AvaliacaoDisciplinaAluno (idNumeroAluno, idNumeroDisciplina, nota)
    VALUES (@idAluno, @idDisciplina, 15);

    FETCH NEXT FROM cur INTO @idDisciplina;
END

CLOSE cur;
DEALLOCATE cur;

COMMIT TRANSACTION @TrasactionName8;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName8;
END CATCH;




DECLARE @TrasactionName81 VARCHAR(20) = 'Exercicio81';
BEGIN TRY
    BEGIN TRAN @TrasactionName81

DECLARE @idAluno1 nvarchar(255)
DECLARE @idCurso1 bigint

SELECT TOP (1) 
    @idAluno1 = c.numeroAluno,
    @idCurso1 = 
        CASE 
            WHEN c.curso = 'LEI' THEN '2'
            WHEN c.curso = 'LIG' THEN '3'
            ELSE NULL 
        END
FROM tfc.Aluno AS c
WHERE c.ECTS > 0;


DECLARE @idDisciplina1 bigint
DECLARE cur CURSOR FOR
SELECT @idDisciplina= d.id
FROM tfc.Disciplina AS d
WHERE d.cursoAssociado = @idCurso;

OPEN cur;
FETCH NEXT FROM cur INTO @idDisciplina;

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO tfc.AvaliacaoDisciplinaAluno (idNumeroAluno, idNumeroDisciplina, nota)
    VALUES (@idAluno, @idDisciplina1, 8);

    FETCH NEXT FROM cur INTO @idDisciplina;
END

CLOSE cur;
DEALLOCATE cur;

COMMIT TRANSACTION @TrasactionName81;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName81;
END CATCH;

/*
SELECT*
FROM tfc.AvaliacaoDisciplinaAluno

SELECT*
FROM tfc.TFCDisciplina

SELECT*
FROM tfc.HistoricoTFC

SELECT*
FROM tfc.Aluno

SELECT*
FROM tfc.TFC

SELECT*
FROM tfc.Inscricao
*/

--**********************************************



--Exercicio 9*******************************************************
DECLARE @TrasactionName9 VARCHAR(20) = 'Exercicio9';
BEGIN TRY
    BEGIN TRAN @TrasactionName9

--dar delete à inscriçao e historicoTFC que tenha o ano registoDeincriçao diferente ao do tfc.TFC.anoletivo
DELETE insc
FROM tfc.Inscricao insc
INNER JOIN tfc.TFC t ON t.idtfc = insc.idtfc
WHERE YEAR(t.anoLetivo) <> YEAR(insc.registoDeInscricao);

DELETE hist
FROM tfc.HistoricoTFC hist
INNER JOIN tfc.TFC t ON t.idtfc = hist.idtfc
WHERE YEAR(t.anoLetivo) <> YEAR(hist.dataMudancaEstado);


DELETE ordem
FROM tfc.Inscricao ordem
WHERE NOT ordemEscolha>1 AND ordemEscolha<6


DELETE avaliacao
FROM tfc.AvaliacaoDisciplinaAluno avaliacao
WHERE nota<0 OR nota>20


COMMIT TRANSACTION @TrasactionName9;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName9;
END CATCH;

--*********************************************************


--Exercicio 10*******************************************************
DECLARE @TrasactionName10 VARCHAR(20) = 'Exercicio10';
BEGIN TRY
    BEGIN TRAN @TrasactionName10

ALTER TABLE tfc.Inscricao
ADD CONSTRAINT FK_InscricaoCont_TFC
FOREIGN KEY (idNumeroGrupo)
REFERENCES tfc.TFC(idGrupo);


COMMIT TRANSACTION @TrasactionName10;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName10;
END CATCH;

--DUVIDA
--*********************************************************


--Exercicio 11*******************************************************

DECLARE @TrasactionName11 VARCHAR(20) = 'Exercicio11';
BEGIN TRY
    BEGIN TRAN @TrasactionName11


--certificar que os dados estao iguais em ambos os lados para preparar as colunas para a foreign key
DELETE tfc.Inscricao
FROM tfc.Inscricao
  LEFT JOIN tfc.TFC ON tfc.TFC.idtfc = tfc.Inscricao.idTFC
  WHERE tfc.TFC.idtfc IS NULL

--adicionar PK na tabela  tfc.Inscricao.idTFC para poder usar forign key
--para isso temos de dar drop da key PK atual que nao vai ser mais necessaria
ALTER TABLE tfc.Inscricao
DROP PK_Inscricao;


--dar drop à coluna que nao vamos necessitar
ALTER TABLE tfc.Inscricao
DROP COLUMN id;

ALTER TABLE tfc.Inscricao
ADD CONSTRAINT PK_Inscricao PRIMARY KEY (idtfc);

--fazer o mesmo para tfc.TFC
ALTER TABLE tfc.TFC
DROP PK_TFC;

ALTER TABLE tfc.TFC
DROP COLUMN id;

ALTER TABLE tfc.TFC
ADD CONSTRAINT PK_TFC PRIMARY KEY (idtfc);


--implementar foreign key
ALTER TABLE tfc.TFC
ADD CONSTRAINT FK_TFC_Inscricao
FOREIGN KEY (idtfc) REFERENCES tfc.Inscricao(idTFC);

ALTER TABLE tfc.TFC
ADD CONSTRAINT FK_TFC_Inscricao 
FOREIGN KEY (idtfc) REFERENCES tfc.Inscricao(idTFC);

ALTER TABLE tfc.Inscricao
DROP CONSTRAINT FK_Inscricao_TFC;

ALTER TABLE tfc.Inscricao
ADD CONSTRAINT FK_Inscricao_TFC 
FOREIGN KEY (idTFC) REFERENCES tfc.TFC(idtfc);


--resolver agr FK para HistoricoTFC

DELETE tfc.HistoricoTFC
FROM tfc.HistoricoTFC
  LEFT JOIN tfc.TFC ON tfc.TFC.idtfc = tfc.HistoricoTFC.idTFC
  WHERE tfc.TFC.idtfc IS NULL


ALTER TABLE tfc.HistoricoTFC
ADD CONSTRAINT FK_HistoricoTFC_TFC 
FOREIGN KEY (idTFC) REFERENCES tfc.TFC(idtfc);


-- Como precisamos de idtfcnumero em tfc.TFC copiar todos os idtfc -> idtfcnumero para TFC
-- tratamento para todos os que usam idtfcnumerico


--para tfcCurso

EXEC sp_rename 'tfc.TFCCurso.idtfc', 'idtfcnumerico', 'COLUMN';

ALTER TABLE tfc.TFCCurso
ADD idtfc nvarchar(255);


UPDATE tfc.TFCCurso
SET idtfc = h.idTFC
FROM tfc.TFCCurso tc
INNER JOIN tfc.HistoricoTFC h ON tc.idTFCnumerico = h.idTFCNumerico;

DELETE tfc.TFCCurso
FROM  tfc.TFCCurso
WHERE idtfc IS NULL

ALTER TABLE tfc.TFCCurso
Drop COLUMN idTFCNumerico


--para tfcDisciplina

ALTER TABLE tfc.tfcDisciplina
ADD idtfc nvarchar(255);


UPDATE tfc.TFCDisciplina
SET idtfc = h.idTFC
FROM tfc.TFCDisciplina tD
INNER JOIN tfc.HistoricoTFC h ON tD.numeroTFC = h.idTFCNumerico;


DELETE tfc.TFCDisciplina
FROM  tfc.TFCDisciplina
WHERE idtfc IS NULL

ALTER TABLE tfc.TFCDisciplina
Drop COLUMN numeroTFC


--para tfcTecnologia

EXEC sp_rename 'tfc.TFCTecnologia.idTFC', 'idtfcnumerico', 'COLUMN';

ALTER TABLE tfc.tfcTecnologia
ADD idtfc nvarchar(255);


UPDATE tfc.TFCTecnologia
SET idtfc = h.idTFC
FROM tfc.TFCTecnologia tTec
INNER JOIN tfc.HistoricoTFC h ON tTec.idtfcnumerico = h.idTFCNumerico;


DELETE tfc.TFCTecnologia
FROM  tfc.TFCTecnologia
WHERE idtfc IS NULL

ALTER TABLE tfc.TFCTecnologia
Drop COLUMN idtfcnumerico

--para avaliacaodisciplina

ALTER TABLE tfc.AvaliacaoDisciplinaAluno
ALTER COLUMN IdNumeroAluno nvarchar(255) NOT NULL;

ALTER TABLE tfc.AvaliacaoDisciplinaAluno
ADD CONSTRAINT FK_AvaliacaoDisciplinaAluno_Aluno
FOREIGN KEY (idNumeroAluno) REFERENCES tfc.Aluno(numeroAluno);


-- TFCCurso - tfc
ALTER TABLE tfc.TFCCurso
DROP PK_TFCCurso;
ALTER TABLE tfc.TFCCurso
DROP COLUMN id;
ALTER TABLE tfc.TFCCurso
ADD CONSTRAINT PK_TFCCurso PRIMARY KEY (idTFC);

DELETE tfc.TFCCurso
FROM tfc.TFCCurso
  LEFT JOIN tfc.TFC ON tfc.TFC.idtfc = tfc.TFCCurso.idtfc
  WHERE tfc.TFC.idtfc IS NULL
  
ALTER TABLE tfc.TFCCurso
ADD CONSTRAINT FK_TFCCurso_TFC
FOREIGN KEY (idTFC) REFERENCES tfc.TFC(idtfc);


-- TFCDisciplina -tfc
ALTER TABLE tfc.TFCDisciplina
DROP PK_TFCDisciplina;
ALTER TABLE tfc.TFCDisciplina
DROP COLUMN id;
ALTER TABLE tfc.TFCDisciplina
ADD CONSTRAINT PK_TFCDisciplina PRIMARY KEY (numeroTFC);

DELETE tfc.TFCDisciplina
FROM tfc.TFCDisciplina
  LEFT JOIN tfc.TFC ON tfc.TFC.idtfc = tfc.TFCDisciplina.idtfc
  WHERE tfc.TFC.idtfc IS NULL
  
ALTER TABLE tfc.TFCDisciplina
ADD CONSTRAINT FK_TFCDisciplina_TFC
FOREIGN KEY (idTFC) REFERENCES tfc.TFC(idtfc);


-- TFCTecnologia - TFC
ALTER TABLE tfc.TFCTecnologia
DROP PK_TFCTecnologia;
ALTER TABLE tfc.TFCTecnologia
DROP COLUMN id;

ALTER TABLE tfc.TFCTecnologia
ALTER COLUMN idtfc bigint NOT NULL;

ALTER TABLE tfc.TFCTecnologia
ADD CONSTRAINT PK_TFCTecnologia PRIMARY KEY (idTFC);


DELETE tfc.TFCTecnologia
FROM tfc.TFCTecnologia
  LEFT JOIN tfc.HistoricoTFC ON tfc.HistoricoTFC.idTFCNumerico = tfc.TFCTecnologia.idTFC
  WHERE tfc.HistoricoTFC.idTFCNumerico IS NULL
  

ALTER TABLE tfc.TFCTecnologia
ADD CONSTRAINT FK_TFCTecnologia_TFC
FOREIGN KEY (idTFC) REFERENCES tfc.TFC(idtfc);

--para TFCCurso-Curso

DELETE tfc.TFCCurso
FROM tfc.TFCCurso
  LEFT JOIN tfc.Curso ON tfc.Curso.id = tfc.TFCCurso.idCurso
  WHERE tfc.Curso.id IS NULL
  

ALTER TABLE tfc.TFCCurso
ADD CONSTRAINT FK_TFCCurso_Curso
FOREIGN KEY (idCurso) REFERENCES tfc.Curso(id);


--para TFCTecnologia-Tecnologia

DELETE tfc.TFCTecnologia
FROM tfc.TFCTecnologia
  LEFT JOIN tfc.Tecnologia ON tfc.Tecnologia.id = tfc.TFCTecnologia.idTecnologia
  WHERE tfc.Tecnologia.id IS NULL
  

ALTER TABLE tfc.TFCTecnologia
ADD CONSTRAINT FK_TFCTecnologia_Tecnologia
FOREIGN KEY (idTecnologia) REFERENCES tfc.Tecnologia(id);


--para TFCDisciplina-Disciplina

DELETE tfc.TFCDisciplina
FROM tfc.TFCDisciplina
  LEFT JOIN tfc.Disciplina ON tfc.Disciplina.id = tfc.TFCDisciplina.idNumeroDisciplina
  WHERE tfc.Disciplina.id IS NULL
  

ALTER TABLE tfc.TFCDisciplina
ADD CONSTRAINT FK_TFCDisciplina_Disciplina
FOREIGN KEY (idNumeroDisciplina) REFERENCES tfc.Disciplina(id);


-- AvaliacaoDisciplinaAluno-Disciplina

ALTER TABLE tfc.AvaliacaoDisciplinaAluno
DROP PK_avaliacaoDisciplinaAluno;
ALTER TABLE tfc.AvaliacaoDisciplinaAluno
DROP COLUMN id;

ALTER TABLE tfc.avaliacaoDisciplinaAluno
ALTER COLUMN idNumeroDisciplina bigint NOT NULL;

ALTER TABLE tfc.avaliacaoDisciplinaAluno
ADD CONSTRAINT PK_avaliacaoDisciplinaAluno PRIMARY KEY (idNumeroDisciplina);

DELETE tfc.AvaliacaoDisciplinaAluno
FROM tfc.AvaliacaoDisciplinaAluno
  LEFT JOIN tfc.Disciplina ON tfc.Disciplina.id = tfc.AvaliacaoDisciplinaAluno.idNumeroDisciplina
  WHERE tfc.Disciplina.id IS NULL
  

ALTER TABLE tfc.AvaliacaoDisciplinaAluno
ADD CONSTRAINT FK_AvaliacaoDisciplinaAluno_Disciplina
FOREIGN KEY (idNumeroDisciplina) REFERENCES tfc.Disciplina(id);


-- avaliacaoDisciplinaAluno-Aluno

ALTER TABLE tfc.AvaliacaoDisciplinaAluno
ADD CONSTRAINT FK_AvaliacaoDisciplinaAluno_Aluno
FOREIGN KEY (idNumeroAluno) REFERENCES tfc.Aluno(numeroAluno);

--para Disciplina - Curso

DELETE tfc.Disciplina
FROM tfc.Disciplina
  LEFT JOIN tfc.Curso ON tfc.Curso.id = tfc.Disciplina.cursoAssociado
  WHERE tfc.Curso.id IS NULL
  

ALTER TABLE tfc.Disciplina
ADD CONSTRAINT FK_Disciplina_Curso
FOREIGN KEY (cursoAssociado) REFERENCES tfc.Curso(id);


-- para Inscricao -Grupo

DELETE tfc.Grupo
FROM tfc.Grupo
  LEFT JOIN tfc.Inscricao ON tfc.Inscricao.idNumeroGrupo = tfc.Grupo.id
  WHERE tfc.Inscricao.idNumeroGrupo IS NULL

;WITH Duplicates AS (
    SELECT idNumeroGrupo,
           ROW_NUMBER() OVER(PARTITION BY idNumeroGrupo ORDER BY (SELECT NULL)) AS RowNumber
    FROM tfc.Inscricao
)
DELETE FROM Duplicates WHERE RowNumber > 1;

ALTER TABLE tfc.Inscricao
ADD CONSTRAINT UQ_Inscricao_idGrupo UNIQUE (idNumeroGrupo);

  ALTER TABLE tfc.Grupo
  ADD CONSTRAINT FK_Grupo_Inscricao
  FOREIGN KEY (id) REFERENCES tfc.Inscricao(idNumeroGrupo);


-- para TFC -Grupo

  DELETE tfc.Grupo
  FROM tfc.Grupo
  LEFT JOIN tfc.TFC ON tfc.TFC.idGrupo = tfc.Grupo.id
  WHERE tfc.TFC.idGrupo IS NULL

;WITH Duplicates AS (
    SELECT idGrupo,
           ROW_NUMBER() OVER(PARTITION BY idGrupo ORDER BY (SELECT NULL)) AS RowNumber
    FROM tfc.TFC
)
DELETE FROM Duplicates WHERE RowNumber > 1;

ALTER TABLE tfc.TFC
ADD CONSTRAINT UQ_TFC_idGrupo UNIQUE (idGrupo);


  ALTER TABLE tfc.Grupo
  ADD CONSTRAINT FK_Grupo_TFC
  FOREIGN KEY (id) REFERENCES tfc.TFC(idGrupo);


--para  Grupo - Aluno 1 e 2

ALTER TABLE tfc.Aluno
DROP PK_Aluno;


ALTER TABLE tfc.Aluno
DROP COLUMN id;

ALTER TABLE tfc.Aluno
ADD CONSTRAINT PK_Aluno PRIMARY KEY (numeroAluno);


DELETE tfc.Grupo
FROM tfc.Grupo
  LEFT JOIN tfc.Aluno ON tfc.Aluno.numeroAluno = tfc.Grupo.idNumeroAluno1
  WHERE tfc.Aluno.numeroAluno IS NULL


DELETE tfc.Grupo
FROM tfc.Grupo
  LEFT JOIN tfc.Aluno ON tfc.Aluno.numeroAluno = tfc.Grupo.idNumeroAluno2
  WHERE tfc.Aluno.numeroAluno IS NULL

ALTER TABLE tfc.Aluno
ADD CONSTRAINT UX_numeroAluno UNIQUE (numeroAluno);

ALTER TABLE tfc.Grupo
ADD CONSTRAINT FK_Grupo_Aluno1
FOREIGN KEY (idNumeroAluno1) REFERENCES tfc.Aluno(numeroAluno);


ALTER TABLE tfc.Grupo
ADD CONSTRAINT FK_Grupo_Aluno2
FOREIGN KEY (idNumeroAluno2) REFERENCES tfc.Aluno(numeroAluno);

-- aluno-> curso

DELETE tfc.Aluno
FROM tfc.Aluno
  LEFT JOIN tfc.Curso ON tfc.Curso.nome = tfc.Aluno.curso
  WHERE tfc.Aluno.curso IS NULL


;WITH Duplicates AS (
    SELECT curso,
           ROW_NUMBER() OVER(PARTITION BY curso ORDER BY (SELECT NULL)) AS RowNumber
    FROM tfc.Aluno
)

DELETE FROM Duplicates WHERE RowNumber > 1;


ALTER TABLE tfc.TFC
ADD CONSTRAINT UQ_TFC_idGrupo UNIQUE (idGrupo);

ALTER TABLE tfc.Curso
ADD CONSTRAINT FK_Curso_Aluno
FOREIGN KEY (nome) REFERENCES tfc.Aluno(curso);


-- Utilizador - HistorioTFC
ALTER TABLE tfc.Utilizador
DROP PK_Utilizador;
ALTER TABLE tfc.Utilizador
DROP COLUMN id;
ALTER TABLE tfc.Utilizador
ADD CONSTRAINT PK_Utilizador PRIMARY KEY (idIdentificacao);

ALTER TABLE tfc.Utilizador
ALTER COLUMN idIdentificacao NVARCHAR(255) NOT NULL;

DELETE tfc.Utilizador
FROM tfc.Utilizador
  LEFT JOIN tfc.HistoricoTFC ON tfc.HistoricoTFC.utilizador = tfc.Utilizador.idIdentificacao
  WHERE tfc.HistoricoTFC.utilizador IS NULL


WITH
  RankedRows
  AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER (PARTITION BY utilizador ORDER BY utilizador) AS RowNum
    FROM
      tfc.HistoricoTFC
  )


SELECT
  id,
  avaliacao,
  dataMudancaEstado,
  estado,
  idTFC,
  idTFCNumerico,
  utilizador
Into Temporario
FROM
  RankedRows
WHERE 
  RowNum = 1;
  

TRUNCATE TABLE tfc.HistoricoTFC

INSERT into tfc.HistoricoTFC
SELECT *
from dbo.Temporario

Drop Table dbo.Temporario


ALTER TABLE tfc.HistoricoTFC
ADD CONSTRAINT UX_Historicotfc UNIQUE (utilizador);

ALTER TABLE tfc.Utilizador
ADD CONSTRAINT FK_HistoricoTFC_Utilizador FOREIGN KEY (idIdentificacao)
REFERENCES tfc.HistoricoTFC(Utilizador);



--para TFC -ProfessorDEISI

ALTER TABLE tfc.ProfessorDEISI
DROP PK_ProfessorDEISI;


ALTER TABLE tfc.ProfessorDEISI
DROP COLUMN id;


ALTER TABLE tfc.ProfessorDEISI
ADD CONSTRAINT PK_ProfessorDEISI PRIMARY KEY (numeroProfessor);

-- Criar uma coluna para o departamento para depois podemos copiar todos os dados
-- da tabela ProfessorDeisi para ProfessorNdeisi para termos todos os professores numa tabela só para ser mais pratico e rapido

ALTER TABLE tfc.ProfessorDEISI
ADD departamentoAfeto nvarchar(255) NOT NULL DEFAULT 'DEISI';


ALTER TABLE tfc.ProfessorNDEISI
ALTER COLUMN idProfessor NVARCHAR(255) NOT NULL;

ALTER TABLE tfc.ProfessorNDEISI
DROP PK_ProfessorNDEISI;


ALTER TABLE tfc.ProfessorNDEISI
DROP COLUMN id;


INSERT INTO tfc.ProfessorNdeisi (departamentoAfeto, email, idProfessor, nome, numeroContato)
SELECT departamentoAfeto, email, nome, numeroProfessor, numeroContato
FROM tfc.ProfessorDeisi;

--nome está trocado com o idprofessor. ao transferir a informaçao ficou trocado
UPDATE tfc.ProfessorNDEISI
SET
    idProfessor = CASE
                        WHEN departamentoAfeto = 'DEISI' THEN nome
                        ELSE idProfessor
                    END,
    nome = CASE
                WHEN departamentoAfeto = 'DEISI' THEN idProfessor
                ELSE nome
            END
WHERE departamentoAfeto = 'DEISI';


DROP TABLE tfc.ProfessorDEISI

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
  departamentoAfeto,
  email,
  idProfessor,
  nome,
  numeroContato
Into Temporario
FROM
  RankedRows
WHERE 
  RowNum = 1;


TRUNCATE TABLE tfc.ProfessorNDEISI

INSERT into tfc.ProfessorNDEISI
SELECT *
from dbo.Temporario

Drop Table dbo.Temporario


ALTER TABLE tfc.ProfessorNDEISI
ADD CONSTRAINT PK_ProfessorNDEISI PRIMARY KEY (idProfessor);

ALTER TABLE tfc.TFC
ADD CONSTRAINT FK_TFC_ProfessorNDEISI_Coorientador
FOREIGN KEY (coorientador) REFERENCES tfc.ProfessorNDEISI(idProfessor);


ALTER TABLE tfc.TFC
ADD CONSTRAINT FK_TFC_ProfessorNDEISI_orientador
FOREIGN KEY (orientador) REFERENCES tfc.ProfessorNDEISI(idProfessor);

/*
SELECT*
FROM tfc.ProfessorNDEISI
*/

--tfc-> empresa

ALTER TABLE tfc.Empresa_EntidadeExterna
DROP COLUMN id;

DELETE TFC.Empresa_EntidadeExterna
WHERE idEmpresa is NULL

ALTER TABLE  TFC.Empresa_EntidadeExterna
ALTER COLUMN idEmpresa nvarchar(255) NOT NULL;

ALTER TABLE tfc.Empresa_EntidadeExterna
ADD CONSTRAINT PK_Empresa_EntidadeExterna PRIMARY KEY (idEmpresa);

INSERT INTO tfc.Empresa_EntidadeExterna (email,idEmpresa,interlocutor,morada,nome,numeroContato)
VALUES (null,0,null,null,'Nome da Empresa','');


ALTER TABLE tfc.TFC
ADD CONSTRAINT FK_TFC_Empresa_EntidadeExterna
FOREIGN KEY (IdEmpresa) REFERENCES tfc.Empresa_EntidadeExterna(idEmpresa);


COMMIT TRANSACTION @TrasactionName11;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION @TrasactionName11;
END CATCH;

--*********************************************************

--13********************************************************


ALTER TABLE tfc.Aluno
ADD estado NVARCHAR(255) NOT NULL DEFAULT 'excluido';

UPDATE tfc.Aluno
SET estado = 'válido'
FROM tfc.TFC
INNER JOIN tfc.Grupo ON TFC.idGrupo = Grupo.id
INNER JOIN tfc.Aluno ON tfc.Grupo.idNumeroAluno1 = tfc.Aluno.numeroAluno OR tfc.Grupo.idNumeroAluno2 = tfc.Aluno.numeroAluno
WHERE estadoAtual = 'Atribuido';



--DUVIDA tema atribuido tfc.estado? tfc.idgrupo->grupo.idnumeroaluno->aluno.estado??


--********************************************************



--14********************************************************

-- Eliminar colunas repetidas

--dataProposta = dataEstado
ALTER TABLE tfc.TFC
DROP COLUMN dataProposta;

--preponente = orientador
ALTER TABLE tfc.TFC
DROP COLUMN preponente;

--orientadorProposto = orientador
ALTER TABLE tfc.TFC
DROP COLUMN orientadorProposto;


-- por colunas a nao permitirem NULL

ALTER TABLE tfc.TFC
ALTER COLUMN avaliacaoProposta nvarchar(255) NOT NULL;

ALTER TABLE tfc.TFC
ALTER COLUMN estado nvarchar(255) NOT NULL;

ALTER TABLE tfc.TFC
ALTER COLUMN idGrupo bigint NOT NULL;

ALTER TABLE tfc.TFC
ALTER COLUMN idtfc nvarchar(255) NOT NULL;

--*********************************************************
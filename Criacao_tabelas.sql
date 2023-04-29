/*---------TABELA ALUNO---------------------------*/

CREATE
  TABLE ALUNO
  (

    MATRICULA VARCHAR2(20 BYTE) NOT NULL ENABLE,

    NOME      VARCHAR2(100 BYTE),

    SEXO      CHARACTER(1 BYTE),

    CPF       VARCHAR2(11 BYTE),

    RG        NUMBER(10),

    DATANASCIMENTO DATE,

    CIDADE   VARCHAR2(50 BYTE),

    BAIRRO   VARCHAR2(50 BYTE),

    CEP      VARCHAR2(10 BYTE),

    ENDERECO VARCHAR2(50 BYTE),
    CONSTRAINT "PK_ALUNO" PRIMARY KEY (MATRICULA)
);


/*---------TABELA PROFESSOR---------------------------*/

CREATE
  TABLE PROFESSOR (

    MATRICULA VARCHAR2(20 BYTE) NOT NULL ENABLE,

    NOME      VARCHAR2(100 BYTE),

    SEXO      CHARACTER(1 BYTE),

    CPF       VARCHAR2(11 BYTE),

    RG        NUMBER(10),

    DATANASCIMENTO DATE,

    ESPECIALIDADE VARCHAR2(100 BYTE),
    DATAFORMACAO DATE,
    NOMEFACULDADEFORMACAO VARCHAR2(100 BYTE), 
    CIDADE   VARCHAR2(50 BYTE),

    BAIRRO   VARCHAR2(50 BYTE),

    CEP      VARCHAR2(10 BYTE),

    ENDERECO VARCHAR2(50 BYTE),
    CONSTRAINT "PK_PROFESSOR" PRIMARY KEY (MATRICULA)
);


/*---------TABELA DISCIPLINA-------------------------*/

CREATE
  TABLE DISCIPLINA(

    CODDISCIPLINA   VARCHAR2(20 BYTE) NOT NULL ENABLE,

    NOMEDISCIPLINA  VARCHAR2(100 BYTE),
    CARGAHORARIA    NUMBER,

    CONSTRAINT "PK_DISCIPLINA" PRIMARY KEY (CODDISCIPLINA)
);


/*---------TABELA TURMA-------------------------*/

CREATE
  TABLE TURMA
  (

    CODTURMA       VARCHAR2(20 BYTE) NOT NULL ENABLE,

    CODDISCIPLINA  VARCHAR2(20 BYTE) NOT NULL ENABLE,
    NOMETURMA      VARCHAR2(100 BYTE),

    SALA           VARCHAR2(10 BYTE),

    TURNO          VARCHAR2(20 BYTE),

    CONSTRAINT "PK_TURMA" PRIMARY KEY (CODTURMA),
    CONSTRAINT "FK_TURMA" FOREIGN KEY (CODDISCIPLINA) 
    REFERENCES DISCIPLINA (CODDISCIPLINA) ENABLE
);


/*---------TABELA FREQUENTA----------------------*/


CREATE
  TABLE FREQUENTA
  (

    MATRICULA 	VARCHAR2(20 BYTE) NOT NULL ENABLE,

    CODTURMA	VARCHAR2(20 BYTE) NOT NULL ENABLE,

    NOTA        NUMBER(4,2),

    FALTA       NUMBER,

    SEMESTRE    NUMBER,

    ANO         NUMBER,

    CONSTRAINT "FK_FREQUENTA_MATRICULA" FOREIGN KEY (MATRICULA) REFERENCES

    ALUNO (MATRICULA) ENABLE
,
    CONSTRAINT "FK_FREQUENTA_CODTURMA" FOREIGN KEY (CODTURMA) REFERENCES

    TURMA (CODTURMA) ENABLE


)
;


/*---------TABELA ENSINA--------------------------*/

CREATE
  TABLE ENSINA
  (

    MATRICULA  VARCHAR2(20 BYTE) NOT NULL ENABLE,

    CODTURMA   VARCHAR2(20 BYTE) NOT NULL ENABLE,

    CONSTRAINT "FK_ENSINA_MATRICULA" FOREIGN KEY (MATRICULA) REFERENCES

    PROFESSOR (MATRICULA) ENABLE,

    CONSTRAINT "FK_ENSINA_CODTURMA" FOREIGN KEY (CODTURMA) REFERENCES

    TURMA (CODTURMA) ENABLE

);


/* Saber os professores (nome do professor e nome da disciplina) que ministra a disciplina de Algoritmos e Programa��o */
SELECT NOME,NOMEDISCIPLINA 
FROM PROFESSOR P, DISCIPLINA D, ENSINA E, TURMA T
WHERE P.MATRICULA = E.MATRICULA 
AND E.CODTURMA = T.CODTURMA
AND T.CODDISCIPLINA = D.CODDISCIPLINA
AND D.NOMEDISCIPLINA = 'Algoritmos e Programacao' ;


/* Resultado Felipe Moura e Gabriel Formiga /*


/* Saber a m�dia aritm�tica da turma T04 de matematica discreta.
Pegando nome do aluno,nota */
SELECT AVG(NOTA) 
FROM ALUNO A, FREQUENTA F, TURMA T, DISCIPLINA D
WHERE A.MATRICULA = F.MATRICULA
AND F.CODTURMA = T.CODTURMA
AND T.CODDISCIPLINA = D.CODDISCIPLINA
AND T.CODTURMA = 'T04';

/* Resultado 7,725 


/* Saber todas as disciplinas que Maria Fernandes est� cursando.
Considere nome do aluno, matr�cula do aluno, nome da disciplina. */
SELECT A.NOME,A.MATRICULA,D.NOMEDISCIPLINA
FROM ALUNO A, FREQUENTA F, TURMA T, DISCIPLINA D
WHERE A.MATRICULA = F.MATRICULA
AND F.CODTURMA = T.CODTURMA
AND T.CODDISCIPLINA = D.CODDISCIPLINA
AND A.NOME = 'Maria Fernandes';


/* Resultado. 5 disciplinas. Algoritmos e Programacao, Logica Matematica, Matematica Discreta, Arquitetura de 
 Computadores 1, Introducao ao Ensino Superior
 Saber quantas turmas existem de Matem�tica Discreta e que s�o seus professores */
SELECT COUNT(T.CODTURMA),P.NOME
FROM PROFESSOR P, ENSINA E, TURMA T, DISCIPLINA D
WHERE P.MATRICULA = E.MATRICULA
AND E.CODTURMA = T.CODTURMA
AND T.CODDISCIPLINA = D.CODDISCIPLINA
AND D.NOMEDISCIPLINA = 'Matematica Discreta'
GROUP BY P.NOME;

/* Resultado : Iara Mourinha ministra 2 turmas de matem�tica */


/* Saber a maior nota da turma T08 de Introdu��o ao Ensino Superior */
SELECT MAX(F.NOTA)
FROM ALUNO A, FREQUENTA F, TURMA T, DISCIPLINA D
WHERE A.MATRICULA = F.MATRICULA
AND F.CODTURMA = T.CODTURMA
AND T.CODDISCIPLINA = D.CODDISCIPLINA
AND T.CODTURMA = 'T08';
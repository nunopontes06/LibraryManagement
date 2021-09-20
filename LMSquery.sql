CREATE DATABASE LMS;

USE DATABASE LMS;

CREATE TABLE autor(
    idArtigo int NOT NULL,
    idAutor int PRIMARY KEY NOT NULL,
    nome varchar(300),
    dataNascimento date,
    localizacao varchar(300)
);

CREATE TABLE editora(
    idEditora int PRIMARY KEY NOT NULL,
    nome varchar(300),
    localizacao varchar(300),
);

CREATE TABLE fornecedor(
    idFornecedor int PRIMARY KEY NOT NULL,
    nome varchar(300),
    localizacao varchar(300)
);

CREATE TABLE artigo(
    idArtigo int PRIMARY KEY NOT NULL,
    idEditora int NOT NULL,
    idFornecedor int NOT NULL,
    titulo varchar(300),
    idioma varchar(300),
    formato varchar(300),
    paginas int NOT NULL,
    categoria varchar(300),
    FOREIGN KEY(idEditora) REFERENCES editora(idEditora),
    FOREIGN KEY(idFornecedor) REFERENCES fornecedor(idFornecedor)
);

CREATE TABLE artigo_autor(
    idArtigo int NOT NULL,
    idAutor int NOT NULL,
    FOREIGN KEY (idArtigo) REFERENCES artigo(idArtigo),
    FOREIGN KEY (idAutor) REFERENCES autor(idAutor)
);

CREATE TABLE revista(
    titulo varchar(300),
    idioma varchar(300),
    formato varchar(300),
    paginas int,
    categoria varchar(300),
    idArtigo_rev int NOT NULL REFERENCES artigo(idArtigo), PRIMARY KEY(idArtigo_rev)  
);

CREATE TABLE banda_desenhada(
    titulo varchar(300),
    idioma varchar(300),
    formato varchar(300),
    paginas int,
    categoria varchar(300),
    tipodeBD varchar(300),
    idArtigo_bd int NOT NULL REFERENCES artigo(idArtigo), PRIMARY KEY(idArtigo_bd)  
);

CREATE TABLE livro(
    titulo varchar(300),
    idioma varchar(300),
    formato varchar(300),
    paginas int,
    categoria varchar(300),
    idArtigo_lvr int NOT NULL REFERENCES artigo(idArtigo), PRIMARY KEY(idArtigo_lvr)
);

CREATE TABLE ebook(
    titulo varchar(300),
    idioma varchar(300),
    formato varchar(300),
    paginas int,
    categoria varchar(300),
    idArtigo_ebook int NOT NULL REFERENCES artigo(idArtigo), PRIMARY KEY(idArtigo_ebook)
);

CREATE TABLE braile(
    titulo varchar(300),
    idioma varchar(300),
    formato varchar(300),
    paginas int,
    categoria varchar(300),
    idArtigo_braile int NOT NULL REFERENCES artigo(idArtigo), PRIMARY KEY(idArtigo_braile)
);

CREATE TABLE audiobook(
    titulo varchar(300),
    idioma varchar(300),
    formato varchar(300),
    paginas int,
    categoria varchar(300),
    narrador (300),
    idArtigo_audiob int NOT NULL REFERENCES artigo(idArtigo), PRIMARY KEY(idArtigo_audiob)
);

CREATE TABLE membro(
    idMembro int PRIMARY KEY NOT NULL,
    nome varchar(300),
    dataNascimento date NOT NULL,
    contacto int NOT NULL,
    localizacao varchar(300),
    email varchar(300),
);

CREATE TABLE res(
    idArtigo int NOT NULL,
    idMembro int NOT NULL,
    dataReserva date NOT NULL,
    estado varchar(300)
    FOREIGN KEY(idArtigo) REFERENCES artigo(idArtigo),
    FOREIGN KEY(idMembro) REFERENCES membro(idMembro)  

);

CREATE TABLE req(
    idArtigo int NOT NULL,
    idMembro int NOT NULL,
    dataDev date NOT NULL,
    dataReq date NOT NULL,
    FOREIGN KEY(idArtigo) REFERENCES artigo(idArtigo),
    FOREIGN KEY(idMembro) REFERENCES membro(idMembro)  
);

INSERT INTO editora VALUES  (1111, 'BambúrrioEDT', 'Portugal'),
                            (2222, 'PatuscoEDT', 'Londres'),
                            (3333, 'DestrambrelhadoEDT', 'Portugal'),
                            (4444, 'ObnóxioEDT', 'Portugal'),
                            (5555, 'SemblanteEDT', 'Portugal'),
                            (6666, 'PorvirEDT', 'Lituania'),
                            (7777, 'DuduEDT', 'Espanha'),
                            (8888, 'PetizEDT', 'Portugal'),
                            (9999, 'ConcupiscênciaEDT', 'Portugal'),
                            (101010, 'EstioEDT', 'Portugal'),
                            (111111, 'EzioEDT', 'Portugal'),
                            (121212, 'AlzorEDT', 'Portugal');

INSERT INTO fornecedor VALUES   (1000, 'Porto Editora', 'Portugal'),
                                (2000, 'Europress', 'Londres'),
                                (3000, 'ProSaber', 'Portugal'),
                                (4000, 'Classica', 'Portugal'),
                                (5000, 'ProAbril', 'Portugal'),
                                (6000, 'Dellproducoes', 'Lituania'),
                                (7000, 'DumasDistr', 'Espanha'),
                                (8000, 'Profino', 'Portugal'),
                                (9000, 'Abecula', 'Portugal'),
                                (10000, 'Lapaint', 'Portugal'),
                                (11000, 'Letras', 'Portugal'),
                                (12000, 'AreT', 'Portugal');


INSERT INTO artigo VALUES   (1, 1111, 1000, 'O Fim do Homem Soviético', 'Português', 'Capa mole', 472, 'Revistas'),
                            (2, 2222, 2000, 'Amada Vida', 'Português', 'Capa mole', 280, 'Revistas'),
                            (3, 3333, 3000, 'Astérix e a Transitálica', 'Português', 'Capa dura', 145, 'Banda Desenhada'),
                            (4, 4444,4000,'O Mundo de Garfield', 'Português', 'Capa dura', 600, 'Banda Desenhada'),
                            (5, 5555,5000,'O Senhor dos Aneis I: Irmandade do Anel', 'Português', 'Capa mole', 468, 'Livro'),
                            (6, 6666,6000,'O Gigante Enterrado', 'Português', 'Capa dura', 412, 'Livro'),
                            (7,7777,7000,'A Vela Sagrada', 'Português', 'Capa mole', 424, 'Ebook'),
                            (8,8888,8000,'Até que o Amor me Mate', 'Português', 'Capa mole', 544, 'Ebook'),
                            (9,9999,9000,'Assim falou Zaratustra', 'Português', 'Capa dura', 800,  'Braile'),
                            (10,101010,10000,'Vivemos livres numa prisão', 'Português', 'Capa dura', 274, 'Braile'),
                            (11,111111,11000,'Barack Obama', 'Inglês', 'Capa dura', 56, 'AudioBook'),
                            (12,121212,12000,'Robinson Crusoe', 'Inglês', 'Capa dura', 128, 'AudioBook');


INSERT INTO autor VALUES    (1,001,'Svetlana Aleksievitch', '1948-05-31', 'Ucrânia'),
                            (2,002,'Alice Ann Munro', '1931-07-10', 'Ontário'),
                            (3,003,'Norman Rush', '1943-10-24', 'Califórnia'),
                            (4,004,'Adalberto Dias de Carvalho', '1938-07-14', 'Portugal'),
                            (5,005,'Jorge Barreto Xavier', '1965-06-11', 'Índia'),
                            (6,006,'Jean-Yves Ferri', '1959-05-17', 'França'),
                            (7,007,'James Robert Davis', '1945-06-28', 'Estados Unidos'),
                            (8,008,'Artur Correia', '1968-11-21', 'Portugal'),
                            (9,009,'Antoine de Saint-Exupéry', '1900-06-29', 'França'),
                            (10,0010,'Geronimo Stilton', '1928-09-11', 'Lituania'),
                            (11,0011,' J. R. R. Tolkien', '1892-01-03', 'África do Sul'),
                            (12,0012,'Erle Stanley Gardner', '1934-11-24', 'Estados Unidos');


INSERT INTO livro VALUES    ('O Senhor dos Aneis I: Irmandade do Anel', 'Português', 'Capa mole', 468, 'Livro',5),
                            ('O Gigante Enterrado', 'Português', 'Capa dura', 412, 'Livro',6);

INSERT INTO revista VALUES  ('O Fim do Homem Soviético', 'Português', 'Capa mole', 472, 'Revistas Literarias', 1),
                            ('Amada Vida', 'Português', 'Capa mole', 280, 'Revistas Literarias', 2);

INSERT INTO banda_desenhada VALUES  ('Astérix e a Transitálica', 'Português', 'Capa dura', 145, 'Banda Desenhada','Infantil', 3),
                                    ('Naruto', 'Ingles', 'Capa dura', 600, 'Banda Desenhada', 'Manga Japonesa',4);

INSERT INTO ebook VALUES    ('A Vela Sagrada', 'Português', 'Capa mole', 424, 'Ebook',7),
                            ('Até que o Amor me Mate', 'Português', 'Capa mole', 544, 'Ebook',8);

INSERT INTO braile VALUES       ('Assim falou Zaratustra', 'Português', 'Capa dura', 800, 'Braille',9),
                                ('Vivemos livres numa prisão', 'Português', 'Capa dura', 274, 'Braille',10);

INSERT INTO audiobook VALUES    ('Barack Obama', 'Inglês', 'Capa dura', 56, 'AudioBook', 'Arthur Simpson' 11),
                                ('Robinson Crusoe', 'Inglês', 'Capa dura', 128, 'AudioBook','John Bolton'12);

INSERT INTO membro VALUES   (1011,'ALZIRA DOS SANTOS SCOTTINI', '1955-10-31', 22111222,'Porto','email@etc.com.pt'),
                            (1012,'JOSÉ JORGE FREIRE DE LEMOS COSTA', '1965-11-13', 22111333,'Lisboa','email@etc.com.pt'),
                            (1013,'ANTONIO AMBROSIO DE MORAES', '1955-12-03', 22111444,'Lisboa','email@etc.com.pt'),
                            (1014,'FERNANDO PEREIRA DE ALMEIDA', '1975-10-22', 22111555,'Aveiro','email@etc.com.pt'),
                            (1015,'JOÃO VICTOR PINHEIRO BARBOSA', '1978-08-16', 22111666,'Braga','email@etc.com.pt'),
                            (1016,'RICARDO OLIVEIRA DA SILVA', '1945-10-13', 22111777,'Lisboa','email@etc.com.pt'),
                            (1017,'JILIAN DOS SANTOS SOUZA', '1957-04-03', 22111888,'Setubal','email@etc.com.pt'),
                            (1018,'SAMUEL ALVES DOS SANTOS', '1954-11-11', 22111999,'Albufeira','email@etc.com.pt'),
                            (1019,'GILBERTO ALMEIDA DA SILVA', '1958-05-06', 22123456,'Acores','email@etc.com.pt'),
                            (1020,'ROSÁRIO DE FÁTIMA MARQUES DE ARAÚJO', '1955-09-08', 22896786,'Alentejo','email@etc.com.pt'),
                            (1021,'LUIZ BARROS LEITE FILHO', '1945-10-18', 228967864,'Coimbra','email@etc.com.pt'),
                            (1022,'JOEL MARCOS CARDOSO', '1955-09-16', 223243243,'Esmoriz','email@etc.com.pt');

INSERT INTO res VALUES  (1,1011,'2018-06-22','Disponivel'),
                        (2,1014,'2018-07-02','Nao disponivel'),
                        (3,1015,'2018-10-14','Disponivel'),
                        (4,1020,'2018-04-12','Disponivel'),
                        (5,1013,'2018-03-13','Nao Disponivel');

INSERT INTO req VALUES  (6,1019,'2017-12-18', '2018-01-10'),
                        (7,1014,'2018-01-05','2018-02-15'),
                        (8,1016,'2018-01-11','2018-12-25'),
                        (9,1021,'2018-01-22','2018-03-18'),
                        (11,1018,'2018-02-15','2018-04-25');


/*Seleciona os dados todos da tabela artigo*/

SELECT * FROM artigo;

/*Seleciona todos os dados da tabela membro*/

SELECT * FROM membro;

/*Seleciona apenas os dados contidos em localizacao da tabela membro*/

SELECT localizacao FROM membro;

/*Seleciona penas nomes comecados por M da tabela membro*/

SELECT nome
FROM membro
WHERE nome LIKE 'A%';

/*Seleciona nomes comecados por G da tabela membro*/

SELECT nome
FROM membro
WHERE nome LIKE 'L%';

/*Seleciona apenas nomes comecados por J da tabela membro*/

SELECT nome
FROM membro
WHERE nome LIKE 'J%';

/*Ordena as cidades por nome da tabela membro*/

SELECT * FROM membro
ORDER BY localizacao;

/*Ordena as nomes de autor por nome da tabela autor*/

SELECT * FROM autor
ORDER BY nome;

/*Ordena os autor pela data de nascimento de ordem crescente*/

SELECT * FROM autor
ORDER BY dataNascimento;

/*Ordena os autores pela data de nascimento de ordem decrescente*/

SELECT * FROM autor
ORDER BY dataNascimento desc;

/*Este comando conta quantas linhas tem a tabela artigo*/

SELECT count(*)
FROM artigo;

/*Este comando permite saber, atraves da data de nascimento, qual é o membro mais novo em termos de idade da tabela membro*/

SELECT max(dataNascimento)
FROM membro;

/*Este comando seleciona os id dos artigos, a data de requisicao e a data de devolucao, ou seja, dos livros que foram requisitados*/

select idArtigo,dataReq,dataDev
from req;

/*Este comando mostra o ID dos livros que foram requisitados assim como o nome das pessoas que o requisitaram*/

SELECT membro.idMembro, membro.nome,req.idMembro
from membro
LEFT JOIN req ON membro.idMembro =req.idReq;

/*Este comando abre-se numa nova query e serve para ver os dados da tabela autor
funciona como uma janela que daa uma perspectiva da Base de Dados. 
E posteriormente usa-se o SELECT para se consultar o view criado numa nova query que retorna todos os autores
em que a inicial do nome é J*/

CREATE VIEW v_autor
AS 
SELECT nome
FROM autor
WHERE nome LIKE 'J%';

/*Este comando remove o view da base de dados*/

DROP VIEW v_autor;

/*Este comando permite criar um INDEX para campos de tabelas que por norma nao estao indexadas
uma vez que nao possuem uma PRIMARY KEY, ao inves possuem FOREIGN KEYS de outras tabelas*/

CREATE INDEX IX_bandaDesenhada
ON banda_desenhada(titulo);

/*Este comando mostra a tabela artigo ordenada por titulo*/

SELECT * FROM banda_desenhada
with (INDEX(IX_bandaDesenhada))

/*Este comando serve para se apagar o INDEX*/

DROP INDEX IX_bandaDesenhada
ON banda_desenhada;

/*Altera para 1000 o numero de paginas de de todos os artigos em que tiverem um numero de paginas inferior a 500*/

UPDATE artigo SET paginas=1000 WHERE paginas<500;



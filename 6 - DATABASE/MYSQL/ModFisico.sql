/* Instituto Federal de São Paulo - São Paulo (SP)
 * Copyright Brendo Oliveira Gonçalves   SP3047237
 * Banco de Dados - Eurides Balbino da Silva  */

/* Criando o Banco de Dados */

CREATE DATABASE Db_HomeShare;
DROP DATABASE Db_HomeShare;
SHOW DATABASES;
USE Db_HomeShare;
SELECT DATABASE();

/* Criando as tabelas */

CREATE TABLE Tb_Usuario(
Id_Usr SMALLINT PRIMARY KEY AUTO_INCREMENT,
CPF_Usr VARCHAR(11) NOT NULL,
Nome_Usr VARCHAR(30) NOT NULL,
Sobrenome_Usr VARCHAR(40),
Senha_Usr VARCHAR(20) NOT NULL,
Email_Usr VARCHAR(30),
DtNasc_Usr DATE NOT NULL,
Gen_Usr ENUM ('M', 'F') NOT NULL,
Anim_Usr ENUM ('S', 'N') NOT NULL,
Fum_Usr ENUM ('S', 'N') NOT NULL,
Foto_Usr BLOB
)AUTO_INCREMENT = 1001;

CREATE TABLE Tb_PreferenciaUsr(
Id_Usr SMALLINT AUTO_INCREMENT,
Bair_Pref VARCHAR(50) NOT NULL,
PRIMARY KEY(Id_Usr, Bair_Pref),
CONSTRAINT fk_Id_Usr FOREIGN KEY (Id_Usr) REFERENCES Tb_Usuario (Id_Usr),
Cid_Pref VARCHAR(30),
Est_Pref VARCHAR(20),
Fum_Pref ENUM ('S', 'N', 'I'),
Anim_Pref ENUM ('S', 'N', 'I'),
Gen_Pref ENUM ('M', 'F', 'I'),
Gar_Pref SMALLINT,
Quar_Pref SMALLINT
) AUTO_INCREMENT = 1001;

CREATE TABLE Tb_Quarto(
Id_Quar SMALLINT PRIMARY KEY AUTO_INCREMENT,
Tipo_Quar ENUM ('N', 'S'), /*Normal ou Suite*/
Com_Quar ENUM ('S', 'N')
)AUTO_INCREMENT = 3201;

CREATE TABLE Tb_Casa(
Id_Cs SMALLINT AUTO_INCREMENT PRIMARY KEY,
Logra_Cs VARCHAR(30) NOT NULL,
Num_Cs SMALLINT NOT NULL,
Bair_Cs VARCHAR(30) NOT NULL,
Cid_Cs VARCHAR(30) NOT NULL,
Est_Cs VARCHAR(20) NOT NULL,
CEP_Cs VARCHAR(8),
Gen_Cs ENUM ('M', 'F', 'A'),
Fum_Cs ENUM ('S', 'N'),
Anim_Cs ENUM ('S', 'N'),
Id_Qua SMALLINT,
CONSTRAINT fk_Id_Qua FOREIGN KEY (Id_Qua) REFERENCES Tb_Quarto (Id_Quar),
Quar_Cs SMALLINT NOT NULL,
Gar_Cs SMALLINT NOT NULL,
Desc_Cs VARCHAR(50),
Visi_Cs ENUM ('S', 'N')
)AUTO_INCREMENT = 2101;

CREATE TABLE Tb_RestricaoCs(
Id_Rest SMALLINT PRIMARY KEY AUTO_INCREMENT,
Id_Cs SMALLINT,
CONSTRAINT fk_Id_Cs FOREIGN KEY (Id_Cs) REFERENCES Tb_Casa (Id_Cs),
Gen_Rest ENUM ('M', 'F', 'A'),
Fum_Rest ENUM ('S', 'N'),
Anim_Rest ENUM ('S', 'N'),
IdaMin_Rest SMALLINT NOT NULL,
IdaMax_Rest SMALLINT NOT NULL
)AUTO_INCREMENT = 8801;

CREATE TABLE Tb_Residente(
Id_Rsd SMALLINT PRIMARY KEY AUTO_INCREMENT,
Id_Usr SMALLINT,
CONSTRAINT fk_Id_User FOREIGN KEY (Id_Usr) REFERENCES Tb_Usuario (Id_Usr),
Id_Cs SMALLINT,
CONSTRAINT fk_Id_Cas FOREIGN KEY (Id_Cs) REFERENCES Tb_Casa (Id_Cs)
)AUTO_INCREMENT = 3801;

CREATE TABLE Tb_Administrador(
Id_Adm SMALLINT PRIMARY KEY AUTO_INCREMENT,
Id_Rsd SMALLINT ,
CONSTRAINT fk_Id_Resd FOREIGN KEY (Id_Rsd) REFERENCES Tb_Residente (Id_Rsd),
Dt_Inicio DATE NOT NULL
)AUTO_INCREMENT = 9101;

CREATE TABLE Tb_Convite(
Id_Convite SMALLINT PRIMARY KEY AUTO_INCREMENT,
Id_Adm SMALLINT,
CONSTRAINT fk_Id_Adm FOREIGN KEY (Id_Adm) REFERENCES Tb_Administrador (Id_Adm),
Id_Usr SMALLINT,
CONSTRAINT fk_Id_Us FOREIGN KEY (Id_Usr) REFERENCES Tb_Usuario (Id_Usr),
Dt_Con DATE NOT NULL,
DtResp_Con DATE NOT NULL,
Resp_Con ENUM('S', 'N') /* SIM - NÃO */
)AUTO_INCREMENT = 9301;

CREATE TABLE Tb_Tarefa(
Id_Trf SMALLINT PRIMARY KEY AUTO_INCREMENT,
Id_Rs SMALLINT,
CONSTRAINT fk_Id_Rs FOREIGN KEY (Id_Rs) REFERENCES Tb_Residente (Id_Rsd),
Tit_Trf VARCHAR(20) NOT NULL,
Desc_Trf VARCHAR(80),
DtCriacao_Trf DATE NOT NULL,
DtPrazo_Trf DATE NOT NULL,
DtRea_Trf DATE NOT NULL
)AUTO_INCREMENT = 5001;

CREATE TABLE Tb_StatusTrf(
DtPrazo_Trf DATE NOT NULL,
DtRea_Trf DATE NOT NULL,
PRIMARY KEY(DtPrazo_Trf, DtRea_Trf),
Status_Trf ENUM ('A', 'I', 'C') /* Ativa - Inativa - Concluida */
);

CREATE TABLE Tb_TarefaPeriodica(
Id_TrfPd SMALLINT PRIMARY KEY AUTO_INCREMENT,
Id_Trf SMALLINT,
CONSTRAINT fk_Id_Trf FOREIGN KEY (Id_Trf) REFERENCES Tb_Tarefa (Id_Trf),
Tipo_Trf ENUM ('D', 'S', 'M', 'A') /* Diária, Semanal, Mensal, Anual */
)AUTO_INCREMENT = 6001;

CREATE TABLE Tb_StatusPerio(
DtPrazo_Trf DATE NOT NULL,
DtRea_Trf DATE NOT NULL,
PRIMARY KEY(DtPrazo_Trf, DtRea_Trf),
Status_Trf ENUM ('S', 'N') /* Sim - Não */
);

CREATE TABLE Tb_Despesa(
Id_Desp SMALLINT PRIMARY KEY AUTO_INCREMENT,
Tit_Desp VARCHAR (20) NOT NULL,
DtFix_Desp DATE NOT NULL,
Valor_Desp DECIMAL (6, 2)
)AUTO_INCREMENT = 7401;

CREATE TABLE Tb_DespResidente(
Id_Desp SMALLINT,
Id_Rsd SMALLINT,
PRIMARY KEY (Id_Desp, Id_Rsd),
DtPag_Desp DATE NOT NULL,
ValPag_Desp DECIMAL (6, 2),
Pgd_Desp ENUM ('C', 'R'), /* CONTRIBUINTE - RESPONSAVEL */
Forma_Desp ENUM ('T', 'P') /* TOTAL - PARCIAL */
);

CREATE TABLE Tb_StatusDesp(
DtFix_Desp DATE NOT NULL,
DtPag_Desp DATE NOT NULL,
PRIMARY KEY (DtFix_Desp, DtPag_Desp),
Atra_Desp ENUM ('S', 'N') /* SIM - NÃO */
);

CREATE TABLE Tb_Registro(
Id_Reg SMALLINT PRIMARY KEY AUTO_INCREMENT,
Id_Cs SMALLINT,
Id_Rsd SMALLINT,
Desc_Reg VARCHAR(80),
DtRea_Reg DATE NOT NULL
)AUTO_INCREMENT = 4701;

CREATE TABLE Tb_RegTarefa(
Id_Reg SMALLINT,
Id_Trf SMALLINT,
PRIMARY KEY (Id_Reg, Id_Trf)
);

CREATE TABLE Tb_RegDespesa(
Id_Reg SMALLINT,
Id_Desp SMALLINT,
PRIMARY KEY (Id_Reg, Id_Desp)
);

CREATE TABLE Tb_Penalidade(
Id_Pena SMALLINT PRIMARY KEY AUTO_INCREMENT,
Desc_Pena VARCHAR(80)
)AUTO_INCREMENT = 8601;

/* Entidade Associativa */
CREATE TABLE Tb_TrfPena(
Id_Pena SMALLINT,
Id_Trf SMALLINT,
PRIMARY KEY (Id_Pena, Id_Trf)
);

CREATE TABLE Tb_Vaga(
Id_Vag SMALLINT PRIMARY KEY AUTO_INCREMENT,
Id_Cs SMALLINT,
CONSTRAINT fk_Id_Casa FOREIGN KEY (Id_Cs) REFERENCES Tb_Casa (Id_Cs),
Quan_Vag SMALLINT
)AUTO_INCREMENT = 2401;

/* Alimentando as relações */

INSERT INTO Tb_Usuario (CPF_Usr, Nome_Usr, Sobrenome_Usr, Senha_Usr, Email_Usr, DtNasc_Usr, 
Gen_Usr, Fum_Usr, Anim_Usr) VALUES 
('56387126914', 'Maria', 'Eduarda', 'PeterChen##', 'edu.maria@gmail.com', 
'1995-04-30', 'F',  'S', 'S');
INSERT INTO Tb_Usuario (CPF_Usr, Nome_Usr, Sobrenome_Usr, Senha_Usr, Email_Usr, DtNasc_Usr, 
Gen_Usr, Fum_Usr, Anim_Usr) VALUES 
('60024859237', 'Jose', 'Garcia', 'sql23', 'jose53@hotmail.com', 
'1990-01-23', 'M',  'N', 'N');
INSERT INTO Tb_Usuario (CPF_Usr, Nome_Usr, Sobrenome_Usr, Senha_Usr, Email_Usr, DtNasc_Usr, 
Gen_Usr, Fum_Usr, Anim_Usr) VALUES 
('46105462062', 'Renata', 'Medeiros', 'cobol500', 'renata.med@hotmail.com', 
'1996-12-04', 'F',  'N', 'N');
INSERT INTO Tb_Usuario (CPF_Usr, Nome_Usr, Sobrenome_Usr, Senha_Usr, Email_Usr, DtNasc_Usr, 
Gen_Usr, Fum_Usr, Anim_Usr) VALUES 
('87460989120', 'Lucas', 'Oliveira', '$$DBMS$$', 'lukass10@gmail.com', 
'2000-09-07', 'M',  'N', 'S');
INSERT INTO Tb_Usuario (CPF_Usr, Nome_Usr, Sobrenome_Usr, Senha_Usr, Email_Usr, DtNasc_Usr, 
Gen_Usr, Fum_Usr, Anim_Usr) VALUES 
('47395467241', 'Daniel', 'Ribeiro', 'LinguagemC#', 'daniel.games@gmail.com', 
'1982-03-02', 'M',  'N', 'N');
INSERT INTO Tb_Usuario (CPF_Usr, Nome_Usr, Sobrenome_Usr, Senha_Usr, Email_Usr, DtNasc_Usr, 
Gen_Usr, Fum_Usr, Anim_Usr) VALUES 
('76795204140', 'Luana', 'Amaral', 'JAVAPOO', 'lu123@gmail.com', 
'1999-10-01', 'F',  'S', 'N');
INSERT INTO Tb_Usuario (CPF_Usr, Nome_Usr, Sobrenome_Usr, Senha_Usr, Email_Usr, DtNasc_Usr, 
Gen_Usr, Fum_Usr, Anim_Usr) VALUES 
('95646740470', 'Mateus', 'Junior', '768&15ABC', 'mateusmateusjj@hotmail.com', 
'1987-05-23', 'M',  'S', 'N');
INSERT INTO Tb_Usuario (CPF_Usr, Nome_Usr, Sobrenome_Usr, Senha_Usr, Email_Usr, DtNasc_Usr, 
Gen_Usr, Fum_Usr, Anim_Usr) VALUES 
('97856222076', 'Priscila', 'Goncalves', 'Pencil%%', 'pri.goncalves@hotmail.com', 
'2000-09-07', 'F',  'N', 'S');

INSERT INTO Tb_PreferenciaUsr (Bair_Pref, Cid_Pref, Est_Pref, Fum_Pref, Anim_Pref, Gen_Pref, 
Gar_Pref, Quar_Pref) VALUES ('Jardim Novo Horizonte', 'Sao Paulo', 'SP', 'S', 'S', 'F', 0, 1);
INSERT INTO Tb_PreferenciaUsr (Bair_Pref, Cid_Pref, Est_Pref, Fum_Pref, Anim_Pref, Gen_Pref, 
Gar_Pref, Quar_Pref) VALUES ('Parque Savoy', 'Londrina', 'PR', 'S', 'S', 'M', 1, 2);
INSERT INTO Tb_PreferenciaUsr (Bair_Pref, Cid_Pref, Est_Pref, Fum_Pref, Anim_Pref, Gen_Pref, 
Gar_Pref, Quar_Pref) VALUES ('Vila Tostoi', 'Niteroi', 'RJ', 'N', 'N', 'F', 0, 1);
INSERT INTO Tb_PreferenciaUsr (Bair_Pref, Cid_Pref, Est_Pref, Fum_Pref, Anim_Pref, Gen_Pref, 
Gar_Pref, Quar_Pref) VALUES ('Jardim Novo Horizonte', 'Sao Paulo', 'SP', 'S', 'S', 'I', 1, 1);
INSERT INTO Tb_PreferenciaUsr (Bair_Pref, Cid_Pref, Est_Pref, Fum_Pref, Anim_Pref, Gen_Pref, 
Gar_Pref, Quar_Pref) VALUES ('Vila Tostoi', 'Niteroi', 'RJ', 'S', 'N', 'M', 0, 1);
INSERT INTO Tb_PreferenciaUsr (Bair_Pref, Cid_Pref, Est_Pref, Fum_Pref, Anim_Pref, Gen_Pref, 
Gar_Pref, Quar_Pref) VALUES ('Vila Tostoi', 'Niteroi', 'RJ', 'S', 'N', 'I', 0, 1);
INSERT INTO Tb_PreferenciaUsr (Bair_Pref, Cid_Pref, Est_Pref, Fum_Pref, Anim_Pref, Gen_Pref, 
Gar_Pref, Quar_Pref) VALUES ('Parque Savoy', 'Londrina', 'PR', 'N', 'S', 'F', 2, 1);
INSERT INTO Tb_PreferenciaUsr (Bair_Pref, Cid_Pref, Est_Pref, Fum_Pref, Anim_Pref, Gen_Pref, 
Gar_Pref, Quar_Pref) VALUES ('Jardim Novo Horizonte', 'Sao Paulo', 'SP', 'S', 'S', 'I', 0, 2);

INSERT INTO Tb_Quarto (Tipo_Quar, Com_Quar) VALUES ('N', 'S');
INSERT INTO Tb_Quarto (Tipo_Quar, Com_Quar) VALUES ('N', 'N');
INSERT INTO Tb_Quarto (Tipo_Quar, Com_Quar) VALUES ('S', 'S');
INSERT INTO Tb_Quarto (Tipo_Quar, Com_Quar) VALUES ('S', 'N');

INSERT INTO Tb_Casa (Logra_Cs, Num_Cs, Bair_Cs, Cid_Cs, Est_Cs, CEP_Cs, Gen_Cs, Fum_Cs, 
Anim_Cs, Id_Qua, Quar_Cs, Gar_Cs, Desc_Cs, Visi_Cs) VALUES ('Rua Belo Monte', '90', 
'Jardim Novo Horizonte', 'Sao Paulo', 'SP', '59763021', 'A', 'S', 'N', 3201, 3, 2, 
'Local Tranquilo', 'S');
INSERT INTO Tb_Casa (Logra_Cs, Num_Cs, Bair_Cs, Cid_Cs, Est_Cs, CEP_Cs, Gen_Cs, Fum_Cs, 
Anim_Cs, Id_Qua, Quar_Cs, Gar_Cs, Desc_Cs, Visi_Cs) VALUES ('Avenida Figueiredo', '23', 
'Parque Savoy', 'Londrina', 'PR', '87635863', 'A', 'N', 'N', 3201, 2, 2, 
'Proximo ao mercado', 'S');
INSERT INTO Tb_Casa (Logra_Cs, Num_Cs, Bair_Cs, Cid_Cs, Est_Cs, CEP_Cs, Gen_Cs, Fum_Cs, 
Anim_Cs, Id_Qua, Quar_Cs, Gar_Cs, Desc_Cs, Visi_Cs) VALUES ('Rua Fernandez', '10', 
'Jardim Novo Horizonte', 'Sao Paulo', 'SP', '01245637', 'F', 'N', 'N', 3203, 4, 3, 
'Area Nobre', 'S');
INSERT INTO Tb_Casa (Logra_Cs, Num_Cs, Bair_Cs, Cid_Cs, Est_Cs, CEP_Cs, Gen_Cs, Fum_Cs, 
Anim_Cs, Id_Qua, Quar_Cs, Gar_Cs, Desc_Cs, Visi_Cs) VALUES ('Travessa Laranjeiras', '56', 
'Parque Savoy', 'Londrina', 'PR', '87361911', 'A', 'N', 'N', 3202, 3, 1, 
'Local Tranquilo', 'S');
INSERT INTO Tb_Casa (Logra_Cs, Num_Cs, Bair_Cs, Cid_Cs, Est_Cs, CEP_Cs, Gen_Cs, Fum_Cs, 
Anim_Cs, Id_Qua, Quar_Cs, Gar_Cs, Desc_Cs, Visi_Cs) VALUES ('Rua Linda Vista', '8', 
'Parque Savoy', 'Londrina', 'PR', '00897332', 'M', 'S', 'N', 3201, 3, 0, 
'Proximo ao mercado', 'S');
INSERT INTO Tb_Casa (Logra_Cs, Num_Cs, Bair_Cs, Cid_Cs, Est_Cs, CEP_Cs, Gen_Cs, Fum_Cs, 
Anim_Cs, Id_Qua, Quar_Cs, Gar_Cs, Desc_Cs, Visi_Cs) VALUES ('Travessa Mexericos', '129', 
'Vila Tostoi', 'Niteroi', 'RJ', '88726199', 'A', 'N', 'N', 3202, 5, 1, 
'Proximo ao mercado', 'S');
INSERT INTO Tb_Casa (Logra_Cs, Num_Cs, Bair_Cs, Cid_Cs, Est_Cs, CEP_Cs, Gen_Cs, Fum_Cs, 
Anim_Cs, Id_Qua, Quar_Cs, Gar_Cs, Desc_Cs, Visi_Cs) VALUES ('Rua Antonio Veloso', '11', 
'Vila Tostoi', 'Niteroi', 'RJ', '83368221', 'A', 'N', 'N', 3201, 4, 2, 
'Local Tranquilo', 'S');
INSERT INTO Tb_Casa (Logra_Cs, Num_Cs, Bair_Cs, Cid_Cs, Est_Cs, CEP_Cs, Gen_Cs, Fum_Cs, 
Anim_Cs, Id_Qua, Quar_Cs, Gar_Cs, Desc_Cs, Visi_Cs) VALUES ('Avenida Japão', '27', 
'Jardim Novo Horizonte', 'Sao Paulo', 'SP', '97668201', 'A', 'N', 'S', 3204, 2, 4, 
'Area Nobre', 'N');

INSERT INTO Tb_RestricaoCs (Id_Cs, Gen_Rest, Fum_Rest, Anim_Rest, 
IdaMin_Rest, IdaMax_Rest) VALUES (2101, 'A', 'S', 'N', '16', '40');
INSERT INTO Tb_RestricaoCs (Id_Cs, Gen_Rest, Fum_Rest, Anim_Rest, 
IdaMin_Rest, IdaMax_Rest) VALUES (2102, 'A', 'N', 'N', '16', '40');
INSERT INTO Tb_RestricaoCs (Id_Cs, Gen_Rest, Fum_Rest, Anim_Rest, 
IdaMin_Rest, IdaMax_Rest) VALUES (2103, 'F', 'N', 'N', '16', '38');
INSERT INTO Tb_RestricaoCs (Id_Cs, Gen_Rest, Fum_Rest, Anim_Rest, 
IdaMin_Rest, IdaMax_Rest) VALUES (2104, 'A', 'N', 'N', '18', '40');
INSERT INTO Tb_RestricaoCs (Id_Cs, Gen_Rest, Fum_Rest, Anim_Rest, 
IdaMin_Rest, IdaMax_Rest) VALUES (2105, 'M', 'S', 'N', '16', '35');
INSERT INTO Tb_RestricaoCs (Id_Cs, Gen_Rest, Fum_Rest, Anim_Rest, 
IdaMin_Rest, IdaMax_Rest) VALUES (2106, 'A', 'N', 'N', '16', '40');
INSERT INTO Tb_RestricaoCs (Id_Cs, Gen_Rest, Fum_Rest, Anim_Rest, 
IdaMin_Rest, IdaMax_Rest) VALUES (2107, 'A', 'N', 'N', '16', '40');
INSERT INTO Tb_RestricaoCs (Id_Cs, Gen_Rest, Fum_Rest, Anim_Rest, 
IdaMin_Rest, IdaMax_Rest) VALUES (2108, 'A', 'N', 'S', '18', '40');

INSERT INTO Tb_Residente(Id_Usr, Id_Cs) VALUES (1001, 2101);
INSERT INTO Tb_Residente(Id_Usr, Id_Cs) VALUES (1002, 2102);
INSERT INTO Tb_Residente(Id_Usr, Id_Cs) VALUES (1003, 2103);
INSERT INTO Tb_Residente(Id_Usr, Id_Cs) VALUES (1004, 2104);
INSERT INTO Tb_Residente(Id_Usr, Id_Cs) VALUES (1005, 2105);
INSERT INTO Tb_Residente(Id_Usr, Id_Cs) VALUES (1006, 2106);
INSERT INTO Tb_Residente(Id_Usr, Id_Cs) VALUES (1007, 2107);
INSERT INTO Tb_Residente(Id_Usr, Id_Cs) VALUES (1008, 2108);

INSERT INTO Tb_Administrador(Id_Rsd, Dt_Inicio) VALUES (3802, '2020-12-12');
INSERT INTO Tb_Administrador(Id_Rsd, Dt_Inicio) VALUES (3804, '2021-03-02');

INSERT INTO Tb_Convite(Id_Adm, Id_Usr, Dt_Con, DtResp_Con, Resp_Con) VALUES 
(9102, 1008, '2018-06-01', '2018-07-09', 'S');
INSERT INTO Tb_Convite(Id_Adm, Id_Usr, Dt_Con, DtResp_Con, Resp_Con) VALUES 
(9101, 1001, '2019-03-21', '2019-03-21', 'N');
INSERT INTO Tb_Convite(Id_Adm, Id_Usr, Dt_Con, DtResp_Con, Resp_Con) VALUES 
(9101, 1003, '2020-11-12', '2020-12-05', 'S');
INSERT INTO Tb_Convite(Id_Adm, Id_Usr, Dt_Con, DtResp_Con, Resp_Con) VALUES 
(9102, 1007, '2021-01-10', '2021-02-12', 'S');

INSERT INTO Tb_Tarefa(Id_Rs, Tit_Trf, Desc_Trf, DtCriacao_Trf, DtPrazo_Trf, DtRea_Trf) VALUES
(3801, 'Lavar Louça', 'Lavar pratos e copos', '2020-12-03', '2020-12-05', '2020-12-05');
INSERT INTO Tb_Tarefa(Id_Rs, Tit_Trf, Desc_Trf, DtCriacao_Trf, DtPrazo_Trf, DtRea_Trf) VALUES
(3807, 'Varrer Quintal', 'Varrer todo o quintal', '2020-01-02', '2021-02-10', '2021-02-10');
INSERT INTO Tb_Tarefa(Id_Rs, Tit_Trf, Desc_Trf, DtCriacao_Trf, DtPrazo_Trf, DtRea_Trf) VALUES
(3805, 'Apagar Luz', 'Apagar as luzes ao sair', '2021-02-25', '2021-03-27', '2021-03-02');
INSERT INTO Tb_Tarefa(Id_Rs, Tit_Trf, Desc_Trf, DtCriacao_Trf, DtPrazo_Trf, DtRea_Trf) VALUES
(3803, 'Limpar Janela', 'Limpar apenas com agua', '2021-02-26', '2021-03-20', '2021-02-28');

INSERT INTO Tb_StatusTrf(DtPrazo_Trf, DtRea_Trf, Status_Trf) VALUES 
('2020-12-05', '2020-12-15', 'C');
INSERT INTO Tb_StatusTrf(DtPrazo_Trf, DtRea_Trf, Status_Trf) VALUES 
('2021-02-10', '2021-02-10', 'I');
INSERT INTO Tb_StatusTrf(DtPrazo_Trf, DtRea_Trf, Status_Trf) VALUES 
('2021-03-27', '2021-03-02', 'A');
INSERT INTO Tb_StatusTrf(DtPrazo_Trf, DtRea_Trf, Status_Trf) VALUES 
('2021-03-20', '2019-04-05', 'A');

INSERT INTO Tb_TarefaPeriodica(Id_Trf, Tipo_Trf) VALUES (5001, 'D');
INSERT INTO Tb_TarefaPeriodica(Id_Trf, Tipo_Trf) VALUES (5002, 'S');
INSERT INTO Tb_TarefaPeriodica(Id_Trf, Tipo_Trf) VALUES (5001, 'M');
INSERT INTO Tb_TarefaPeriodica(Id_Trf, Tipo_Trf) VALUES (5001, 'A');

INSERT INTO Tb_StatusPerio(DtPrazo_Trf, DtRea_Trf, Status_Trf) VALUES
('2020-12-13', '2020-12-15', 'N');
INSERT INTO Tb_StatusPerio(DtPrazo_Trf, DtRea_Trf, Status_Trf) VALUES
('2021-01-04', '2020-12-10', 'N');
INSERT INTO Tb_StatusPerio(DtPrazo_Trf, DtRea_Trf, Status_Trf) VALUES
('2020-05-03', '2021-03-02', 'N');
INSERT INTO Tb_StatusPerio(DtPrazo_Trf, DtRea_Trf, Status_Trf) VALUES
('2019-04-05', '2019-04-05', 'S');

INSERT INTO Tb_Despesa(Tit_Desp, DtFix_Desp, Valor_Desp) VALUES
('Luz', '2020-09-08', 50.9);
INSERT INTO Tb_Despesa(Tit_Desp, DtFix_Desp, Valor_Desp) VALUES
('Agua','2020-01-10', 89.3);
INSERT INTO Tb_Despesa(Tit_Desp, DtFix_Desp, Valor_Desp) VALUES
('Telefone', '2020-12-12', 77.1);
INSERT INTO Tb_Despesa(Tit_Desp, DtFix_Desp, Valor_Desp) VALUES
('Internet', '2021-01-30', 12.8);

INSERT INTO Tb_DespResidente(
Id_Desp, Id_RsD, DtPag_Desp, ValPag_Desp, Pgd_Desp, Forma_Desp) VALUES 
(7401, 1005, '2020-12-10', 20.2, 'C', 'T');
INSERT INTO Tb_DespResidente(
Id_Desp, Id_RsD, DtPag_Desp, ValPag_Desp, Pgd_Desp, Forma_Desp) VALUES 
(7402, 1008, '2021-03-02', 0, 'R', 'P');
INSERT INTO Tb_DespResidente(
Id_Desp, Id_RsD, DtPag_Desp, ValPag_Desp, Pgd_Desp, Forma_Desp) VALUES 
(7403, 1001, '2021-01-23', 12.8, 'C', 'T');
INSERT INTO Tb_DespResidente(
Id_Desp, Id_RsD, DtPag_Desp, ValPag_Desp, Pgd_Desp, Forma_Desp) VALUES 
(7404, 1003, '2021-01-01', 2.3, 'C', 'P');

INSERT INTO Tb_StatusDesp(DtFix_Desp, DtPag_Desp, Atra_Desp) VALUES
('2020-09-08', '2020-12-10', 'N');
INSERT INTO Tb_StatusDesp(DtFix_Desp, DtPag_Desp, Atra_Desp) VALUES
('2020-01-10', '2021-03-02', 'S');
INSERT INTO Tb_StatusDesp(DtFix_Desp, DtPag_Desp, Atra_Desp) VALUES
('2020-12-12', '2021-01-23', 'N');
INSERT INTO Tb_StatusDesp(DtFix_Desp, DtPag_Desp, Atra_Desp) VALUES
('2021-01-30', '2021-01-15', 'N');

INSERT INTO Tb_Registro(Id_Cs, Id_Rsd, Desc_Reg, DtRea_Reg) VALUES
(2103, 1002, 'Excluiu', '2021-02-01');
INSERT INTO Tb_Registro(Id_Cs, Id_Rsd, Desc_Reg, DtRea_Reg) VALUES
(2107, 1006, 'Adicionou', '2021-02-24');

INSERT INTO Tb_RegTarefa(Id_Reg, Id_Trf) VALUES (4701, 5001);

INSERT INTO Tb_RegDespesa(Id_Reg, Id_Desp) VALUES (4701, 7403);

INSERT INTO Tb_Penalidade(Desc_Pena) VALUES ('Aumento 12.5 % no aluguel');
INSERT INTO Tb_Penalidade(Desc_Pena) VALUES ('Pagar 80 % da contade água');
INSERT INTO Tb_Penalidade(Desc_Pena) VALUES ('Pagar 50 % conta de Luz');

INSERT INTO Tb_TrfPena (Id_Pena, Id_Trf) VALUES (5002, 8603);
INSERT INTO Tb_TrfPena (Id_Pena, Id_Trf) VALUES (5003, 8601);

INSERT INTO Tb_Vaga (Id_Cs, Quan_Vag) VALUES (2105, 1);
INSERT INTO Tb_Vaga (Id_Cs, Quan_Vag) VALUES (2108, 6);

/* Manipulando Dados */

UPDATE Tb_Vaga SET Quan_Vag = 3 WHERE Id_Vag = 2401;
DELETE FROM Tb_Penalidade WHERE Id_Pena = 8603;
SELECT Tit_Desp FROM Tb_Despesa;
DELETE FROM Tb_RegTarefa WHERE Id_Reg = 4701;
ALTER TABLE Tb_Registro ADD NOVO_CAMPO INT; 

SHOW TABLES;

/* Exibindo valores */

SELECT * FROM Tb_Usuario;
SELECT * FROM Tb_PreferenciaUsr;
SELECT * FROM Tb_Quarto;
SELECT * FROM Tb_Casa;
SELECT * FROM Tb_RestricaoCs;
SELECT * FROM Tb_Residente;
SELECT * FROM Tb_Administrador;
SELECT * FROM Tb_Convite;
SELECT * FROM Tb_Tarefa;
SELECT * FROM Tb_StatusTrf;
SELECT * FROM Tb_TarefaPeriodica;
SELECT * FROM Tb_StatusPerio;
SELECT * FROM Tb_Despesa;
SELECT * FROM Tb_DespResidente;
SELECT * FROM Tb_StatusDesp;
SELECT * FROM Tb_Registro;
SELECT * FROM Tb_RegTarefa;
SELECT * FROM Tb_RegDespesa;
SELECT * FROM Tb_Penalidade;
SELECT * FROM Tb_TrfPena;
SELECT * FROM Tb_Vaga;

/* Apagando Tabelas (Relações) */

DROP TABLE Tb_Usuario;
DROP TABLE Tb_PreferenciaUsr;
DROP TABLE Tb_Quarto;
DROP TABLE Tb_Casa;
DROP TABLE Tb_RestricaoCs;
DROP TABLE Tb_Residente;
DROP TABLE Tb_Administrador;
DROP TABLE Tb_Convite;
DROP TABLE Tb_Tarefa;
DROP TABLE Tb_StatusTrf;
DROP TABLE Tb_TarefaPeriodica;
DROP TABLE Tb_StatusPerio;
DROP TABLE Tb_Despesa;
DROP TABLE Tb_DespResidente;
DROP TABLE Tb_StatusDesp;
DROP TABLE Tb_Registro;
DROP TABLE Tb_RegTarefa;
DROP TABLE Tb_RegDespesa;
DROP TABLE Tb_Penalidade;
DROP TABLE Tb_TrfPena;
DROP TABLE Tb_Vaga;
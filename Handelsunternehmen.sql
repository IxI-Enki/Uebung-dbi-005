/*    UEBUNG-005 -- HANDELSUNTERNEHMEN    */
/*        3ACIFT        JAN RITT          */
/*  Description: Simple Worker Database   */
 
/*        -- delete existing/conflicting tables --
drop table VERWALTUNGSMITARBEITER; drop table MITARBEITER; drop table ABTEILUNG; 
*/
          -- create tables --
create table ABTEILUNG              (AbteilungsNr           NUMBER PRIMARY KEY, 
                                     AbteilungsBezeichnung  VARCHAR(20));         
          
create table MITARBEITER            (IDNumber               NUMBER PRIMARY KEY,
                                     AbteilungsNr           NUMBER REFERENCES ABTEILUNG(AbteilungsNr),
                                     MirtarbeiterName       VARCHAR(20),
                                     MitarbeiterAnschrift   VARCHAR(40));

create table VERWALTUNGSMITARBEITER (VerwaltungsNr          NUMBER PRIMARY KEY,
                                     IDNumber               NUMBER REFERENCES MITARBEITER(IDNumber),
                                     FachlVor               NUMBER REFERENCES MITARBEITER(IDNumber),
                                     DisziVor               NUMBER REFERENCES MITARBEITER(IDNumber));
									
          -- fill tables --

/* ABTEILUNG */
insert into ABTEILUNG VALUES (1, 'Innendienst');
insert into ABTEILUNG VALUES (2, 'Auﬂendienst');
insert into ABTEILUNG VALUES (3, 'Verwaltung');

/* MITARBEITER */
insert into MITARBEITER VALUES (1, 2, 'Frank Schuft', 'Testweg 1, 2345 Stadt');
insert into MITARBEITER VALUES (2, 3, 'Moritz Hofer', 'Testweg 67, 2345 Stadt');
insert into MITARBEITER VALUES (3, 3, 'Gerald Schuft', 'Testweg 3, 2345 Stadt');
insert into MITARBEITER VALUES (4, 1, 'Andrea Hofer', 'Testweg 25, 2345 Stadt');
insert into MITARBEITER VALUES (5, 3, 'Sabine Haus', 'Testweg 7, 2345 Stadt');
insert into MITARBEITER VALUES (6, 3, 'Hans Seer', 'Testweg 3, 2345 Stadt');

/* VERWALTUNGSMITARBEITER */
insert into VERWALTUNGSMITARBEITER VALUES(1,2,5,6);
insert into VERWALTUNGSMITARBEITER VALUES(2,3,2,6);
insert into VERWALTUNGSMITARBEITER VALUES(3,5,5,6);
insert into VERWALTUNGSMITARBEITER VALUES(4,6,2,6);

          -- output tables --                                                             
select * from VERWALTUNGSMITARBEITER;
select * from MITARBEITER;
select * from ABTEILUNG;





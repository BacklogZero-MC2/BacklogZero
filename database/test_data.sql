INSERT INTO public.users (username,email,"password",created_timestamp) VALUES
	 ('ana123','ana123@email.com','sifra123','2024-05-06 10:00:00+02'),
	 ('marko456','marko456@email.com','password456','2024-05-06 10:30:00+02'),
	 ('ivana789','ivana789@email.com','lozinka789','2024-05-06 11:00:00+02'),
	 ('petar112','petar112@email.com','pass1234','2024-05-06 11:30:00+02'),
	 ('maja345','maja345@email.com','lozinka456','2024-05-06 12:00:00+02'),
	 ('igor678','igor678@email.com','pass456','2024-05-06 12:30:00+02'),
	 ('lana910','lana910@email.com','lana123','2024-05-06 13:00:00+02'),
	 ('dario111','dario111@email.com','password123','2024-05-06 13:30:00+02'),
	 ('nikola222','nikola222@email.com','lozinka222','2024-05-06 14:00:00+02'),
	 ('lena333','lena333@email.com','pass333','2024-05-06 14:30:00+02');

INSERT INTO public.tags (author_id,"name",created_timestamp) VALUES
	 (1,'programiranje','2024-05-06 10:00:00+02'),
	 (2,'matematika','2024-05-06 10:30:00+02'),
	 (3,'fizika','2024-05-06 11:00:00+02'),
	 (4,'biologija','2024-05-06 11:30:00+02'),
	 (5,'kemija','2024-05-06 12:00:00+02'),
	 (6,'povijest','2024-05-06 12:30:00+02'),
	 (7,'jezik','2024-05-06 13:00:00+02'),
	 (8,'umjetnost','2024-05-06 13:30:00+02'),
	 (9,'psihologija','2024-05-06 14:00:00+02'),
	 (10,'ekonomija','2024-05-06 14:30:00+02');

INSERT INTO public.collections ("name",user_id,created_timestamp) VALUES
	 ('programiranje_kolekcija',1,'2024-05-06 10:00:00+02'),
	 ('matematika_kolekcija',2,'2024-05-06 10:30:00+02'),
	 ('fizika_kolekcija',3,'2024-05-06 11:00:00+02'),
	 ('biologija_kolekcija',4,'2024-05-06 11:30:00+02'),
	 ('kemija_kolekcija',5,'2024-05-06 12:00:00+02'),
	 ('povijest_kolekcija',6,'2024-05-06 12:30:00+02'),
	 ('jezik_kolekcija',7,'2024-05-06 13:00:00+02'),
	 ('umjetnost_kolekcija',8,'2024-05-06 13:30:00+02'),
	 ('psihologija_kolekcija',9,'2024-05-06 14:00:00+02'),
	 ('ekonomija_kolekcija',10,'2024-05-06 14:30:00+02');

INSERT INTO public.documents (author_id,tag_id,title,searchable_text,url,num_of_upvotes,num_of_downvotes,created_timestamp,last_updated_timestamp) VALUES
	 (1,1,'Osnove Pythona','Učenje osnovnih koncepata Python programiranja.','1',10,2,'2024-04-18 18:32:56.637826','2024-04-18 18:32:56.637826+02'),
	 (2,2,'Algebra','Temeljna algebraička pravila i operacije.','2',15,3,'2024-03-30 15:31:13.089439','2024-03-30 15:31:13.089439+01'),
	 (3,3,'Osnove Newtonove fizike','Osnovna načela Newtonove fizike i primjena na svakodnevne situacije.','3',12,1,'2024-03-20 17:19:46.020088','2024-03-20 17:19:46.020088+01'),
	 (4,4,'Genetika','Osnove genetike i nasljeđivanja gena.','4',8,0,'2024-04-26 09:01:37.778263','2024-04-26 09:01:37.778263+02'),
	 (5,5,'Periodni sustav elemenata','Pregled periodnog sustava elemenata i njihovih svojstava.','5',20,5,'2024-04-06 02:19:55.114573','2024-04-06 02:19:55.114573+02'),
	 (6,6,'Drugi svjetski rat','Povijesni pregled i analiza događaja Drugog svjetskog rata.','6',18,4,'2024-04-11 05:00:36.272192','2024-04-11 05:00:36.272192+02'),
	 (7,7,'Engleski gramatika','Pregled gramatičkih pravila i vježbe iz engleskog jezika.','7',14,2,'2024-05-01 14:18:42.891167','2024-05-01 14:18:42.891167+02'),
	 (8,8,'Uvod u slikarstvo','Pregled različitih stilova i tehnika slikanja.','8',11,3,'2024-05-01 13:44:06.692673','2024-05-01 13:44:06.692673+02'),
	 (9,9,'Osnove psihologije','Učenje osnovnih koncepata psihologije i ljudskog ponašanja.','9',16,2,'2024-04-25 20:45:00.233566','2024-04-25 20:45:00.233566+02'),
	 (10,10,'Mikroekonomija','Osnove mikroekonomije i tržišnih mehanizama.','10',13,1,'2024-03-28 12:44:15.975556','2024-03-28 12:44:15.975556+01');
INSERT INTO public.documents (author_id,tag_id,title,searchable_text,url,num_of_upvotes,num_of_downvotes,created_timestamp,last_updated_timestamp) VALUES
	 (1,1,'Napredne teme u Pythonu','Napredne tehnike i koncepti Python programiranja.','11',8,1,'2024-03-17 05:45:46.279192','2024-03-17 05:45:46.279192+01'),
	 (2,2,'Geometrija','Osnovni koncepti geometrije i primjena u svakodnevnom životu.','12',10,0,'2024-04-08 19:25:47.968828','2024-04-08 19:25:47.968828+02'),
	 (3,3,'Osnove elektromagnetizma','Razumijevanje elektromagnetskog polja i elektromagnetskih pojava.','13',15,2,'2024-03-11 05:07:41.534766','2024-03-11 05:07:41.534766+01'),
	 (4,4,'Ekologija','Temeljni koncepti ekologije i odnosa organizama s okolišem.','14',12,3,'2024-03-11 14:47:06.175323','2024-03-11 14:47:06.175323+01'),
	 (5,5,'Kemijske reakcije','Vrste kemijskih reakcija i njihove primjene.','15',18,0,'2024-04-12 19:24:17.017018','2024-04-12 19:24:17.017018+02'),
	 (6,6,'Razvoj demokracije','Povijesni pregled razvoja demokratskih ideja i institucija.','16',22,5,'2024-04-24 22:44:59.278889','2024-04-24 22:44:59.278889+02'),
	 (7,7,'Francuski jezik','Osnove francuskog jezika i vježbe iz govora i pisanja.','17',17,1,'2024-04-05 18:02:09.521136','2024-04-05 18:02:09.521136+02'),
	 (8,8,'Povijest umjetnosti','Pregled razvoja umjetnosti kroz povijest i analiza ključnih umjetničkih djela.','18',20,3,'2024-04-25 17:26:59.825808','2024-04-25 17:26:59.825808+02'),
	 (9,9,'Socijalna psihologija','Analiza ljudskog ponašanja u društvenim kontekstima.','19',14,0,'2024-04-20 17:46:48.131799','2024-04-20 17:46:48.131799+02'),
	 (10,10,'Makroekonomija','Analiza makroekonomskih pokazatelja i ekonomskih politika.','20',19,2,'2024-03-29 16:06:16.576557','2024-03-29 16:06:16.576557+01');
INSERT INTO public.documents (author_id,tag_id,title,searchable_text,url,num_of_upvotes,num_of_downvotes,created_timestamp,last_updated_timestamp) VALUES
	 (1,1,'Web Development','Učenje web development tehnologija i praksa izrade web stranica.','21',25,4,'2024-04-22 07:02:34.414987','2024-04-22 07:02:34.414987+02'),
	 (2,2,'Statistika','Osnovni koncepti statistike i primjena u analizi podataka.','22',21,1,'2024-03-18 22:40:02.935291','2024-03-18 22:40:02.935291+01'),
	 (3,3,'Termodinamika','Osnovni principi termodinamike i primjena u svakodnevnom životu.','23',16,2,'2024-04-14 15:06:42.129046','2024-04-14 15:06:42.129046+02'),
	 (4,4,'Evolucijska biologija','Teorija evolucije i mehanizmi genetičke promjene.','24',23,3,'2024-03-13 11:44:09.840607','2024-03-13 11:44:09.840607+01'),
	 (5,5,'Organska kemija','Struktura organskih spojeva i reakcije.','25',27,5,'2024-04-03 09:23:26.797598','2024-04-03 09:23:26.797598+02'),
	 (6,6,'Hladni rat','Povijesni pregled i analiza događaja Hladnog rata.','26',20,3,'2024-03-25 09:25:34.536965','2024-03-25 09:25:34.536965+01'),
	 (7,7,'Njemački jezik','Osnove njemačkog jezika i vježbe iz govora i pisanja.','27',18,2,'2024-04-06 10:04:40.232452','2024-04-06 10:04:40.232452+02'),
	 (8,8,'Suvremena umjetnost','Analiza suvremenih umjetničkih praksi i trendova.','28',25,4,'2024-03-30 04:47:12.190009','2024-03-30 04:47:12.190009+01'),
	 (9,9,'Kognitivna psihologija','Proučavanje kognitivnih procesa i percepcije.','29',22,1,'2024-03-20 13:24:08.605557','2024-03-20 13:24:08.605557+01'),
	 (10,10,'Međunarodna trgovina','Teorija i praksa međunarodne trgovine i ekonomskih odnosa.','30',19,0,'2024-04-08 15:24:51.248961','2024-04-08 15:24:51.248961+02');
INSERT INTO public.documents (author_id,tag_id,title,searchable_text,url,num_of_upvotes,num_of_downvotes,created_timestamp,last_updated_timestamp) VALUES
	 (1,1,'Data Science','Osnove analize podataka i statističke obrade podataka.','31',30,2,'2024-03-29 00:23:18.53517','2024-03-29 00:23:18.53517+01'),
	 (2,2,'Kombinatorika','Osnovni koncepti kombinatorike i primjene u rješavanju problema.','32',24,3,'2024-04-05 14:18:39.063284','2024-04-05 14:18:39.063284+02'),
	 (3,3,'Optika','Osnove optike i valne optike.','33',17,0,'2024-03-27 08:03:22.514519','2024-03-27 08:03:22.514519+01'),
	 (4,4,'Molekularna biologija','Struktura i funkcija molekula u živim organizmima.','34',28,5,'2024-04-02 16:12:38.895701','2024-04-02 16:12:38.895701+02'),
	 (5,5,'Anorganska kemija','Svojstva i reakcije anorganskih spojeva.','35',31,2,'2024-03-30 17:09:27.300504','2024-03-30 17:09:27.300504+01'),
	 (6,6,'Osnove antike','Pregled povijesti antičkih civilizacija i njihovih doprinosa.','36',26,1,'2024-04-29 19:17:20.997672','2024-04-29 19:17:20.997672+02'),
	 (7,7,'Talijanski jezik','Osnove talijanskog jezika i vježbe iz govora i pisanja.','37',23,4,'2024-03-22 13:10:51.980355','2024-03-22 13:10:51.980355+01'),
	 (8,8,'Filmska umjetnost','Povijesni razvoj filmske umjetnosti i analiza filmskih stilova.','38',29,2,'2024-04-03 13:26:33.108361','2024-04-03 13:26:33.108361+02'),
	 (9,9,'Razvojna psihologija','Proučavanje razvoja ljudskog ponašanja tijekom životnog ciklusa.','39',27,3,'2024-04-06 08:15:02.585251','2024-04-06 08:15:02.585251+02'),
	 (10,10,'Ekonomski razvoj','Teorija i praksa ekonomskog razvoja i rasta.','40',24,1,'2024-03-31 11:03:47.862378','2024-03-31 11:03:47.862378+02');

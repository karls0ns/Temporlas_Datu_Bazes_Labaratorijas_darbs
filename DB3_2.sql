alter session set NLS_DATE_FORMAT = 'DD-MM-RRRR';

create or replace type ALGA_type as object(
    ID number(4),
    ALGA number(6,2),
    NO date,    
    LIDZ date
);

create or replace type ALGAS_type as table of ALGA_type;

create or replace type DARBINIEKS_type as object(
    ID number(4),
    VARDS varchar2(25),
    UZVARDS varchar2(25),    
    DZIMUMS varchar2(15)
);

create or replace type DARBINIEKI_type as object(
    DARBINIEKA_DATI DARBINIEKS_type,
    ALGAS ALGAS_type
);

create table DARBINIEKU_DATI of DARBINIEKI_type
nested table ALGAS store as algas_nested;

create or replace type TRASE_DARB_type as object(
    ID number(4),
    TRASES_NOSAUKUMS varchar2(25),
    NO date,    
    LIDZ date
);

create or replace type TRASE_DARBI_type as table of TRASE_DARB_type;

create table DARBINIEKI(
    DARBINIEKA_ID Number(4),
    DARBINIEKA_DATI REF DARBINIEKI_type,
    PERIODS TRASE_DARBI_type)
    nested table periods store as periodi_nested;

create or replace type APMEKLE_type as object(
    ID Number(4),
    TRASES_NOSAUKUMS varchar2(25),
    NO date,    
    LIDZ date
);

create table APMEKLETAJI(
    APMEKLETAJA_ID Number(4),
    VARDS varchar2(25),
    UZVARDS varchar2(25),
    APMEKLE APMEKLE_type
);



insert into APMEKLETAJI values(1,'Jânis','Skanis',APMEKLE_type(1,'Iesâcçju','01-05-2018','01-10-2018'));
insert into APMEKLETAJI values(2,'Guntris','Cakulis',APMEKLE_type(2,'Iesâcçju','01-05-2018','01-10-2018'));
insert into APMEKLETAJI values(3,'Inese','Admîdiòa',APMEKLE_type(3,'Iesâcçju','01-05-2018','05-07-2018'));
insert into APMEKLETAJI values(4,'Sîmanis','Svilpe',APMEKLE_type(4,'Iesâcçju','01-07-2018','01-10-2018'));
insert into APMEKLETAJI values(5,'Ilgona','Jumtiòa',APMEKLE_type(5,'Iesâcçju','01-07-2018','06-07-2018'));
insert into APMEKLETAJI values(6,'Jevgçòijs','Mûks',APMEKLE_type(6,'Tautas','01-05-2018','01-10-2018'));
insert into APMEKLETAJI values(7,'Dita','Dziïuma',APMEKLE_type(7,'Tautas','01-06-2018','01-09-2018'));
insert into APMEKLETAJI values(8,'Agris','Galçns',APMEKLE_type(8,'Tautas','05-07-2018','01-10-2018'));
insert into APMEKLETAJI values(9,'Valdemârs','Brisiòð',APMEKLE_type(9,'Tautas','01-05-2018','01-06-2018'));
insert into APMEKLETAJI values(10,'Solveiga','Brantiòa',APMEKLE_type(10,'Tautas','09-07-2018','07-08-2018'));
insert into APMEKLETAJI values(11,'Armands','Balulis',APMEKLE_type(11,'PRO','01-05-2018','01-06-2018'));
insert into APMEKLETAJI values(12,'Mairis','Berenfelds',APMEKLE_type(12,'PRO','05-09-2018','25-09-2018'));
insert into APMEKLETAJI values(13,'Zigmunds','Zvirgzdiòð',APMEKLE_type(13,'PRO','26-07-2018','01-08-2018'));
insert into APMEKLETAJI values(14,'Edmunds','Valdmans',APMEKLE_type(14,'PRO','01-05-2018','01-10-2018'));
insert into APMEKLETAJI values(15,'Amanta','Uþavniece',APMEKLE_type(15,'PRO','10-09-2018','02-10-2018'));

select a.apmekletaja_id , a.vards, a.uzvards, a.apmekle.id as ID, a.apmekle.trases_nosaukums as "Trases nosaukums",
    a.apmekle.no as No, a.apmekle.lidz as Lidz  from APMEKLETAJI a;
    
insert into DARBINIEKU_DATI values(
    DARBINIEKS_type(1,'Jânis','Ozols','Vîrietis'),
    ALGAS_type(ALGA_type(1,250.50,'01-04-2018','01-06-2018'),
        ALGA_type(2,300.00,'02-06-2018','01-08-2018'),
        ALGA_type(3,450.00,'02-08-2018',NULL)));        
insert into DARBINIEKU_DATI values(
    DARBINIEKS_type(2,'Inta','Kalniòa','Sieviete'),
    ALGAS_type(ALGA_type(4,350.45,'02-06-2018','01-08-2018'),
        ALGA_type(5,400.00,'02-08-2018','01-09-2018')));        
insert into DARBINIEKU_DATI values(
    DARBINIEKS_type(3,'Kârlis','Kazainis','Vîrietis'),
    ALGAS_type(ALGA_type(6,350.00,'01-04-2018','02-10-2018')));      
insert into DARBINIEKU_DATI values(
    DARBINIEKS_type(4,'Linda','Dreimane','Sieviete'),
    ALGAS_type(ALGA_type(7,275.75,'01-04-2018','01-06-2018'),
        ALGA_type(8,300.00,'02-06-2018','01-08-2018'),
        ALGA_type(9,350.00,'02-08-2018',NULL)));        
insert into DARBINIEKU_DATI values(
    DARBINIEKS_type(5,'Juris','Ilgzinis','Vîrietis'),
    ALGAS_type(ALGA_type(10,350.50,'01-05-2018','01-07-2018'),
        ALGA_type(11,450.00,'02-07-2018',NULL)));
insert into DARBINIEKU_DATI values(
    DARBINIEKS_type(6,'Maiga','Valdzaine','Sieviete'),
    ALGAS_type(ALGA_type(12,305.50,'01-06-2018','01-08-2018'),
        ALGA_type(13,495.00,'02-09-2018',NULL)));
        
select a.darbinieka_dati.ID as "Darbinieka ID", a.darbinieka_dati.vards as Vards, 
    a.darbinieka_dati.uzvards as Uzvards, a.darbinieka_dati.dzimums as Dzimums, 
    b.id, b.alga, b.no, b.lidz
from DARBINIEKU_DATI a, TABLE(A.ALGAS) b;


declare
    ats1 ref DARBINIEKI_type;
    ats2 ref DARBINIEKI_type;
    ats3 ref DARBINIEKI_type;
    ats4 ref DARBINIEKI_type;
    ats5 ref DARBINIEKI_type;
    ats6 ref DARBINIEKI_type;

begin
    select ref(a) into ats1 from DARBINIEKU_DATI a 
        where a.darbinieka_dati.ID = 1;
    select ref(a) into ats2 from DARBINIEKU_DATI a 
        where a.darbinieka_dati.ID = 2;
    select ref(a) into ats3 from DARBINIEKU_DATI a 
        where a.darbinieka_dati.ID = 3;
    select ref(a) into ats4 from DARBINIEKU_DATI a 
        where a.darbinieka_dati.ID = 4;
    select ref(a) into ats5 from DARBINIEKU_DATI a 
        where a.darbinieka_dati.ID = 5;
    select ref(a) into ats6 from DARBINIEKU_DATI a 
        where a.darbinieka_dati.ID = 6;

    insert into darbinieki
        values(1,ats1,TRASE_DARBI_type(
            TRASE_DARB_type(1,'Iesâcçju','01-04-2018','01-05-2018'),
            TRASE_DARB_type(2,'Iesâcçju','02-07-2018','1-08-2018')));
    insert into darbinieki
        values(2,ats2,TRASE_DARBI_type(
            TRASE_DARB_type(3,'Iesâcçju','02-06-2018','01-07-2018'),
            TRASE_DARB_type(4,'Tautas','02-07-2018','01-08-2018'),
            TRASE_DARB_type(5,'Tautas','02-08-2018','01-09-2018')));
    insert into darbinieki
        values(3,ats3,TRASE_DARBI_type(
            TRASE_DARB_type(6,'Tautas','01-04-2018','01-05-2018'),
            TRASE_DARB_type(7,'Tautas','02-05-2018','01-06-2018'),
            TRASE_DARB_type(8,'PRO','02-07-2018','01-08-2018'),
            TRASE_DARB_type(9,'PRO','02-08-2018','01-09-2018'),
            TRASE_DARB_type(10,'Iesâcçju','02-09-2018','01-10-2018')));
    insert into darbinieki
        values(4,ats4,TRASE_DARBI_type(
            TRASE_DARB_type(11,'PRO','01-04-2018','01-05-2018'),
            TRASE_DARB_type(12,'PRO','02-05-2018','01-06-2018'),
            TRASE_DARB_type(13,'PRO','02-06-2018','01-07-2018'),
            TRASE_DARB_type(14,'Iesâcçju','02-08-2018','01-09-2018'),
            TRASE_DARB_type(15,'Iesâcçju','02-10-2018','01-11-2018')));
    insert into darbinieki
        values(5,ats5,TRASE_DARBI_type(
            TRASE_DARB_type(16,'Iesâcçju','02-05-2018','01-06-2018'),
            TRASE_DARB_type(17,'Tautas','02-09-2018','01-10-2018'),
            TRASE_DARB_type(18,'Tautas','02-10-2018','01-11-2018')));
    insert into darbinieki
        values(6,ats6,TRASE_DARBI_type(
            TRASE_DARB_type(19,'Tautas','02-06-2018','01-07-2018'),
            TRASE_DARB_type(20,'PRO','02-09-2018','01-10-2018'),
            TRASE_DARB_type(21,'PRO','02-10-2018','01-11-2018')));  
end;

select a.darbinieka_id as "Darbinieka ID", deref(a.darbinieka_dati).darbinieka_dati.vards as Vards,
    deref(a.darbinieka_dati).darbinieka_dati.uzvards as uzvards,
    deref(a.darbinieka_dati).darbinieka_dati.dzimums as dzimums,
    b.alga, b.no as "Alga No", b.lidz as "Alga lidz",
    c.ID, c.trases_nosaukums as Trase, c.no as "Periods no", c.lidz as "Periods lidz"
from darbinieki a, table(deref(a.darbinieka_dati).algas) b, table(a.periods) c;

-- VAICÂJUMS 1
create or replace type vaicajums_1_type as object(
    VARDS varchar2(25),
    UZVARDS varchar2(25), 
    ALGA number(6,2),
    NO date,    
    LIDZ date,
    member function STRADA(V1_datums in date) return number  
);

create or replace type body vaicajums_1_type as
  member function STRADA(V1_datums in date) return number is
  begin
    if ((V1_datums >= self.NO AND V1_datums <= self.LIDZ) or
	 (self.LIDZ IS NULL AND V1_datums >= self.NO)) then
	  return 1; 
	else
	  return 0;
	end if;
  end STRADA;
end;

create or replace view V1_SKATS of vaicajums_1_type
    with object identifier(vards, uzvards) as
    select a.darbinieka_dati.vards, a.darbinieka_dati.uzvards, b.alga, b.no, b.lidz
    from DARBINIEKU_DATI a, TABLE(A.ALGAS) b;
    
select a.vards as "Vârds", a.uzvards as "Uzvârds", a.no as "No", a.lidz as "Lîdz",
    case when value(a).STRADA(to_date('02-05-2018', 'DD-MM-RRRR')) = 1
            then 'Strâdâ'
        when value(a).STRADA(to_date('02-05-2018', 'DD-MM-RRRR')) = 0
            then 'Nestrâda' END as "Nodarbinâtîba"
    from v1_skats A;
    
select a.vards as "Vârds", a.uzvards as "Uzvârds", a.alga as "Alga"
    from v1_skats a
    where value(a).strada(to_date('07-07-2018','dd-mm-rrrr'))=1;
    
select a.vards as "Vârds", a.uzvards as "Uzvârds", a.alga as "Alga", a.no as "No", a.lidz as "Lîdz"
    from v1_skats a
    where value(a).strada(to_date('07-07-2018','dd-mm-rrrr'))=1; 
    
    
--2. vaicâjums
create or replace type vaicajums_2_type as object(
    ID number(4),
    VARDS varchar2(25),
    UZVARDS varchar2(25),
    ALGA number(6,2),
    NO date,    
    LIDZ date,
    member function PIRMS(v2_datums in date) return number  
);

create or replace type body vaicajums_2_type as
  member function PIRMS(v2_datums in date) return number is
  begin
    if (self.no < v2_datums) then 
	  return 1;  
	else
	  return 0;
	end if;
  end PIRMS;
end;

create or replace view V2_SKATS of vaicajums_2_type
    with object identifier(vards, uzvards) as
    select a.darbinieka_dati.id, a.darbinieka_dati.vards, a.darbinieka_dati.uzvards, b.alga, b.no, b.lidz
    from DARBINIEKU_DATI a, TABLE(A.ALGAS) b;

select * from V2_SKATS;

select a.vards as "Vârds", a.uzvards as "Uzvârds", a.alga as "Alga"
    from V2_SKATS a
    where value(a).PIRMS(to_date('31-05-2018','dd-mm-rrrr'))=1;

select a.vards as "Vârds", a.uzvards as "Uzvârds", a.alga as "Alga", a.no "No"
    from V2_SKATS a
    where value(a).PIRMS(to_date('31-05-2018','dd-mm-rrrr'))=1;

-- 3. vaicâjums
create or replace type vaicajums_3_type as object(
    ID number(4),
    VARDS varchar2(25),
    UZVARDS varchar2(25),
    TRASES_NOSAUKUMS varchar2(25),
    NO date,    
    LIDZ date,
    order member function SATIEK(v3_objekts in vaicajums_3_type) return number  
);

create or replace type body vaicajums_3_type as
  order member function SATIEK(v3_objekts in vaicajums_3_type) return number is
  begin
    if (self.LIDZ = v3_objekts.NO-1) then 
	  return 1;  
	else
	  return 0;
	end if;
  end SATIEK;
end;

create or replace view V3_SKATS of vaicajums_3_type
    with object identifier(ID, NO) as
    select a.darbinieka_id, deref(a.darbinieka_dati).darbinieka_dati.vards,
    deref(a.darbinieka_dati).darbinieka_dati.uzvards,
    b.trases_nosaukums, b.no, b.lidz
    from darbinieki a, table(a.periods) b;
    
select * from V3_SKATS;

select a.vards as "Vârds pirms", a.uzvards as "Uzvârds pirms", b.vards as "Vârds pçc", 
    b.uzvards as "Uzvârds pçc", a.trases_nosaukums as "Trase"
    from v3_skats a, v3_skats b
    where value(a).satiek(value(b))=1 and a.trases_nosaukums = b.trases_nosaukums and a.id <> b.id
    order by a.trases_nosaukums;
    

select a.vards as "Vârds pirms", a.uzvards as "Uzvârds pirms", b.vards as "Vârds pçc", 
    b.uzvards as "Uzvârds pçc", a.trases_nosaukums as "Trase", a.lidz as "Pirms beigas", b.no as "Pçc sâkums"
    from v3_skats a, v3_skats b
    where value(a).satiek(value(b))=1 and a.trases_nosaukums = b.trases_nosaukums and a.id <> b.id
    order by a.trases_nosaukums;

--4. vaicâjums
create or replace type v4_unfold_type as object(
    NO date,
    LIDZ date
);

create or replace type v4_unfold as table of v4_unfold_type;

create or replace function UNFOLD(apmekle in apmekle_type)
    return v4_unfold as rezultats
    v4_unfold := v4_unfold();
    no date := apmekle.NO;
    temp date := apmekle.NO;
    lidz date := apmekle.LIDZ;
  
begin      
	while (lidz > no) LOOP
        rezultats.extend;
        temp := no;
        no := no + 1;  
        rezultats(rezultats.count) := v4_unfold_type(temp,no);	
	end loop;
	return rezultats;	
end UNFOLD;

select a.vards as "Vârds", a.uzvards as "Uzvârds", b.no as "No", b.lidz as "Lîdz"
    from apmekletaji a, table(unfold(a.apmekle)) b; 


select distinct a.vards as "Vârds", a.uzvards as "Uzvârds",
    count(vards) OVER(order by a.apmekle.trases_nosaukums) as "Dienu skaits"
    from apmekletaji a, table(unfold(a.apmekle)) b
    order by ("Dienu skaits") asc;
    
select count(*) as "Dienu skaits", 'Unfold' as "Metode"
    from apmekletaji a, table(unfold(a.apmekle)) b
    where a.vards = 'Amanta'
union   
select a.apmekle.lidz - a.apmekle.no as "Dienu skaits", 'Aprçíins' as "Metode"
    from apmekletaji a
    where a.vards = 'Amanta';
    
----------------------------------------------------------------------------------------------------
--5. vaicâjums

create or replace type v5_objekts_type as object(
    NO date,
    LIDZ date,  
    member function SATIEK(v5_objekts in v5_objekts_type) return number
);

create or replace type body v5_objekts_type as
    member function SATIEK(v5_objekts in v5_objekts_type) return number is
    begin
        if (self.lidz < v5_objekts.no and self.lidz is not null) then
            return 1;
        else
            return 0;
        end if;
    end SATIEK;
end;

create or replace type v5_objekti_type as table of v5_objekts_type;

create or replace type apvienojums_rut as object(
    rezultats v5_objekti_type, 
    
    static function ODCIAggregateInitialize(
        sctx in out apvienojums_rut) return number,  

    member function ODCIAggregateIterate(
        self in out apvienojums_rut, 
        v5_objekts in v5_objekts_type) return number,
	
    member function  ODCIAggregateTerminate(
        self in apvienojums_rut, 
        objekts_rez out v5_objekti_type, flags in number) 
        return number,
  
    member function ODCIAggregateMerge(
        self in out apvienojums_rut, 
        ctx2 in apvienojums_rut) return number
);

------------------------------------------------------------
create or replace type body apvienojums_rut as
    static function ODCIAggregateInitialize(
        sctx in out apvienojums_rut) return number is
        begin
            sctx := apvienojums_rut(v5_objekti_type()); 
            return ODCIConst.Success; 
        end ODCIAggregateInitialize;
  
    member function ODCIAggregateIterate(
        self in out apvienojums_rut, 
            v5_objekts in v5_objekts_type) return number is
                i number;
                j number;
                k number;
                begin
                    i := 1;
                    while (i <= rezultats.count and rezultats(i).SATIEK(v5_objekts) = 1
                        ) loop
                            i := i + 1;
                    end loop;
                    if (i > rezultats.count) then
                        rezultats.extend;
                        rezultats(i) := v5_objekts;
                    elsif (v5_objekts.SATIEK(rezultats(i)) = 1) then 
                        rezultats.extend;	  
                        for j in reverse (i + 1)..rezultats.count loop
                            rezultats(j) := rezultats(j - 1);
                        end loop;
                        rezultats(i) := v5_objekts;
                    else  
                        if (rezultats(i).no > v5_objekts.no) then
                            rezultats(i).no := v5_objekts.no; 
                        end if;
                    
                        if (rezultats(i).lidz is not null) then
                            if (v5_objekts.lidz > rezultats(i).lidz or
                                v5_objekts.lidz is null) then
                                rezultats(i).lidz := v5_objekts.lidz;
		   
                                if (rezultats(i).lidz IS NULL) then 
                                    rezultats.trim(rezultats.count - i);
                                end if;
                            
                                j := i + 1;
                                while (j <= rezultats.count) loop
                                    if (rezultats(i).satiek(rezultats(j)) = 0) then
                                        if (rezultats(j).lidz > rezultats(i).lidz or 
                                        rezultats(j).lidz is null ) then
                                            rezultats(i).lidz := rezultats(j).lidz;
                                        end if;
                                        if (rezultats(i).lidz is null) then 
                                            rezultats.trim(rezultats.count - i);
                                        else
                                            for k in j..(rezultats.count - 1) loop
                                                rezultats(k) := rezultats(k + 1);
                                            end loop;
                                            rezultats.trim;
                                        end if;
                                    else
                                        j := rezultats.count + 1;
                                    end if;
                                end loop;	   
                            end if;
                        end if;
                    end if;	
        return (odciconst.success); 
    end ODCIAggregateIterate;
  
    member function ODCIAggregateTerminate(
        self in apvienojums_rut, objekts_rez out v5_objekti_type, flags in number) 
        return Number is
            begin
                objekts_rez := self.rezultats;
                return (odciconst.success);
    end ODCIAggregateTerminate;

  
    member function ODCIAggregateMerge(
        self IN OUT apvienojums_rut, 
        ctx2 in apvienojums_rut) 
        return number is
            begin
                return ODCIConst.Success; 
            end ODCIAggregateMerge;
    end;


create or replace function apvienojums(input v5_objekts_type)
    return v5_objekti_type
    aggregate using apvienojums_rut;
  
 
 ------------------------------------------------------ 
select distinct e.darbinieka_ID as ID, 
    deref(e.darbinieka_dati).darbinieka_dati.vards as "Vârds",
    deref(e.darbinieka_dati).darbinieka_dati.uzvards as "Uzvards",
    f.trases_nosaukums as "Trase", D.NO as "No", D.LIDZ as "Lîdz"    
    from(Select a.darbinieka_ID as dID, 
            apvienojums(v5_objekts_type(b.no, b.lidz)) as apv
            from darbinieki a, table(a.periods) b
            where b.trases_nosaukums ='Iesâcçju'
            Group By darbinieka_ID) c,
        table(c.apv) d, darbinieki e, table(e.periods) f
    where e.darbinieka_ID = c.dID and f.trases_nosaukums = 'Iesâcçju'
union
select distinct e.darbinieka_ID as ID, 
    deref(e.darbinieka_dati).darbinieka_dati.vards as "Vârds",
    deref(e.darbinieka_dati).darbinieka_dati.uzvards as "Uzvards",
    f.trases_nosaukums as "Trase", D.NO as "No", D.LIDZ as "Lîdz"    
    from(Select a.darbinieka_ID as dID, 
            apvienojums(v5_objekts_type(b.no, b.lidz)) as apv
            from darbinieki a, table(a.periods) b
            where b.trases_nosaukums ='Tautas'
            Group By darbinieka_ID) c,
        table(c.apv) d, darbinieki e, table(e.periods) f
    where e.darbinieka_ID = c.dID and f.trases_nosaukums = 'Tautas'
union    
select distinct e.darbinieka_ID as ID, 
    deref(e.darbinieka_dati).darbinieka_dati.vards as "Vârds",
    deref(e.darbinieka_dati).darbinieka_dati.uzvards as "Uzvards",
    f.trases_nosaukums as "Trase", D.NO as "No", D.LIDZ as "Lîdz"    
    from(Select a.darbinieka_ID as dID, 
            apvienojums(v5_objekts_type(b.no, b.lidz)) as apv
            from darbinieki a, table(a.periods) b
            where b.trases_nosaukums ='PRO'
            Group By darbinieka_ID) c,
        table(c.apv) d, darbinieki e, table(e.periods) f
    where e.darbinieka_ID = c.dID and f.trases_nosaukums = 'PRO'
    order by ("No");

------------------------------------------------------------------------------------------------------------------
-- 6. Vaicâjums
create or replace type vaicajums_6_type as object(
    APMEKLETAJA_ID number(4),
    VARDS varchar2(25),
    UZVARDS varchar2(25),
    TRASES_NOSAUKUMS varchar2(25),
    NO date,    
    LIDZ date,    
    member function ATRODAS(V6_No in date, V6_Lidz in date) return number  
);

create or replace type body vaicajums_6_type as
  member function ATRODAS(V6_No in date, V6_Lidz in date) return number is
  begin
    if V6_No >= self.NO  or
        V6_No > self.Lidz or
        self.no < V6_Lidz then
      return 1; 
    else
      return 0;
    end if;
  end ATRODAS;
end;

create or replace view V6_SKATS of vaicajums_6_type
    with object identifier(vards, uzvards) as
    select a.apmekletaja_ID, a.vards, a.uzvards, a.apmekle.trases_nosaukums, a.apmekle.no, a.apmekle.lidz
    from APMEKLETAJI a;


select a.trases_nosaukums as Trase, a.vards As "Apmeklçtâja Vârds", a.uzvards as "Apmeklçtâja uzvârds", a.no as "Apmeklç No", 
    a.lidz as "Apmekle Lîdz", deref(b.darbinieka_dati).darbinieka_dati.vards as "Darbinieka Vârds", 
    deref(b.darbinieka_dati).darbinieka_dati.uzvards as "Darbinieka Uzvârds", c.no as "Strada No", c.lidz as "Strâdâ Lîdz",
    '07-07-2018' as "Interesç No",'10-07-2018' as "Interesç Lîdz" 
    from v6_skats a, darbinieki b, table(b.periods) c
    where value(a).ATRODAS((to_date('07-07-2018','dd-mm-rrrr')),(to_date('10-07-2018','dd-mm-rrrr')))=1 and
    a.trases_nosaukums = 'Tautas' and 
    a.trases_nosaukums = c.trases_nosaukums and
    deref(b.darbinieka_dati).darbinieka_dati.vards = 'Inta' and
    (c.no <= '07-07-2018' or c.no <= '10-07-2018' or c.lidz <='10-07-2018');
    
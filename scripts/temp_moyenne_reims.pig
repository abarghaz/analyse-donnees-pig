  donnees = load 'meteo.csv' using PigStorage(';') as (omm:int, date, temperature:int);
    reims = filter donnees by omm == 7072 and date matches '.* 12:00:00';
grp_reims = group reims by omm;
 temp_moy = foreach grp_reims generate AVG(reims.temperature)/10;
dump temp_moy;

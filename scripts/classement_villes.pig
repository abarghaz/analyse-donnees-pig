   donnees = load 'meteo.csv' using PigStorage(';') as (omm:int, date, temperature:int);
  stations = load 'stations.csv' using PigStorage(';') as (id:int, ville, omm:int);
releve_12h = filter donnees by date matches '2012-11-15 12:00:00';
       jnt = join releve_12h by omm, stations by omm;
tri_releve = order jnt by temperature asc;
     les_5 = limit tri_releve 5;
    villes = foreach les_5 generate ville;
dump villes;

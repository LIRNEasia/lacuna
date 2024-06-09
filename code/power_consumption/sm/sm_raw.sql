CREATE SCHEMA IF NOT EXISTS "raw";

CREATE TABLE IF NOT EXISTS "raw"."power_consumption_sm"(
  
  "serial" TEXT,
  "customerref" TEXT,
  "timestamp" TEXT,
  "obis" TEXT,
  "date" TEXT,
  "time" TEXT,
  "importkwh(kwh)" TEXT,
  "exportkwh(kwh)" TEXT,
  "importkvarh(kvarh)" TEXT,
  "exportkvarh(kvarh)" TEXT,
  "phaseainstcurrent(a)" TEXT,
  "phasebinstcurrent(a)" TEXT,
  "phasecinstcurrent(a)" TEXT,
  "phaseainstvoltage(v)" TEXT,
  "phasebinstvoltage(v)" TEXT,
  "phasecinstvoltage(v)" TEXT,
  "powerfactor" TEXT,
  "avgimportkw(kw)" TEXT,
  "avgexportkw(kw)" TEXT,
  "avgimportkva(kva)" TEXT,
  "avgexportkva(kva)" TEXT,
  "avgcurrent(v)" TEXT,
  "avgvoltage(v)" TEXT
);



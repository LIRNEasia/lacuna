CREATE SCHEMA IF NOT EXISTS "clean";

CREATE TABLE IF NOT EXISTS "clean"."power_consumption_sm" (
  "SERIAL" TEXT,
  "CUSTOMER_REF" TEXT,
  "TIMESTAMP" TEXT,
  "OBIS" TEXT,
  "DATE" DATE, -- DATE, TIME is in a format that can be converted to a date, time
  "TIME" TIME, 
  "IMPORT_KWH" NUMERIC,
  "EXPORT_KWH" NUMERIC,
  "IMPORT_KVARH" NUMERIC,
  "EXPORT_KVARH" NUMERIC,
  "PHASE_A_INST_CURRENT" NUMERIC,
  "PHASE_B_INST_CURRENT" NUMERIC,
  "PHASE_C_INST_CURRENT" NUMERIC,
  "PHASE_A_INST_VOLTAGE" NUMERIC,
  "PHASE_B_INST_VOLTAGE" NUMERIC,
  "PHASE_C_INST_VOLTAGE" NUMERIC,
  "POWER_FACTOR" NUMERIC, 
  "AVG_IMPORT_KW" NUMERIC,
  "AVG_EXPORT_KW" NUMERIC,
  "AVG_IMPORT_KVA" NUMERIC,
  "AVG_EXPORT_KVA" NUMERIC,
  "AVG_CURRENT" NUMERIC,
  "AVG_VOLTAGE" NUMERIC 
);

CREATE INDEX IF NOT EXISTS idx_clean_sm_serial ON "clean"."power_consumption_sm" ("SERIAL");
CREATE INDEX IF NOT EXISTS idx_clean_sm_customer_ref ON "clean"."power_consumption_sm" ("CUSTOMER_REF");
CREATE INDEX IF NOT EXISTS idx_clean_sm_import ON "clean"."power_consumption_sm" ("IMPORT_KWH");
CREATE INDEX IF NOT EXISTS idx_clean_sm_export ON "clean"."power_consumption_sm" ("EXPORT_KWH");
CREATE INDEX IF NOT EXISTS idx_clean_sm_date ON "clean"."power_consumption_sm" ("DATE");
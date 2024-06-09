-- Create the customer_reference_lookup table

-- CREATE TABLE IF NOT EXISTS "raw"."customer_reference_lookup" (
--  "customerref" TEXT PRIMARY KEY
--);


-- Alter the power_consumption_sm table to add the foreign key constraint
-- ALTER TABLE "raw"."power_consumption_sm" 
-- ADD CONSTRAINT "type_constraint"
-- FOREIGN KEY ("customerref") REFERENCES "raw"."customer_reference_lookup" ("customerref");


CREATE TABLE IF NOT EXISTS "raw"."smart_meter_lookup" (
  "FIELD_NAME" TEXT PRIMARY KEY,
  "DESCRIPTION" TEXT
);


INSERT INTO "raw"."smart_meter_lookup"
VALUES 
('serial', 'Unique identifier for each record in the dataset'),
('customerref', 'Customer reference or identifier for the household'),
('timestamp', 'Date and time when the data was recorded'),
('obis', 'OBIS code is a numerical code which represents the physical quantity measured by the meter, Since all the values in this field in the dataset is LP. It should be related to something on Smart meter'),
('date','Date of the recorded data'),
('time', 'Time of the recorded data.'),
('importkwh(kwh)','Imported energy consumption in kilowatt-hours'),
('exportkwh(kwh)','Exported energy consumption in kilowatt-hours (if applicable)'),
('importkvarh(kvarh)','Imported reactive energy consumption in kilovolt-ampere reactive hours. Reactive power is the portion of apparent power that does no work but is stored and returned to the source. It is caused by inductive and capacitive loads. The term reactive comes from the fact that it is reactive to changes in current and voltage'),
('exportkvarh(kvarh)','Exported reactive energy consumption in kilovolt-ampere reactive hours (if applicable)'),
('phaseainstcurrent(a)','Instantaneous current in Phase A in Amperes'),
('phasebinstcurrent(a)','Instantaneous current in Phase B in Amperes'),
('phasecinstcurrent(a)','Instantaneous current in Phase C in Amperes'),
('phaseainstvoltage(v)','Instantaneous voltage in Phase A in Volts'),
('phasebinstvoltage(v)','Instantaneous voltage in Phase B in Volts'),
('phasecinstvoltage(v)','Instantaneous voltage in Phase C in Volts'),
('powerfactor','Power factor for the combined three-phase system'),
('avgimportkw(kw)','Average imported power in kilowatts'),
('avgexportkw(kw)','Average exported power in kilowatts (if applicable)'),
('avgimportkva(kva)','Average imported apparent power in kilovolt-amperes'),
('avgexportkva(kva)','Average exported apparent power in kilovolt-amperes (if applicable)'),
('avgcurrent(v)','Average current in Amperes'),
('avgvoltage(v)','Average voltage in Volts');
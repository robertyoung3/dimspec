DROP TRIGGER IF EXISTS trigger_additive_aliases_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_additive_aliases_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'additive_aliases' */ AFTER INSERT ON additive_aliases FOR EACH ROW WHEN NEW.additive_id NOT IN (SELECT id FROM norm_additives) BEGIN INSERT OR IGNORE INTO norm_additives (name) VALUES (NEW.additive_id); UPDATE additive_aliases SET additive_id = (iif(NEW.additive_id IN (SELECT id FROM norm_additives), NEW.additive_id, (SELECT id FROM norm_additives WHERE name = NEW.additive_id ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_additive_aliases_after_update; CREATE TRIGGER IF NOT EXISTS trigger_additive_aliases_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'additive_aliases' */ AFTER UPDATE ON additive_aliases FOR EACH ROW WHEN NEW.additive_id NOT IN (SELECT id FROM norm_additives) BEGIN INSERT OR IGNORE INTO norm_additives (name) VALUES (NEW.additive_id); UPDATE additive_aliases SET additive_id = (iif(NEW.additive_id IN (SELECT id FROM norm_additives), NEW.additive_id, (SELECT id FROM norm_additives WHERE name = NEW.additive_id ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_chromatography_descriptions_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_chromatography_descriptions_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'chromatography_descriptions' */ AFTER INSERT ON chromatography_descriptions FOR EACH ROW WHEN NEW.column_chemistry_id NOT IN (SELECT id FROM norm_column_chemistries) OR NEW.chromatography_types_id NOT IN (SELECT id FROM norm_chromatography_types) OR NEW.column_position_id NOT IN (SELECT id FROM norm_column_positions) OR NEW.system_vendor_id NOT IN (SELECT id FROM norm_vendors) OR NEW.column_vendor_id NOT IN (SELECT id FROM norm_vendors) BEGIN INSERT OR IGNORE INTO norm_column_chemistries (name) VALUES (NEW.column_chemistry_id); INSERT OR IGNORE INTO norm_chromatography_types (name, acronym) VALUES (NEW.chromatography_types_id, NULL); INSERT OR IGNORE INTO norm_column_positions (name) VALUES (NEW.column_position_id); INSERT OR IGNORE INTO norm_vendors (name) VALUES (NEW.system_vendor_id); INSERT OR IGNORE INTO norm_vendors (name) VALUES (NEW.column_vendor_id); UPDATE chromatography_descriptions SET column_chemistry_id = (iif(NEW.column_chemistry_id IN (SELECT id FROM norm_column_chemistries), NEW.column_chemistry_id, (SELECT id FROM norm_column_chemistries WHERE name = NEW.column_chemistry_id ORDER BY id LIMIT 1))), chromatography_types_id = (iif(NEW.chromatography_types_id IN (SELECT id FROM norm_chromatography_types), NEW.chromatography_types_id, (SELECT id FROM norm_chromatography_types WHERE name = NEW.chromatography_types_id OR acronym = NEW.chromatography_types_id ORDER BY id LIMIT 1))), column_position_id = (iif(NEW.column_position_id IN (SELECT id FROM norm_column_positions), NEW.column_position_id, (SELECT id FROM norm_column_positions WHERE name = NEW.column_position_id ORDER BY id LIMIT 1))), system_vendor_id = (iif(NEW.system_vendor_id IN (SELECT id FROM norm_vendors), NEW.system_vendor_id, (SELECT id FROM norm_vendors WHERE name = NEW.system_vendor_id ORDER BY id LIMIT 1))), column_vendor_id = (iif(NEW.column_vendor_id IN (SELECT id FROM norm_vendors), NEW.column_vendor_id, (SELECT id FROM norm_vendors WHERE name = NEW.column_vendor_id ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_chromatography_descriptions_after_update; CREATE TRIGGER IF NOT EXISTS trigger_chromatography_descriptions_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'chromatography_descriptions' */ AFTER UPDATE ON chromatography_descriptions FOR EACH ROW WHEN NEW.column_chemistry_id NOT IN (SELECT id FROM norm_column_chemistries) OR NEW.chromatography_types_id NOT IN (SELECT id FROM norm_chromatography_types) OR NEW.column_position_id NOT IN (SELECT id FROM norm_column_positions) OR NEW.system_vendor_id NOT IN (SELECT id FROM norm_vendors) OR NEW.column_vendor_id NOT IN (SELECT id FROM norm_vendors) BEGIN INSERT OR IGNORE INTO norm_column_chemistries (name) VALUES (NEW.column_chemistry_id); INSERT OR IGNORE INTO norm_chromatography_types (name, acronym) VALUES (NEW.chromatography_types_id, NULL); INSERT OR IGNORE INTO norm_column_positions (name) VALUES (NEW.column_position_id); INSERT OR IGNORE INTO norm_vendors (name) VALUES (NEW.system_vendor_id); INSERT OR IGNORE INTO norm_vendors (name) VALUES (NEW.column_vendor_id); UPDATE chromatography_descriptions SET column_chemistry_id = (iif(NEW.column_chemistry_id IN (SELECT id FROM norm_column_chemistries), NEW.column_chemistry_id, (SELECT id FROM norm_column_chemistries WHERE name = NEW.column_chemistry_id ORDER BY id LIMIT 1))), chromatography_types_id = (iif(NEW.chromatography_types_id IN (SELECT id FROM norm_chromatography_types), NEW.chromatography_types_id, (SELECT id FROM norm_chromatography_types WHERE name = NEW.chromatography_types_id OR acronym = NEW.chromatography_types_id ORDER BY id LIMIT 1))), column_position_id = (iif(NEW.column_position_id IN (SELECT id FROM norm_column_positions), NEW.column_position_id, (SELECT id FROM norm_column_positions WHERE name = NEW.column_position_id ORDER BY id LIMIT 1))), system_vendor_id = (iif(NEW.system_vendor_id IN (SELECT id FROM norm_vendors), NEW.system_vendor_id, (SELECT id FROM norm_vendors WHERE name = NEW.system_vendor_id ORDER BY id LIMIT 1))), column_vendor_id = (iif(NEW.column_vendor_id IN (SELECT id FROM norm_vendors), NEW.column_vendor_id, (SELECT id FROM norm_vendors WHERE name = NEW.column_vendor_id ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_compound_aliases_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_compound_aliases_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'compound_aliases' */ AFTER INSERT ON compound_aliases FOR EACH ROW WHEN NEW.alias_type NOT IN (SELECT id FROM norm_analyte_alias_references) BEGIN INSERT OR IGNORE INTO norm_analyte_alias_references (name, description, reference) VALUES (NEW.alias_type, NULL, NULL); UPDATE compound_aliases SET alias_type = (iif(NEW.alias_type IN (SELECT id FROM norm_analyte_alias_references), NEW.alias_type, (SELECT id FROM norm_analyte_alias_references WHERE name = NEW.alias_type OR description = NEW.alias_type OR reference = NEW.alias_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_compound_aliases_after_update; CREATE TRIGGER IF NOT EXISTS trigger_compound_aliases_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'compound_aliases' */ AFTER UPDATE ON compound_aliases FOR EACH ROW WHEN NEW.alias_type NOT IN (SELECT id FROM norm_analyte_alias_references) BEGIN INSERT OR IGNORE INTO norm_analyte_alias_references (name, description, reference) VALUES (NEW.alias_type, NULL, NULL); UPDATE compound_aliases SET alias_type = (iif(NEW.alias_type IN (SELECT id FROM norm_analyte_alias_references), NEW.alias_type, (SELECT id FROM norm_analyte_alias_references WHERE name = NEW.alias_type OR description = NEW.alias_type OR reference = NEW.alias_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_compounds_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_compounds_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'compounds' */ AFTER INSERT ON compounds FOR EACH ROW WHEN NEW.source_type NOT IN (SELECT id FROM norm_source_types) BEGIN INSERT OR IGNORE INTO norm_source_types (name, acronym, definition) VALUES (NEW.source_type, NULL, NULL); UPDATE compounds SET source_type = (iif(NEW.source_type IN (SELECT id FROM norm_source_types), NEW.source_type, (SELECT id FROM norm_source_types WHERE name = NEW.source_type OR acronym = NEW.source_type OR definition = NEW.source_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_compounds_after_update; CREATE TRIGGER IF NOT EXISTS trigger_compounds_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'compounds' */ AFTER UPDATE ON compounds FOR EACH ROW WHEN NEW.source_type NOT IN (SELECT id FROM norm_source_types) BEGIN INSERT OR IGNORE INTO norm_source_types (name, acronym, definition) VALUES (NEW.source_type, NULL, NULL); UPDATE compounds SET source_type = (iif(NEW.source_type IN (SELECT id FROM norm_source_types), NEW.source_type, (SELECT id FROM norm_source_types WHERE name = NEW.source_type OR acronym = NEW.source_type OR definition = NEW.source_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_fragment_aliases_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_fragment_aliases_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'fragment_aliases' */ AFTER INSERT ON fragment_aliases FOR EACH ROW WHEN NEW.alias_type NOT IN (SELECT id FROM norm_analyte_alias_references) BEGIN INSERT OR IGNORE INTO norm_analyte_alias_references (name, description, reference) VALUES (NEW.alias_type, NULL, NULL); UPDATE fragment_aliases SET alias_type = (iif(NEW.alias_type IN (SELECT id FROM norm_analyte_alias_references), NEW.alias_type, (SELECT id FROM norm_analyte_alias_references WHERE name = NEW.alias_type OR description = NEW.alias_type OR reference = NEW.alias_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_fragment_aliases_after_update; CREATE TRIGGER IF NOT EXISTS trigger_fragment_aliases_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'fragment_aliases' */ AFTER UPDATE ON fragment_aliases FOR EACH ROW WHEN NEW.alias_type NOT IN (SELECT id FROM norm_analyte_alias_references) BEGIN INSERT OR IGNORE INTO norm_analyte_alias_references (name, description, reference) VALUES (NEW.alias_type, NULL, NULL); UPDATE fragment_aliases SET alias_type = (iif(NEW.alias_type IN (SELECT id FROM norm_analyte_alias_references), NEW.alias_type, (SELECT id FROM norm_analyte_alias_references WHERE name = NEW.alias_type OR description = NEW.alias_type OR reference = NEW.alias_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_fragment_sources_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_fragment_sources_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'fragment_sources' */ AFTER INSERT ON fragment_sources FOR EACH ROW WHEN NEW.generation_type NOT IN (SELECT id FROM norm_generation_type) BEGIN INSERT OR IGNORE INTO norm_generation_type (name) VALUES (NEW.generation_type); UPDATE fragment_sources SET generation_type = (iif(NEW.generation_type IN (SELECT id FROM norm_generation_type), NEW.generation_type, (SELECT id FROM norm_generation_type WHERE name = NEW.generation_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_fragment_sources_after_update; CREATE TRIGGER IF NOT EXISTS trigger_fragment_sources_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'fragment_sources' */ AFTER UPDATE ON fragment_sources FOR EACH ROW WHEN NEW.generation_type NOT IN (SELECT id FROM norm_generation_type) BEGIN INSERT OR IGNORE INTO norm_generation_type (name) VALUES (NEW.generation_type); UPDATE fragment_sources SET generation_type = (iif(NEW.generation_type IN (SELECT id FROM norm_generation_type), NEW.generation_type, (SELECT id FROM norm_generation_type WHERE name = NEW.generation_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_logs_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_logs_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'logs' */ AFTER INSERT ON logs FOR EACH ROW WHEN NEW.effect NOT IN (SELECT id FROM norm_log_effect) OR NEW.executed_from NOT IN (SELECT id FROM norm_log_executed_from) BEGIN INSERT OR IGNORE INTO norm_log_effect (name) VALUES (NEW.effect); INSERT OR IGNORE INTO norm_log_executed_from (name) VALUES (NEW.executed_from); UPDATE logs SET effect = (iif(NEW.effect IN (SELECT id FROM norm_log_effect), NEW.effect, (SELECT id FROM norm_log_effect WHERE name = NEW.effect ORDER BY id LIMIT 1))), executed_from = (iif(NEW.executed_from IN (SELECT id FROM norm_log_executed_from), NEW.executed_from, (SELECT id FROM norm_log_executed_from WHERE name = NEW.executed_from ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_logs_after_update; CREATE TRIGGER IF NOT EXISTS trigger_logs_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'logs' */ AFTER UPDATE ON logs FOR EACH ROW WHEN NEW.effect NOT IN (SELECT id FROM norm_log_effect) OR NEW.executed_from NOT IN (SELECT id FROM norm_log_executed_from) BEGIN INSERT OR IGNORE INTO norm_log_effect (name) VALUES (NEW.effect); INSERT OR IGNORE INTO norm_log_executed_from (name) VALUES (NEW.executed_from); UPDATE logs SET effect = (iif(NEW.effect IN (SELECT id FROM norm_log_effect), NEW.effect, (SELECT id FROM norm_log_effect WHERE name = NEW.effect ORDER BY id LIMIT 1))), executed_from = (iif(NEW.executed_from IN (SELECT id FROM norm_log_executed_from), NEW.executed_from, (SELECT id FROM norm_log_executed_from WHERE name = NEW.executed_from ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_mobile_phases_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_mobile_phases_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'mobile_phases' */ AFTER INSERT ON mobile_phases FOR EACH ROW WHEN NEW.flow_units NOT IN (SELECT id FROM norm_flow_units) OR NEW.duration_units NOT IN (SELECT id FROM norm_duration_units) BEGIN INSERT OR IGNORE INTO norm_flow_units (name, abbreviation) VALUES (NEW.flow_units, NULL); INSERT OR IGNORE INTO norm_duration_units (name, abbreviation) VALUES (NEW.duration_units, NULL); UPDATE mobile_phases SET flow_units = (iif(NEW.flow_units IN (SELECT id FROM norm_flow_units), NEW.flow_units, (SELECT id FROM norm_flow_units WHERE name = NEW.flow_units OR abbreviation = NEW.flow_units ORDER BY id LIMIT 1))), duration_units = (iif(NEW.duration_units IN (SELECT id FROM norm_duration_units), NEW.duration_units, (SELECT id FROM norm_duration_units WHERE name = NEW.duration_units OR abbreviation = NEW.duration_units ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_mobile_phases_after_update; CREATE TRIGGER IF NOT EXISTS trigger_mobile_phases_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'mobile_phases' */ AFTER UPDATE ON mobile_phases FOR EACH ROW WHEN NEW.flow_units NOT IN (SELECT id FROM norm_flow_units) OR NEW.duration_units NOT IN (SELECT id FROM norm_duration_units) BEGIN INSERT OR IGNORE INTO norm_flow_units (name, abbreviation) VALUES (NEW.flow_units, NULL); INSERT OR IGNORE INTO norm_duration_units (name, abbreviation) VALUES (NEW.duration_units, NULL); UPDATE mobile_phases SET flow_units = (iif(NEW.flow_units IN (SELECT id FROM norm_flow_units), NEW.flow_units, (SELECT id FROM norm_flow_units WHERE name = NEW.flow_units OR abbreviation = NEW.flow_units ORDER BY id LIMIT 1))), duration_units = (iif(NEW.duration_units IN (SELECT id FROM norm_duration_units), NEW.duration_units, (SELECT id FROM norm_duration_units WHERE name = NEW.duration_units OR abbreviation = NEW.duration_units ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_ms_descriptions_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_ms_descriptions_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'ms_descriptions' */ AFTER INSERT ON ms_descriptions FOR EACH ROW WHEN NEW.ms_types_id NOT IN (SELECT id FROM norm_ms_types) OR NEW.vendor_id NOT IN (SELECT id FROM norm_vendors) BEGIN INSERT OR IGNORE INTO norm_ms_types (name, acronym) VALUES (NEW.ms_types_id, NULL); INSERT OR IGNORE INTO norm_vendors (name) VALUES (NEW.vendor_id); UPDATE ms_descriptions SET ms_types_id = (iif(NEW.ms_types_id IN (SELECT id FROM norm_ms_types), NEW.ms_types_id, (SELECT id FROM norm_ms_types WHERE name = NEW.ms_types_id OR acronym = NEW.ms_types_id ORDER BY id LIMIT 1))), vendor_id = (iif(NEW.vendor_id IN (SELECT id FROM norm_vendors), NEW.vendor_id, (SELECT id FROM norm_vendors WHERE name = NEW.vendor_id ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_ms_descriptions_after_update; CREATE TRIGGER IF NOT EXISTS trigger_ms_descriptions_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'ms_descriptions' */ AFTER UPDATE ON ms_descriptions FOR EACH ROW WHEN NEW.ms_types_id NOT IN (SELECT id FROM norm_ms_types) OR NEW.vendor_id NOT IN (SELECT id FROM norm_vendors) BEGIN INSERT OR IGNORE INTO norm_ms_types (name, acronym) VALUES (NEW.ms_types_id, NULL); INSERT OR IGNORE INTO norm_vendors (name) VALUES (NEW.vendor_id); UPDATE ms_descriptions SET ms_types_id = (iif(NEW.ms_types_id IN (SELECT id FROM norm_ms_types), NEW.ms_types_id, (SELECT id FROM norm_ms_types WHERE name = NEW.ms_types_id OR acronym = NEW.ms_types_id ORDER BY id LIMIT 1))), vendor_id = (iif(NEW.vendor_id IN (SELECT id FROM norm_vendors), NEW.vendor_id, (SELECT id FROM norm_vendors WHERE name = NEW.vendor_id ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_ms_methods_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_ms_methods_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'ms_methods' */ AFTER INSERT ON ms_methods FOR EACH ROW WHEN NEW.ionization NOT IN (SELECT id FROM norm_ionization) OR NEW.voltage_units NOT IN (SELECT id FROM norm_voltage_units) OR NEW.polarity NOT IN (SELECT id FROM norm_polarity_types) OR NEW.ce_desc NOT IN (SELECT id FROM norm_ce_desc) OR NEW.ce_units NOT IN (SELECT id FROM norm_ce_units) OR NEW.fragmentation NOT IN (SELECT id FROM norm_fragmentation_types) OR NEW.ms2_type NOT IN (SELECT id FROM norm_ms_n_types) BEGIN INSERT OR IGNORE INTO norm_ionization (name, acronym, import_text) VALUES (NEW.ionization, NULL, NULL); INSERT OR IGNORE INTO norm_voltage_units (name, abbreviation) VALUES (NEW.voltage_units, NULL); INSERT OR IGNORE INTO norm_polarity_types (name) VALUES (NEW.polarity); INSERT OR IGNORE INTO norm_ce_desc (name) VALUES (NEW.ce_desc); INSERT OR IGNORE INTO norm_ce_units (name, abbreviation) VALUES (NEW.ce_units, NULL); INSERT OR IGNORE INTO norm_fragmentation_types (name, acronym) VALUES (NEW.fragmentation, NULL); INSERT OR IGNORE INTO norm_ms_n_types (name, acronym, import_text) VALUES (NEW.ms2_type, NULL, NULL); UPDATE ms_methods SET ionization = (iif(NEW.ionization IN (SELECT id FROM norm_ionization), NEW.ionization, (SELECT id FROM norm_ionization WHERE name = NEW.ionization OR acronym = NEW.ionization OR import_text = NEW.ionization ORDER BY id LIMIT 1))), voltage_units = (iif(NEW.voltage_units IN (SELECT id FROM norm_voltage_units), NEW.voltage_units, (SELECT id FROM norm_voltage_units WHERE name = NEW.voltage_units OR abbreviation = NEW.voltage_units ORDER BY id LIMIT 1))), polarity = (iif(NEW.polarity IN (SELECT id FROM norm_polarity_types), NEW.polarity, (SELECT id FROM norm_polarity_types WHERE name = NEW.polarity ORDER BY id LIMIT 1))), ce_desc = (iif(NEW.ce_desc IN (SELECT id FROM norm_ce_desc), NEW.ce_desc, (SELECT id FROM norm_ce_desc WHERE name = NEW.ce_desc ORDER BY id LIMIT 1))), ce_units = (iif(NEW.ce_units IN (SELECT id FROM norm_ce_units), NEW.ce_units, (SELECT id FROM norm_ce_units WHERE name = NEW.ce_units OR abbreviation = NEW.ce_units ORDER BY id LIMIT 1))), fragmentation = (iif(NEW.fragmentation IN (SELECT id FROM norm_fragmentation_types), NEW.fragmentation, (SELECT id FROM norm_fragmentation_types WHERE name = NEW.fragmentation OR acronym = NEW.fragmentation ORDER BY id LIMIT 1))), ms2_type = (iif(NEW.ms2_type IN (SELECT id FROM norm_ms_n_types), NEW.ms2_type, (SELECT id FROM norm_ms_n_types WHERE name = NEW.ms2_type OR acronym = NEW.ms2_type OR import_text = NEW.ms2_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_ms_methods_after_update; CREATE TRIGGER IF NOT EXISTS trigger_ms_methods_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'ms_methods' */ AFTER UPDATE ON ms_methods FOR EACH ROW WHEN NEW.ionization NOT IN (SELECT id FROM norm_ionization) OR NEW.voltage_units NOT IN (SELECT id FROM norm_voltage_units) OR NEW.polarity NOT IN (SELECT id FROM norm_polarity_types) OR NEW.ce_desc NOT IN (SELECT id FROM norm_ce_desc) OR NEW.ce_units NOT IN (SELECT id FROM norm_ce_units) OR NEW.fragmentation NOT IN (SELECT id FROM norm_fragmentation_types) OR NEW.ms2_type NOT IN (SELECT id FROM norm_ms_n_types) BEGIN INSERT OR IGNORE INTO norm_ionization (name, acronym, import_text) VALUES (NEW.ionization, NULL, NULL); INSERT OR IGNORE INTO norm_voltage_units (name, abbreviation) VALUES (NEW.voltage_units, NULL); INSERT OR IGNORE INTO norm_polarity_types (name) VALUES (NEW.polarity); INSERT OR IGNORE INTO norm_ce_desc (name) VALUES (NEW.ce_desc); INSERT OR IGNORE INTO norm_ce_units (name, abbreviation) VALUES (NEW.ce_units, NULL); INSERT OR IGNORE INTO norm_fragmentation_types (name, acronym) VALUES (NEW.fragmentation, NULL); INSERT OR IGNORE INTO norm_ms_n_types (name, acronym, import_text) VALUES (NEW.ms2_type, NULL, NULL); UPDATE ms_methods SET ionization = (iif(NEW.ionization IN (SELECT id FROM norm_ionization), NEW.ionization, (SELECT id FROM norm_ionization WHERE name = NEW.ionization OR acronym = NEW.ionization OR import_text = NEW.ionization ORDER BY id LIMIT 1))), voltage_units = (iif(NEW.voltage_units IN (SELECT id FROM norm_voltage_units), NEW.voltage_units, (SELECT id FROM norm_voltage_units WHERE name = NEW.voltage_units OR abbreviation = NEW.voltage_units ORDER BY id LIMIT 1))), polarity = (iif(NEW.polarity IN (SELECT id FROM norm_polarity_types), NEW.polarity, (SELECT id FROM norm_polarity_types WHERE name = NEW.polarity ORDER BY id LIMIT 1))), ce_desc = (iif(NEW.ce_desc IN (SELECT id FROM norm_ce_desc), NEW.ce_desc, (SELECT id FROM norm_ce_desc WHERE name = NEW.ce_desc ORDER BY id LIMIT 1))), ce_units = (iif(NEW.ce_units IN (SELECT id FROM norm_ce_units), NEW.ce_units, (SELECT id FROM norm_ce_units WHERE name = NEW.ce_units OR abbreviation = NEW.ce_units ORDER BY id LIMIT 1))), fragmentation = (iif(NEW.fragmentation IN (SELECT id FROM norm_fragmentation_types), NEW.fragmentation, (SELECT id FROM norm_fragmentation_types WHERE name = NEW.fragmentation OR acronym = NEW.fragmentation ORDER BY id LIMIT 1))), ms2_type = (iif(NEW.ms2_type IN (SELECT id FROM norm_ms_n_types), NEW.ms2_type, (SELECT id FROM norm_ms_n_types WHERE name = NEW.ms2_type OR acronym = NEW.ms2_type OR import_text = NEW.ms2_type ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_peaks_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_peaks_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'peaks' */ AFTER INSERT ON peaks FOR EACH ROW WHEN NEW.ion_state NOT IN (SELECT id FROM norm_ion_states) OR NEW.identification_confidence NOT IN (SELECT id FROM norm_peak_confidence) BEGIN INSERT OR IGNORE INTO norm_ion_states (name) VALUES (NEW.ion_state); INSERT OR IGNORE INTO norm_peak_confidence (confidence) VALUES (NEW.identification_confidence); UPDATE peaks SET ion_state = (iif(NEW.ion_state IN (SELECT id FROM norm_ion_states), NEW.ion_state, (SELECT id FROM norm_ion_states WHERE name = NEW.ion_state ORDER BY id LIMIT 1))), identification_confidence = (iif(NEW.identification_confidence IN (SELECT id FROM norm_peak_confidence), NEW.identification_confidence, (SELECT id FROM norm_peak_confidence WHERE level1 = NEW.identification_confidence OR level2 = NEW.identification_confidence OR confidence = NEW.identification_confidence ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_peaks_after_update; CREATE TRIGGER IF NOT EXISTS trigger_peaks_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'peaks' */ AFTER UPDATE ON peaks FOR EACH ROW WHEN NEW.ion_state NOT IN (SELECT id FROM norm_ion_states) OR NEW.identification_confidence NOT IN (SELECT id FROM norm_peak_confidence) BEGIN INSERT OR IGNORE INTO norm_ion_states (name) VALUES (NEW.ion_state); INSERT OR IGNORE INTO norm_peak_confidence (confidence) VALUES (NEW.identification_confidence); UPDATE peaks SET ion_state = (iif(NEW.ion_state IN (SELECT id FROM norm_ion_states), NEW.ion_state, (SELECT id FROM norm_ion_states WHERE name = NEW.ion_state ORDER BY id LIMIT 1))), identification_confidence = (iif(NEW.identification_confidence IN (SELECT id FROM norm_peak_confidence), NEW.identification_confidence, (SELECT id FROM norm_peak_confidence WHERE level1 = NEW.identification_confidence OR level2 = NEW.identification_confidence OR confidence = NEW.identification_confidence ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_qc_methods_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_qc_methods_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'qc_methods' */ AFTER INSERT ON qc_methods FOR EACH ROW WHEN NEW.name NOT IN (SELECT id FROM norm_qc_methods_name) OR NEW.reference NOT IN (SELECT id FROM norm_qc_methods_reference) BEGIN INSERT OR IGNORE INTO norm_qc_methods_name (name) VALUES (NEW.name); INSERT OR IGNORE INTO norm_qc_methods_reference (name) VALUES (NEW.reference); UPDATE qc_methods SET name = (iif(NEW.name IN (SELECT id FROM norm_qc_methods_name), NEW.name, (SELECT id FROM norm_qc_methods_name WHERE name = NEW.name ORDER BY id LIMIT 1))), reference = (iif(NEW.reference IN (SELECT id FROM norm_qc_methods_reference), NEW.reference, (SELECT id FROM norm_qc_methods_reference WHERE name = NEW.reference ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_qc_methods_after_update; CREATE TRIGGER IF NOT EXISTS trigger_qc_methods_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'qc_methods' */ AFTER UPDATE ON qc_methods FOR EACH ROW WHEN NEW.name NOT IN (SELECT id FROM norm_qc_methods_name) OR NEW.reference NOT IN (SELECT id FROM norm_qc_methods_reference) BEGIN INSERT OR IGNORE INTO norm_qc_methods_name (name) VALUES (NEW.name); INSERT OR IGNORE INTO norm_qc_methods_reference (name) VALUES (NEW.reference); UPDATE qc_methods SET name = (iif(NEW.name IN (SELECT id FROM norm_qc_methods_name), NEW.name, (SELECT id FROM norm_qc_methods_name WHERE name = NEW.name ORDER BY id LIMIT 1))), reference = (iif(NEW.reference IN (SELECT id FROM norm_qc_methods_reference), NEW.reference, (SELECT id FROM norm_qc_methods_reference WHERE name = NEW.reference ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_samples_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_samples_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'samples' */ AFTER INSERT ON samples FOR EACH ROW WHEN NEW.sample_class_id NOT IN (SELECT id FROM norm_sample_classes) OR NEW.generation_type NOT IN (SELECT id FROM norm_generation_type) OR NEW.sample_solvent NOT IN (SELECT id FROM norm_carriers) BEGIN INSERT OR IGNORE INTO norm_sample_classes (name) VALUES (NEW.sample_class_id); INSERT OR IGNORE INTO norm_generation_type (name) VALUES (NEW.generation_type); INSERT OR IGNORE INTO norm_carriers (name) VALUES (NEW.sample_solvent); UPDATE samples SET sample_class_id = (iif(NEW.sample_class_id IN (SELECT id FROM norm_sample_classes), NEW.sample_class_id, (SELECT id FROM norm_sample_classes WHERE name = NEW.sample_class_id ORDER BY id LIMIT 1))), generation_type = (iif(NEW.generation_type IN (SELECT id FROM norm_generation_type), NEW.generation_type, (SELECT id FROM norm_generation_type WHERE name = NEW.generation_type ORDER BY id LIMIT 1))), sample_solvent = (iif(NEW.sample_solvent IN (SELECT id FROM norm_carriers), NEW.sample_solvent, (SELECT id FROM norm_carriers WHERE name = NEW.sample_solvent ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_samples_after_update; CREATE TRIGGER IF NOT EXISTS trigger_samples_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'samples' */ AFTER UPDATE ON samples FOR EACH ROW WHEN NEW.sample_class_id NOT IN (SELECT id FROM norm_sample_classes) OR NEW.generation_type NOT IN (SELECT id FROM norm_generation_type) OR NEW.sample_solvent NOT IN (SELECT id FROM norm_carriers) BEGIN INSERT OR IGNORE INTO norm_sample_classes (name) VALUES (NEW.sample_class_id); INSERT OR IGNORE INTO norm_generation_type (name) VALUES (NEW.generation_type); INSERT OR IGNORE INTO norm_carriers (name) VALUES (NEW.sample_solvent); UPDATE samples SET sample_class_id = (iif(NEW.sample_class_id IN (SELECT id FROM norm_sample_classes), NEW.sample_class_id, (SELECT id FROM norm_sample_classes WHERE name = NEW.sample_class_id ORDER BY id LIMIT 1))), generation_type = (iif(NEW.generation_type IN (SELECT id FROM norm_generation_type), NEW.generation_type, (SELECT id FROM norm_generation_type WHERE name = NEW.generation_type ORDER BY id LIMIT 1))), sample_solvent = (iif(NEW.sample_solvent IN (SELECT id FROM norm_carriers), NEW.sample_solvent, (SELECT id FROM norm_carriers WHERE name = NEW.sample_solvent ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_carrier_additives_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_carrier_additives_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'carrier_additives' */ AFTER INSERT ON carrier_additives FOR EACH ROW WHEN NEW.component NOT IN (SELECT id FROM norm_additives) OR NEW.units NOT IN (SELECT id FROM norm_additive_units) BEGIN INSERT OR IGNORE INTO norm_additives (name) VALUES (NEW.component); INSERT OR IGNORE INTO norm_additive_units (name, abbreviation) VALUES (NEW.units, NULL); UPDATE carrier_additives SET component = (iif(NEW.component IN (SELECT id FROM norm_additives), NEW.component, (SELECT id FROM norm_additives WHERE name = NEW.component ORDER BY id LIMIT 1))), units = (iif(NEW.units IN (SELECT id FROM norm_additive_units), NEW.units, (SELECT id FROM norm_additive_units WHERE name = NEW.units OR abbreviation = NEW.units ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_carrier_additives_after_update; CREATE TRIGGER IF NOT EXISTS trigger_carrier_additives_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'carrier_additives' */ AFTER UPDATE ON carrier_additives FOR EACH ROW WHEN NEW.component NOT IN (SELECT id FROM norm_additives) OR NEW.units NOT IN (SELECT id FROM norm_additive_units) BEGIN INSERT OR IGNORE INTO norm_additives (name) VALUES (NEW.component); INSERT OR IGNORE INTO norm_additive_units (name, abbreviation) VALUES (NEW.units, NULL); UPDATE carrier_additives SET component = (iif(NEW.component IN (SELECT id FROM norm_additives), NEW.component, (SELECT id FROM norm_additives WHERE name = NEW.component ORDER BY id LIMIT 1))), units = (iif(NEW.units IN (SELECT id FROM norm_additive_units), NEW.units, (SELECT id FROM norm_additive_units WHERE name = NEW.units OR abbreviation = NEW.units ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_carrier_aliases_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_carrier_aliases_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'carrier_aliases' */ AFTER INSERT ON carrier_aliases FOR EACH ROW WHEN NEW.carrier_id NOT IN (SELECT id FROM norm_carriers) BEGIN INSERT OR IGNORE INTO norm_carriers (name) VALUES (NEW.carrier_id); UPDATE carrier_aliases SET carrier_id = (iif(NEW.carrier_id IN (SELECT id FROM norm_carriers), NEW.carrier_id, (SELECT id FROM norm_carriers WHERE name = NEW.carrier_id ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_carrier_aliases_after_update; CREATE TRIGGER IF NOT EXISTS trigger_carrier_aliases_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'carrier_aliases' */ AFTER UPDATE ON carrier_aliases FOR EACH ROW WHEN NEW.carrier_id NOT IN (SELECT id FROM norm_carriers) BEGIN INSERT OR IGNORE INTO norm_carriers (name) VALUES (NEW.carrier_id); UPDATE carrier_aliases SET carrier_id = (iif(NEW.carrier_id IN (SELECT id FROM norm_carriers), NEW.carrier_id, (SELECT id FROM norm_carriers WHERE name = NEW.carrier_id ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_carrier_mixes_after_insert; CREATE TRIGGER IF NOT EXISTS trigger_carrier_mixes_after_insert /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after insert actions on table 'carrier_mixes' */ AFTER INSERT ON carrier_mixes FOR EACH ROW WHEN NEW.component NOT IN (SELECT id FROM norm_carriers) BEGIN INSERT OR IGNORE INTO norm_carriers (name) VALUES (NEW.component); UPDATE carrier_mixes SET component = (iif(NEW.component IN (SELECT id FROM norm_carriers), NEW.component, (SELECT id FROM norm_carriers WHERE name = NEW.component ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
DROP TRIGGER IF EXISTS trigger_carrier_mixes_after_update; CREATE TRIGGER IF NOT EXISTS trigger_carrier_mixes_after_update /* [autogenerated by sqlite_auto_trigger()] Trigger to control normalization compliance after update actions on table 'carrier_mixes' */ AFTER UPDATE ON carrier_mixes FOR EACH ROW WHEN NEW.component NOT IN (SELECT id FROM norm_carriers) BEGIN INSERT OR IGNORE INTO norm_carriers (name) VALUES (NEW.component); UPDATE carrier_mixes SET component = (iif(NEW.component IN (SELECT id FROM norm_carriers), NEW.component, (SELECT id FROM norm_carriers WHERE name = NEW.component ORDER BY id LIMIT 1))) WHERE ROWID = NEW.ROWID; END;
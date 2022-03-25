
CREATE VIEW IF NOT EXISTS view_additive_aliases AS 
		/* [autogenerated by sqlite_auto_view()] View of "additive_aliases" normalized by "norm_additives". */ 
	SELECT 	
		norm_additives.name AS additive_id, 
			/* Normalized value column 'name' from table 'norm_additives'. */ 	
		additive_aliases.alias AS alias 
			/* Direct use column 'alias' from table 'additive_aliases'. */ 
	FROM additive_aliases 
	LEFT JOIN norm_additives ON additive_aliases.additive_id = norm_additives.id;

CREATE VIEW IF NOT EXISTS view_compound_aliases AS 
		/* [autogenerated by sqlite_auto_view()] View of "compound_aliases" normalized by "norm_analyte_alias_references". */ 
	SELECT 	
		compound_aliases.compound_id AS compound_id, 
			/* Direct use column 'compound_id' from table 'compound_aliases'. */ 	
		norm_analyte_alias_references.name AS alias_type, 
			/* Normalized value column 'name' from table 'norm_analyte_alias_references'. */ 	
		compound_aliases.alias AS alias 
			/* Direct use column 'alias' from table 'compound_aliases'. */ 
	FROM compound_aliases 
	LEFT JOIN norm_analyte_alias_references ON compound_aliases.alias_type = norm_analyte_alias_references.id;

CREATE VIEW IF NOT EXISTS view_compounds AS 
		/* [autogenerated by sqlite_auto_view()] View of "compounds" normalized by "norm_source_types". */ 
	SELECT 	
		compounds.id AS id, 
			/* Direct use column 'id' from table 'compounds'. */ 	
		compounds.category AS category, 
			/* Direct use column 'category' from table 'compounds'. */ 	
		compounds.name AS name, 
			/* Direct use column 'name' from table 'compounds'. */ 	
		compounds.obtained_from AS obtained_from, 
			/* Direct use column 'obtained_from' from table 'compounds'. */ 	
		norm_source_types.name AS source_type, 
			/* Normalized value column 'name' from table 'norm_source_types'. */ 	
		compounds.additional AS additional, 
			/* Direct use column 'additional' from table 'compounds'. */ 	
		compounds.local_positive AS local_positive, 
			/* Direct use column 'local_positive' from table 'compounds'. */ 	
		compounds.local_negative AS local_negative, 
			/* Direct use column 'local_negative' from table 'compounds'. */ 	
		compounds.formula AS formula, 
			/* Direct use column 'formula' from table 'compounds'. */ 	
		compounds.fixedmass AS fixedmass, 
			/* Direct use column 'fixedmass' from table 'compounds'. */ 	
		compounds.netcharge AS netcharge, 
			/* Direct use column 'netcharge' from table 'compounds'. */ 	
		compounds.inspected_by AS inspected_by, 
			/* Direct use column 'inspected_by' from table 'compounds'. */ 	
		compounds.inspected_on AS inspected_on 
			/* Direct use column 'inspected_on' from table 'compounds'. */ 
	FROM compounds 
	LEFT JOIN norm_source_types ON compounds.source_type = norm_source_types.id;

CREATE VIEW IF NOT EXISTS view_fragment_aliases AS 
		/* [autogenerated by sqlite_auto_view()] View of "fragment_aliases" normalized by "norm_analyte_alias_references". */ 
	SELECT 	
		fragment_aliases.fragment_id AS fragment_id, 
			/* Direct use column 'fragment_id' from table 'fragment_aliases'. */ 	
		norm_analyte_alias_references.name AS alias_type, 
			/* Normalized value column 'name' from table 'norm_analyte_alias_references'. */ 	
		fragment_aliases.alias AS alias 
			/* Direct use column 'alias' from table 'fragment_aliases'. */ 
	FROM fragment_aliases 
	LEFT JOIN norm_analyte_alias_references ON fragment_aliases.alias_type = norm_analyte_alias_references.id;

CREATE VIEW IF NOT EXISTS view_fragment_sources AS 
		/* [autogenerated by sqlite_auto_view()] View of "fragment_sources" normalized by "norm_generation_type". */ 
	SELECT 	
		fragment_sources.fragment_id AS fragment_id, 
			/* Direct use column 'fragment_id' from table 'fragment_sources'. */ 	
		norm_generation_type.name AS generated_by, 
			/* Normalized value column 'name' from table 'norm_generation_type'. */ 	
		fragment_sources.citation AS citation 
			/* Direct use column 'citation' from table 'fragment_sources'. */ 
	FROM fragment_sources 
	LEFT JOIN norm_generation_type ON fragment_sources.generated_by = norm_generation_type.id;

CREATE VIEW IF NOT EXISTS view_logs AS 
		/* [autogenerated by sqlite_auto_view()] View of "logs" normalized by "norm_log_effect" and "norm_log_executed_from". */ 
	SELECT 	
		logs.id AS id, 
			/* Direct use column 'id' from table 'logs'. */ 	
		logs.category AS category, 
			/* Direct use column 'category' from table 'logs'. */ 	
		logs.bundle AS bundle, 
			/* Direct use column 'bundle' from table 'logs'. */ 	
		logs.description AS description, 
			/* Direct use column 'description' from table 'logs'. */ 	
		norm_log_effect.name AS effect, 
			/* Normalized value column 'name' from table 'norm_log_effect'. */ 	
		logs.affects_table AS affects_table, 
			/* Direct use column 'affects_table' from table 'logs'. */ 	
		logs.affects_ids AS affects_ids, 
			/* Direct use column 'affects_ids' from table 'logs'. */ 	
		logs.executed_by AS executed_by, 
			/* Direct use column 'executed_by' from table 'logs'. */ 	
		norm_log_executed_from.name AS executed_from, 
			/* Normalized value column 'name' from table 'norm_log_executed_from'. */ 	
		logs.executed_on AS executed_on, 
			/* Direct use column 'executed_on' from table 'logs'. */ 	
		logs.new_vals AS new_vals, 
			/* Direct use column 'new_vals' from table 'logs'. */ 	
		logs.old_vals AS old_vals 
			/* Direct use column 'old_vals' from table 'logs'. */ 
	FROM logs 
	LEFT JOIN norm_log_effect ON logs.effect = norm_log_effect.id 
	LEFT JOIN norm_log_executed_from ON logs.executed_from = norm_log_executed_from.id;

CREATE VIEW IF NOT EXISTS view_mobile_phases AS 
		/* [autogenerated by sqlite_auto_view()] View of "mobile_phases" normalized by "norm_flow_units" and "norm_duration_units". */ 
	SELECT 	
		mobile_phases.ms_methods_id AS ms_methods_id, 
			/* Direct use column 'ms_methods_id' from table 'mobile_phases'. */ 	
		mobile_phases.solvent_mix_collection_id AS solvent_mix_collection_id, 
			/* Direct use column 'solvent_mix_collection_id' from table 'mobile_phases'. */ 	
		mobile_phases.flow AS flow, 
			/* Direct use column 'flow' from table 'mobile_phases'. */ 	
		norm_flow_units.name AS flow_units, 
			/* Normalized value column 'name' from table 'norm_flow_units'. */ 	
		mobile_phases.duration AS duration, 
			/* Direct use column 'duration' from table 'mobile_phases'. */ 	
		norm_duration_units.name AS duration_units 
			/* Normalized value column 'name' from table 'norm_duration_units'. */ 
	FROM mobile_phases 
	LEFT JOIN norm_flow_units ON mobile_phases.flow_units = norm_flow_units.id 
	LEFT JOIN norm_duration_units ON mobile_phases.duration_units = norm_duration_units.id;

CREATE VIEW IF NOT EXISTS view_ms_descriptions AS 
		/* [autogenerated by sqlite_auto_view()] View of "ms_descriptions" normalized by "norm_ms_types" and "norm_vendors". */ 
	SELECT 	
		ms_descriptions.ms_methods_id AS ms_methods_id, 
			/* Direct use column 'ms_methods_id' from table 'ms_descriptions'. */ 	
		norm_ms_types.name AS ms_types_id, 
			/* Normalized value column 'name' from table 'norm_ms_types'. */ 	
		norm_vendors.name AS vendor_id, 
			/* Normalized value column 'name' from table 'norm_vendors'. */ 	
		ms_descriptions.vendor_model AS vendor_model, 
			/* Direct use column 'vendor_model' from table 'ms_descriptions'. */ 	
		ms_descriptions.citation AS citation 
			/* Direct use column 'citation' from table 'ms_descriptions'. */ 
	FROM ms_descriptions 
	LEFT JOIN norm_ms_types ON ms_descriptions.ms_types_id = norm_ms_types.id 
	LEFT JOIN norm_vendors ON ms_descriptions.vendor_id = norm_vendors.id;

CREATE VIEW IF NOT EXISTS view_ms_methods AS 
		/* [autogenerated by sqlite_auto_view()] View of "ms_methods" normalized by "norm_ionization", "norm_voltage_units", "norm_polarity_types", "norm_ce_units", "norm_ce_desc", "norm_fragmentation_types", and "norm_ms_n_types". */ 
	SELECT 	
		ms_methods.id AS id, 
			/* Direct use column 'id' from table 'ms_methods'. */ 	
		norm_ionization.name AS ionization, 
			/* Normalized value column 'name' from table 'norm_ionization'. */ 	
		ms_methods.voltage AS voltage, 
			/* Direct use column 'voltage' from table 'ms_methods'. */ 	
		norm_voltage_units.name AS voltage_units, 
			/* Normalized value column 'name' from table 'norm_voltage_units'. */ 	
		norm_polarity_types.name AS polarity, 
			/* Normalized value column 'name' from table 'norm_polarity_types'. */ 	
		ms_methods.ce_value AS ce_value, 
			/* Direct use column 'ce_value' from table 'ms_methods'. */ 	
		norm_ce_units.name AS ce_units, 
			/* Normalized value column 'name' from table 'norm_ce_units'. */ 	
		norm_ce_desc.name AS ce_desc, 
			/* Normalized value column 'name' from table 'norm_ce_desc'. */ 	
		norm_fragmentation_types.name AS fragmentation, 
			/* Normalized value column 'name' from table 'norm_fragmentation_types'. */ 	
		norm_ms_n_types.name AS ms2_type, 
			/* Normalized value column 'name' from table 'norm_ms_n_types'. */ 	
		ms_methods.has_qc_method AS has_qc_method, 
			/* Direct use column 'has_qc_method' from table 'ms_methods'. */ 	
		ms_methods.citation AS citation 
			/* Direct use column 'citation' from table 'ms_methods'. */ 
	FROM ms_methods 
	LEFT JOIN norm_ionization ON ms_methods.ionization = norm_ionization.id 
	LEFT JOIN norm_voltage_units ON ms_methods.voltage_units = norm_voltage_units.id 
	LEFT JOIN norm_polarity_types ON ms_methods.polarity = norm_polarity_types.id 
	LEFT JOIN norm_ce_units ON ms_methods.ce_units = norm_ce_units.id 
	LEFT JOIN norm_ce_desc ON ms_methods.ce_desc = norm_ce_desc.id 
	LEFT JOIN norm_fragmentation_types ON ms_methods.fragmentation = norm_fragmentation_types.id 
	LEFT JOIN norm_ms_n_types ON ms_methods.ms2_type = norm_ms_n_types.id;

CREATE VIEW IF NOT EXISTS view_peaks AS 
		/* [autogenerated by sqlite_auto_view() with manual editresolving norm_peak_confidence] View of "peaks" normalized by "norm_ion_states" and "norm_peak_confidence". */ 
	SELECT 	
		peaks.id AS id, 
			/* Direct use column 'id' from table 'peaks'. */ 	
		peaks.sample_id AS sample_id, 
			/* Direct use column 'sample_id' from table 'peaks'. */ 	
		peaks.num_points AS num_points, 
			/* Direct use column 'num_points' from table 'peaks'. */ 	
		peaks.precursor_mz AS precursor_mz, 
			/* Direct use column 'precursor_mz' from table 'peaks'. */ 	
		norm_ion_states.name AS ion_state, 
			/* Normalized value column 'name' from table 'norm_ion_states'. */ 	
		peaks.rt_start AS rt_start, 
			/* Direct use column 'rt_start' from table 'peaks'. */ 	
		peaks.rt_centroid AS rt_centroid, 
			/* Direct use column 'rt_centroid' from table 'peaks'. */ 	
		peaks.rt_end AS rt_end, 
			/* Direct use column 'rt_end' from table 'peaks'. */ 	
		norm_peak_confidence.level1 AS identification_confidence_level1, 
			/* Normalized value column 'level1' from table 'norm_peak_confidence'. */ 
		norm_peak_confidence.level2 AS identification_confidence_level2 
			/* Normalized value column 'level2' from table 'norm_peak_confidence'. */ 
	FROM peaks 
	LEFT JOIN norm_ion_states ON peaks.ion_state = norm_ion_states.id 
	LEFT JOIN norm_peak_confidence ON peaks.identification_confidence = norm_peak_confidence.id;

CREATE VIEW IF NOT EXISTS view_qc_methods AS 
		/* [autogenerated by sqlite_auto_view()] View of "qc_methods" normalized by "norm_qc_methods_name" and "norm_qc_methods_reference". */ 
	SELECT 	
		qc_methods.ms_methods_id AS ms_methods_id, 
			/* Direct use column 'ms_methods_id' from table 'qc_methods'. */ 	
		norm_qc_methods_name.name AS name, 
			/* Normalized value column 'name' from table 'norm_qc_methods_name'. */ 	
		qc_methods.value AS value, 
			/* Direct use column 'value' from table 'qc_methods'. */ 	
		norm_qc_methods_reference.name AS reference, 
			/* Normalized value column 'name' from table 'norm_qc_methods_reference'. */ 	
		qc_methods.reference_text AS reference_text 
			/* Direct use column 'reference_text' from table 'qc_methods'. */ 
	FROM qc_methods 
	LEFT JOIN norm_qc_methods_name ON qc_methods.name = norm_qc_methods_name.id 
	LEFT JOIN norm_qc_methods_reference ON qc_methods.reference = norm_qc_methods_reference.id;

CREATE VIEW IF NOT EXISTS view_samples AS 
		/* [autogenerated by sqlite_auto_view()] View of "samples" normalized by "norm_sample_classes", "norm_generation_type", and "norm_solvents". */ 
	SELECT 	
		samples.id AS id, 
			/* Direct use column 'id' from table 'samples'. */ 	
		samples.mzml_name AS mzml_name, 
			/* Direct use column 'mzml_name' from table 'samples'. */ 	
		samples.description AS description, 
			/* Direct use column 'description' from table 'samples'. */ 	
		norm_sample_classes.name AS sample_class_id, 
			/* Normalized value column 'name' from table 'norm_sample_classes'. */ 	
		samples.source_citation AS source_citation, 
			/* Direct use column 'source_citation' from table 'samples'. */ 	
		samples.sample_contributor AS sample_contributor, 
			/* Direct use column 'sample_contributor' from table 'samples'. */ 	
		norm_generation_type.name AS generation_type, 
			/* Normalized value column 'name' from table 'norm_generation_type'. */ 	
		samples.generated_on AS generated_on, 
			/* Direct use column 'generated_on' from table 'samples'. */ 	
		samples.ms_methods_id AS ms_methods_id, 
			/* Direct use column 'ms_methods_id' from table 'samples'. */ 	
		norm_solvents.name AS sample_solvent 
			/* Normalized value column 'name' from table 'norm_solvents'. */ 
	FROM samples 
	LEFT JOIN norm_sample_classes ON samples.sample_class_id = norm_sample_classes.id 
	LEFT JOIN norm_generation_type ON samples.generation_type = norm_generation_type.id 
	LEFT JOIN norm_solvents ON samples.sample_solvent = norm_solvents.id;

CREATE VIEW IF NOT EXISTS view_solvent_additives AS 
		/* [autogenerated by sqlite_auto_view()] View of "solvent_additives" normalized by "norm_additives" and "norm_additive_units". */ 
	SELECT 	
		solvent_additives.mix_id AS mix_id, 
			/* Direct use column 'mix_id' from table 'solvent_additives'. */ 	
		norm_additives.name AS component, 
			/* Normalized value column 'name' from table 'norm_additives'. */ 	
		solvent_additives.amount AS amount, 
			/* Direct use column 'amount' from table 'solvent_additives'. */ 	
		norm_additive_units.name AS units 
			/* Normalized value column 'name' from table 'norm_additive_units'. */ 
	FROM solvent_additives 
	LEFT JOIN norm_additives ON solvent_additives.component = norm_additives.id 
	LEFT JOIN norm_additive_units ON solvent_additives.units = norm_additive_units.id;

CREATE VIEW IF NOT EXISTS view_solvent_aliases AS 
		/* [autogenerated by sqlite_auto_view()] View of "solvent_aliases" normalized by "norm_solvents". */ 
	SELECT 	
		norm_solvents.name AS solvent_id, 
			/* Normalized value column 'name' from table 'norm_solvents'. */ 	
		solvent_aliases.alias AS alias 
			/* Direct use column 'alias' from table 'solvent_aliases'. */ 
	FROM solvent_aliases 
	LEFT JOIN norm_solvents ON solvent_aliases.solvent_id = norm_solvents.id;

CREATE VIEW IF NOT EXISTS view_solvent_mixes AS 
		/* [autogenerated by sqlite_auto_view()] View of "solvent_mixes" normalized by "norm_solvents". */ 
	SELECT 	
		solvent_mixes.mix_id AS mix_id, 
			/* Direct use column 'mix_id' from table 'solvent_mixes'. */ 	
		norm_solvents.name AS component, 
			/* Normalized value column 'name' from table 'norm_solvents'. */ 	
		solvent_mixes.fraction AS fraction 
			/* Direct use column 'fraction' from table 'solvent_mixes'. */ 
	FROM solvent_mixes 
	LEFT JOIN norm_solvents ON solvent_mixes.component = norm_solvents.id;
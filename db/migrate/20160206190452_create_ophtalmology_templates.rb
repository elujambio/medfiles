class CreateOphtalmologyTemplates < ActiveRecord::Migration
  def change
    create_table :ophtalmology_templates do |t|

      #Patient Information

      t.string :name
      t.integer :age, default: 0 
      t.date :birth_date
      t.string :sex
      t.text :originary_from
      t.string :ocupation
      t.string :religion
      t.text :address
      t.string :telephone
      t.string :email
      t.string :insurance_company
      t.string :insurance_policy
      t.boolean :previous_revisions
      t.string :previous_revision_date

      #Current Ailments

      t.text :current_ailments

      #Family Background

      t.string :family_diabetes_mellitus
      t.string :family_nephropathy
      t.string :family_hypertension
      t.string :family_cardiopathy
      t.string :family_thyroid
      t.string :family_cancer
      t.text :family_other

      #Family Ophtalmological Background

      t.string :family_myopia
      t.string :family_farsightedness
      t.string :family_astigmatism
      t.string :family_keratoconus
      t.string :family_strabismus
      t.string :family_diabetic_retinopathy
      t.string :family_eye_surgery
      t.string :family_cataract
      t.string :family_retinal_deatachment
      t.string :family_laser_surgery
      t.string :family_glaucoma
      t.text :family_other_ailments_2

      #Personal Background

      t.boolean :patient_diabetes_mellitus, default: false
      t.string :patient_diabetes_mellitus_since
      t.text :patient_diabetes_mellitus_treatment

      t.boolean :patient_arterial_hypertension, default: false
      t.date :patient_arterial_hypertension_since
      t.text :patient_arterial_hypertension_treatment

      t.boolean :patient_thyroid, default: false
      t.text :patient_thyroid_description

      t.boolean :patient_nefropathy, default: false
      t.text :patient_nefropathy_description

      t.boolean :patient_alergies, default: false
      t.text :patient_alergies_description

      t.boolean :patient_cardiopathy, default: false
      t.text :patient_cardiopathy_description

      t.boolean :patient_surgery, default: false
      t.text :patient_surgery_description

      t.boolean :patient_cancer, default: false
      t.text :patient_cancer_description

      t.boolean :patient_transfusion, default: false
      t.text :patient_transfusion_description

      t.boolean :patient_smoking, default: false

      t.text :patient_ailments_other

      #Patient Ophtalmological Background

      t.boolean :patient_myopia, default: false
      t.text :patient_myopia_description

      t.boolean :patient_hyperopia, default: false
      t.text :patient_hyperopia_description

      t.boolean :patient_astigmatism, default: false
      t.text :patient_astigmatism_description

      t.boolean :patient_keratoconus, default: false
      t.text :patient_keratoconus_description

      t.boolean :patient_presbyopia, default: false
      t.text :patient_presbyopia_description

      t.boolean :patient_uses_glasses, default: false
      t.date :patient_uses_glasses_since

      t.boolean :patient_uses_contact_lenses, default: false
      t.date :patient_uses_contact_lenses_since

      t.boolean :patient_strabismus, default: false
      t.text :patient_strabismus_treatment

      t.boolean :patient_cataracts, default: false
      t.date :patient_cataracts_since

      t.boolean :patient_glaucoma, default: false
      t.date :patient_glaucoma_since
      t.text :patient_glaucoma_treatment

      t.boolean :patient_diabetic_retinopathy, default: false 

      t.boolean :patient_laser_surgery, default: false  

      t.boolean :patient_retinal_deatachment_left , default: false      
      t.boolean :patient_retinal_deatachment_right, default: false  

      t.date :patient_retinal_deatachment_since       
      t.text :patient_retinal_deatachment_treatment       

      t.boolean :shocks
      t.text :shocks_description

      t.boolean :surgery_left_eye, default: false
      t.text :surgery_left_eye_description
      t.boolean :surgery_right_eye, default: false
      t.text :surgery_right_eye_description

      t.text :patient_other_eye_ailments

      #Only Women

      t.boolean :patient_is_pregnant, default: false
      t.boolean :lactation, default: false

      #Perinatal History

      t.boolean :gynobstetric_revision_during_pregnancy, default: false

      t.boolean :ailment_presence_during_pregnancy, default: false
      t.text :ailments_during_pregnancy
      t.text :ailments_during_pregnancy_treatment

      t.string :weight_at_birth
      t.string :size_at_birth

      t.boolean :born_of_term, default: false

      t.text :problems_during_birth

      #Ophtalmological Exploration

      t.string :uncorrected_visual_acuity_left
      t.string :uncorrected_visual_acuity_both
      t.string :uncorrected_visual_acuity_right

      t.string :pinhole_left
      t.string :pinhole_both
      t.string :pinhole_right

      t.string :visual_acuity_with_correction_left
      t.string :visual_acuity_with_correction_both
      t.string :visual_acuity_with_correction_right

      t.boolean :patient_uses_contact_lenses_current, default: false
      t.boolean :patient_uses_glasses_current, default: false

      t.string :corrected_visual_acuity_left
      t.string :corrected_visual_acuity_both
      t.string :corrected_visual_acuity_right

      t.string :lensometer_left_value_1
      t.string :lensometer_left_value_2
      t.string :lensometer_left_value_3
      t.string :lensometer_right_value_1
      t.string :lensometer_right_value_2
      t.string :lensometer_right_value_3

      t.string :add_1

      t.text :refraction

      t.string :manifested_refraction_left_value_1
      t.string :manifested_refraction_left_value_2
      t.string :manifested_refraction_left_value_3
      t.string :manifested_refraction_right_value_1
      t.string :manifested_refraction_right_value_2
      t.string :manifested_refraction_right_value_3

      t.string :subjective_refraction_left_value_1
      t.string :subjective_refraction_left_value_2
      t.string :subjective_refraction_left_value_3
      t.string :subjective_refraction_right_value_1
      t.string :subjective_refraction_right_value_2
      t.string :subjective_refraction_right_value_3

      t.string :add_2

      t.string :autorefraction_left_value_1
      t.string :autorefraction_left_value_2
      t.string :autorefraction_left_value_3
      t.string :autorefraction_right_value_1
      t.string :autorefraction_right_value_2
      t.string :autorefraction_right_value_3

      t.string :cicloplegic_refraction_left_value_1
      t.string :cicloplegic_refraction_left_value_2
      t.string :cicloplegic_refraction_left_value_3
      t.string :cicloplegic_refraction_right_value_1
      t.string :cicloplegic_refraction_right_value_2
      t.string :cicloplegic_refraction_right_value_3

      t.string :better_corrected_visual_acuity_left
      t.string :better_corrected_visual_acuity_both
      t.string :better_corrected_visual_acuity_right      

      t.string :keratometry_left
      t.string :keratometry_right

      t.string :paquimetry_left
      t.string :paquimetry_right

      t.string :specular_biomicroscopy_left
      t.string :specular_biomicroscopy_right

      t.string :pupillary_reflexes_left
      t.string :pupillary_reflexes_right

      t.string :ocular_movements

      t.string :ductions_left
      t.string :ductions_right

      t.string :versions_left
      t.string :versions_right

      t.string :primary_position_of_gaze_left
      t.string :primary_position_of_gaze_right

      t.string :eyelids_left
      t.string :eyelids_right

      t.string :annexes_left
      t.string :annexes_right

      t.string :lachrymal_left
      t.string :lachrymal_right

      t.string :conjunctiva_left
      t.string :conjunctiva_right

      t.string :cornea_left
      t.string :cornea_right

      t.string :antechamber_left
      t.string :antechamber_right

      t.string :intraocular_pressure_left
      t.string :intraocular_pressure_right

      #HERE GOES X X DIAGRAM THINGY

      t.string :iris_left
      t.string :iris_right

      t.string :pupil_left
      t.string :pupil_right

      t.string :crystaline_left
      t.string :crystaline_right

      t.string :fundus_left
      t.string :fundus_right

      t.string :retina_left
      t.string :retina_right      

      t.string :vitreous_left
      t.string :vitreous_right

      t.string :optic_nerve_left
      t.string :optic_nerve_right

      t.string :taint_left
      t.string :taint_right

      #HERE GOES EYE DIAGRAM THINGY 

      t.text :observations
      t.text :diagnosis
      t.text :plan_and_treatment


      # t.text :keratometry_left
      # t.text :keratometry_right
      # t.string :specular_magnification_left
      # t.string :specular_magnification_right
      # t.text :ocular_movements
      # t.string :ocular_movement_version_left
      # t.string :ocular_movement_version_right
      # t.string :ppm
      # t.text :eyelids_left
      # t.text :eyelids_right
      # t.boolean :retinal_deatachment_left, default: false
      # t.boolean :retinal_deatachment_right, default: false
      # t.text :retinal_deatachment_time
      # t.text :retinal_deatachment_treatment
      # t.text :retinal_deatachment_description
      # t.text :eye_surgery_left
      # t.text :eye_surgery_right
      # t.text :other_eye_condition
      # t.boolean :pregnancy, default: false
      # t.text :pregnancy_description
      # t.boolean :gynobstetric_revision_during_pregnancy, default: false
      # t.text :ailments_during_pregnancy
      # t.text :ailments_during_pregnancy_treatment
      # t.decimal :weight_at_birth, default: 0
      # t.decimal :size_at_birth, default: 0
      # t.boolean :born_of_term, default: false
      # t.text :born_of_term_description
      # t.string :avsc_first_value
      # t.string :avsc_second_value
      # t.string :avsc_third_value
      # t.string :avcc_first_value
      # t.string :avcc_second_value
      # t.string :avcc_third_value
      # t.string :pinhole_first_value
      # t.string :pinhole_second_value
      # t.string :pinhole_third_value
      # t.string :conjunctiva_left
      # t.string :conjunctiva_right
      # t.string :cornea_left
      # t.string :cornea_right
      # t.string :antechamber_left
      # t.string :antechamber_right
      # t.string :ac_bottom_left_value_1
      # t.string :ac_bottom_left_value_2
      # t.string :ac_bottom_right_value_1
      # t.string :ac_bottom_right_value_2
      # t.string :intraocular_pressure_left
      # t.string :intraocular_pressure_2
      # t.string :goinoscopy_left
      # t.string :goinoscopy_right
      # t.string :iris_left
      # t.string :iris_right
      # t.string :pupil_right
      # t.string :pupil_left
      # t.string :crystaline_left
      # t.string :crystaline_right
      # t.string :fundus_right
      # t.string :fundus_left
      # t.string :retina_right
      # t.string :retina_left
      # t.string :vitreous_left
      # t.string :vitreous_right
      # t.string :no_left
      # t.string :no_right
      # t.text :no_left_description
      # t.text :no_right_description
      # t.text :general_annotations
      # t.text :diagnosis
      # t.text :diagnosis_treatment

      t.timestamps null: false
    end
  end
end

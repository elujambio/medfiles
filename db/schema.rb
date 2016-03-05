# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160302225750) do

  create_table "contraceptives", force: :cascade do |t|
    t.string   "name"
    t.string   "time"
    t.string   "tolerance"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "gynecology_template_id"
  end

  add_index "contraceptives", ["gynecology_template_id"], name: "index_contraceptives_on_gynecology_template_id"

  create_table "doctor_pictures", force: :cascade do |t|
    t.string   "picture"
    t.integer  "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "doctor_pictures", ["doctor_id"], name: "index_doctor_pictures_on_doctor_id"

  create_table "doctors", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "practice_address_1"
    t.string   "practice_address_2"
    t.string   "postal_code"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "facebook"
    t.string   "website"
    t.string   "profession"
    t.string   "speciality"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "doctors", ["email"], name: "index_doctors_on_email", unique: true
  add_index "doctors", ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true

  create_table "gynecology_annexes", force: :cascade do |t|
    t.text     "annex"
    t.integer  "gynecology_template_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "gynecology_annexes", ["gynecology_template_id"], name: "index_gynecology_annexes_on_gynecology_template_id"

  create_table "gynecology_templates", force: :cascade do |t|
    t.integer  "register",                          default: 0
    t.string   "name"
    t.string   "email"
    t.string   "husband_name"
    t.text     "address"
    t.string   "telephone"
    t.integer  "age"
    t.integer  "husband_age"
    t.string   "marital_status"
    t.string   "ocupation"
    t.string   "husband_ocupation"
    t.text     "reason"
    t.text     "mother_background"
    t.text     "father_background"
    t.text     "grandparents_background"
    t.text     "siblings_background"
    t.text     "parents_siblings_background"
    t.text     "children_background"
    t.text     "husband_background"
    t.text     "personal_background"
    t.text     "diet"
    t.text     "smoking"
    t.text     "alergies"
    t.text     "drugs"
    t.string   "alcoholism"
    t.text     "inmunizations"
    t.text     "traumatics"
    t.text     "surgicals"
    t.text     "transfusions"
    t.string   "menarche"
    t.string   "rhythm"
    t.string   "dysmenorrhea",                      default: "f"
    t.boolean  "circumcised_partner"
    t.integer  "ivsa"
    t.integer  "number_of_sexual_partners"
    t.boolean  "pms",                               default: false
    t.string   "pms_duration"
    t.string   "gestate"
    t.string   "gestate_for"
    t.integer  "c_section"
    t.integer  "abortions"
    t.integer  "ee"
    t.date     "fum"
    t.date     "fup"
    t.date     "fua"
    t.date     "fuc"
    t.date     "fpp"
    t.date     "doc"
    t.text     "previous_preganancy_complications"
    t.text     "colposcopy"
    t.text     "sexual_habits"
    t.boolean  "fridigity",                         default: false
    t.boolean  "dyspareunia",                       default: false
    t.boolean  "menopause",                         default: false
    t.text     "menopause_symptomatology"
    t.boolean  "leucorrea",                         default: false
    t.text     "leucorrea_treatment"
    t.text     "pregnancy_medication"
    t.string   "ta"
    t.decimal  "weight"
    t.decimal  "size"
    t.text     "habitus"
    t.text     "head"
    t.text     "neck"
    t.text     "torax"
    t.text     "abdomen"
    t.text     "limbs"
    t.text     "breasts_appearance"
    t.boolean  "symetry",                           default: false
    t.text     "skin_abnormalities"
    t.text     "nipple"
    t.text     "abnormal_mass"
    t.text     "axillary_region"
    t.text     "ganglion_growth"
    t.text     "abnormal_secretion"
    t.text     "mastalgia"
    t.text     "external_aspect"
    t.text     "clitoris"
    t.text     "vulva"
    t.text     "pubic_hair"
    t.text     "himen"
    t.text     "introito"
    t.text     "perine"
    t.text     "vaginal_walls"
    t.text     "secreation_and_discharge"
    t.text     "cervix"
    t.text     "uterus_position"
    t.text     "uterus_consistency"
    t.text     "uterus_size"
    t.text     "uterus_form"
    t.text     "annexes"
    t.text     "speculoscopy"
    t.text     "internal_and_external_genitalia"
    t.text     "clinic_pelvimetry"
    t.text     "impression_diagnosis"
    t.text     "other_1"
    t.text     "other_2"
    t.text     "other_3"
    t.text     "other_4"
    t.text     "other_5"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "doctor_id"
  end

  add_index "gynecology_templates", ["doctor_id"], name: "index_gynecology_templates_on_doctor_id"

  create_table "ophtalmology_templates", force: :cascade do |t|
    t.string   "name"
    t.integer  "age",                                     default: 0
    t.date     "birth_date"
    t.string   "sex"
    t.text     "originary_from"
    t.string   "ocupation"
    t.string   "religion"
    t.text     "address"
    t.string   "telephone"
    t.string   "email"
    t.string   "insurance_company"
    t.string   "insurance_policy"
    t.boolean  "previous_revisions"
    t.string   "previous_revision_date"
    t.text     "current_ailments"
    t.string   "family_diabetes_mellitus"
    t.string   "family_nephropathy"
    t.string   "family_hypertension"
    t.string   "family_cardiopathy"
    t.string   "family_thyroid"
    t.string   "family_cancer"
    t.text     "family_other"
    t.string   "family_myopia"
    t.string   "family_farsightedness"
    t.string   "family_astigmatism"
    t.string   "family_keratoconus"
    t.string   "family_strabismus"
    t.string   "family_diabetic_retinopathy"
    t.string   "family_eye_surgery"
    t.string   "family_cataract"
    t.string   "family_retinal_deatachment"
    t.string   "family_laser_surgery"
    t.string   "family_glaucoma"
    t.text     "family_other_ailments_2"
    t.boolean  "patient_diabetes_mellitus",               default: false
    t.string   "patient_diabetes_mellitus_since"
    t.text     "patient_diabetes_mellitus_treatment"
    t.boolean  "patient_arterial_hypertension",           default: false
    t.date     "patient_arterial_hypertension_since"
    t.text     "patient_arterial_hypertension_treatment"
    t.boolean  "patient_thyroid",                         default: false
    t.text     "patient_thyroid_description"
    t.boolean  "patient_nefropathy",                      default: false
    t.text     "patient_nefropathy_description"
    t.boolean  "patient_alergies",                        default: false
    t.text     "patient_alergies_description"
    t.boolean  "patient_cardiopathy",                     default: false
    t.text     "patient_cardiopathy_description"
    t.boolean  "patient_surgery",                         default: false
    t.text     "patient_surgery_description"
    t.boolean  "patient_cancer",                          default: false
    t.text     "patient_cancer_description"
    t.boolean  "patient_transfusion",                     default: false
    t.text     "patient_transfusion_description"
    t.boolean  "patient_smoking",                         default: false
    t.text     "patient_ailments_other"
    t.boolean  "patient_myopia",                          default: false
    t.text     "patient_myopia_description"
    t.boolean  "patient_hyperopia",                       default: false
    t.text     "patient_hyperopia_description"
    t.boolean  "patient_astigmatism",                     default: false
    t.text     "patient_astigmatism_description"
    t.boolean  "patient_keratoconus",                     default: false
    t.text     "patient_keratoconus_description"
    t.boolean  "patient_presbyopia",                      default: false
    t.text     "patient_presbyopia_description"
    t.boolean  "patient_uses_glasses",                    default: false
    t.date     "patient_uses_glasses_since"
    t.boolean  "patient_uses_contact_lenses",             default: false
    t.date     "patient_uses_contact_lenses_since"
    t.boolean  "patient_strabismus",                      default: false
    t.text     "patient_strabismus_treatment"
    t.boolean  "patient_cataracts",                       default: false
    t.date     "patient_cataracts_since"
    t.boolean  "patient_glaucoma",                        default: false
    t.date     "patient_glaucoma_since"
    t.text     "patient_glaucoma_treatment"
    t.boolean  "patient_diabetic_retinopathy",            default: false
    t.boolean  "patient_laser_surgery",                   default: false
    t.boolean  "patient_retinal_deatachment_left",        default: false
    t.boolean  "patient_retinal_deatachment_right",       default: false
    t.date     "patient_retinal_deatachment_since"
    t.text     "patient_retinal_deatachment_treatment"
    t.boolean  "shocks"
    t.text     "shocks_description"
    t.boolean  "surgery_left_eye",                        default: false
    t.text     "surgery_left_eye_description"
    t.boolean  "surgery_right_eye",                       default: false
    t.text     "surgery_right_eye_description"
    t.text     "patient_other_eye_ailments"
    t.boolean  "patient_is_pregnant",                     default: false
    t.boolean  "lactation",                               default: false
    t.boolean  "gynobstetric_revision_during_pregnancy",  default: false
    t.boolean  "ailment_presence_during_pregnancy",       default: false
    t.text     "ailments_during_pregnancy"
    t.text     "ailments_during_pregnancy_treatment"
    t.string   "weight_at_birth"
    t.string   "size_at_birth"
    t.boolean  "born_of_term",                            default: false
    t.text     "problems_during_birth"
    t.string   "uncorrected_visual_acuity_left"
    t.string   "uncorrected_visual_acuity_both"
    t.string   "uncorrected_visual_acuity_right"
    t.string   "pinhole_left"
    t.string   "pinhole_both"
    t.string   "pinhole_right"
    t.string   "visual_acuity_with_correction_left"
    t.string   "visual_acuity_with_correction_both"
    t.string   "visual_acuity_with_correction_right"
    t.boolean  "patient_uses_contact_lenses_current",     default: false
    t.boolean  "patient_uses_glasses_current",            default: false
    t.string   "corrected_visual_acuity_left"
    t.string   "corrected_visual_acuity_both"
    t.string   "corrected_visual_acuity_right"
    t.string   "lensometer_left_value_1"
    t.string   "lensometer_left_value_2"
    t.string   "lensometer_left_value_3"
    t.string   "lensometer_right_value_1"
    t.string   "lensometer_right_value_2"
    t.string   "lensometer_right_value_3"
    t.string   "add_1"
    t.text     "refraction"
    t.string   "manifested_refraction_left_value_1"
    t.string   "manifested_refraction_left_value_2"
    t.string   "manifested_refraction_left_value_3"
    t.string   "manifested_refraction_right_value_1"
    t.string   "manifested_refraction_right_value_2"
    t.string   "manifested_refraction_right_value_3"
    t.string   "subjective_refraction_left_value_1"
    t.string   "subjective_refraction_left_value_2"
    t.string   "subjective_refraction_left_value_3"
    t.string   "subjective_refraction_right_value_1"
    t.string   "subjective_refraction_right_value_2"
    t.string   "subjective_refraction_right_value_3"
    t.string   "add_2"
    t.string   "autorefraction_left_value_1"
    t.string   "autorefraction_left_value_2"
    t.string   "autorefraction_left_value_3"
    t.string   "autorefraction_right_value_1"
    t.string   "autorefraction_right_value_2"
    t.string   "autorefraction_right_value_3"
    t.string   "cicloplegic_refraction_left_value_1"
    t.string   "cicloplegic_refraction_left_value_2"
    t.string   "cicloplegic_refraction_left_value_3"
    t.string   "cicloplegic_refraction_right_value_1"
    t.string   "cicloplegic_refraction_right_value_2"
    t.string   "cicloplegic_refraction_right_value_3"
    t.string   "better_corrected_visual_acuity_left"
    t.string   "better_corrected_visual_acuity_both"
    t.string   "better_corrected_visual_acuity_right"
    t.string   "keratometry_left"
    t.string   "keratometry_right"
    t.string   "paquimetry_left"
    t.string   "paquimetry_right"
    t.string   "specular_biomicroscopy_left"
    t.string   "specular_biomicroscopy_right"
    t.string   "pupillary_reflexes_left"
    t.string   "pupillary_reflexes_right"
    t.string   "ocular_movements"
    t.string   "ductions_left"
    t.string   "ductions_right"
    t.string   "versions_left"
    t.string   "versions_right"
    t.string   "primary_position_of_gaze_left"
    t.string   "primary_position_of_gaze_right"
    t.string   "eyelids_left"
    t.string   "eyelids_right"
    t.string   "annexes_left"
    t.string   "annexes_right"
    t.string   "lachrymal_left"
    t.string   "lachrymal_right"
    t.string   "conjunctiva_left"
    t.string   "conjunctiva_right"
    t.string   "cornea_left"
    t.string   "cornea_right"
    t.string   "antechamber_left"
    t.string   "antechamber_right"
    t.string   "intraocular_pressure_left"
    t.string   "intraocular_pressure_right"
    t.string   "iris_left"
    t.string   "iris_right"
    t.string   "pupil_left"
    t.string   "pupil_right"
    t.string   "crystaline_left"
    t.string   "crystaline_right"
    t.string   "fundus_left"
    t.string   "fundus_right"
    t.string   "retina_left"
    t.string   "retina_right"
    t.string   "vitreous_left"
    t.string   "vitreous_right"
    t.string   "optic_nerve_left"
    t.string   "optic_nerve_right"
    t.string   "taint_left"
    t.string   "taint_right"
    t.text     "observations"
    t.text     "diagnosis"
    t.text     "plan_and_treatment"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "doctor_id"
  end

  add_index "ophtalmology_templates", ["doctor_id"], name: "index_ophtalmology_templates_on_doctor_id"

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.date     "birth_date"
    t.string   "sex"
    t.string   "originary_from"
    t.string   "ocupation"
    t.string   "religion"
    t.string   "address"
    t.string   "telephone"
    t.string   "email"
    t.string   "insurance_company"
    t.string   "insurance_policy"
    t.integer  "templatable_id"
    t.string   "templatable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "doctor_id"
  end

  add_index "patients", ["doctor_id"], name: "index_patients_on_doctor_id"
  add_index "patients", ["templatable_id"], name: "index_patients_on_templatable_id"

  create_table "pregnancies", force: :cascade do |t|
    t.integer  "pregnancy_number"
    t.date     "pregnancy_date"
    t.string   "abortion"
    t.string   "delivery"
    t.string   "induction"
    t.string   "ending"
    t.string   "rn"
    t.string   "newborn"
    t.string   "baby_weight"
    t.string   "baby_sex"
    t.string   "puerperium"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "gynecology_template_id"
  end

  add_index "pregnancies", ["gynecology_template_id"], name: "index_pregnancies_on_gynecology_template_id"

  create_table "prescriptions", force: :cascade do |t|
    t.text     "prescription"
    t.integer  "prescriptable_id"
    t.string   "prescriptable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "template_files", force: :cascade do |t|
    t.string   "asset"
    t.integer  "fileable_id"
    t.string   "fileable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "template_photos", force: :cascade do |t|
    t.string   "photo"
    t.integer  "photable_id"
    t.string   "photable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end

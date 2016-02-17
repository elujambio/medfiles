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

ActiveRecord::Schema.define(version: 20160216212157) do

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
    t.string   "induction"
    t.integer  "gestational_age"
    t.date     "fum"
    t.date     "fup"
    t.date     "fua"
    t.date     "fuc"
    t.date     "fpp"
    t.string   "doc"
    t.text     "previous_preganancy_complications"
    t.text     "colposcopy"
    t.text     "sexual_habits"
    t.boolean  "fridigity",                         default: false
    t.string   "dyspareunia"
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
    t.string   "ocupation"
    t.string   "religion"
    t.text     "address"
    t.string   "telephone"
    t.string   "insurance_company"
    t.string   "insurance_policy"
    t.boolean  "previous_revisions"
    t.string   "current"
    t.text     "ailments"
    t.string   "family_hypertension"
    t.string   "family_cardiopathy"
    t.string   "family_thyroid"
    t.string   "family_cancer"
    t.text     "family_other"
    t.string   "family_myopia"
    t.string   "farsightedness"
    t.string   "astigmatism"
    t.string   "family_diabetic_retinopathy"
    t.string   "family_eye_surgery"
    t.string   "family_cataract"
    t.string   "family_retinal_deatachment"
    t.string   "family_laser_surgery"
    t.text     "family_other_ailments_2"
    t.boolean  "patient_diabetes_mellitus",               default: false
    t.string   "patient_diabetes_mellitus_time"
    t.text     "patient_diabetes_mellitus_treatment"
    t.boolean  "patient_arterial_hypertension",           default: false
    t.string   "patient_arterial_hypertension_time"
    t.text     "patient_arterial_hypertension_treatment"
    t.boolean  "patient_nefropathy",                      default: false
    t.text     "patient_nefropathy_description"
    t.boolean  "patient_alergies",                        default: false
    t.text     "patient_alergies_description"
    t.boolean  "patient_cancer",                          default: false
    t.text     "patient_cancer_description"
    t.boolean  "patient_transfution",                     default: false
    t.text     "patient_transfution_description"
    t.boolean  "patient_smoking",                         default: false
    t.text     "patient_ailments_other"
    t.boolean  "patient_myopia",                          default: false
    t.text     "patient_myopia_description"
    t.boolean  "patient_hyperopia",                       default: false
    t.text     "patient_hyperopia_description"
    t.boolean  "patient_astigmatism",                     default: false
    t.text     "patient_astigmatism_description"
    t.boolean  "patient_presbyopia",                      default: false
    t.text     "patient_presbyopia_description"
    t.boolean  "patient_uses_glasses",                    default: false
    t.date     "patient_uses_glasses_since"
    t.boolean  "patient_squint",                          default: false
    t.text     "patient_squint_treatment"
    t.boolean  "patient_glaucoma",                        default: false
    t.date     "patient_glaucoma_since"
    t.text     "patient_glaucoma_treatment"
    t.string   "lensometer_left_value"
    t.string   "lensometer_left_value_2"
    t.string   "lensometer_left_value_3"
    t.string   "lensometer_right_value_1"
    t.string   "lensometer_right_value_2"
    t.string   "lensometer_right_value_3"
    t.string   "add"
    t.text     "refraction"
    t.string   "subjective_left_value_1"
    t.string   "subjective_left_value_2"
    t.string   "subjective_left_value_3"
    t.string   "subjective_right_value_1"
    t.string   "subjective_right_value_2"
    t.string   "subjective_right_value_3"
    t.string   "autorefraction_left_value_1"
    t.string   "autorefraction_left_value_2"
    t.string   "autorefraction_left_value_3"
    t.string   "autorefraction_right_value_1"
    t.string   "autorefraction_right_value_2"
    t.string   "autorefraction_right_value_3"
    t.string   "cycloplegic_left_value_1"
    t.string   "cycloplegic_left_value_2"
    t.string   "cycloplegic_left_value_3"
    t.string   "cycloplegic_right_value_1"
    t.string   "cycloplegic_right_value_2"
    t.string   "cycloplegic_right_value_3"
    t.text     "keratometry_left"
    t.text     "keratometry_right"
    t.string   "specular_magnification_left"
    t.string   "specular_magnification_right"
    t.string   "pupillary_reflexes_left"
    t.string   "pupilary_reflexes_right"
    t.text     "ocular_movements"
    t.string   "ocular_movement_version_left"
    t.string   "ocular_movement_version_right"
    t.string   "ppm"
    t.text     "eyelids_left"
    t.text     "eyelids_right"
    t.boolean  "retinal_deatachment_left",                default: false
    t.boolean  "retinal_deatachment_right",               default: false
    t.text     "retinal_deatachment_time"
    t.text     "retinal_deatachment_treatment"
    t.text     "retinal_deatachment_description"
    t.text     "eye_surgery_left"
    t.text     "eye_surgery_right"
    t.text     "other_eye_condition"
    t.boolean  "pregnancy",                               default: false
    t.text     "pregnancy_description"
    t.boolean  "gynobstetric_revision_during_pregnancy",  default: false
    t.text     "ailments_during_pregnancy"
    t.text     "ailments_during_pregnancy_treatment"
    t.decimal  "weight_at_birth",                         default: 0.0
    t.decimal  "size_at_birth",                           default: 0.0
    t.boolean  "born_of_term",                            default: false
    t.text     "born_of_term_description"
    t.string   "avsc_first_value"
    t.string   "avsc_second_value"
    t.string   "avsc_third_value"
    t.string   "avcc_first_value"
    t.string   "avcc_second_value"
    t.string   "avcc_third_value"
    t.string   "pinhole_first_value"
    t.string   "pinhole_second_value"
    t.string   "pinhole_third_value"
    t.string   "conjunctiva_left"
    t.string   "conjunctiva_right"
    t.string   "cornea_left"
    t.string   "cornea_right"
    t.string   "antechamber_left"
    t.string   "antechamber_right"
    t.string   "ac_bottom_left_value_1"
    t.string   "ac_bottom_left_value_2"
    t.string   "ac_bottom_right_value_1"
    t.string   "ac_bottom_right_value_2"
    t.string   "intraocular_pressure_left"
    t.string   "intraocular_pressure_2"
    t.string   "goinoscopy_left"
    t.string   "goinoscopy_right"
    t.string   "iris_left"
    t.string   "iris_right"
    t.string   "pupil_right"
    t.string   "pupil_left"
    t.string   "crystaline_left"
    t.string   "crystaline_right"
    t.string   "fundus_right"
    t.string   "fundus_left"
    t.string   "retina_right"
    t.string   "retina_left"
    t.string   "vitreous_left"
    t.string   "vitreous_right"
    t.string   "no_left"
    t.string   "no_right"
    t.text     "no_left_description"
    t.text     "no_right_description"
    t.text     "general_annotations"
    t.text     "diagnosis"
    t.text     "diagnosis_treatment"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "email"
    t.integer  "doctor_id"
  end

  add_index "ophtalmology_templates", ["doctor_id"], name: "index_ophtalmology_templates_on_doctor_id"

end

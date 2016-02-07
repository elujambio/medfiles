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

ActiveRecord::Schema.define(version: 20160207003537) do

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
  end

end

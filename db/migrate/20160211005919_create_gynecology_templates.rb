class CreateGynecologyTemplates < ActiveRecord::Migration
  def change
    create_table :gynecology_templates do |t|
      t.integer :register, default: 0
      t.string :name
      t.string :email
      t.string :husband_name
      t.text :address
      t.string :telephone
      t.integer :age
      t.integer :husband_age
      t.string :marital_status
      t.string :ocupation
      t.string :husband_ocupation
      t.text :reason
      t.text :mother_background
      t.text :father_background
      t.text :grandparents_background
      t.text :siblings_background
      t.text :parents_siblings_background
      t.text :children_background
      t.text :husband_background
      t.text :personal_background
      t.text :diet
      t.text :smoking
      t.text :alergies
      t.text :drugs
      t.string :alcoholism
      t.text :inmunizations
      t.text :traumatics
      t.text :surgicals
      t.text :transfusions
      t.string :menarche
      t.string :rhythm
      t.string :dysmenorrhea, default: false
      t.boolean :circumcised_partner
      t.integer :ivsa
      t.integer :number_of_sexual_partners
      t.boolean :pms, default: false 
      t.string :pms_duration
      t.string :gestate
      t.string :gestate_for
      t.integer :c_section
      t.integer :abortions
      t.integer :ee
      t.string :induction
      t.integer :gestational_age
      t.date :fum
      t.date :fup
      t.date :fua
      t.date :fuc
      t.date :fpp
      t.string :doc
      t.text :previous_preganancy_complications
      t.text :colposcopy
      t.text :sexual_habits
      t.boolean :fridigity, default: false
      t.string :dyspareunia
      t.boolean :menopause, default: false
      t.text :menopause_symptomatology
      t.boolean :leucorrea, default: false
      t.text :leucorrea_treatment
      t.text :pregnancy_medication
      t.string :ta
      t.decimal :weight
      t.decimal :size
      t.text  :habitus
      t.text :head
      t.text :neck
      t.text :torax
      t.text :abdomen
      t.text :limbs
      t.text :breasts_appearance
      t.boolean :symetry, default: false
      t.text :skin_abnormalities
      t.text :nipple
      t.text :abnormal_mass
      t.text :axillary_region
      t.text :ganglion_growth
      t.text :abnormal_secretion
      t.text :mastalgia
      t.text :external_aspect
      t.text :clitoris
      t.text :vulva
      t.text :pubic_hair
      t.text :himen
      t.text :introito
      t.text :perine
      t.text :vaginal_walls
      t.text :secreation_and_discharge
      t.text :cervix
      t.text :uterus_position
      t.text :uterus_consistency
      t.text :uterus_size
      t.text :uterus_form
      t.text :annexes
      t.text :speculoscopy
      t.text :internal_and_external_genitalia
      t.text :clinic_pelvimetry
      t.text :impression_diagnosis
      t.text :other_1
      t.text :other_2
      t.text :other_3
      t.text :other_4
      t.text :other_5

      t.timestamps null: false
    end
  end
end

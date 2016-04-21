class CreateGeneralTemplates < ActiveRecord::Migration
  def change
    create_table :general_templates do |t|
      t.integer :register, default: 0
    
      t.string :marital_status 
     
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
      t.text :physical_exercise
      t.text :housing_perks
      t.boolean :smoking, default: false
      t.text :alergies
      t.text :drugs
      t.string :alcoholism
      t.text :inmunizations
      t.text :traumatics
      t.text :surgicals
      t.text :transfusions
      t.string :menarche
      t.string :gesta
      t.text :abortions
      t.string :rhythm
      t.text :pregnancies
      t.text :contraceptives
      t.date :last_period_date
      t.string :ivsa
      t.text :current_ailment
      t.text :cardio
      t.text :neuro
      t.text :gastro
      t.text :respiratory
      t.text :derma
      t.text :muscle
      t.text :urinary
      t.string :ta
      t.string :fc
      t.string :fr
      t.string :temperature
      t.decimal :weight
      t.decimal :size
      t.text  :habitus
      t.text :head
      t.text :neck
      t.text :torax
      t.text :abdomen
      t.text :limbs
     
     
    
      t.text :lab_results
      t.text :diagnosis
      t.text :treatment
      t.text :other_1
      t.text :other_2
      t.text :other_3
      t.text :other_4
      t.text :other_5

      
      t.timestamps null: false
    end
  end
end

import '../../presentation/widget/quiz_questions_widget.dart';

Map<String, dynamic> medMicroQuestions = {
  'Amatuer': <QuizQuestionsWidget>[],
  'Easy': <QuizQuestionsWidget>[
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following is the primary method for sterilizing culture media in the microbiology lab?',
      quizOptions: const [
        'Filtration',
        'Autoclaving',
        'UV radiation',
        'Dry heat'
      ],
      correctOption: 'Autoclaving',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the purpose of using aseptic technique in the microbiology lab?',
      quizOptions: const [
        'To save time',
        'To prevent contamination of samples and the environment',
        'To increase the growth rate of microbes',
        'To sterilize the workbench'
      ],
      correctOption: 'To prevent contamination of samples and the environment',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is a common indicator of contamination in a microbial culture?',
      quizOptions: const [
        'Clear broth',
        'No growth on the agar plate',
        'Mixed growth of unexpected organisms',
        'Increased temperature'
      ],
      correctOption: 'Mixed growth of unexpected organisms',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which type of cells are primarily used to culture viruses in the lab?',
      quizOptions: const [
        'Red blood cells',
        'Epithelial cells',
        'Fibroblasts',
        'Bacterial cells'
      ],
      correctOption: 'Fibroblasts',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'What is the purpose of a plaque assay in virology?',
      quizOptions: const [
        'To measure bacterial growth',
        'To quantify the number of virus particles',
        'To stain viral particles',
        'To identify viral species'
      ],
      correctOption: 'To quantify the number of virus particles',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following is a common method for detecting viral RNA?',
      quizOptions: const [
        'ELISA',
        'PCR',
        'Gram staining',
        'Culture on agar plates'
      ],
      correctOption: 'PCR',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the primary stain used for detecting malaria parasites in blood smears?',
      quizOptions: const [
        'Gram stain',
        'Giemsa stain',
        'Acid-fast stain',
        'Wright’s stain'
      ],
      correctOption: 'Giemsa stain',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which sample type is commonly used to diagnose intestinal parasitic infections?',
      quizOptions: const ['Blood', 'Stool', 'Urine', 'Sputum'],
      correctOption: 'Stool',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following parasites is typically identified by its characteristic egg morphology in stool samples?',
      quizOptions: const [
        'Plasmodium falciparum',
        'Ascaris lumbricoides',
        'Giardia lamblia',
        'Trypanosoma brucei'
      ],
      correctOption: 'Ascaris lumbricoides',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'What is the role of DNA polymerase in PCR?',
      quizOptions: const [
        'To separate DNA strands',
        'To synthesize new DNA strands',
        'To cut DNA into fragments',
        'To ligate DNA fragments'
      ],
      correctOption: 'To synthesize new DNA strands',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following steps is not part of the PCR cycle?',
      quizOptions: const [
        'Denaturation',
        'Annealing',
        'Extension',
        'Translation'
      ],
      correctOption: 'Translation',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the primary purpose of gel electrophoresis in molecular diagnostics?',
      quizOptions: const [
        'To amplify DNA',
        'To separate DNA fragments by size',
        'To sequence DNA',
        'To lyse cells'
      ],
      correctOption: 'To separate DNA fragments by size',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the shape of Staphylococcus aureus under the microscope?',
      quizOptions: const [
        'Rod-shaped',
        'Spiral-shaped',
        'Spherical (cocci)',
        'Comma-shaped'
      ],
      correctOption: 'Spherical (cocci)',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which biochemical test differentiates Staphylococcus aureus from other staphylococci?',
      quizOptions: const [
        'Catalase test',
        'Coagulase test',
        'Oxidase test',
        'Indole test'
      ],
      correctOption: 'Coagulase test',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'What is the purpose of the Gram stain in bacteriology?',
      quizOptions: const [
        'To determine the metabolic activity of bacteria',
        'To identify bacterial spores',
        'To classify bacteria into Gram-positive and Gram-negative',
        'To detect bacterial toxins'
      ],
      correctOption:
          'To classify bacteria into Gram-positive and Gram-negative',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'Which medium is commonly used for cultivating fungi?',
      quizOptions: const [
        'MacConkey agar',
        'Sabouraud dextrose agar',
        'Blood agar',
        'Chocolate agar'
      ],
      correctOption: 'Sabouraud dextrose agar',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the typical appearance of Candida albicans under the microscope?',
      quizOptions: const [
        'Rod-shaped bacteria',
        'Yeast cells and pseudohyphae',
        'Hyphal filaments',
        'Spiral-shaped bacteria'
      ],
      correctOption: 'Yeast cells and pseudohyphae',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which stain is used to visualize fungal elements in clinical samples?',
      quizOptions: const [
        'Gram stain',
        'Acid-fast stain',
        'Lactophenol cotton blue',
        'Wright’s stain'
      ],
      correctOption: 'Lactophenol cotton blue',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'Why is quality control important in microbiology labs?',
      quizOptions: const [
        'To increase the speed of testing',
        'To ensure the accuracy and reliability of test results',
        'To reduce the number of tests performed',
        'To save costs on reagents'
      ],
      correctOption: 'To ensure the accuracy and reliability of test results',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What personal protective equipment (PPE) is essential when handling infectious samples?',
      quizOptions: const [
        'Safety goggles',
        'Lab coat',
        'Gloves',
        'All of the above'
      ],
      correctOption: 'All of the above',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'Which of the following is a function of hemoglobin?',
      quizOptions: const [
        'Regulating blood pressure',
        'Carrying oxygen to tissues',
        'Aiding in digestion',
        'Regulating blood sugar levels'
      ],
      correctOption: 'Carrying oxygen to tissues',
    ),
  ],
  'Hard': <QuizQuestionsWidget>[
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A sample tests positive for the mecA gene using PCR. This result indicates the presence of:',
      quizOptions: const [
        'Methicillin-resistant Staphylococcus aureus (MRSA)',
        'Vancomycin-resistant Enterococcus (VRE)',
        'Carbapenem-resistant Enterobacteriaceae (CRE)',
        'Extended-spectrum beta-lactamase (ESBL) producing bacteria'
      ],
      correctOption: 'Methicillin-resistant Staphylococcus aureus (MRSA)',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following is the most appropriate molecular method to detect Clostridioides difficile toxin genes?',
      quizOptions: const ['RT-PCR', 'Northern blot', 'Southern blot', 'FISH'],
      correctOption: 'RT-PCR',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What does a positive result in a multiplex PCR assay for respiratory pathogens indicate?',
      quizOptions: const [
        'Presence of a single pathogen',
        'Presence of multiple pathogens',
        'Absence of all tested pathogens',
        'Inconclusive results'
      ],
      correctOption: 'Presence of multiple pathogens',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'In a PCR test for Mycobacterium tuberculosis, what does the detection of the IS6110 element indicate?',
      quizOptions: const [
        'Infection with a non-tuberculosis mycobacterium',
        'Infection with Mycobacterium leprae',
        'Infection with Mycobacterium tuberculosis complex',
        'No infection'
      ],
      correctOption: 'Infection with Mycobacterium tuberculosis complex',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which gene is commonly targeted in molecular tests to identify Salmonella species?',
      quizOptions: const [
        '16S rRNA gene',
        'invA gene',
        'katG gene',
        'bla gene'
      ],
      correctOption: 'invA gene',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What does a high cycle threshold (Ct) value in a quantitative PCR (qPCR) for viral load typically suggest?',
      quizOptions: const [
        'High viral load',
        'Low viral load',
        'No viral RNA detected',
        'Contamination in the sample'
      ],
      correctOption: 'Low viral load',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A PCR assay for detection of HIV-1 RNA shows no amplification signal. What does this most likely indicate?',
      quizOptions: const [
        'Presence of HIV-1 infection',
        'Absence of HIV-1 infection',
        'PCR inhibition',
        'Equipment malfunction'
      ],
      correctOption: 'Absence of HIV-1 infection',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which molecular method is commonly used for typing of bacterial strains in outbreak investigations?',
      quizOptions: const [
        'PFGE (Pulsed-Field Gel Electrophoresis)',
        'Southern blotting',
        'Northern blotting',
        'ELISA'
      ],
      correctOption: 'PFGE (Pulsed-Field Gel Electrophoresis)',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A patient’s stool sample tested positive for rotavirus RNA by RT-PCR. What does this result indicate?',
      quizOptions: const [
        'Bacterial gastroenteritis',
        'Viral gastroenteritis',
        'Parasitic infection',
        'Fungal infection'
      ],
      correctOption: 'Viral gastroenteritis',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'In a real-time PCR assay for influenza A virus, a melting curve analysis is performed. What does a single, sharp peak in the melting curve indicate?',
      quizOptions: const [
        'Presence of a single, specific amplicon',
        'Presence of multiple non-specific products',
        'PCR failure',
        'Contamination'
      ],
      correctOption: 'Presence of a single, specific amplicon',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which molecular technique is commonly used to detect antimicrobial resistance genes directly from clinical samples?',
      quizOptions: const [
        'PCR',
        'Western blotting',
        'Flow cytometry',
        'Mass spectrometry'
      ],
      correctOption: 'PCR',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the primary target of PCR tests used for the detection of Neisseria gonorrhoeae?',
      quizOptions: const [
        'opa gene',
        '16S rRNA gene',
        'pncA gene',
        'ureC gene'
      ],
      correctOption: 'opa gene',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A positive result for the katG and inhA mutations in a Mycobacterium tuberculosis isolate suggests resistance to:',
      quizOptions: const [
        'Rifampicin',
        'Isoniazid',
        'Ethambutol',
        'Streptomycin'
      ],
      correctOption: 'Isoniazid',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'In a PCR assay for Borrelia burgdorferi, what does the presence of the ospA gene indicate?',
      quizOptions: const [
        'Lyme disease',
        'Syphilis',
        'Rocky Mountain spotted fever',
        'Malaria'
      ],
      correctOption: 'Lyme disease',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which molecular diagnostic method is used to identify norovirus in clinical samples?',
      quizOptions: const [
        'RT-PCR',
        'Western blotting',
        'ELISA',
        'Northern blotting'
      ],
      correctOption: 'RT-PCR',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A PCR assay for detecting carbapenem-resistant genes in Enterobacteriaceae is performed. Which gene is commonly targeted?',
      quizOptions: const ['mecA', 'blaKPC', 'vanA', 'gyrA'],
      correctOption: 'blaKPC',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A molecular diagnostic test for Chlamydia trachomatis targets which gene?',
      quizOptions: const ['ompA gene', 'katG gene', 'pncA gene', 'rpoB gene'],
      correctOption: 'ompA gene',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'In a PCR test for detection of hepatitis B virus (HBV), the presence of which DNA indicates active infection?',
      quizOptions: const [
        'Surface antigen gene (HBsAg)',
        'Core antigen gene (HBcAg)',
        'Polymerase gene (pol)',
        'X gene (HBx)'
      ],
      correctOption: 'Surface antigen gene (HBsAg)',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A molecular test for Zika virus RNA using RT-PCR shows amplification. What does this result suggest?',
      quizOptions: const [
        'Current infection with Zika virus',
        'Previous infection with Zika virus',
        'No infection with Zika virus',
        'Vaccination against Zika virus'
      ],
      correctOption: 'Current infection with Zika virus',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which control is essential in a PCR test to rule out false positives due to contamination?',
      quizOptions: const [
        'Positive control',
        'Negative control',
        'Internal control',
        'All of the above'
      ],
      correctOption: 'Negative control',
    ),
  ],
  'Professional': <QuizQuestionsWidget>[
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which section of ISO 15189 covers the requirements for quality management systems in medical laboratories?',
      quizOptions: const ['Section 5', 'Section 4', 'Section 3', 'Section 2'],
      correctOption: 'Section 4',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following is a primary goal of implementing a QMS in a clinical laboratory?',
      quizOptions: const [
        'To increase the number of tests performed',
        'To ensure consistent and reliable test results',
        'To reduce the cost of testing',
        'To comply with government regulations'
      ],
      correctOption: 'To ensure consistent and reliable test results',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'According to ISO 15189, who is responsible for ensuring the quality and competency of laboratory personnel?',
      quizOptions: const [
        'Laboratory Director',
        'Quality Manager',
        'Safety Officer',
        'Laboratory Technician'
      ],
      correctOption: 'Laboratory Director',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the purpose of an internal audit in a laboratory QMS?',
      quizOptions: const [
        'To increase workload',
        'To identify nonconformities and areas for improvement',
        'To train new employees',
        'To validate new test methods'
      ],
      correctOption: 'To identify nonconformities and areas for improvement',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which document outlines the procedures and policies for maintaining a QMS in the laboratory?',
      quizOptions: const [
        'Laboratory manual',
        'Standard Operating Procedures (SOPs)',
        'Quality Manual',
        'Test requisition forms'
      ],
      correctOption: 'Quality Manual',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'In a molecular lab, what is the primary purpose of a validation study for a new test method?',
      quizOptions: const [
        'To publish research findings',
        'To verify that the test method performs as expected',
        'To train personnel',
        'To save costs'
      ],
      correctOption: 'To verify that the test method performs as expected',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following is a critical component of quality control in molecular diagnostic testing?',
      quizOptions: const [
        'Regular maintenance of pipettes',
        'Testing of reference materials',
        'Documentation of test results',
        'Use of sterile gloves'
      ],
      correctOption: 'Testing of reference materials',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the importance of proficiency testing (PT) in a molecular lab?',
      quizOptions: const [
        'To ensure the accuracy and reliability of test results',
        'To increase test throughput',
        'To reduce operational costs',
        'To minimize the use of reagents'
      ],
      correctOption: 'To ensure the accuracy and reliability of test results',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'According to ISO 15189, what should be done when a nonconformity is identified in a molecular lab?',
      quizOptions: const [
        'Ignore it and continue testing',
        'Document it and implement corrective actions',
        'Report it to regulatory authorities immediately',
        'Reassign personnel'
      ],
      correctOption: 'Document it and implement corrective actions',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which aspect of sample management is crucial for maintaining the integrity of molecular diagnostic tests?',
      quizOptions: const [
        'Proper labeling and tracking',
        'Using expensive reagents',
        'Hiring more staff',
        'Storing samples at room temperature'
      ],
      correctOption: 'Proper labeling and tracking',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the role of external quality assessment (EQA) in a parasitology lab?',
      quizOptions: const [
        'To increase the number of samples processed',
        'To benchmark the lab’s performance against other labs',
        'To reduce the cost of testing',
        'To train new technicians'
      ],
      correctOption: 'To benchmark the lab’s performance against other labs',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'In a parasitology lab, what is the primary purpose of staining techniques like Giemsa stain?',
      quizOptions: const [
        'To make samples look more colorful',
        'To enhance the visibility of parasites under the microscope',
        'To kill bacteria',
        'To preserve the sample'
      ],
      correctOption:
          'To enhance the visibility of parasites under the microscope',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following is a key quality control measure for microscopic examination in a parasitology lab?',
      quizOptions: const [
        'Calibration of microscopes',
        'Using only one type of stain',
        'Running tests without controls',
        'Increasing the sample volume'
      ],
      correctOption: 'Calibration of microscopes',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'According to ISO 15189, what should be done if a parasitology test result is questionable?',
      quizOptions: const [
        'Report it as negative',
        'Retest the sample and review the process',
        'Discard the sample',
        'Assume it is a false positive'
      ],
      correctOption: 'Retest the sample and review the process',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is an essential practice for ensuring the accuracy of parasitology test results?',
      quizOptions: const [
        'Using high-quality reagents',
        'Performing regular proficiency testing',
        'Increasing the number of tests performed',
        'Hiring more staff'
      ],
      correctOption: 'Performing regular proficiency testing',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which biochemical test is critical for identifying Staphylococcus aureus in a bacteriology lab?',
      quizOptions: const [
        'Coagulase test',
        'Indole test',
        'Citrate test',
        'Urease test'
      ],
      correctOption: 'Coagulase test',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Why is antibiotic susceptibility testing important in a bacteriology lab?',
      quizOptions: const [
        'To determine the best treatment options for bacterial infections',
        'To identify the bacterial species',
        'To document laboratory procedures',
        'To calibrate lab equipment'
      ],
      correctOption:
          'To determine the best treatment options for bacterial infections',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'According to ISO 15189, how should equipment calibration records be maintained in a bacteriology lab?',
      quizOptions: const [
        'Only electronic records',
        'Only paper records',
        'Both paper and electronic records',
        'No need for records'
      ],
      correctOption: 'Both paper and electronic records',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which type of quality control measure ensures that culture media in a bacteriology lab are performing correctly?',
      quizOptions: const [
        'Sterility testing',
        'Gram staining',
        'pH testing',
        'Antibiotic testing'
      ],
      correctOption: 'Sterility testing',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the importance of maintaining environmental monitoring in a bacteriology lab?',
      quizOptions: const [
        'To reduce the workload',
        'To ensure a contamination-free environment',
        'To increase the number of tests performed',
        'To minimize reagent use'
      ],
      correctOption: 'To ensure a contamination-free environment',
    ),
  ]
};

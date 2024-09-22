import '../../presentation/widget/quiz_questions_widget.dart';

Map<String, dynamic> hematologyQuestions = {
  'Amatuer': <QuizQuestionsWidget>[],
  'Easy': <QuizQuestionsWidget>[
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which blood type is considered the universal donor for red blood cells?',
      quizOptions: const ['A+', 'B+', 'AB+', 'O-'],
      correctOption: 'O-',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which blood type is considered the universal recipient for red blood cells?',
      quizOptions: const ['A+', 'B+', 'AB+', 'O+'],
      correctOption: 'AB+',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A patient with blood type A can receive red blood cells from which of the following donors?',
      quizOptions: const ['A and O', 'B and O', 'AB and A', 'O and AB'],
      correctOption: 'A and O',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the most common blood type in the general population?',
      quizOptions: const ['A+', 'B+', 'AB+', 'O+'],
      correctOption: 'O+',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A person with blood type B+ can donate red blood cells to which blood types?',
      quizOptions: const [
        'B+ and AB+',
        'B- and AB-',
        'B+ and O+',
        'A+ and AB+'
      ],
      correctOption: 'B+ and AB+',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'Which blood type has anti-A antibodies in the plasma?',
      quizOptions: const ['Type A', 'Type B', 'Type AB', 'Type O'],
      correctOption: 'Type B',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'Which blood type has no ABO antibodies in the plasma?',
      quizOptions: const ['Type A', 'Type B', 'Type AB', 'Type O'],
      correctOption: 'Type AB',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A patient with Rh-negative blood can receive blood from which Rh type?',
      quizOptions: const [
        'Only Rh-negative',
        'Only Rh-positive',
        'Both Rh-positive and Rh-negative',
        'Neither Rh-positive nor Rh-negative'
      ],
      correctOption: 'Only Rh-negative',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the primary purpose of crossmatching before a blood transfusion?',
      quizOptions: const [
        'To determine the patient’s blood type',
        'To ensure compatibility between donor and recipient blood',
        'To screen for infectious diseases',
        'To assess the recipient’s hemoglobin level'
      ],
      correctOption:
          'To ensure compatibility between donor and recipient blood',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which component is typically used to increase a patient’s platelet count?',
      quizOptions: const [
        'Whole blood',
        'Fresh frozen plasma',
        'Platelet concentrate',
        'Red blood cells'
      ],
      correctOption: 'Platelet concentrate',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What blood component is primarily used to treat patients with clotting factor deficiencies?',
      quizOptions: const [
        'Platelets',
        'Fresh frozen plasma',
        'Red blood cells',
        'Cryoprecipitate'
      ],
      correctOption: 'Fresh frozen plasma',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which Rh antigen is most commonly involved in hemolytic disease of the newborn (HDN)?',
      quizOptions: const [
        'D antigen',
        'C antigen',
        'E antigen',
        'Kell antigen'
      ],
      correctOption: 'D antigen',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the recommended storage temperature for red blood cell units?',
      quizOptions: const ['-20°C', '2-6°C', 'Room temperature', '37°C'],
      correctOption: '2-6°C',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which type of transfusion reaction is most commonly associated with fever and chills?',
      quizOptions: const [
        'Allergic reaction',
        'Hemolytic reaction',
        'Febrile non-hemolytic reaction',
        'Anaphylactic reaction'
      ],
      correctOption: 'Febrile non-hemolytic reaction',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the shelf life of platelets when stored at the correct temperature?',
      quizOptions: const ['5 days', '10 days', '21 days', '35 days'],
      correctOption: '5 days',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following blood components is used to treat patients with fibrinogen deficiency?',
      quizOptions: const [
        'Whole blood',
        'Fresh frozen plasma',
        'Cryoprecipitate',
        'Platelets'
      ],
      correctOption: 'Cryoprecipitate',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the principle behind the direct antiglobulin test (DAT)?',
      quizOptions: const [
        'Detects antibodies in the patient’s serum',
        'Detects antibodies or complement bound to red blood cells in vivo',
        'Identifies the patient’s blood type',
        'Screens for infectious diseases'
      ],
      correctOption:
          'Detects antibodies or complement bound to red blood cells in vivo',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'Which blood type can be safely transfused with O+ blood?',
      quizOptions: const ['A+', 'B+', 'AB+', 'All of the above'],
      correctOption: 'All of the above',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'What is the primary use of fresh frozen plasma (FFP)?',
      quizOptions: const [
        'To increase red blood cell mass',
        'To provide clotting factors',
        'To increase platelet count',
        'To treat anemia'
      ],
      correctOption: 'To provide clotting factors',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which test is used to detect irregular antibodies in the recipient’s serum before transfusion?',
      quizOptions: const [
        'Crossmatch',
        'Direct antiglobulin test',
        'Indirect antiglobulin test',
        'ABO typing'
      ],
      correctOption: 'Indirect antiglobulin test',
    ),
  ],
  'Hard': <QuizQuestionsWidget>[
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the primary purpose of crossmatching in blood transfusion?',
      quizOptions: const [
        'To determine the patient\'s blood type',
        'To detect any antibodies in the patient\'s plasma that might react with donor red blood cells',
        'To measure the patient\'s hemoglobin level',
        'To screen for infectious diseases'
      ],
      correctOption:
          'To detect any antibodies in the patient\'s plasma that might react with donor red blood cells',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which blood component is most commonly used to treat patients with severe anemia?',
      quizOptions: const [
        'Platelets',
        'Fresh frozen plasma',
        'Whole blood',
        'Packed red blood cells'
      ],
      correctOption: 'Packed red blood cells',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the principle behind the ABO blood grouping system?',
      quizOptions: const [
        'The presence or absence of Rh antigen',
        'The presence or absence of A and B antigens on red blood cells',
        'The presence or absence of HLA antigens',
        'The presence or absence of coagulation factors'
      ],
      correctOption:
          'The presence or absence of A and B antigens on red blood cells',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the main purpose of the indirect antiglobulin test (IAT)?',
      quizOptions: const [
        'To detect antibodies attached to red blood cells in vivo',
        'To determine a person\'s blood type',
        'To detect free antibodies in the serum',
        'To measure clotting time'
      ],
      correctOption: 'To detect free antibodies in the serum',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the appropriate storage temperature for red blood cells?',
      quizOptions: const ['-20°C', '4°C', '22°C', '37°C'],
      correctOption: '4°C',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following blood components is used to treat patients with clotting disorders?',
      quizOptions: const [
        'Red blood cells',
        'Platelets',
        'Fresh frozen plasma',
        'Cryoprecipitate'
      ],
      correctOption: 'Fresh frozen plasma',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the main function of platelets in blood transfusion?',
      quizOptions: const [
        'To carry oxygen',
        'To fight infections',
        'To help in blood clotting',
        'To carry nutrients'
      ],
      correctOption: 'To help in blood clotting',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Why is it important to perform an antibody screen on a blood donor?',
      quizOptions: const [
        'To determine the donor\'s blood type',
        'To ensure the donor has no infectious diseases',
        'To detect unexpected antibodies that could cause a transfusion reaction',
        'To measure the donor\'s hemoglobin level'
      ],
      correctOption:
          'To detect unexpected antibodies that could cause a transfusion reaction',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the typical shelf life of platelets when stored at room temperature with agitation?',
      quizOptions: const ['1 day', '5 days', '10 days', '30 days'],
      correctOption: '5 days',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the primary purpose of the direct antiglobulin test (DAT)?',
      quizOptions: const [
        'To detect free antibodies in the serum',
        'To detect antibodies attached to red blood cells in vivo',
        'To measure the patient\'s blood type',
        'To screen for infectious diseases'
      ],
      correctOption: 'To detect antibodies attached to red blood cells in vivo',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which test is used to determine if a patient has developed antibodies against donor red blood cells after a transfusion?',
      quizOptions: const [
        'Direct antiglobulin test',
        'Indirect antiglobulin test',
        'ABO typing',
        'Rh typing'
      ],
      correctOption: 'Direct antiglobulin test',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which of the following is a key principle of blood component therapy?',
      quizOptions: const [
        'Transfuse whole blood whenever possible',
        'Use the smallest number of donors to meet the patient\'s needs',
        'Match donor and recipient gender',
        'Always transfuse blood components at room temperature'
      ],
      correctOption:
          'Use the smallest number of donors to meet the patient\'s needs',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'What is leukoreduction, and why is it performed?',
      quizOptions: const [
        'Removing red blood cells to reduce risk of clotting',
        'Removing white blood cells to reduce the risk of febrile reactions and CMV transmission',
        'Reducing platelet count to prevent thrombosis',
        'Diluting blood components to reduce viscosity'
      ],
      correctOption:
          'Removing white blood cells to reduce the risk of febrile reactions and CMV transmission',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Which blood component is most suitable for a patient with hemophilia A?',
      quizOptions: const [
        'Red blood cells',
        'Platelets',
        'Fresh frozen plasma',
        'Cryoprecipitate'
      ],
      correctOption: 'Cryoprecipitate',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the primary indication for using irradiated blood products?',
      quizOptions: const [
        'To increase the shelf life of blood products',
        'To destroy bacterial contaminants',
        'To prevent transfusion-associated graft-versus-host disease',
        'To improve oxygen-carrying capacity'
      ],
      correctOption:
          'To prevent transfusion-associated graft-versus-host disease',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What does the term “universal donor” refer to in blood banking?',
      quizOptions: const [
        'A person with AB blood type',
        'A person with O negative blood type',
        'A person with Rh positive blood type',
        'A person with A positive blood type'
      ],
      correctOption: 'A person with O negative blood type',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the purpose of washing red blood cells before transfusion?',
      quizOptions: const [
        'To remove plasma proteins and reduce the risk of allergic reactions',
        'To sterilize the red blood cells',
        'To improve oxygen-carrying capacity',
        'To increase the shelf life of red blood cells'
      ],
      correctOption:
          'To remove plasma proteins and reduce the risk of allergic reactions',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion: 'Which blood group is known as the universal recipient?',
      quizOptions: const [
        'O positive',
        'A positive',
        'AB positive',
        'B negative'
      ],
      correctOption: 'AB positive',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'What is the main function of the Rh antigen in blood transfusion?',
      quizOptions: const [
        'To determine compatibility for organ transplants',
        'To facilitate oxygen transport',
        'To influence compatibility between donor and recipient blood',
        'To indicate the presence of infectious diseases'
      ],
      correctOption:
          'To influence compatibility between donor and recipient blood',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Why is it important to screen for HLA antibodies in patients receiving platelet transfusions?',
      quizOptions: const [
        'To match donor and recipient blood types',
        'To prevent hemolytic transfusion reactions',
        'To avoid alloimmunization and refractoriness to platelet transfusions',
        'To ensure compatibility with red blood cell antigens'
      ],
      correctOption:
          'To avoid alloimmunization and refractoriness to platelet transfusions',
    ),
  ],
  'Professional': <QuizQuestionsWidget>[
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Your blood bank receives a new batch of reagents for TTI screening. According to ISO 15189, what is your first course of action?',
      quizOptions: const [
        'Start using the reagents immediately',
        'Perform verification tests to ensure the reagents meet the required specifications',
        'Store the reagents and wait for external validation',
        'Distribute the reagents to various departments without testing'
      ],
      correctOption:
          'Perform verification tests to ensure the reagents meet the required specifications',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A hematology analyzer shows inconsistent results during routine testing. According to ISO 15189, what should be your immediate response?',
      quizOptions: const [
        'Continue using the analyzer and monitor results closely',
        'Take the analyzer out of service and conduct troubleshooting and calibration',
        'Ignore the issue if the variations are minor',
        'Replace the analyzer with a new one without further investigation'
      ],
      correctOption:
          'Take the analyzer out of service and conduct troubleshooting and calibration',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'During an internal audit, it is found that some blood bank staff are not adhering to the standard operating procedures (SOPs). What action should you take in line with ISO 15189?',
      quizOptions: const [
        'Terminate the staff immediately',
        'Provide additional training and re-evaluate their competence',
        'Ignore the issue if the deviations are minor',
        'Replace the SOPs with less stringent ones'
      ],
      correctOption:
          'Provide additional training and re-evaluate their competence',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A patient’s TTI screening test returns a borderline positive result. According to ISO 15189, what should be the next step?',
      quizOptions: const [
        'Report the result as positive',
        'Immediately retest the sample using the same method',
        'Retest the sample using a confirmatory test',
        'Disregard the result and assume it is a false positive'
      ],
      correctOption: 'Retest the sample using a confirmatory test',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Your lab is preparing for an external ISO 15189 accreditation audit. What key documents should be reviewed and updated as part of the preparation process?',
      quizOptions: const [
        'Marketing materials',
        'Laboratory quality manual, SOPs, and training records',
        'Financial records',
        'Patient feedback forms only'
      ],
      correctOption: 'Laboratory quality manual, SOPs, and training records',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A blood donor reports feeling unwell after donating blood. How should this adverse event be handled according to ISO 15189?',
      quizOptions: const [
        'Ignore it if the symptoms are mild',
        'Document the event, investigate the cause, and implement corrective actions',
        'Advise the donor to seek medical attention without further action',
        'Offer the donor a refund'
      ],
      correctOption:
          'Document the event, investigate the cause, and implement corrective actions',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Your laboratory’s quality control results for hematology tests show a trend outside acceptable limits. According to ISO 15189, what should you do?',
      quizOptions: const [
        'Ignore the trend if results are within clinical ranges',
        'Investigate the cause, take corrective action, and document the findings',
        'Change the control materials without investigation',
        'Report the trend to patients immediately'
      ],
      correctOption:
          'Investigate the cause, take corrective action, and document the findings',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A discrepancy is found between the electronic records and the manual logs of blood components. What action is required under ISO 15189?',
      quizOptions: const [
        'Ignore the discrepancy if it is minor',
        'Investigate the cause, reconcile the records, and implement measures to prevent recurrence',
        'Delete the electronic records',
        'Switch to manual logging only'
      ],
      correctOption:
          'Investigate the cause, reconcile the records, and implement measures to prevent recurrence',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Your lab receives a proficiency testing sample for TTI screening and the result is incorrect. What should you do according to ISO 15189?',
      quizOptions: const [
        'Ignore the result since it is a test sample',
        'Investigate the cause of the error, implement corrective actions, and document the findings',
        'Request a new sample and retest without further action',
        'Blame the proficiency testing provider'
      ],
      correctOption:
          'Investigate the cause of the error, implement corrective actions, and document the findings',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A hematology analyzer has been replaced with a newer model. What validation process is required according to ISO 15189?',
      quizOptions: const [
        'Start using the new analyzer immediately',
        'Conduct a full validation to ensure the new analyzer meets all performance criteria',
        'Use the new analyzer only for non-critical tests initially',
        'Rely on the manufacturer\'s validation data only'
      ],
      correctOption:
          'Conduct a full validation to ensure the new analyzer meets all performance criteria',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'During an internal audit, it is discovered that temperature logs for the blood storage refrigerator have not been maintained. What should be your response under ISO 15189?',
      quizOptions: const [
        'Ignore the lapse if there are no immediate issues',
        'Conduct an investigation, document findings, and implement corrective actions to prevent recurrence',
        'Dismiss the staff responsible for the logs',
        'Stop using the refrigerator immediately'
      ],
      correctOption:
          'Conduct an investigation, document findings, and implement corrective actions to prevent recurrence',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A blood donor admits to engaging in high-risk behavior shortly before donating. According to ISO 15189, how should this be handled?',
      quizOptions: const [
        'Ignore if the donor appears healthy',
        'Defer the donor and advise on the deferral period based on risk assessment',
        'Allow the donation but increase screening tests',
        'Immediately report the donor to authorities'
      ],
      correctOption:
          'Defer the donor and advise on the deferral period based on risk assessment',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A batch of blood bags shows a recurrent defect. According to ISO 15189, what should be the lab’s next step?',
      quizOptions: const [
        'Use the defective blood bags if the defect is minor',
        'Report the defect to the supplier, quarantine the batch, and conduct a risk assessment',
        'Ignore the defect and continue using the blood bags',
        'Return the batch to the supplier without further action'
      ],
      correctOption:
          'Report the defect to the supplier, quarantine the batch, and conduct a risk assessment',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'You notice that the control results for the hematology analyzer are within range but show increasing variability. What is the appropriate action under ISO 15189?',
      quizOptions: const [
        'Ignore if results are within range',
        'Investigate the cause of variability, document findings, and implement corrective actions',
        'Replace the control materials immediately',
        'Report the variability to patients'
      ],
      correctOption:
          'Investigate the cause of variability, document findings, and implement corrective actions',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'During a review, you find that the expiration date on some reagents used for TTI screening has passed. According to ISO 15189, what should be done?',
      quizOptions: const [
        'Use the reagents until they are finished',
        'Discard the expired reagents and document the action',
        'Extend the expiration date after testing',
        'Store the reagents separately'
      ],
      correctOption: 'Discard the expired reagents and document the action',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A new regulation requires changes in the TTI screening protocol. How should these changes be implemented according to ISO 15189?',
      quizOptions: const [
        'Implement the changes immediately without informing staff',
        'Update SOPs, train staff on the new protocol, and document the changes',
        'Ignore the new regulation if current protocols are sufficient',
        'Implement changes but keep old SOPs for reference'
      ],
      correctOption:
          'Update SOPs, train staff on the new protocol, and document the changes',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'Your lab receives a complaint about a delayed test result. According to ISO 15189, what should be your approach?',
      quizOptions: const [
        'Ignore the complaint if it is the first one',
        'Investigate the cause of the delay, document the findings, and communicate with the complainant',
        'Apologize to the complainant without further action',
        'Expedite the next test for the complainant only'
      ],
      correctOption:
          'Investigate the cause of the delay, document the findings, and communicate with the complainant',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'An external quality assessment (EQA) report indicates poor performance in hematology. What steps should be taken according to ISO 15189?',
      quizOptions: const [
        'Ignore the EQA report',
        'Investigate the reasons for poor performance, implement corrective actions, and document the process',
        'Repeat the EQA test without changes',
        'Dispute the EQA results'
      ],
      correctOption:
          'Investigate the reasons for poor performance, implement corrective actions, and document the process',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'A blood bank technician does not understand a new SOP implemented for TTI screening. According to ISO 15189, what should be done?',
      quizOptions: const [
        'Ignore the issue if the technician performs well otherwise',
        'Provide additional training and ensure comprehension before allowing the technician to resume duties',
        'Reassign the technician to a different role',
        'Simplify the SOP to the technician’s level of understanding'
      ],
      correctOption:
          'Provide additional training and ensure comprehension before allowing the technician to resume duties',
    ),
    QuizQuestionsWidget(
      markObtain: 0,
      selectedOption: '',
      quizQuestion:
          'You identify a discrepancy in the inventory management of blood products. According to ISO 15189, what should be your immediate action?',
      quizOptions: const [
        'Ignore the discrepancy if it does not affect critical supplies',
        'Investigate the discrepancy, reconcile inventory, and implement preventive measures',
        'Order new supplies immediately',
        'Inform patients about potential delays in service'
      ],
      correctOption:
          'Investigate the discrepancy, reconcile inventory, and implement preventive measures',
    ),
  ]
};

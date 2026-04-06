# AZD សម្រាប់អ្នកអភិវឌ្ឍន៍ AI

!!! info "អ្នកគោលដៅសម្រាប់សិក្ខាសាលានេះ"
   
    សិក្ខាសាលានេះសាកសមសម្រាប់អ្នកដែលចង់បង្កើតកម្មវិធីភ្នាក់ងារ AI លើ Microsoft Foundry ដោយប្រើឧបករណ៍ និងដំណើរការងារល្អឆ្នៃ។ សិក្ខាសាលានេះសមសម្រាប់ទាំងអ្នកចាប់ផ្តើម និងអ្នកអភិវឌ្ឍដែលមានបទពិសោធន៍ ដែលមានការស្គាល់ពី Azure, គំនិត AI និងកូដ Python រួចមួយចំនួន។ សូមពិនិត្យលក្ខខណ្ឌមុនពេលអ្នកចាប់ផ្តើម។

    **រយៈពេល:** 3-4 ម៉ោង  
    **កម្រិត:** ចាប់ផ្តើម ទៅ កម្រិតមធ្យម  

---


## លក្ខខណ្ឌមុនចូលសិក្ខាសាលា

- គណនី GitHub ផ្ទាល់ខ្លួន → [បង្កើតមួយដោយឥតគិតថ្លៃ](https://github.com/signup)
- គណនី Azure សកម្ម → [បង្កើតមួយដោយឥតគិតថ្លៃ](https://aka.ms/free)
- ការស្គាល់ពីមូលដ្ឋាននៃគំនិត AI, ការអភិវឌ្ឍន៍ Python និងឧបករណ៍បន្ទាត់ពាក្យបញ្ជា
- មានបទពិសោធន៍ជាមួយ VS Code និងឧបករណ៍ និងដំណើរការងារ GitHub។

---

## គោលដៅការសិក្សា

ដោយចប់សិក្ខាសាលានេះ អ្នកនឹងដឹងពីវិធីដូចខាងក្រោម:

- [X] **ធ្វើការជាមួយ Azure Developer CLI** → ដើម្បីផ្គត់ផ្គង់ ផ្សព្វផ្សាយ និងគ្រប់គ្រងធនធាន Azure របស់អ្នក។
- [X] **ប្រើគំរូកម្មវិធី AI** → ដើម្បីចាប់ផ្តើមគម្រោងភ្នាក់ងារ AI លើ Microsoft Foundry។
- [X] **កំណត់រចនាម៉ូដែល** → សម្រាប់មុខងារដូចជា Red Teaming, ការវាយតម្លៃ, ការតាមដាន និងការត្រួតពិនិត្យ
- [X] **បំបែក និងស្វែងយល់** → រចនាម៉ូដែល និងដំណើរការងារ AZD ដោយប្រើ GitHub Copilot
- [X] **ប្ដូរតាមតម្រូវការនិងដាក់ឡើងវិញ** → គំរូស្ដាតសម្រាប់ភ្នាក់ងារ AI ជាមួយតម្រូវការផ្ទាល់ខ្លួនរបស់អ្នក

---

## រចនាសម្ព័ន្ធសិក្ខាសាលា

The workshop is structured as modules, each anchored by a hands-on lab exercise:

1. **Introduction** - Get an understanding of what AZD templates are, and how they work
1. **Selection** - Discover the right "starter" template for your next AI project
1. **Validation** - Deploy and explore the template to verify it works as advertised
1. **Deconstruction** - Take the template apart to understand its components & configuration
1. **Configuration** - Learn to activate and use different Microsoft Foundry features
1. **Customization** - Reconstruct the application with your data and requirements in mind
1. **Teardown** - Learn to deprovision infrastructure and recover soft-deleted resources

---

## មតិយោបល់ និងបញ្ហា

យើងកំពុងធ្វើបច្ចុប្បន្នភាពមេរៀនយ៉ាងសកម្ម ដើម្បីធានាថាវាផ្តល់បទពិសោធន៍សិក្សាល្អបំផុតសម្រាប់អ្នកចាប់ផ្តើម។ យើងសូមទទួលយកមតិយោបល់របស់អ្នក។

1. ផ្ញើបញ្ហាមួយលើ repo នេះ - ស្លាកវា `Workshop` សម្រាប់ភាពងាយស្រួល។
1. ចូលរួមក្នុង Microsoft Foundry Discord - តភ្ជាប់ជាមួយអ្នករៀនដទៃទៀត!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែដោយបញ្ញាសិប្បនិម្មិត [Co-op Translator](https://github.com/Azure/co-op-translator). ខណៈពេលដែលយើងខិតខំធ្វើឱ្យមានភាពត្រឹមត្រូវ សូមយកចិត្តទុកដាក់ថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬ ភាពមិនត្រឹមត្រូវ។ ឯកសារដើមក្នុងភាសាម្ចាស់របស់វាគួរត្រូវបានចាត់ទុកថាជាផ្លូវការនិងជាផ្ទៃដើមដែលមានសុពលភាព។ សម្រាប់ព័ត៌មានសំខាន់ណាស់ ណែនាំឱ្យប្រើការបកប្រែដោយអ្នកបកប្រែមនុស្សជាអាជីព។ យើងមិនទទួលខុសត្រូវចំពោះការយល់មិនបានឬការបកស្រាយខុសដែលកើតឡើងពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
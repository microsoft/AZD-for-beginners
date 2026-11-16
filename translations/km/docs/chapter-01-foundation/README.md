# ជំពូក 1៖មូលដ្ឋាន និងចាប់ផ្តើមលឿន

**📚 코스**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md) | **⏱️ រយៈពេល**: ៧៥-១២០ នាទី រួមទាំងការដាក់បញ្ចូលដំបូង; បាក់តេស្តបន្ថែមនឹងចំណាយពេលបន្ថែម | **⭐ កំរិតស្មុគស្មាញ**: អ្នកចាប់ផ្តើម

---

## ទិដ្ឋភាពសង្ខេប

ជំពូកនេះណែនាំមូលដ្ឋាន Azure Developer CLI (azd)។ អ្នកនឹងរៀនពីគំនិតសំខាន់ៗ ដំឡើងឧបករណ៍ និងដាក់កម្មវិធីដំបូងរបស់អ្នកទៅ Azure។

> គោលបំណងការត្រួតពិនិត្យពាក្យបញ្ជា និងការកំណត់រចនាសម្ព័ន្ធ: `azd 1.37.2` (មិថុនា ២០២៦)។ ការផ្គត់ផ្គង់ Azure តាមផ្ទាល់មិនបានរត់ក្នុងពេលពិនិត្យ។

## គោលបំណងរៀន

ដោយបញ្ចប់ជំពូកនេះ អ្នកនឹងអាចៈ
- យល់ពីអ្វីគឺជា Azure Developer CLI និងវាផ្សេងពី Azure CLI ដូចម្តេច
- ដំឡើង និងកំណត់ AZD លើវេទិការបស់អ្នក
- ដាក់កម្មវិធីដំបូងរបស់អ្នកទៅ Azure ជាមួយ `azd up`
- សម្អាតធនធានជាមួយ `azd down`

---

## 📚 មេរៀន

| # | មេរៀន | សេចក្ដីពិពណ៌នា | ពេលវេលា |
|---|--------|-------------|------|
| 1 | [មូលដ្ឋាន AZD](azd-basics.md) | គំនិតចម្បង ភាសាពាក្យ និងរចនាសម្ព័ន្ធគម្រោង | ១៥ នាទី |
| 2 | [ការដំឡើង និងការកំណត់](installation.md) | មេរៀនដំឡើងជាពិសេសសម្រាប់វេទិកា | ១០ នាទី |
| 3 | [គម្រោងដំបូងរបស់អ្នក](first-project.md) | ប្រើប្រាស់ដៃ៖ ដាក់កំណត់កម្មវិធីវេបទៅ Azure | ២០ នាទី |
| 4 | [យកកម្មវិធីរបស់អ្នកមក](bring-your-own-app.md) | បន្ថែម azd ទៅគម្រោងដែលមានរបស់អ្នករួចហើយ | ១៥ នាទី |
| 5 | [Dev Containers និង Codespaces](dev-containers.md) | បរិយាកាស azd ដែលអាចបង្កើតឡើងវិញដោយ dev containers | ១៥ នាទី |

---

## ✅ ចាប់ផ្តើមពីនេះ៖ ពិនិត្យភាពត្រឹមត្រូវនៃការតំឡើងរបស់អ្នក

មុនចាប់ផ្តើម សូមបញ្ជាក់ថា គណនីក្នុងស្រុករបស់អ្នកបានត្រៀមរួចសម្រាប់គំរូជំពូក ១ ៖

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

ប្រសិនបើស្គ្រីបបង្ហាញថាសម្ភារៈខ្វះ សូមជួសជុលវាជាPriority មុនបន្តជំពូកនេះ។

---

## 🚀 ចាប់ផ្តើមលឿន

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ វិសាលភាពជោគជ័យ

បន្ទាប់ពីបញ្ចប់ជំពូកនេះ អ្នកគួរតែលទ្ធផលដូចខាងក្រោមៈ

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 គន្លងទស្សនា

| ទិស | ជំពូក |
|-----------|---------|
| **បន្ទាប់** | [ជំពូក 2៖ ការអភិវឌ្ឍ AI ដំបូង](../chapter-02-ai-development/README.md) |
| **រំកិលទៅ** | [ជំពូក 3៖ ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/README.md) |

---

## 📖 ឯកសារពាក់ពន្ធ័

- [តារាងបញ្ជា](../../resources/cheat-sheet.md)
- [សំណួរញឹកញាប់](../../resources/faq.md)
- [វចនានុក្រម](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
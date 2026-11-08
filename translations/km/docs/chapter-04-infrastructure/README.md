# មេរៀនទី 4: ការស្ថាបត្យកម្មជារបស់កូដ និងការដាក់ចេញ

**📚 មុខវិជ្ជា**៖ [AZD សំរាប់អ្នកចាប់ផ្តើម](../../README.md) | **⏱️ រយៈពេល**៖ ២-៣ ម៉ោងរៀន; អនុញ្ញាតពេលបន្ថែមសម្រាប់លំហាត់ដាក់ចេញ | **⭐ មាតិកា**៖ មធ្យម

---

## ទិដ្ឋភាពទូទៅ

មេរៀននេះគ្របដណ្តប់លើលំនាំ Infrastructure as Code (IaC) ជាមួយពុម្ពប្លង់ Bicep, ការផ្គត់ផ្គង់ធនធាន, និងយុទ្ធសាស្រ្តដាក់ចេញប្រើ Azure Developer CLI។

> គោលដៅពិនិត្យបញ្ជា និងការកំណត់រចនា៖ `azd 1.37.2` (វិច្ឆិកា ២០២៦)។ ការផ្គត់ផ្គង់ Azure តាមរយៈការសរសេរនៅពេលពិនិត្យមិនបានដំណើរការ។

## គោលបំណងរៀន

ដោយបញ្ចប់មេរៀននេះ អ្នកនឹងអាច៖
- យល់ដឹងអំពីរចនាសម្ព័ន្ធ និងវាសនាដៃរបស់ពុម្ពប្លង់ Bicep
- ផ្គត់ផ្គង់ធនធាន Azure ជាមួយ `azd provision`
- ដាក់ចេញកម្មវិធីជាមួយ `azd deploy`
- អនុវត្តយុទ្ធសាស្រ្តដាក់ចេញបែបស្វាយខៀវ-បៃតង និងដាក់ចេញជារបារមួយៗ

---

## 📚 មេរៀន

| # | មេរៀន | ពិពណ៌នា | ពេលវេលា |
|---|--------|-------------|------|
| 1 | [ការផ្គត់ផ្គង់ធនធាន](provisioning.md) | ការគ្រប់គ្រងធនធាន Azure ជាមួយ AZD | ៤៥ នាទី |
| 2 | [មគ្គុទេសក៍ដាក់ចេញ](deployment-guide.md) | យុទ្ធសាស្រ្តដាក់ចេញកម្មវិធី | ៤៥ នាទី |
| 3 | [ការសរសេរពុម្ពប្លង់ផ្ទាល់របស់អ្នក](custom-templates.md) | កសាង និងផ្សព្វផ្សាយពុម្ពប្លង់ azd ដែលអាចប្រើប្រាស់ឡើងវិញ | ៣០ នាទី |

---

## 🚀 ចាប់ផ្តើមយ៉ាងរហ័ស

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 រចនាសម្ព័ន្ធគម្រោង AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 ពាក្យបញ្ជាជាចំបង

| ពាក្យបញ្ជា | ពិពណ៌នា |
|---------|-------------|
| `azd init` | ចាប់ផ្តើមគម្រោង |
| `azd provision` | បង្កើតធនធាន Azure |
| `azd deploy` | ដាក់ចេញកូដកម្មវិធី |
| `azd up` | ផ្គត់ផ្គង់ + ដាក់ចេញ |
| `azd down` | លុបធនធានទាំងអស់ |

---

## 🔗 ការរុករក

| ទិសដៅ | មេរៀន |
|-----------|---------|
| **មុន** | [មេរៀនទី 3: ការកំណត់រចនា](../chapter-03-configuration/README.md) |
| **បន្ទាប់** | [មេរៀនទី 5: ដំណោះស្រាយប៉ារ៉ាម៉ែត្រច្រើន](../chapter-05-multi-agent/README.md) |

---

## 📖 ឯកសារពាក់ព័ន្ធ

- [ការត្រួតពិនិត្យមុនដាក់ចេញ](../chapter-06-pre-deployment/README.md)
- [ឧទាហរណ៍កម្មវិធី Container App](../../examples/container-app/README.md)
- [ឧទាហរណ៍កម្មវិធីមូលដ្ឋានទិន្នន័យ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
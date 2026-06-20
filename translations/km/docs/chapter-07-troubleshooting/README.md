# ជំពូក 7: ដោះស្រាយបញ្ហា និងពិនិត្យកំហុស

**📚 វគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md) | **⏱️ រយៈពេល**: 1-1.5 ម៉ោង | **⭐ កម្រិតចំណេះដឹង**: មធ្យម

---

## ទិដ្ឋភាពទូទៅ

ជំពូកនេះជួយអ្នកស្វែងរកមូលហេតុនិងដោះស្រាយបញ្ហាទូទៅពេលធ្វើការជាមួយ Azure Developer CLI — ចាប់ពីការបរាជ័យក្នុងការចេញផ្សាយរហូតដល់បញ្ហាពាក់ព័ន្ធ AI។

> បានផ្ទៀងផ្ទាត់ជាមួយ `azd 1.25.6` នៅខែ មិថុនា 2026.

## គោលដៅការសិក្សា

By completing this chapter, you will:
- ស្វែងរកមូលហេតុនៃការបរាជ័យទូទៅក្នុងការដាក់ពាក្យ AZD
- ពិនិត្យកំហុសទាក់ទងនឹងការផ្ទៀងផ្ទាត់ និងសិទ្ធិអនុញ្ញាត
- ដោះស្រាយបញ្ហាការតភ្ជាប់សេវាកម្ម AI
- ប្រើ Azure Portal និង CLI សម្រាប់ដោះស្រាយបញ្ហា

---

## 📚 មេរៀន

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [បញ្ហាទូទៅ](common-issues.md) | បញ្ហាដែលឃើញជាញឹកញាប់ | 30 នាទី |
| 2 | [មគ្គុទេសក៍ពិនិត្យកំហុស](debugging.md) | យុទ្ធសាស្ត្រពិនិត្យកំហុសជាជំហានៗ | 45 នាទី |
| 3 | [ដោះស្រាយបញ្ហា AI](ai-troubleshooting.md) | បញ្ហាពិសេសទាក់ទងនឹង AI | 30 នាទី |

---

## 🚨 ដំណោះស្រាយរហ័ស

### បញ្ហាការផ្ទៀងផ្ទាត់
```bash
# ចាំបាច់សម្រាប់ដំណើរការ AZD
azd auth login

# ជាជម្រើស ប្រសិនបើអ្នកក៏កំពុងប្រើពាក្យបញ្ជា Azure CLI ដោយផ្ទាល់
az login

azd auth status
```

### ការបរាជ័យក្នុងការផ្គត់ផ្គង់
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### ការប្រឆាំងធនធាន
```bash
azd down --force --purge
azd env new different-name
azd up
```

### លើសកំណត់
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 យោងកូដកំហុស

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | មិនបានចូល | `azd auth login` |
| `ResourceNotFound` | គ្មានធនធាន | ពិនិត្យឈ្មោះធនធាន |
| `QuotaExceeded` | កំណត់ក្នុងការជាវ | ស្នើសុំបន្ថែមកម្រិត |
| `InvalidTemplate` | កំហុសវាក្យសម្ព័ន្ធ Bicep | `az bicep build` |
| `Conflict` | ធនធានមានរួច | ប្រើឈ្មោះថ្មី ឬលុបវា |
| `Forbidden` | សិទ្ធិមិនគ្រប់គ្រាន់ | ពិនិត្យតួនាទី RBAC |

---

## 🔄 កំណត់ឡើងវិញ និងស្ដារឡើងវិញ

```bash
# កំណត់ឡើងវិញប្រភេទទន់ (រក្សាធនធាន, ដាក់កូដឡើងវិញ)
azd deploy --force

# កំណត់ឡើងវិញប្រភេទខ្លាំង (លុបអ្វីគ្រប់យ៉ាង, ចាប់ផ្ដើមពីដើម)
azd down --force --purge
azd up
```

---

## 🔗 ការរុករក

| Direction | Chapter |
|-----------|---------|
| **Previous** | [ជំពូក 6: មុនការដាក់ពាក្យ](../chapter-06-pre-deployment/README.md) |
| **Next** | [ជំពូក 8: ផលិតកម្ម](../chapter-08-production/README.md) |

---

## 📖 ធនធានពាក់ព័ន្ធ

- [ការត្រួតពិនិត្យមុនការដាក់ពាក្យ](../chapter-06-pre-deployment/preflight-checks.md)
- [មគ្គុទេសក៍ការកំណត់](../chapter-03-configuration/configuration.md)
- [បញ្ហា AZD នៅ GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
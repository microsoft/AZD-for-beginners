# Chapter 4: ഇൻഫ്രാസ്ട്രക്ചർ ആസ് കോഡ് & വിന്യാസം

**📚 Course**: [AZD ആരംഭക്കാർക്കുള്ളത്](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Overview

ഈ അധ്യായത്തിൽ Bicep ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ചുള്ള Infrastructure as Code (IaC) മാതൃകകൾ, റിസോഴ്സ് പ്രൊവിഷനിംഗ്, Azure Developer CLI ഉപയോഗിച്ചുള്ള വിന്യാസ തന്ത്രങ്ങൾ എന്നിവ കവർ ചെയ്യുന്നു.

## Learning Objectives

ഈ അധ്യായം പൂർത്തീകരിച്ചതോടെ, നിങ്ങൾക്ക് താഴെയുള്ള കാര്യങ്ങൾ ചെയ്യാൻ കഴിയും:
- Bicep ടെംപ്ലേറ്റ് ഘടനയും സിന്താക്സും 이해 ചെയ്യുക
- Azure വിഭവങ്ങൾ `azd provision` ഉപയോഗിച്ച് പ്രൊവിഷൻ ചെയ്യുക
- അപ്ലിക്കേഷനുകൾ `azd deploy` ഉപയോഗിച്ച് ഡിപ്ലോയ്മെന്റ് ചെയ്യുക
- ബ്ലൂ-ഗ്രീൻ හා റോളിംഗ് ഡിപ്ലോയ്മെന്റ് തന്ത്രങ്ങൾ നടപ്പിലാക്കുക

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [റിസോഴ്സ് പ്രൊവിഷനിംഗ്](provisioning.md) | AZD ഉപയോഗിച്ച് Azure റിസോഴ്സ് മാനേജ്മെന്റ് | 45 min |
| 2 | [ഡിപ്ലോയ്മെന്റ് ഗൈഡ്](deployment-guide.md) | അപ്ലിക്കേഷൻ ഡിപ്ലോയ്മെന്റ് തന്ത്രങ്ങൾ | 45 min |

---

## 🚀 Quick Start

```bash
# ടെംപ്ലേറ്റിൽ നിന്ന് ആരംഭിക്കുക
azd init --template azure-functions-python-v2-http

# സൃഷ്ടിക്കപ്പെടുന്നതിന്റെ മുൻദൃശ്യം കാണിക്കുക
azd provision --preview

# ഇൻഫ്രാസ്ട്രക്ചർ മാത്രം ഒരുക്കുക
azd provision

# കോഡ് മാത്രം വിന്യസിക്കുക
azd deploy

# അല്ലെങ്കിൽ ഇരുവും ഒരുമിച്ച്
azd up
```

---

## 📁 AZD Project Structure

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

## 🔧 Essential Commands

| Command | Description |
|---------|-------------|
| `azd init` | പ്രോജക്ട് ആരംഭിക്കുക |
| `azd provision` | Azure വിഭവങ്ങൾ സൃഷ്ടിക്കുക |
| `azd deploy` | അപ്ലിക്കേഷൻ കോഡ് ഡിപ്ലോയ്മെന്റ് ചെയ്യുക |
| `azd up` | പ്രൊവിഷൻ + ഡിപ്ലോയ്മെന്റ് |
| `azd down` | എല്ലാ വിഭവങ്ങളും നീക്കം ചെയ്യുക |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [അദ്ധ്യായം 3: ക്രമീകരണം](../chapter-03-configuration/README.md) |
| **Next** | [അദ്ധ്യായം 5: മൾട്ടി-ഏജന്റ് പരിഹാരങ്ങൾ](../chapter-05-multi-agent/README.md) |

---

## 📖 Related Resources

- [മുൻ-ഡിപ്പ്ലോയ്മെന്റ് പരിശോധനകൾ](../chapter-06-pre-deployment/README.md)
- [കൺടെയ്‌നർ ആപ് ഉദാഹരണങ്ങൾ](../../examples/container-app/README.md)
- [ഡേറ്റാബേസ് ആപ് ഉദാഹരണം](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്‌ക്ലെയിമർ:
ഈ രേഖ AI തർജ്ജമാ സേവനമായ Co‑op Translator (https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് തർജ്മ ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്ക് പരിശ്രമിക്കുന്നതു_strengthന്നേതെങ്കിലും, ഓട്ടോമേറ്റഡ് തർജ്മകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ അകൃത്യതകൾ ഉണ്ടാകാവുന്നതായതിനു ദയവായി ശ്രദ്ധിക്കുക. അതിന്റെ സ്വഭാവഭാഷയിലുള്ള_original_ ദസ്താവേജാണ് അധികാരപരമായ ഉറവിടമായി കരുതപ്പെടേണ്ടത്. ഗുരുതരമായി പരിഗണിക്കാവുന്ന വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യനാൽ നിച്ചയിച്ച തർജ്മ ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ തർജ്മയുടെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണകൾക്കും പാളിച്ചകൾക്കും ഞങ്ങൾ ഉത്തരവാദിത്വം വഹിക്കുകയില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
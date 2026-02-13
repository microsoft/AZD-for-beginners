# Chapter 4: ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್‌ ಆಸ್ ಕೋಡ್ ಮತ್ತು ನಿಯೋಜನೆ

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 ಗಂಟೆ | **⭐ Complexity**: ಮಧ್ಯಮ

---

## Overview

ಈ ಅಧ್ಯಾಯವು Infrastructure as Code (IaC) ಮಾದರಿಗಳನ್ನು Bicep ಟೆಂಪ್ಲೇಟ್‌ಗಳೊಂದಿಗೆ, ಸಂಪನ್ಮೂಲ ಒದಗಿಸುವಿಕೆ ಮತ್ತು Azure Developer CLI ಬಳಸಿ ನಿಯೋಜನೆಯ ತಂತ್ರಗಳನ್ನು ಒಳಗೊಂಡಿದೆ.

## Learning Objectives

ಈ ಅಧ್ಯಾಯವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದರೆ, ನೀವು:
- Bicep ಟೆಂಪ್ಲೇಟ್‌ನ ರಚನೆ ಮತ್ತು ವ್ಯಾಕರಣವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಬಹುದು
- `azd provision` ಬಳಸಿ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸಬೇಕು
- `azd deploy` ಬಳಸಿ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಬೇಕು
- ಬ್ಲೂ-ಗ್ರೀನ್ ಮತ್ತು ರೋಲಿಂಗ್ ನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಬಹುದು

---

## 📚 ಪಾಠಗಳು

| # | ಪಾಠ | ವಿವರಣೆ | ಸಮಯ |
|---|--------|-------------|------|
| 1 | [ಸಂಪನ್ಮೂಲಗಳ ಒದಗಣೆ](provisioning.md) | AZD ಮೂಲಕ Azure ಸಂಪನ್ಮೂಲ ನಿರ್ವಹಣೆ | 45 ನಿಮಿಷ |
| 2 | [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](deployment-guide.md) | ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ ತಂತ್ರಗಳು | 45 ನಿಮಿಷ |

---

## 🚀 ತ್ವರಿತ ಪ್ರಾರಂಭ

```bash
# ಟೆಂಪ್ಲೇಟ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd init --template azure-functions-python-v2-http

# ರಚಿಸಲ್ಪಡುವುದನ್ನು ಪೂರ್ವದೃಶ್ಯವಾಗಿ ನೋಡಿ
azd provision --preview

# ಮೂಲಸೌಕರ್ಯವನ್ನು ಮಾತ್ರ ಒದಗಿಸಿ
azd provision

# ಕೋಡ್ ಅನ್ನು ಮಾತ್ರ ನಿಯೋಜಿಸಿ
azd deploy

# ಅಥವಾ ಎರಡನ್ನೂ ಒಟ್ಟಿಗೆ
azd up
```

---

## 📁 AZD ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ

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

## 🔧 ಅತ್ಯಾವಶ್ಯಕ ಕಮಾಂಡ್‌ಗಳು

| ಕಮಾಂಡ್ | ವಿವರಣೆ |
|---------|-------------|
| `azd init` | ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ |
| `azd provision` | Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸಿ |
| `azd deploy` | ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ |
| `azd up` | ಒದಗಣೆ + ನಿಯೋಜನೆ |
| `azd down` | ಎಲ್ಲಾ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಳಿಸಿ |

---

## 🔗 ಸಂಚಾರ

| ದಿಕ್ಕು | ಅಧ್ಯಾಯ |
|-----------|---------|
| **ಹಿಂದಿನ** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **ಮುಂದಿನ** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 ಸಂಬಂಧಿಸಿದ ಸಂಪನ್ಮೂಲಗಳು

- [ನಿಯೋಜನೆಕ್ಕೂ ಮುನ್ನ ಪರಿಶೀಲನೆಗಳು](../chapter-06-pre-deployment/README.md)
- [ಕಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆಗಳು](../../examples/container-app/README.md)
- [ಡೇಟಾಬೇಸ್ ಅಪ್ಲಿಕೇಶನ್ ಉದಾಹರಣೆ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಜವಾಬ್ದಾರಿ ನಿರಾಕರಣೆ:

ಈ ದಾಖಲೆವನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಅನ್ನು ಬಳಸಿಕೊಂಡು ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ಶುದ್ದತೆಯತ್ತ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪುಗಳು ಇರಬಹುದು ಎಂಬುದು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿರಿಸಿಕೊಳ್ಳಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿನ ಮೂಲ ದಾಖಲೆವನ್ನು ಅಧಿಕಾರ—as the authoritative source—ಆಗ ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗೊಳ್ಳಿಕೆಗಳು ಅಥವಾ ವ್ಯಾಖ್ಯಾನದ ದೋಷಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
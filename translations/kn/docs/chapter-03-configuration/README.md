# ಅಧ್ಯಾಯ 3: ವೈಯವಸ್ಥೆ ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಣ

**📚 ಪಾಠಕ್ರಮ**: [AZD ಆರಂಭಿಕರಿಗಾಗಿ](../../README.md) | **⏱️ ಅವಧಿ**: 90-150 ನಿಮಿಷಗಳು ಸಂಯೋಜನಾ ಅಭ್ಯಾಸವನ್ನು ಒಳಗೊಂಡಂತೆ | **⭐ ಸಂಕೀರ್ಣತೆ**: ಮಧ್ಯಮ

---

## ಅವಲೋಕನ

ಈ ಅಧ್ಯಾಯವು ಪರಿಸರ ವ್ಯವವಸ್ಥೆ, ಪ್ರಾಮಾಣೀಕರಣ ಮಾದರಿಗಳು, ಮತ್ತು ಅಜೂರ್ ಡೆವಲಪರ್ CLI ನಿಯೋಜನೆಗಳಿಗೆ ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳನ್ನು ಒಳಗೊಂಡಿರುತ್ತದೆ.

> ಆಜ್ಞೆ ಮತ್ತು ಸಂರಚನಾ ವಿಮರ್ಶೆಯ ಗುರಿ: `azd 1.37.2` (ನವೆಂಬರ್ 2026). ವಿಮರ್ಶೆಯ ಸಮಯದಲ್ಲಿ ಲೈವ್ ಅಜೂರ್ ಪ್ರೊವಿಜನಿಂಗ್ ನಡೆಸಲಿಲ್ಲ.

## ಕಲಿಕೆಯ ಉದ್ದೇಶಗಳು

ಈ ಅಧ್ಯಾಯವನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ, ನೀವು:
- AZD ಸಂರಚನಾ ಶೃಂಖಲೆಯನ್ನು ನಿಪುಣರಾಗುವುದು
- ಬಾಹ್ಯ, ಸ್ಥಗಿತ, ಉತ್ಪಾದನಾ ಸೇರಿದಂತೆ ಬಹು ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸುವುದು
- ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿಗಳೊಂದಿಗೆ ಭದ್ರತಾ ಪ್ರಾಮಾಣೀಕರಣವನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್ಸ್ ಅನ್ನು ಸಂರಚಿಸಲಾಗುವುದು

---

## 📚 ಪಾಠಗಳು

| # | ಪಾಠ | ವಿವರಣೆ | ಸಮಯ |
|---|--------|-------------|------|
| 1 | [ಸಂರಚನಾ ಮಾರ್ಗದರ್ಶಿ](configuration.md) | ಪರಿಸರ ಸೆಟ್ಟಪ್ ಮತ್ತು ನಿರ್ವಹಣೆ | 30 ನಿಮಿಷಗಳು |
| 2 | [ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಭದ್ರತೆ](authsecurity.md) | ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ ಮತ್ತು RBAC ಮಾದರಿಗಳು | 30 ನಿಮಿಷಗಳು |

---

## 🚀 ಬೇಗ ಆರಂಭಿಸಿ

**ಈಗಾಗಲೇ ಪ್ರಾರಂಭಗೊಂಡ azd ಅಪ್ಲಿಕೇಶನ್** ಮುಖ್ಯ ಡೈರೆಕ್ಟರಿಯಿಂದ ಚಾಲನೆ ಮಾಡಿರಿ, ಪಾಠಕ್ರಮ ರೈಪೋಸಿಟರಿಯನ್ನು ಅಲ್ಲ. ಈ ಹೆಸರುಗಳಷ್ಟು ಇದ್ದಲ್ಲಿ ಅನ್ವಯಿಸದ ಪರಿಸರ ಹೆಸರುಗಳನ್ನು ಉಪಯೋಗಿಸಿ.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` ಉದಾಹರಣೆಯಾಗಿದೆ: ಅದು ನಿಮ್ಮ ಟೆಂಪ್ಲೇಟ್ ಸ್ಪಷ್ಟವಾಗಿ ಬಳಸಿದಲ್ಲಿ ಮಾತ್ರ ಮೂಲಸೌಕರ್ಯವನ್ನು ಪ್ರಭಾವಿಸುತ್ತದೆ. ಸಾಮಾನ್ಯ `azd env set` ಮೌಲ್ಯಗಳು ಸ್ಥಳೀಯವಾಗಿ ಪ್ಲೇನ್‌ಟೆಕ್ಸ್ಟ್‌ನಲ್ಲಿ ಉಳಿಸಲಾಗುತ್ತವೆ; ಅವು ಭದ್ರವಾದ ರಹಸ್ಯ ಸಂಗ್ರಹಣೆ ಅಲ್ಲ.

---

## 🔧 ಸಂರಚನಾ ಶೃಂಖಲೆಯು

ಮೂರು ವಿಭಿನ್ನ ಸಂರಚನಾ ಮಟ್ಟಗಳನ್ನು ಪ್ರತ್ಯೇಕಿಸಬೇಕು: ಜಾಗತಿಕ ಆದ್ಯತೆಗಳು (`azd config`), ಪ್ರಾಜೆಕ್ಟ್ ರಚನೆ (`azure.yaml`), ಮತ್ತು ಪ್ರತಿಪರಿಸರ ಮೌಲ್ಯಗಳು (`azd env`). ಫ್ಲಾಗ್‌ಗಳು ಅವರು ಬೆಂಬಲಿಸುವ ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳಿಗೆ ಮಾತ್ರ ಮೇಲುಗೈ ವಹಿಸುತ್ತವೆ; ಯಾವುದೇ ಸಾಮಾನ್ಯ ಪರಿಸರ ಚರಗಳು `azure.yaml` ಅಥವಾ Bicep ಗೆ ಸ್ವತಃ ಜೋಡಿಸುವಿಕೆ ಇಲ್ಲ.

---

## 🔐 ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 ನಾವಿಗೇಶನ್

| ದಿಕ್ಕು | ಅಧ್ಯಾಯ |
|-----------|---------|
| **ಹಿಂದಿನದು** | [ಅಧ್ಯಾಯ 2: AI ಅಭಿವೃದ್ಧಿ](../chapter-02-ai-development/README.md) |
| **ಮುಂದಿನದು** | [ಅಧ್ಯಾಯ 4: ಮೂಲಸೌಕರ್ಯ](../chapter-04-infrastructure/README.md) |

---

## 📖 ಸಂಬಂಧಿತ ಸಂಪನ್ಮೂಲಗಳು

- [ಪೂರ್ವ-ನಿಯೋಜನೆ ಪರಿಶೀಲನೆಗಳು](../chapter-06-pre-deployment/README.md)
- [ಸಮಸ್ಯೆ ಪರಿಹಾರ](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
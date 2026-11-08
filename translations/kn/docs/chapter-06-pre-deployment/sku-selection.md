# SKU ಆಯ್ಕೆ ಮಾರ್ಗದರ್ಶಿ - ಸರಿಯಾದ Azure ಸೇವಾ ತರ್ಗತಗಳನ್ನು ಆಯ್ಕೆಮಾಡುವುದು

**ಅಧ್ಯಾಯ ನಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 6 - ಪೂರ್ವ-ನಿರ್ದೇಶನ ಪರಿಶೀಲನೆ ಮತ್ತು ಯೋಜನೆ
- **⬅️ ಹಿಂದಿನದು**: [ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ](capacity-planning.md)
- **➡️ ಮುಂದಿನದು**: [ಪೂರ್ವ-ಪ್ರಯಾಣ ತಪಾಸಣೆ](preflight-checks.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 7: ತೊಂದರೆ ಪರಿಹಾರ](../chapter-07-troubleshooting/common-issues.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ ನಿಮಗೆ ವಿಭಿನ್ನ ಪರಿಸರಗಳು, ಕೆಲಸದಭಾರಗಳು ಮತ್ತು ಅಗತ್ಯಗಳಿಗೆ ಅನುಗುಣವಾಗಿ ಅತ್ಯುತ್ತಮ Azure ಸೇವಾ SKUಗಳನ್ನು ಆಯ್ಕೆ ಮಾಡಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ. ನಿಮ್ಮ Azure Developer CLI ನಿಯೋಜನೆಗಳಿಗೆ ಅನುಕೂಲಕರವಾದ ಸೇವಾ ತರ್ಗತಗಳನ್ನು ಆಯ್ಕೆ ಮಾಡಲು ಕಾರ್ಯಕ್ಷಮತಾ ಅಗತ್ಯಗಳು, ವೆಚ್ಚ ಪರಿಗಣನೆಗಳು ಮತ್ತು ಅನುದೇಶಿತ ಅಗತ್ಯಗಳನ್ನು ವಿಶ್ಲೇಷಿಸುವುದನ್ನು ಕಲಿಯಿರಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿ ಪೂರ್ಣಗೊಳ್ಳಿಸಿದ ನಂತರ, ನೀವು:
- Azure SKU ಪರಿಕಲ್ಪನೆಗಳು, ಬೆಲೆ ಮಾದರಿಗಳು ಮತ್ತು ವೈಶಿಷ್ಟ್ಯ ವ್ಯತ್ಯಾಸಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಅಭಿವೃದ್ಧಿ, ಸ್ತ್ರೀಕರಣ ಮತ್ತು ಉತ್ಪಾದನೆಗೆ ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ SKU ಆಯ್ಕೆ ಕಾರ್ಯತಂತ್ರಗಳನ್ನು ನಿಭಾಯಿಸುವುದು
- ಕೆಲಸದಭಾರ ಅಗತ್ಯಗಳನ್ನು ವಿಶ್ಲেষಿಸಿ ಅವುಗಳ ಅನ್ವಯ ಸೇವಾ ತರ್ಗತಗಳನ್ನು ಹೊಂದಿಸುವುದು
- ಬುದ್ಧಿವಂತ SKU ಆಯ್ಕೆ ಮೂಲಕ ವೆಚ್ಚ ಉಳಿತಾಯ ಕಾರ್ಯತಂತ್ರಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- SKU ಆಯ್ಕೆಗಳಿಗೆ ಕಾರ್ಯಕ್ಷಮತಾ ಪರೀಕ್ಷಾ ಮತ್ತು ಮಾನ್ಯತೆ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸುವುದು
- ಸವಯಂ ಚಾಲಿತ SKU ಶಿಫಾರಸುಗಳು ಮತ್ತು ನಿಗಾವಣೆಗಳ ನಿಯೋಜನೆ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳ್ಳುವ ಪ್ರಕ್ರಿಯೆ ನಂತರ, ನೀವು:
- ಕೆಲಸದಭಾರ ಅವಶ್ಯಕತೆಗಳು ಮತ್ತು ನಿರ್ಬಂಧಗಳ ಆಧಾರದ ಮೇಲೆ ಸರಿಯಾದ Azure ಸೇವಾ SKUಗಳನ್ನು ಆಯ್ಕೆಮಾಡಬಹುದು
- ವಿಸ್ತೃತ ಪರಿಸರಗಳಿಗಾಗಿ ವೆಚ್ಚದೃಷ್ಟಿಯಿಂದ ಸಮರ್ಪಕ ತರ್ಗತ ಆಯ್ಕೆದ ಮೂಲಕ معماريಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಬಹುದು
- SKU ಆಯ್ಕೆಗಳಿಗೆ ಕಾರ್ಯಕ್ಷಮತಾ ಪರಿಶೀಲನೆ ಮತ್ತು ಮಾನ್ಯತೆಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಬಹುದು
- SKU ಶಿಫಾರಸು ಮತ್ತು ವೆಚ್ಚ ಉಳಿತಾಯಕ್ಕಾಗಿ ಸ್ವಯಂಚಾಲಿತ ಉಪಕರಣಗಳನ್ನು ರಚಿಸಬಹುದು
- ಬದಲಾಗುತ್ತಿರುವ ಅಗತ್ಯಗಳಿಗೆ SKU ವರ್ಗಾವಣೆ ಮತ್ತು ವಿಸ್ತರಣೆ ಕಾರ್ಯತಂತ್ರಗಳನ್ನು ಯೋಜಿಸಬಹುದು
- ಸೇವಾ ತರ್ಗತ ಆಯ್ಕೆಗೆ Azure ಉತ್ತಮ ಶಿಲ್ಪಗ್ರಹಣ ಅಳವಡಿಸುವುದು

## ವಿಷಯಪಟ್ಟಿ

- [SKUಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು](#understanding-skus)
- [ಪರಿಸರ ಆಧಾರಿತ ಆಯ್ಕೆ](#environment-based-selection)
- [ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ಮಾರ್ಗಸೂಚಿಗಳು](#service-specific-guidelines)
- [ವೆಚ್ಚ ಉಳಿತಾಯ ಕಾರ್ಯತಂತ್ರಗಳು](#cost-optimization-strategies)
- [ಕಾರ್ಯಕ್ಷಮತೆ ಪರಿಗಣನೆಗಳು](#performance-considerations)
- [ವೇಗದ ಸಂಗ್ರಹಣೆಯ ಟೇಬಲ್ಗಳು](#quick-reference-tables)
- [ಮಾನ್ಯತೆ ಉಪಕರಣಗಳು](#validation-tools)

---

## SKUಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

> **ಉದಾಹರಣೆ ವ್ಯಾಪ್ತಿಯು:** ಕೆಳಗಿನ YAML SKU ನಕ್ಷೆಗಳು ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತಾ ಸಂರಚನೆಗಳು ವಿನ್ಯಾಸ ಟಿಪ್ಪಣಿಗಳು, ಒಂದು `azure.yaml` ಸ್ಕೀಮಾ ಅಥವಾ ಲೋಡ್-ಟೂಲ್ ಸಂರಚನೆವಲ್ಲ. Bicep ಬ್ಲಾಕ್‌ಗಳು ಪರ್ಯಾಯಗಳು/ಖಂಡಗಳು: ಅವರ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳು ಮತ್ತು ಪೋಷಕ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಪ್ರಕಟಿಸಿ, ವಿಭಿನ್ನ ಚಿಹ್ನಿತ ಹೆಸರುಗಳನ್ನು ಬಳಸಿ ಅವುಗಳನ್ನು ಸಂಯೋಜಿಸಿ, ಮತ್ತು ಕಾರ್ಯನಿರ್ವಹಣೆಯ ಯೋಜನೆಗೆ ಉತ್ತರದಾಯಕವಾಗಿ ವಾಯರ್ ಮಾಡಿರಿ. ಬೆಲೆಗಳು, ಮಿತಿಗಳು, ಮತ್ತು ಪ್ರದೇಶ/SKU ಲಭ್ಯತೆ ನಿಮ್ಮ ಚಂದಾದಾರಿಕೆಗೆ ನಿಯೋಜಿಸುವ ಮುನ್ನ ಪರಿಶೀಲಿಸಬೇಕು.

### SKUಗಳೆಂದರೆ ಏನು?

SKUಗಳು (ಸ್ಟಾಕ್ ಕೀಪಿಂಗ್ ಯುನಿಟ್‌ಗಳು) ಬೇರೆ ಬೇರೆ ಸೇವಾ ತರ್ಗತಗಳು ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತಾ ಮಟ್ಟಗಳನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತವೆ. ಪ್ರತಿಯೊಬ್ಬ SKU ಭಿನ್ನವಾಗಿರುವುದು:

- **ಕಾರ್ಯಕ್ಷಮತಾ ಲಕ್ಷಣಗಳು** (CPU, ಮೆಮೊರಿ, ಥ್ರೂಪುಟ್)
- **ವೈಶಿಷ್ಟ್ಯ ಲಭ್ಯತೆ** (ವಿಸ್ತರಣೆ ಆಯ್ಕೆಗಳು, SLA ಮಟ್ಟಗಳು)
- **ಬೆಲೆ ಮಾದರಿಗಳು** (ಬಳಕೆ ಆಧಾರಿತ, ಕಾಯ್ದಿರಿಸಿದ ಸಾಮರ್ಥ್ಯ)
- **ಪ್ರದೇಶ ಲಭ್ಯತೆ** (ಎಲ್ಲಾ SKUಗಳು ಎಲ್ಲ ರಾಷ್ಟ್ರಗಳಲ್ಲಿ ಲಭ್ಯವಿಲ್ಲ)

### SKU ಆಯ್ಕೆದಲ್ಲಿನ ಪ್ರಮುಖ ಅಂಶಗಳು

1. **ಕೆಲಸದಭಾರ ಅವಶ್ಯಕತೆಗಳು**
   - ನಿರೀಕ್ಷಿತ ಸಂಚಾರ/ಬರಸಂಪಣೆ ಮಾದರಿಗಳು
   - ಕಾರ್ಯಕ್ಷಮತಾ ಅಗತ್ಯಗಳು (CPU, ಮೆಮೊರಿ, I/O)
   - ಸಂಗ್ರಹಣೆಯ ಅಗತ್ಯಗಳು ಮತ್ತು ಪ್ರವೇಶ ಮಾದರಿಗಳು

2. **ಪರಿಸರ ಪ್ರಕಾರ**
   - ಅಭಿವೃದ್ಧಿ/ಪರೀಕ್ಷಣೆ vs. ಉತ್ಪಾದನೆ
   - ಲಭ್ಯತೆಯ ಅಗತ್ಯಗಳು
   - ಭದ್ರತೆ ಮತ್ತು ಅನುಪಾಲನೆಯ ಅಗತ್ಯಗಳು

3. **ಬಜೆಟ್ ನಿರ್ಬಂಧಗಳು**
   - ಆರಂಭಿಕ ವೆಚ್ಚಗಳು vs. ಕಾರ್ಯಾಚರಣಾ ವೆಚ್ಚಗಳು
   - ಕಾಯ್ದಿರಿಸಿದ ಸಾಮರ್ಥ್ಯ ರಿಯಾಯಿತಿಗಳು
   - ಸ್ವಯಂ ವಿಸ್ತರಣೆ ವೆಚ್ಚ ಪರಿಣಾಮಗಳು

4. **ವೃದ್ಧಿ ನಿರೀಕ್ಷೆಗಳು**
   - ವಿಸ್ತರಣೆ ಅಗತ್ಯಗಳು
   - ಭವಿಷ್ಯದ ವೈಶಿಷ್ಟ್ಯ ಅಗತ್ಯಗಳು
   - ವರ್ಗಾವಣೆ ಸಂಕೀರ್ಣತೆ

---

## ಪರಿಸರ ಆಧಾರಿತ ಆಯ್ಕೆ

### ಅಭಿವೃದ್ಧಿ ಪರಿಸರ

**ಮುಖ್ಯತೆಗಳು**: ವೆಚ್ಚ ಉಳಿತಾಯ, ಮೂಲಭೂತ ಕಾರ್ಯಕ್ಷಮತೆ, ಸುಲಭವಾಗಿ ಹಂಚಿಕೆ/ಅನುಷ್ಠಾನ ರದ್ದುಪಡಿಸುವಿಕೆ

#### ಶಿಫಾರಸು ಮಾಡಿದ SKUಗಳು
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Standard"      # Free tier is an account opt-in, not a SKU
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "workspace-based" # Consumption billing; no Free SKU
```

#### ಲಕ್ಷಣಗಳು
- **ಆಪ್ ಸೇವೆ**: ಸರಳ ಪರೀಕ್ಷೆಗಾಗಿ F1 (ಉಚಿತ) ಅಥವಾ B1 (ಮೂಲಭೂತ)
- **ಡೇಟಾಬೇಸ್‌ಗಳು**: ಕನಿಷ್ಠ ಸಂಪನ್ಮೂಲಗಳೊಂದಿಗೆ ಮೂಲಭೂತ ತರ್ಗತಿ
- **ಸಂಗ್ರಹಣೆ**: ಸ್ಥಳೀಯ redundancy ಮಾತ್ರ ಇರುವ ಸಾಮಾನ್ಯ
- **ಗಣನೆ**: ಹಂಚಿಕೊಂಡ ಸಂಪನ್ಮೂಲಗಳು ಅನುಮತನೆ
- **ನೆಟ್‌ವರ್ಕಿಂಗ್**: ಮೂಲ ಸಂರಚನೆಗಳು

### ಸ್ತಗಿಂಗ್/ಪರೀಕ್ಷಣಾ ಪರಿಸರ

**ಮುಖ್ಯತೆಗಳು**: ಉತ್ಪಾದನೆಯಂತಹ ಸಂರಚನೆ, ವೆಚ್ಚ ಸಮತೋಲನ, ಕಾರ್ಯಕ್ಷಮತಾ ಪರೀಕ್ಷೆ ಸಾಮರ್ಥ್ಯ

#### ಶಿಫಾರಸು ಮಾಡಿದ SKUಗಳು
```yaml
# Staging environment configuration
environment: staging
skus:
  app_service: "S1"          # Standard tier
  sql_database: "S2"         # Standard tier, 50 DTU
  storage: "Standard_GRS"    # Geo-redundant
  cosmos_db: "Standard"      # 400 RU/s provisioned
  container_apps: "Consumption" # Pay-per-use
```

#### ಲಕ್ಷಣಗಳು
- **ಕಾರ್ಯಕ್ಷಮತೆ**: ಉತ್ಪಾದನಾ ಸಾಮರ್ಥ್ಯದ 70-80%
- **ವೈಶಿಷ್ಟ್ಯಗಳು**: ಹೆಚ್ಚಿನ ಉತ್ಪಾದನಾ ವೈಶಿಷ್ಟ್ಯಗಳು ಸಕ್ರಿಯ
- **ಮರುಪೂರ್ತಿಮಾಡುವಿಕೆ**: ಕೆಲವು ಭೌಗೋಳಿಕ redundancy
- **ವಿಸ್ತರಣೆ**: ಪರೀಕ್ಷೆಯಿಗಾಗಿ ಪರಿಮಿತ ಸ್ವಯಂ ವಿಸ್ತರಣೆ
- **ನಿಗಾವಣೆ**: ಪೂರ್ಣ ನಿಗಾವಣೆ ದೃಷ್ಟಿಕೋನ

### ಉತ್ಪಾದನಾ ಪರಿಸರ

**ಮುಖ್ಯತೆಗಳು**: ಕಾರ್ಯಕ್ಷಮತೆ, ಲಭ್ಯತೆ, ಭದ್ರತೆ, ಅನುಪಾಲನೆ, ವಿಸ್ತರಣೆ ಸಾಮರ್ಥ್ಯ

#### ಶಿಫಾರಸು ಮಾಡಿದ SKUಗಳು
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### ಲಕ್ಷಣಗಳು
- **ಹೆಚ್ಚಿನ ಲಭ್ಯತೆ**: 99.9%+ SLA ಅಗತ್ಯಗಳು
- **ಕಾರ್ಯಕ್ಷಮತೆ**: ನಿಗದಿತ ಸಂಪನ್ಮೂಲಗಳು, ಉಚ್ಚ ಥ್ರೂಪುಟ್
- **ಭದ್ರತೆ**: ಪ್ರೀಮಿಯಂ ಭದ್ರತಾ ವೈಶಿಷ್ಟ್ಯಗಳು
- **ವಿಸ್ತರಣೆ**: ಸಂಪೂರ್ಣ ಸ್ವಯಂ ವಿಸ್ತರಣೆ ಸಾಮರ್ಥ್ಯ
- **ನಿಗಾವಣೆ**: ಸಮಗ್ರ ಗಮನಾರ್ಹತೆ

---

## ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ಮಾರ್ಗಸೂಚಿಗಳು

### Azure ಆಪ್ ಸೇವೆ

#### SKU ನಿರ್ಧಾರ ಮ್ಯಾಟ್ರಿಕ್ಸ್

| ಬಳಸುವ ಪ್ರಕರಣ | ಶಿಫಾರಸು ಮಾಡಿದ SKU | ಕಾರಣ |
|----------|----------------|-----------|
| ಅಭಿವೃದ್ಧಿ/ಪರೀಕ್ಷಣೆ | F1 (ಉಚಿತ) ಅಥವಾ B1 (ಮೂಲಭೂತ) | ವೆಚ್ಚ-ಪ್ರಭಾವಶಾಲಿ, ಪರೀಕ್ಷೆಗೆ ಸೂಕ್ತ |
| ಸಣ್ಣ ಉತ್ಪಾದನಾ ಆ್ಯಪ್‌ಗಳು | S1 (ಸಾಮಾನ್ಯ) | ಕಸ್ಟಮ್ ಡೊಮೇನ್ ಗಳು, SSL, ಸ್ವಯಂ ವಿಸ್ತರಣೆ |
| ಮಧ್ಯಮ ಉತ್ಪಾದನಾ ಆ್ಯಪ್‌ಗಳು | P1V3 (ಪ್ರೀಮಿಯಂ V3) | ಉತ್ತಮ ಕಾರ್ಯಕ್ಷಮತೆ, ಹೆಚ್ಚುವರಿಯ ವೈಶಿಷ್ಟ್ಯಗಳು |
| ಹೆಚ್ಚಿನ ಸಂಚಾರ ಆ್ಯಪ್‌ಗಳು | P2V3 ಅಥವಾ P3V3 | ನಿಗದಿತ ಸಂಪನ್ಮೂಲಗಳು, ಹೆಚ್ಚಿನ ಕಾರ್ಯಕ್ಷಮತೆ |
| ಅವಶ್ಯಕ ಕಾರ್ಯಗಳ ಆ್ಯಪ್‌ಗಳು | I1V2 (ಐಸೊಲೇಟಡ್ V2) | ಜಾಲ ತುಂಡನೆ, ನಿಗದಿತ ಉಪಕರಣಗಳು |

#### ಕಾಂಫಿಗರೇಶನ್ ಉದಾಹರಣೆಗಳು

**ಅಭಿವృద్ధಿ**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-dev'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
  properties: {
    reserved: false
  }
}
```

**ಉತ್ಪಾದನೆ**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-prod'
  location: location
  sku: {
    name: 'P1V3'
    tier: 'PremiumV3'
    capacity: 3
  }
  properties: {
    reserved: false
  }
}
```

### Azure SQL ಡೇಟಾಬೇಸ್

#### SKU ಆಯ್ಕೆ ಚೌಕಟ್ಟು

1. **DTU ಆಧಾರಿತ (ಡೇಟಾಬೇಸ್ ಟ್ರಾನ್ಸ್ಯಾಕ್ಷನ್ ಯುನಿಟ್‌ಗಳು)**
   - **ಮೂಲಭೂತ**: 5 DTU - ಅಭಿವೃದ್ಧಿ/ಪರೀಕ್ಷಣೆ
   - **ಸಾಮಾನ್ಯ**: S0-S12 (10-3000 DTU) - ಸಾಮಾನ್ಯ ಉದ್ದೇಶ
   - **ಪ್ರೀಮಿಯಂ**: P1-P15 (125-4000 DTU) - ಕಾರ್ಯಕ್ಷಮತೆ-ಗುರಿಯಾಗಿರುವುದು

2. **vCore ಆಧಾರಿತ** (ಉತ್ಪಾದನೆಗೆ ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
   - **ಸಾಮಾನ್ಯ ಉದ್ದೇಶ**: ಸಮತೋಲನಗೊಂಡ ಗಣನೆ ಮತ್ತು ಸಂಗ್ರಹಣೆ
   - **ವ್ಯವಹಾರ ಗುರಿ**: ಕಡಿಮೆ ವಿಳಂಬ, ಹೆಚ್ಚಿನ IOPS
   - **ಹೈಪರ್ಸ್ಕೇಲ್**: ಅತ್ಯಂತ ವಿಸ್ತರಿಸಲಾಗಬಹುದಾದ ಸಂಗ್ರಹಣೆ; ಪ್ರಸ್ತುತ ಗಾತ್ರ ಮಿತಿಗಳು ಮತ್ತು ಪ್ರದೇಶ ಬೆಂಬಲವನ್ನು ಪರಿಶೀಲಿಸಿ

#### ಉದಾಹರಣಾ ಸಂರಚನೆಗಳು

```bicep
// Development
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-dev'
  parent: sqlServer
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    maxSizeBytes: 2147483648 // 2GB
  }
}

// Production
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-prod'
  parent: sqlServer
  location: location
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 4
  }
  properties: {
    maxSizeBytes: 536870912000 // 500GB
  }
}
```

### Azure ಕಾಂಟೈನರ್ ಆ್ಯಪ್‌ಗಳು

#### ಪರಿಸರ ಪ್ರಕಾರಗಳು

1. **ಬಳಕೆ ಆಧಾರಿತ**
   - ಬಳಕೆ ಪ್ರತ್ಯೇಕ ಪಾವತಿ
   - ಅಭಿವೃದ್ಧಿ ಮತ್ತು ವ್ಯತ್ಯಯಕರ ಕೆಲಸದಭಾರಗಳಿಗೆ ಸೂಕ್ತ
   - ಹಂಚಿಕೊಂಡ ಮೂಲಸೌಕರ್ಯ

2. **ನಿಗದಿತ (ಕೆಲಸದಭಾರ ಪ್ರೊಫೈಲ್‌ಗಳು)**
   - ನಿಗದಿತ ಗಣನೆ ಸಂಪನ್ಮೂಲಗಳು
   - ಮುಟ್ಟಬಹುದಾದ ಕಾರ್ಯಕ್ಷಮತೆ
   - ಉತ್ಪಾದನಾ ಕೆಲಸದಭಾರಗಳಿಗೆ ಉತ್ತಮ

#### ಸಂರಚನೆ ಉದಾಹರಣೆಗಳು

**ಅಭಿವೃದ್ಧಿ (ಬಳಕೆ)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-dev'
  location: location
  properties: {
    zoneRedundant: false
  }
}

resource containerApp 'Microsoft.App/containerApps@2022-10-01' = {
  name: 'ca-${environmentName}-dev'
  location: location
  properties: {
    managedEnvironmentId: containerAppEnvironment.id
    configuration: {
      ingress: {
        external: true
        targetPort: 80 // nginx listens on 80 by default
      }
    }
    template: {
      containers: [{
        name: 'main'
        image: 'nginx:latest'
        resources: {
          cpu: json('0.25')
          memory: '0.5Gi'
        }
      }]
      scale: {
        minReplicas: 0
        maxReplicas: 1
      }
    }
  }
}
```

**ಉತ್ಪಾದನೆ (ನಿಗದಿತ)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 3
      maximumCount: 10
    }]
  }
}
```

ವಲಯ redundancyಗೂ ಬೆಂಬಲಿತ-ಪ್ರದೇಶ ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಸೂಕ್ತ VNet/subnet ಸಂರಚನೆ ಅಗತ್ಯವಿದೆ, ಇಲ್ಲಿ ಬಿಡಿಸಲಾಗಿದೆ. ಈ ಉದಾಹರಣೆಯಲ್ಲಿ ಮೂರು ನಿಗದಿತ ನೋಡ್‌ಗಳಿಗೆ ಬಜೆಟ್ ಮಾಡಲಾಗಿದೆ; ವಲಯ-ಅಸಫಲತೆಯಿಗಾಗಿ ಕನಿಷ್ಠ ಎರಡು ಆಪ್ ಪ್ರತಿಗಳು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ ಮತ್ತು ಎರಡು ಪ್ರತಿಗಳು ಮತ್ತು ನೋಡ್ ಗಳು ವಲಯ ವಿಫಲತೆಯ ಗಾತ್ರಕ್ಕೆ ಹೊಂದಿಸಿ. [Container Apps ನಂಬಿಕೆ ಮಾರ್ಗದರ್ಶನ](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps) ನೋಡೂ. ಈ ಪ್ರೊಫೈಲ್ ಮೇಲೆ ಆಪ್ ಇಡಬೇಕು ಎಂದು ಬಯಸಿದರೆ, ಅದರ `workloadProfileName: 'production-profile'` ಸೆಟ್ ಮಾಡಿ; ಪ್ರೊಫೈಲ್ ಸೃಷ್ಟಿಸುವುದು ಹಗುರವಾಗಿ ಆಪ್‌ಗಳನ್ನು ಅದಕ್ಕೆ ಮರುನಿರ್ದೇಶಿಸುವುದಿಲ್ಲ.

### Azure Cosmos DB

#### ಥ್ರೂಪುಟ್ ಮಾದರಿಗಳು

1. **ಹಸ್ತಚಾಲಿತ ಕೂಲ್ ಥ್ರೂಪುಟ್**
   - ಮುಟ್ಟಬಹುದಾದ ಕಾರ್ಯಕ್ಷಮತೆ
   - ಕಾಯ್ದಿರಿಸಿದ ಸಾಮರ್ಥ್ಯ ರಿಯಾಯಿತಿಗಳು
   - ಸ್ಥಿರ ಕೆಲಸದಭಾರಗಳಿಗೆ ಅತ್ಯುತ್ತಮ

2. **ಸ್ವಯಂ ವಿಸ್ತರಣೆ ಕೂಲ್ ಥ್ರೂಪುಟ್**
   - ಬಳಕೆಯ ಆಧಾರದ ಮೇಲೆ ಸ್ವಚ್ಛಂದ ವಿಸ್ತರಣೆ
   - ಬಳಸಿದಷ್ಟೂ ಪಾವತಿ (ಕನಿಷ್ಠದೊಂದಿಗೆ)
   - ವ್ಯತ್ಯಯಕರ ಕೆಲಸದಭಾರಗಳಿಗೆ ಉತ್ತಮ

3. **ಸರ್ವರ್-ರಹಿತ**
   - ಪ್ರತಿ ವಿನಂತಿಗೆ ಪಾವತಿ
   - ಯಾವುದೇ ಕಾಯ್ದಿರಿಸಿದ ಥ್ರೂಪುಟ್ ಇಲ್ಲ
   - ಅಭಿವೃದ್ಧಿ ಮತ್ತು ಮಧ್ಯಂತರ ಕೆಲಸದಭಾರಗಳಿಗೆ ಶ್ರೇಷ್ಟ

#### SKU ಉದಾಹರಣೆಗಳು

```bicep
// Development - Serverless
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-dev'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [{
      locationName: location
    }]
    capabilities: [{
      name: 'EnableServerless'
    }]
  }
}

// Production - Provisioned with Autoscale
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-prod'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
      {
        locationName: secondaryLocation
        failoverPriority: 1
      }
    ]
    enableAutomaticFailover: true
    enableMultipleWriteLocations: false
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  name: 'main'
  parent: cosmosAccount
  properties: {
    resource: {
      id: 'main'
    }
    options: {
      autoscaleSettings: {
        maxThroughput: 4000
      }
    }
  }
}
```

### Azure ಸಂಗ್ರಹಣಾ ಖಾತೆ

#### ಸಂಗ್ರಹಣೆ ಖಾತೆ ಪ್ರಕಾರಗಳು

1. **Standard_LRS** - ಅಭಿವೃದ್ಧಿ, ಅತೀ ಮಹತ್ವದ ಅಲ್ಲದ ಡೇಟಾ
2. **Standard_GRS** - ಉತ್ಪಾದನೆ, ಭೌಗೋಳಿಕ ಮರುಪೂರ್ತಿ ಅಗತ್ಯ
3. **Premium_LRS** - ಹೆಚ್ಚಿನ ಕಾರ್ಯಕ್ಷಮತಾ ಆ್ಯಪ್‌ಗಳು
4. **Premium_ZRS** - ವಲಯ redundancyಯೊಂದಿಗೆ ಹೆಚ್ಚಿನ ಲಭ್ಯತೆ

#### ಕಾರ್ಯಕ್ಷಮತಾ ತರ್ಗತಗಳು

- **ಸಾಮಾನ್ಯ**: ಸಾಮಾನ್ಯ ಉದ್ದೇಶ, ವೆಚ್ಚ-ಪ್ರಭಾವಶಾಲಿ
- **ಪ್ರೀಮಿಯಂ**: ಹೆಚ್ಚಿನ ಕಾರ್ಯಕ್ಷಮತೆ, ಕಡಿಮೆ ವಿಳಂಬದ ದೃಶ್ಯಗಳು

```bicep
// Development
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}dev'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}

// Production
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}prod'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      defaultAction: 'Deny'
      virtualNetworkRules: []
      ipRules: []
    }
  }
}
```

---

## ವೆಚ್ಚ ಉಳಿತಾಯ ಕಾರ್ಯತಂತ್ರಗಳು

### 1. ಕಾಯ್ದಿರಿಸಿದ ಸಾಮರ್ಥ್ಯ

1-3 ವರ್ಷಗಳಿಗಾಗಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಕಾಯ್ದಿರಿಸಿ ಮಹತ್ತರ ರಿಯಾಯಿತಿಗಳಿಗೆ:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

ಕಾಯ್ದಿರಿಸುವ ಕೊಡುಗೆಗಳು ಮತ್ತು ಅರ್ಹ ಸಂಪನ್ಮೂಲ ಪ್ರಕಾರಗಳು ಬದಲಾಗಬಹುದು; ಪ್ರತಿ ಸೇವೆ/SKU ಕಾಯ್ದಿರಿಸುವಿಕೆ ಬೆಂಬಲಿಸುವುದು ಎಂದು ಊಹಿಸುವ ಬದಲು ಕ್ಯಾಟಲಾಗ್ ಮತ್ತು ಖರೀದಿ ನಿಯಮಗಳನ್ನು ಪರಿಶೀಲಿಸಿ.

### 2. ಸರಿಯಾದ ಗಾತ್ರದ ಆಯ್ಕೆ

ಚಿಕ್ಕ SKUಗಳಿಂದ ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ನಿಜವಾದ ಬಳಕೆಯ ಆಧಾರದ ಮೇಲೆ ಹೆಚ್ಚಿಸಿ:

```yaml
# Progressive scaling approach
development:
  app_service: "F1"    # Free tier
testing:
  app_service: "B1"    # Basic tier  
staging:
  app_service: "S1"    # Standard tier
production:
  app_service: "P1V3"  # Premium tier
```

### 3. ಸ್ವಯಂ ವಿಸ್ತರಣೆ ಸಂರಚನೆ

ವೆಚ್ಚಗಳನ್ನು ಉತ್ತಮಗೊಳಿಸಲು ಬುದ್ಧಿವಂತ ವಿಸ್ತರಣೆ ಅನುಷ್ಠಾನಗೊಳಿಸಿ:

```bicep
resource autoScaleSettings 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscale-${appServicePlan.name}'
  location: location
  properties: {
    profiles: [{
      name: 'default'
      capacity: {
        minimum: '1'
        maximum: '10'
        default: '2'
      }
      rules: [
        {
          metricTrigger: {
            statistic: 'Average'
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'GreaterThan'
            threshold: 70
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Increase'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
        {
          metricTrigger: {
            statistic: 'Average'
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'LessThan'
            threshold: 30
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Decrease'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
      ]
    }]
    enabled: true
    targetResourceUri: appServicePlan.id
  }
}
```

### 4. ನಿಗದಿತ ವಿಸ್ತರಣೆ

ಕೆಲಸದ ಸಮಯ ಹೊರತಾಗಿ ಕಡಿಮೆ ಮಾಡಿ:

```json
{
  "profiles": [
    {
      "name": "business-hours",
      "capacity": {
        "minimum": "2",
        "maximum": "10", 
        "default": "3"
      },
      "recurrence": {
        "frequency": "Week",
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [8],
          "minutes": [0]
        }
      }
    },
    {
      "name": "off-hours",
      "capacity": {
        "minimum": "1",
        "maximum": "2",
        "default": "1"
      },
      "recurrence": {
        "frequency": "Week", 
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [18],
          "minutes": [0]
        }
      }
    }
  ]
}
```

---

## ಕಾರ್ಯಕ್ಷಮತೆ ಪರಿಗಣನೆಗಳು

### ಮೂಲಸ್ಪಷ್ಟ ಕಾರ್ಯಕ್ಷಮತಾ ಅಗತ್ಯಗಳು

SKU ಆಯ್ಕೆ ಮಾಡಲು ಮುಂಚೆ ಸ್ಪಷ್ಟ ಕಾರ್ಯಕ್ಷಮತಾ ಅಗತ್ಯಗಳನ್ನು ವ್ಯಾಖ್ಯಾನಿಸಿ:

```yaml
performance_requirements:
  response_time:
    p95: "< 500ms"
    p99: "< 1000ms"
  throughput:
    requests_per_second: 1000
    concurrent_users: 500
  availability:
    uptime: "99.9%"
    rpo: "15 minutes"
    rto: "30 minutes"
```

### ಲೋಡ್ ಪರೀಕ್ಷೆ

ಕಾರ್ಯಕ್ಷಮತೆಯ ಮಾನ್ಯತೆಗಾಗಿ ವಿಭಿನ್ನ SKUಗಳ ಪರೀಕ್ಷೆ ಮಾಡಿ:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### ನಿಗಾವಣೆ ಮತ್ತು ಉತ್ತಮಗೊಳಿಸುವಿಕೆ

ಸಮಗ್ರ ನಿಗಾವಣೆಯನ್ನು ಹೊಂದಿಸಿ:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    IngestionMode: 'LogAnalytics'
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'law-${environmentName}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
```

---

## ವೇಗದ ಸಂಗ್ರಹಣಾ ಟೇಬಲ್‌ಗಳು

### ಆಪ್ ಸೇವೆ SKU ವೇಗದ ಸಂಗ್ರಹಣಾ

| SKU | ತರ್ಗತಿ | vCPU | RAM | ಸಂಗ್ರಹಣೆ | ಬೆಲೆ ವ್ಯಾಪ್ತಿ | ಬಳಕೆ ಪ್ರಕರಣ |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ಉಚಿತ | ಹಂಚಿಕೊಂಡ | 1GB | 1GB | ಉಚಿತ | ಅಭಿವೃದ್ಧಿ |
| B1 | ಮೂಲಭೂತ | 1 | 1.75GB | 10GB | $ | ಸಣ್ಣ ಆ್ಯಪ್‌ಗಳು |
| S1 | ಸಾಮಾನ್ಯ | 1 | 1.75GB | 50GB | $$ | ಉತ್ಪಾದನೆ |
| P1V3 | ಪ್ರೀಮಿಯಂ V3 | 2 | 8GB | 250GB | $$$ | ಹೆಚ್ಚಿನ ಕಾರ್ಯಕ್ಷಮತೆ |
| I1V2 | ಐಸೊಲೇಟಡ್ V2 | 2 | 8GB | 1TB | $$$$ |エಂಟರ್‌ಪ್ರೈಸ್ |

### SQL ಡೇಟಾಬೇಸ್ SKU ವೇಗದ ಸಂಗ್ರಹಣಾ

| SKU | ತರ್ಗತಿ | DTU/vCore | ಸಂಗ್ರಹಣೆ | ಬೆಲೆ ವ್ಯಾಪ್ತಿ | ಬಳಕೆ ಪ್ರಕರಣ |
|-----|------|-----------|---------|-------------|----------|
| ಮೂಲಭೂತ | ಮೂಲಭೂತ | 5 DTU | 2GB | $ | ಅಭಿವೃದ್ಧಿ |
| S2 | ಸಾಮಾನ್ಯ | 50 DTU | 250GB | $$ | ಸಣ್ಣ ಉತ್ಪಾದನೆ |
| P2 | ಪ್ರೀಮಿಯಂ | 250 DTU | 1TB | $$$ | ಹೆಚ್ಚಿನ ಕಾರ್ಯಕ್ಷಮತೆ |
| GP_Gen5_4 | ಸಾಮಾನ್ಯ ಉದ್ದೇಶ | 4 vCore | 4TB | $$$ | ಸಮತೋಲನಗೊಳಿಸಿದ |
| BC_Gen5_8 | ವ್ಯವಹಾರ ಗುರಿ | 8 vCore | 4TB | $$$$ | ಅವಶ್ಯಕ ಕಾರ್ಯ |

### ಕಾಂಟೈನರ್ ಆ್ಯಪ್‌ಗಳು SKU ವೇಗದ ಸಂಗ್ರಹಣಾ

| ಮಾದರಿ | ಬೆಲೆ | CPU/ಮೆಮೊರಿ | ಬಳಕೆ ಪ್ರಕರಣ |
|-------|---------|------------|----------|
| ಬಳಕೆ | ಬಳಕೆ ಪ್ರತಿ ಪಾವತಿ | ಬೆಂಬಲಿತ CPU/ಮೆಮೊರಿ ಸಂಯೋಜನೆಗಳ ಅವಲಂಬನೆ ಪರಿಸರ/ಪ್ರೊಫೈಲ್ | ಅಭಿವೃದ್ಧಿ ಅಥವಾ ಉತ್ಪಾದನೆ, ವ್ಯತ್ಯಯಕರ ಲೋಡ್ |
| ನಿಗದಿತ D4 | ನಿಗದಿತ ನೋಡ್ ಬಿಲ್ಲಿಂಗ್ | 4 vCPU, 16GiB ಪ್ರತಿ ನೋಡ್ | ಸ್ಥಿರ ಲೋಡ್/ಪಿಂಗ್ಳನೆ ಅಗತ್ಯಗಳು |
| ನಿಗದಿತ D8 | ನಿಗದಿತ ನೋಡ್ ಬಿಲ್ಲಿಂಗ್ | 8 vCPU, 32GiB ಪ್ರತಿ ನೋಡ್ | ಹೆಚ್ಚಿನ ಸ್ಥಿರ ಲೋಡ್ |

---

## ಮಾನ್ಯತೆ ಉಪಕರಣಗಳು

### SKU ಲಭ್ಯತೆ ಪರಿಶೀಲಕ

```bash
#!/bin/bash
# Check SKU availability in target region

check_sku_availability() {
    local region=$1
    local resource_type=$2
    local sku=$3
    
    echo "Checking $sku availability for $resource_type in $region..."
    
    case $resource_type in
        "app-service")
            az appservice list-locations --sku $sku --output table
            ;;
        "sql-database")
            az sql db list-editions --location $region --output table
            ;;
        "storage")
            # Name availability is not SKU availability.
            az storage sku list --query "[?name=='$sku'].{name:name,locations:locations,restrictions:restrictions}" --output json
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### ವೆಚ್ಚ ಅಂದಾಜು ಸ್ಕ್ರಿಪ್ಟ್

**ಊಹಾಪೋಹ ಕೋಡ್ ಮಾತ್ರ:** ಕೆಳಗಿನ `Get-ResourceCost` ಪ್ರಸ್ತುತ ಪ್ರದೇಶ/ಒಪ್ಪಂದ ಬೆಲೆ ಮತ್ತು ಬಳಕೆ ಊಹಾಪೋಹಗಳನ್ನು ಬಳಸಿ ನೀವು ಅನುಷ್ಠಾನಗೊಳಿಸಬೇಕಾದ ಪ್ರಾಜೆಕ್ಟ್-ನಿರ್ದಿಷ್ಟ ಕಾರ್ಯವಾಗಿದೆ. ಇದು PowerShell ಅಥವಾ Azure ಕಮಾಂಡ್‌ಲೆಟ್ ಅಲ್ಲ.

```powershell
# PowerShell script for cost estimation
function Get-AzureCostEstimate {
    param(
        [string]$SubscriptionId,
        [string]$ResourceGroup,
        [hashtable]$Resources
    )
    
    $totalCost = 0
    
    foreach ($resource in $Resources.GetEnumerator()) {
        $resourceType = $resource.Key
        $sku = $resource.Value
        
        # Use Azure Pricing API or calculator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Usage
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### ಕಾರ್ಯಕ್ಷಮತೆ ಮಾನ್ಯತೆ

ಕೆಳಗಿನ YAML ಅಗತ್ಯಗಳ ರೇಖಾಚಿತ್ರ, **ಅವಲ್ಲ** Azure ಲೋಡ್ ಟೆಸ್ಟಿಂಗ್, JMeter, Locust, ಅಥವಾ k6 ಇನ್‌ಪುಟ್ ಸ್ಕೀಮಾ. ಮೇಲಿನ ಲೋಡ್-ಟೆಸ್ಟ್ ಕಮಾಂಡ್ ಬಳಸುವ ಮೊದಲು ಇದನ್ನು ನೀವು ಆಯ್ಕೆಮಾಡಿದ ಉಪಕರಣದ ನಿಜವಾದ ಸಂರಚನೆಗೆ ರೂಪಾಂತರಿಸಿ.

```yaml
# Load test configuration for SKU validation
test_configuration:
  duration: "10m"
  users:
    spawn_rate: 10
    max_users: 100
  
  scenarios:
    - name: "sku_performance_test"
      requests:
        - url: "https://myapp.azurewebsites.net/api/health"
          method: "GET"
          expect:
            - status_code: 200
            - response_time_ms: 500
        
        - url: "https://myapp.azurewebsites.net/api/data"
          method: "POST"
          expect:
            - status_code: 201
            - response_time_ms: 1000

  thresholds:
    http_req_duration:
      - "p(95)<500"  # 95% of requests under 500ms
      - "p(99)<1000" # 99% of requests under 1s
    http_req_failed:
      - "rate<0.1"   # Less than 10% failure rate
```

---

## ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು ಸಾರಾಂಶ

### ಮಾಡಬಹುದಾದವು

1. **ಸಣ್ಣದರಿಂದ ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ನಿಜವಾದ ಬಳಕೆಯ ಆಧಾರದ ಮೇಲೆ ವಿಸ್ತರಿಸಿ**
2. **ವಿವಿಧ ಪರಿಸರಗಳಿಗೆ ವಿಭಿನ್ನ SKUಗಳನ್ನು ಬಳಸಿ**
3. **ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ವೆಚ್ಚಗಳನ್ನು ಸತತವಾಗಿ ನಿಗಾದಿರಿಸಿ**
4. **ಉತ್ಪಾದನಾ ಕೆಲಸದಭಾರಗಳಿಗೆ ಕಾಯ್ದಿರಿಸಿದ ಸಾಮರ್ಥ್ಯ ಉಪಯೋಗಿಸಿ**
5. **ಅತ್ಯುತ್ತಮ ಸ್ಥಳಗಳಲ್ಲಿ ಸ್ವಯಂ ವಿಸ್ತರಣೆ ಅನುಷ್ಠಾನಗೊಳಿಸಿ**
6. **ವಾಸ್ತವಿಕ ಕೆಲಸದಭಾರಗಳೊಂದಿಗೆ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ**
7. **ವೃದ್ಧಿಗಾಗಿ ಯೋಜಿಸಿ ಆದರೆ ಅತಿರೇಕ ಹಂಚಿಕೆ ಮಾಡಬೇಡಿ**
8. **ಅಭಿವೃದ್ಧಿಗಾಗಿ ಉಚಿತ ತರ್ಗತಗಳನ್ನು ಬಳಸಿ ಸಾಧ್ಯವಾದರೆ**

### ಹೊರತಾಗಬೇಕಾದವು

1. **ಅಭಿವೃದ್ಧಿಗಾಗಿ ಉತ್ಪಾದನಾ SKUಗಳನ್ನು ಬಳಸದಿರಿ**
2. **ಪ್ರದೇಶ SKU ಲಭ್ಯತೆಯನ್ನು ನಿರ್ಲಕ್ಷಿಸಬೇಡಿ**
3. **ಡೇಟಾ ವರ್ಗಾವಣೆ ವೆಚ್ಚಗಳನ್ನು ಮರೆತಿರುವುದು ತಪ್ಪು**
4. **ಯುಕ್ತಿಯಿಲ್ಲದೆ ಅತಿರೇಕ ಹಂಚಿಕೆ ಮಾಡಬೇಡಿ**
5. **ನಿರ್ಭರತೆಗಳ ಪರಿಣಾಮಗಳನ್ನು ನಿರ್ಲಕ್ಷಿಸಬೇಡಿ**
6. **ಸ್ವಯಂ ವಿಸ್ತರಣೆ ಮಿತಿಗಳನ್ನು ತುಂಬಾ ಎತ್ತರದಲ್ಲಿ ಸೆಟ್ ಮಾಡಬೇಡಿ**
7. **ಅನುಪಾಲನಾ ಅಗತ್ಯಗಳನ್ನು ಮರೆತಿರುವುದು ತಪ್ಪು**
8. **ಬೆಲೆ ಆಧಾರಿತವಾಗಿ ಮಾತ್ರ ನಿರ್ಧಾರ ಮಾಡಬೇಡಿ**

---

**ಪ್ರೋ ಟಿಪ್**: ನಿಜವಾದ ಬಳಕೆ ಮಾದರಿಗಳ ಆಧಾರದ ಮೇಲೆ SKU ಆಯ್ಕೆಗಳನ್ನು ಉತ್ತಮಗೊಳಿಸಲು Azure ವೆಚ್ಚ ನಿರ್ವಹಣೆ ಮತ್ತು ಸಲಹೆಗಾರರನ್ನು ಉಪಯೋಗಿಸಿ ವೈಯಕ್ತಿಕ ಶಿಫಾರಸುಗಳನ್ನು ಪಡೆಯಿರಿ.

---

**ನಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ಸಾಮರ್ಥ್ಯ ಯೋಜನೆ](capacity-planning.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಪೂರ್ವ-ಪ್ರಯಾಣ ತಪಾಸಣೆ](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# SKU ಆಯ್ಕೆ ಮಾರ್ಗದರ್ಶಿ - ಸರಿಯಾದ Azure ಸೇವಾ ಶ್ರೇಣಿಗಳನ್ನು ಆಯ್ಕೆಮಾಡುವುದು

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 6 - Pre-Deployment Validation & Planning
- **⬅️ Previous**: [Capacity Planning](capacity-planning.md)
- **➡️ Next**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Next Chapter**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## ಪರಿಚಯ

ಈ ಸಂಪೂರ್ಣ ಮಾರ್ಗದರ್ಶಿ ವಿಭಿನ್ನ ಪರಿಸರಗಳು, ಕೆಲಸದ ಭಾರಗಳು ಮತ್ತು ಅಗತ್ಯಗಳಿಗೆ ಅನುಗುಣವಾದ Azure ಸೇವಾ SKUಗಳ (Stock Keeping Units) ಅತ್ಯುತ್ತಮ ಆಯ್ಕೆ ಮಾಡಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ. ನಿಮ್ಮ Azure Developer CLI ನಿಯೋಜನೆಗಳಿಗೆ ತಕ್ಕತಾಗಿ ಸೇವಾ ಶ್ರೇಣಿಗಳನ್ನು ಆಯ್ಕೆಮಾಡಲು ಕಾರ್ಯಕ್ಷಮತಾ ಅವಶ್ಯಕತೆಗಳು, ವೆಚ್ಚ ಪರಿಗಣನೆಗಳು ಮತ್ತು ವಿಸ್ತರಣಾಶೀಲತೆ ಅವಶ್ಯಕತೆಗಳನ್ನು ವಿಮರ್ಶೆ ಮಾಡುವುದುLearn ಮಾಡಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ಮೇಲೆ, ನೀವು:
- Azure SKU ಕಲ್ಪನೆಗಳು, ಬೆಲೆ ನಮೂನೆಗಳು, ಮತ್ತು ವೈಶಿಷ್ಟ್ಯ ವ್ಯತ್ಯಾಸಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ
- ಅಭಿವೃದ್ಧಿ, ಸ್ಟೇಜಿಂಗ್, ಮತ್ತು ಉತ್ಪಾದನೆಗೆ ಪರಿಸರ ನಿರ್ದಿಷ್ಟ SKU ಆಯ್ಕೆ ಯुक्तಿಗಳನ್ನು ಪಾಲಿಸಬಹುದು
- ಕೆಲಸದ ಭಾರ ಅಗತ್ಯಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ ಅವುಗಳಿಗೂ ತಕ್ಕ ಸೇವಾ ಶ್ರೇಣಿಗಳನ್ನು ಹೊಂದಿಸಬಹುದು
- ಬುದ್ಧಿವಂತಿಕೆ ಪಾಲಿಸಿದ SKU ಆಯ್ಕೆ ಮೂಲಕ ವೆಚ್ಚದ ನವೀಕರಣ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸಬಹುದು
- SKU ಆಯ್ಕೆಗಳಿಗೆ ಕಾರ್ಯಕ್ಷಮತೆಯ ಪರೀಕ್ಷೆಗಳು ಮತ್ತು ಮಾನ್ಯತೆ ತಂತ್ರಗಳನ್ನು ಅನುಸರಿಸಬಹುದು
- ಸ್ವಯಂಚಾಲಿತ SKU ಶಿಫಾರಸುಗಳು ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಕಾನ್ಫಿಗರನ್ನು ಸಂರಚಿಸಬಹುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಶಕ್ತರಾಗಿರುವಿರಿ:
- ಕೆಲಸದ ಭಾರ ಅವಶ್ಯಕತೆಗಳು ಮತ್ತು ನಿರ್ಬಂಧಗಳ ಆಧಾರದ ಮೇಲೆ ಸೂಕ್ತ Azure ಸೇವಾ SKUಗಳನ್ನು ಆಯ್ಕೆಮಾಡಲು
- ಸರಿಯಾದ ಟಿಯರ್ ಆಯ್ಕೆಯೊಂದಿಗೆ ವೆಚ್ಚ-ಪ್ರಭಾವಿ ಬಹು-ಪರಿಸರ ವಾಸ್ತುಶಿಲ್ಪಗಳನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಲು
- SKU ಆಯ್ಕೆಗಾಗಿ ಕಾರ್ಯಕ್ಷಮತಾ ಬೇಂಚ್‌ಮಾರ್ಕಿಂಗ್ ಮತ್ತು ಮಾನ್ಯತೆ ಅನುಷ್ಠಾನಗೊಳಿಸಲು
- SKU ಶಿಫಾರಸು ಮತ್ತು ವೆಚ್ಚದ ನವೀಕರಣಕ್ಕಾಗಿ ಸ್ವಯಂಚಾಲಿತ ಸಾಧನಗಳನ್ನು ರಚಿಸಲು
- ಬದಲಾಗುತ್ತಿರುವ ಅಗತ್ಯಗಳಿಗೆ SKU ಮೈಸಿಗೆಯನ್ನು ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ತಂತ್ರಗಳನ್ನು ಯೋಜಿಸಲು
- ಸೇವಾ ಶ್ರೇಣಿಯ ಆಯ್ಕೆಗಳಿಗೆ Azure Well-Architected Framework ತತ್ವಗಳನ್ನು ಅನ್ವಯಿಸಲು

## ವಿಷಯಗಳ ಪಟ್ಟಿಃ

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## SKUಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### SKUಗಳು ಏನು?

SKUಗಳು (Stock Keeping Units) Azure ಸಂಪನ್ಮೂಲಗಳ ವಿಭಿನ್ನ ಸೇವಾ ಶ್ರೇಣಿಗಳು ಮತ್ತು ಕಾರ್ಯಕ್ಷಮತಾ ಮಟ್ಟಗಳನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತವೆ. ಪ್ರತಿ SKU ವ್ಯತ್ಯಸ್ತವಿದೆ:

- **ಕಾರ್ಯಕ್ಷಮತಾ ಲಕ್ಷಣಗಳು** (CPU, ಮೆಮರಿ, throughput)
- **ವೈಶಿಷ್ಟ್ಯ ಲಭ್ಯತೆ** (ಸ್ಕೇಲಿಂಗ್ ಆಯ್ಕೆಗಳು, SLA ಮಟ್ಟಗಳು)
- **ಬೆಲೆ ಮಾದರಿಗಳು** (ಖರ್ಚು-ಆಧಾರಿತ, ರಿಸರ್ವ್ ಮಾಡಿದ ಸಾಮರ್ಥ್ಯ)
- **ಪ್ರಾಂತ್ಯಿಕ ಲಭ್ಯತೆ** (ಎಲ್ಲಾ ಪ್ರಾಂತ್ಯಗಳಲ್ಲಿ ಎಲ್ಲಾ SKUಗಳು ಲಭ್ಯವಿರಲಾರವು)

### SKU ಆಯ್ಕೆಯ ಪ್ರಮುಖ 요소ಗಳು

1. **ಲೋಡ್ ಅವಶ್ಯಕತೆಗಳು**
   - ನಿರೀಕ್ಷಿತ ಟ್ರಾಫಿಕ್/ಲೋಡ್ ಮಾದರಿಗಳು
   - ಕಾರ್ಯಕ್ಷಮತಾ ಅವಶ್ಯಕತೆಗಳು (CPU, ಮೆಮೊರಿ, I/O)
   - ಸಂಗ್ರಹಣಾ ಅಗತ್ಯಗಳು ಮತ್ತು ಪ್ರವೇಶ ಮಾದರಿಗಳು

2. **ಪರಿಸರ ಪ್ರಕಾರ**
   - ಅಭಿವೃದ್ಧಿ/ಪರೀಕ್ಷೆ ಮತ್ತು ಉತ್ಪಾದನೆ
   - ಲಭ್ಯತೆ ಅವಶ್ಯಕತೆಗಳು
   - ಭದ್ರತೆ ಮತ್ತು ಅನುಗುಣತೆ ಅಗತ್ಯಗಳು

3. **ಬಜೆಟ್ ನಿಯಂತ್ರಣೆಗಳು**
   - ಪ್ರಾರಂಭಿಕ ವೆಚ್ಚಗಳು ಮತ್ತು ಕಾರ್ಯಾಚರಣಾ ವೆಚ್ಚಗಳ ನಡುವಿನ ಸಮತೋಲನ
   - ರಿಸರ್ವ್ ಮಾಡಿದ ಸಾಮರ್ಥ್ಯದ ರಿಯಾಯಿತಿಗಳು
   - ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ವೆಚ್ಚ ಪರಿಣಾಮಗಳು

4. **ವೃದ್ಧಿಯ ನಿರೀಕ್ಷೆಗಳು**
   - ಸ್ಕೇಲಬಿಲಿಟಿ ಅವಶ್ಯಕತೆಗಳು
   - ಭವಿಷ್ಯದ ವೈಶಿಷ್ಟ್ಯಗಳ ಅಗತ್ಯಗಳು
   - ಸ್ಥಳಾಂತರದ (ಮೈಗ್ರೇಶನ್) ಸಂಕೀರ್ಣತೆ

---

## ಪರಿಸರಾಧಾರಿತ ಆಯ್ಕೆ

### ವಿಕಾಸ ಪರಿಸರ

**ಪ್ರಮುಖತೆಗಳು**: ವೆಚ್ಚದ ಅತ್ಯೋತ್ತಮೀಕರಣ, ಮೂಲಭೂತ ಕಾರ್ಯಕ್ಷಮತೆ, ಸುಲಭ ಪ್ರಾವಿಧಿ/ಅಪ್ರಾವಿಧಿ

#### Recommended SKUs
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Free"          # Free tier (400 RU/s)
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "Free" # First 5GB free
```

#### ವೈಶಿಷ್ಟ್ಯಗಳು
- **App Service**: ಸರಳ ಪರೀಕ್ಷೆಗೆ F1 (ಉಚಿತ) ಅಥವಾ B1 (ಮೂಲಭೂತ)
- **Databases**: ಕನಿಷ್ಠ ಸಂಪನ್ಮೂಲಗಳೊಂದಿಗೆ Basic ಟಿಯರ್
- **Storage**: ಕ್ಷೇತ್ರೀಯ redundancy ಸೀಮಿತ ಮಾಡಿಕೊಂಡ Standard
- **Compute**: ಹಂಚಿಕೆಯಾಗಿರುವ ಸಂಪನ್ಮೂಲಗಳು ಸ್ವೀಕರಿಸಲಾಗುತ್ತವೆ
- **Networking**: ಮೂಲಭೂತ ಸಂರಚನೆಗಳು

### Staging/Testing ಪರಿಸರ

**ಪ್ರಮುಖತೆಗಳು**: ಉತ್ಪಾದನೆ-ಸಮಾನ ಸಂರಚನೆ, ವೆಚ್ಚದಲ್ಲಿ ಸಮತೋಲನ, ಕಾರ್ಯಕ್ಷಮತಾ ಪರೀಕ್ಷೆಯ ಸಾಮರ್ಥ್ಯ

#### Recommended SKUs
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

#### ವೈಶಿಷ್ಟ್ಯಗಳು
- **Performance**: ಉತ್ಪಾದನೆ ಸಾಮರ್ಥ್ಯದ 70-80%
- **Features**: ಹೆಚ್ಚಿನ ಉತ್ಪಾದನೆ ವೈಶಿಷ್ಟ್ಯಗಳು ಸಕ್ರಿಯ
- **Redundancy**: ಕೆಲವು ಭೌಗೋಳಿಕ redundancy
- **Scaling**: ಪರೀಕ್ಷೆಗೆ ಸೀಮಿತ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್
- **Monitoring**: ಸಂಪೂರ್ಣ ಮಾನಿಟರಿಂಗ್ ಸ್ಟಾಕ್

### Production ಪರಿಸರ

**ಪ್ರಮುಖತೆಗಳು**: ಕಾರ್ಯಕ್ಷಮತೆ, ಲಭ್ಯತೆ, ಭದ್ರತೆ, ಅನುಗುಣತೆ, ಸ್ಕೇಲಬಿಲಿಟಿ

#### Recommended SKUs
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Premium_GRS"     # Premium geo-redundant
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### ವೈಶಿಷ್ಟ್ಯಗಳು
- **High availability**: 99.9%+ SLA ಅವಶ್ಯಕತೆಗಳು
- **Performance**: ನಿಷ್ಠುರ ಸಂಪನ್ಮೂಲಗಳು, ಉನ್ನತ throughput
- **Security**: ಪ್ರೀಮಿಯಂ ಭದ್ರತಾ ವೈಶಿಷ್ಟ್ಯಗಳು
- **Scaling**: ಸಂಪೂರ್ಣ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಸಾಮರ್ಥ್ಯಗಳು
- **Monitoring**: ಸಮಗ್ರಾಗಿದೆ_OBSERVABILITY

---

## ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ಮಾರ್ಗದರ್ಶಿಗಳು

### Azure App Service

#### SKU ನಿರ್ಧಾರ ಮ್ಯಾಟ್ರಿಕ್ಸ್

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | ಸ್ವಲ್ಪ ವೆಚ್ಚಿ, ಪರೀಕ್ಷೆಗೆ ತಕ್ಕಮಟ್ಟಿಗೆ ಯಥেষ্ট |
| Small production apps | S1 (Standard) | ಕಸ್ಟಮ್ ಡೊಮೇನ್ಗಳು, SSL, ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ |
| Medium production apps | P1V3 (Premium V3) | ಉತ್ತಮ ڪار್ಯಕ್ಷಮತೆ, ಹೆಚ್ಚಿನ ವೈಶಿಷ್ಟ್ಯಗಳು |
| High-traffic apps | P2V3 or P3V3 | ನಿಷ್ಠುರ ಸಂಪನ್ಮೂಲಗಳು, ಉನ್ನತ ಕಾರ್ಯಕ್ಷಮತೆ |
| Mission-critical apps | I1V2 (Isolated V2) | ನೆಟ್‌ವರ್ಕ್ ವಿಭಜನೆ, ನಿಷ್ಠುರ ಹಾರ್ಡ್‌ವೇರ್ |

#### ಸಂರಚನೆ ಉದಾಹರಣೆಗಳು

**Development**
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

**Production**
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

### Azure SQL Database

#### SKU ಆಯ್ಕೆ ರೂಪರೇಖೆ

1. **DTU-ಆಧಾರಿತ (Database Transaction Units)**
   - **Basic**: 5 DTU - ವಿಕಾಸ/ಪರೀಕ್ಷೆ
   - **Standard**: S0-S12 (10-3000 DTU) - ಸಾಮಾನ್ಯ ಉದ್ದೇಶ
   - **Premium**: P1-P15 (125-4000 DTU) - ಕಾರ್ಯಕ್ಷಮತೆಯ ಬಳಕೆಗಾಗಿರುವ ಭಾರೀ ಕಾರ್ಯಗಳು

2. **vCore-ಆಧಾರಿತ** (ಉತ್ಪಾದನೆಗೆ ಶಿಫಾರಸು)
   - **General Purpose**: ಸಮತೋಲನ ಹೊಂದಿದ compute ಮತ್ತು storage
   - **Business Critical**: ಕಡಿಮೆ ವಿಳಂಬ, ಉನ್ನತ IOPS
   - **Hyperscale**: ಅತ್ಯಧಿಕ ವಿಸ್ತರಣಾಶೀಲ ಸಂಗ್ರಹಣೆ (ವರೆಗೆ 100TB)

#### ಉದಾಹರಣೆ ಸಂರಚನೆಗಳು

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

### Azure Container Apps

#### ಪರಿಸರ ಪ್ರಕಾರಗಳು

1. **Consumption-based**
   - ಬಳಕೆಗಾಗಿ ಮಾತ್ರ ಪಾವತಿ
   - ವಿಕಾಸ ಹಾಗೂ ಬದಲಾವಣೆಗೊಳ್ಳುವ ಲೋಡ್‌ಗಳಿಗೆ ಯೋಗ್ಯ
   - ಹಂಚಿಕೆಯಾಗಿರುವ ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್

2. **Dedicated (Workload Profiles)**
   - ನಿಷ್ಠುರ compute ಸಂಪನ್ಮೂಲಗಳು
   - ಮುನ್ಸೂಚಿತ ಕಾರ್ಯಕ್ಷಮತೆ
   - ಉತ್ಪಾದನೆ ಕಾರ್ಯಭಾರಗಳಿಗೆ ಉತ್ತಮ

#### ಸಂರಚನೆ ಉದಾಹರಣೆಗಳು

**Development (Consumption)**
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
        targetPort: 3000
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

**Production (Dedicated)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 2
      maximumCount: 10
    }]
  }
}
```

### Azure Cosmos DB

#### Throughput ಮಾದರಿಗಳು

1. **Manual Provisioned Throughput**
   - ಮುನ್ಸೂಚಿತ ಕಾರ್ಯಕ್ಷಮತೆ
   - ರಿಸರ್ವ್ ಸಾಮರ್ಥ್ಯ ರಿಯಾಯಿತಿಗಳು
   - ಸ್ಥಿರ ಲೋಡ್‌ಗಳಿಗೆ ಉತ್ತಮ

2. **Autoscale Provisioned Throughput**
   - ಬಳಕೆಯ ಆಧಾರದ ಮೇಲೆ ಸ್ವಯಂಚಾಲಿತ ಸ್ಕೇಲಿಂಗ್
   - ಬಳಕೆಬಗ್ಗೆ ಮಾತ್ರ ಪಾವತಿ (ಕನಿಷ್ಠ ಮಟ್ಟದೊಂದಿಗೆ)
   - ಬದಲಾಗುವ ಲೋಡ್‌ಗಳಿಗೆ ಉತ್ತಮ

3. **Serverless**
   - ಪ್ರತಿಯೊಂದು ವಿನಂತಿಗೆ ಪಾವತಿ
   - Provisioned throughput ಇಲ್ಲ
   - ವಿಕಾಸ ಮತ್ತು ಮಧ್ಯಂತರ ಲೋಡ್‌ಗಳಿಗೆ אידೀಯಲ್

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

### Azure Storage Account

#### Storage Account ಪ್ರಕಾರಗಳು

1. **Standard_LRS** - ವಿಕಾಸ, ಗಂಭೀರವಲ್ಲದ ಡೇಟಾ
2. **Standard_GRS** - ಉತ್ಪಾದನೆ, ಭೌಗೋಳಿಕ redundancy ಬೇಕಿದ್ದರೆ
3. **Premium_LRS** - ಉನ್ನತ ಕಾರ್ಯಕ್ಷಮತೆಯ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
4. **Premium_ZRS** - ಝೋನ್ redundancy ಜೊತೆ ಉನ್ನತ ಲಭ್ಯತೆ

#### ಕಾರ್ಯಕ್ಷಮತಾ ಟಿಯರ್‌ಗಳು

- **Standard**: ಸಾಮಾನ್ಯ ಉದ್ದೇಶ, ವೆಚ್ಚ-ಕಾರ್ಯಕ್ಷಮ
- **Premium**: ಉನ್ನত ಕಾರ್ಯಕ್ಷಮತೆ, ಕಡಿಮೆ ವಿಳಂಬ ಪರಿಸರಗಳು

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

## ವೆಚ್ಚದ ನವೀಕರಣ ತಂತ್ರಗಳು

### 1. Reserved Capacity

1-3 ವರ್ಷಗಳಿಗಾಗಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಕಾಯ್ದಿರಿಸುವ ಮೂಲಕ ಪ್ರಮುಖ ರಿಯಾಯಿತಿಗಳು:

```bash
# ರಿಸರ್ವೇಶನ್ ಆಯ್ಕೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Right-Sizing

ಪ್ರಾಮಾಣಿಕ ಬಳಕೆಯ ಆಧಾರದ ಮೇಲೆ ಸಣ್ಣ SKUಗಳಿಂದ ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ಮೇಲಕ್ಕೆ ವಿಸ್ತರಿಸು:

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

### 3. Auto-Scaling ಸಂರಚನೆ

ವೆಚ್ಚವನ್ನು tốiಮೀಕರಿಸಲು ಬುದ್ಧಿವಂತಿಕೆಯುತ ಸ್ಕೇಲಿಂಗ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ:

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

### 4. Scheduled Scaling

ಕಾಲಾವಕಾಶಗಳಲ್ಲಿ ಕಡಿಮೆ ಬೋঝ ಭರಿಸುವಂತೆ ಸ್ಕೇಲ್ डाउन ಮಾಡಿ:

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

## ಕಾರ್ಯಕ್ಷಮತಾ ಪರಿಗಣನೆಗಳು

### ಮೂಲಭೂತ ಕಾರ್ಯಕ್ಷಮತಾ ಅವಶ್ಯಕತೆಗಳು

SKU ಆಯ್ಕೆಮಾದಿಯ ಮೇಲೆ ಸ್ಪಷ್ಟ ಕಾರ್ಯಕ್ಷಮತಾ ಅವಶ್ಯಕತೆಗಳನ್ನು ನಿರ್ಧರಿಸಿ:

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

### ಲೋಡ್ ಟೆಸ್ಟಿಂಗ್

ವಿಭಿನ್ನ SKUಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ:

```bash
# Azure ಲೋಡ್ ಪರೀಕ್ಷಾ ಸೇವೆ
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### ಮಾನಿಟರಿಂಗ್ ಮತ್ತು оптимೈಜೇಶನ್

ಸಂಪೂರ್ಣವಾದ ಮಾನಿಟರಿಂಗ್ ಅನ್ನು ಜೋಡಿಸಿ:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    RetentionInDays: 90
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

## ತೀವ್ರ ಶ್ರೇಷ್ಠ ಉಲ್ಲೇಖ ಏರ್ಪಡಿಸು

### App Service SKU ಶೀಘ್ರ ಉಲ್ಲೇಖ

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### SQL Database SKU ಶೀಘ್ರ ಉಲ್ಲೇಖ

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Container Apps SKU ಶೀಘ್ರ ಉಲ್ಲೇಖ

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## ಮಾನ್ಯತೆ ಅಗತ್ಯೋಪಕರಣಗಳು

### SKU ಲಭ್ಯತೆ ಪರಿಶೀಲಕ

```bash
#!/bin/bash
# লক্ষ্যಿತ ಪ್ರದೇಶದಲ್ಲಿ SKU ಲಭ್ಯತೆ ಪರಿಶೀಲಿಸಿ

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
            az storage account check-name --name "test" --output table
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# ಬಳಕೆ
check_sku_availability "eastus" "app-service" "P1V3"
```

### ವೆಚ್ಚ ಅಂದಾಜು ಸ್ಕ್ರಿಪ್ಟ್

```powershell
# ಖರ್ಚಿನ ಅಂದಾಜುಗಾಗಿ PowerShell ಸ್ಕ್ರಿಪ್ಟ್
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
        
        # Azure ಬೆಲೆ API ಅಥವಾ ಕ್ಯಾಲ್ಕ್ಯುಲೇಟರ್ ಬಳಸಿ
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# ಬಳಕೆ
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### ಕಾರ್ಯಕ್ಷಮತಾ ಮಾನ್ಯತೆ

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

## ಉತ್ತಮ ಪದ್ಧತಿಯ ಸಾರಾಂಶ

### ಮಾಡುವುದರು

1. **ಪ್ರಾಮಾಣಿಕವಾಗಿ ಚಿಕ್ಕದಾಗಿ ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ಮೇಲಕ್ಕೆ ಸ್ಕೇಲ್ ಮಾಡಿ** ಬಳಕೆಯ ಆಧಾರದ ಮೇಲೆ
2. **ವಿವಿಧ ಪರಿಸರಗಳಿಗೆ ವಿಭಿನ್ನ SKUಗಳನ್ನು ಬಳಸಿ**
3. **ಕಾರ್ಯಕ್ಷಮತೆ ಮತ್ತು ವೆಚ್ಚಗಳನ್ನು ನಿರಂತರವಾಗಿ ಮಾನಿಟರ್ ಮಾಡಿ**
4. **ಉತ್ಪಾದನಾ ಕಾರ್ಯಭಾರಗಳಿಗೆ ರಿಸರ್ವ್ ಮಾಡಿದ ಸಾಮರ್ಥ್ಯವನ್ನು ಉಪಯೋಗಿಸಿ**
5. **ಯೋಗ್ಯ ಸ್ಥಳಗಳಲ್ಲಿ ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ**
6. **ವಾಸ್ತವಿಕ ಕೆಲಸದ ಭಾರಗಳೊಂದಿಗೆ ಕಾರ್ಯಕ್ಷಮತೆ ಪರೀಕ್ಷೆ ಮಾಡಿ**
7. **ವೃದ್ಧಿಗೆ ಯೋಜಿಸು ಆದರೆ ಅಗತ್ಯವಿಲ್ಲದೆ ಹೆಚ್ಚಿನ ವಿತರಣೆ ಮಾಡದಿರಿ**
8. **ಸಾಧ್ಯವಾದರೆ ವಿಕಾಸಕ್ಕಾಗಿ ಉಚಿತ ಟಿಯರ್‌ಗಳನ್ನು ಬಳಸಿ**

### 하지 말 것 ಗಳು (Don'ts)

1. **ವಿಕಾಸಕ್ಕಾಗಿ ಉತ್ಪಾದನಾ SKUಗಳನ್ನು ಬಳಸಬೇಡಿ**
2. **ಪ್ರಾಂತ್ಯಿಕ SKU ಲಭ್ಯತೆಯನ್ನು ನಿರ್ಲಕ್ಷಿಸಬೇಡಿ**
3. **ಡೇಟಾ ವರ್ಗಾವಣೆ ವೆಚ್ಚಗಳನ್ನು ಮರೆಯಬೇಡಿ**
4. **ತರ್ಕವಿಲ್ಲದೆ ಹೆಚ್ಚು ಪ್ರೊವಿಷನ್ ಮಾಡಬೇಡಿ**
5. **ನಿರ್ಭರತೆಗಳ ಪರಿಣಾಮವನ್ನು ನಿರ್ಲಕ್ಷಿಸಬೇಡಿ**
6. **ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಮಿತಿಗಳನ್ನು ತುಂಬಾ ಉನ್ನತಗೊಳಿಸಬೇಡಿ**
7. **ಅನುಗುಣತಾ ಅಗತ್ಯಗಳನ್ನು ಮರೆಯಬೇಡಿ**
8. **ಕೆಲವೆಡೆ ಕೇವಲ ಬೆಲೆಯ ಆಧಾರದ ಮೇಲೆ ನಿರ್ಧಾರಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳಬೇಡಿ**

---

**ಪ್ರೋ ಟಿಪ್**: ನಿಜವಾದ ಬಳಕೆ ಮಾದರಿಗಳ ಆಧಾರದ ಮೇಲೆ ನಿಮ್ಮ SKU ಆಯ್ಕೆಗಳನ್ನು tốiಮೀಕರಿಸಲು Azure Cost Management ಮತ್ತು Advisor ಅನ್ನು ಬಳಸಿರಿ.

---

**ನಾವಿಗೇಶನ್**
- **Previous Lesson**: [Capacity Planning](capacity-planning.md)
- **Next Lesson**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿದ್ದು ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ ಸಹ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪುತೆಗಳು ಇರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಇರುವ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಅತ್ಯಂತ ಮುಖ್ಯ ಮಾಹಿತಿಗೆ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗರ್ಭಿತತೆಗಳಿಗಾಗಿ ನಾವು ಜವಾಬ್ದಾರರಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
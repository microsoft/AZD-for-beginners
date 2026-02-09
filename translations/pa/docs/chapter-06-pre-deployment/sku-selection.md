# SKU ਚੋਣ ਗਾਈਡ - ਸਹੀ Azure ਸਰਵਿਸ ਟੀਅਰ ਚੁਣਣਾ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: Chapter 6 - Pre-Deployment Validation & Planning
- **⬅️ ਪਿਛਲਾ**: [Capacity Planning](capacity-planning.md)
- **➡️ ਅਗਲਾ**: [Pre-flight Checks](preflight-checks.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## ਪ੍ਰਸਤਾਵਨਾ

ਇਹ ਵਿਸ਼ਤਰੀਤ ਗਾਈਡ ਤੁਹਾਨੂੰ ਵੱਖ-ਵੱਖ ਵਾਤਾਵਰਣਾਂ, ਵਰਕਲੋਡ ਅਤੇ ਲੋੜਾਂ ਲਈ ਢੁਕਵੀਂ Azure ਸਰਵਿਸ SKU (Stock Keeping Units) ਚੁਣਨ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਲੋੜਾਂ, ਲਾਗਤ ਦੇ ਪੱਖ ਅਤੇ ਸਕੇਲਬਿਲਿਟੀ ਦੀਆਂ ਲੋੜਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਨਾ ਸਿੱਖੋ ਤਾਂ ਜੋ ਆਪਣੀਆਂ Azure Developer CLI ਡਿਪਲੋਇਮੈਂਟਸ ਲਈ ਸਭ ਤੋਂ ਉਚਿਤ ਸਰਵਿਸ ਟੀਅਰ ਚੁਣੇ ਜਾ ਸਕਣ।

## ਸਿੱਖਣ ਦੇ ਲਕੜਾਂ

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੇ, ਤੁਸੀਂ:
- Azure SKU ਧਾਰਣਾਂ, ਪ੍ਰਾਈਸਿੰਗ ਮਾਡਲਾਂ ਅਤੇ ਫੀਚਰ ਤਫਾਵਤਾਂ ਨੂੰ ਸਮਝੋਗੇ
- ਡਿਵੈਲਪਮੈਂਟ, ਸਟੇਜਿੰਗ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਤ SKU ਚੋਣ ਰਣਨੀਤੀਆਂ ਵਿੱਚ ਮੁਹਿਰਤ ਹਾਸਲ ਕਰੋਗੇ
- ਵਰਕਲੋਡ ਲੋੜਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਕੇ ਉਚਿਤ ਸਰਵਿਸ ਟੀਅਰ ਨਾਲ ਮੇਲ ਕਰੋਗੇ
- ਸਮਝਦਾਰ SKU ਚੋਣ ਰਾਹੀਂ ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ ਅਮਲ ਕਰੋਗੇ
- SKU ਚੋਣਾਂ ਲਈ ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ ਅਤੇ ਵੈਲਿਡੇਸ਼ਨ ਤਕਨੀਕਾਂ ਲਾਗੂ ਕਰੋਗੇ
- ਆਟੋਮੇਟਿਕ SKU ਸੁਝਾਵਾਂ ਅਤੇ ਨਿਗਰਾਨੀ ਸੰਰਚਨਾ ਕਾਨਫਿਗਰ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਵਰਕਲੋਡ ਲੋੜਾਂ ਅਤੇ ਪਾਬੰਦੀਆਂ ਦੇ ਅਧਾਰ 'ਤੇ ਉਚਿਤ Azure ਸਰਵਿਸ SKU ਚੁਣਨਾ
- ਢੁਕਵੀਂ ਟੀਅਰ ਚੋਣ ਨਾਲ ਲਾਗਤ-ਪ੍ਰਭਾਵੀ ਬਹੁ-ਵਾਤਾਵਰਣ ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਇਨ ਕਰਨਾ
- SKU ਚੋਣਾਂ ਲਈ ਪ੍ਰਦਰਸ਼ਨ ਬੈਂਚਮਾਰਕਿੰਗ ਅਤੇ ਵੈਲਿਡੇਸ਼ਨ ਲਾਗੂ ਕਰਨਾ
- SKU ਸਿਫਾਰਸ਼ੀ ਅਤੇ ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਲਈ ਆਟੋਮੇਟਡ ਟੂਲ ਬਣਾਉਣਾ
- ਬਦਲਦੀਆਂ ਲੋੜਾਂ ਲਈ SKU ਮਾਈਗ੍ਰੇਸ਼ਨ ਅਤੇ ਸਕੇਲਿੰਗ ਰਣਨੀਤੀਆਂ ਦੀ ਯੋਜਨਾ ਬਣਾਉਣਾ
- ਸਰਵਿਸ ਟੀਅਰ ਚੋਣ ਲਈ Azure Well-Architected Framework ਸਿਧਾਂਤ ਲਾਗੂ ਕਰਨਾ

## ਸਮੱਗਰੀ ਸੂਚੀ

- [SKUs ਨੂੰ ਸਮਝਣਾ](../../../../docs/chapter-06-pre-deployment)
- [ਵਾਤਾਵਰਣ-ਆਧਾਰਤ ਚੋਣ](../../../../docs/chapter-06-pre-deployment)
- [ਸਰਵਿਸ-ਨਿਰਧਾਰਤ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼](../../../../docs/chapter-06-pre-deployment)
- [ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ](../../../../docs/chapter-06-pre-deployment)
- [ਪ੍ਰਦਰਸ਼ਨ ਵਿਚਾਰ](../../../../docs/chapter-06-pre-deployment)
- [ਤੇਜ਼ ਸੰਦਰਭ ਸਾਰਣੀਆਂ](../../../../docs/chapter-06-pre-deployment)
- [ਵੈਲਿਡੇਸ਼ਨ ਟੂਲ](../../../../docs/chapter-06-pre-deployment)

---

## SKUs ਨੂੰ ਸਮਝਣਾ

### SKUs ਕੀ ਹਨ?

SKU (Stock Keeping Units) Azure ਸਰੋਤਾਂ ਲਈ ਵੱਖ-ਵੱਖ ਸਰਵਿਸ ਟੀਅਰ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਪੱਧਰਾਂ ਦਾ ਪ੍ਰਤੀਨਿਧਿਤ ਕਰਦੇ ਹਨ। ਹਰ SKU ਵੱਖ-ਵੱਖ ਪੇਸ਼ਕਸ਼ ਕਰਦਾ ਹੈ:

- **ਪਰਫਾਰਮੈਂਸ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ** (CPU, ਮੈਮੋਰੀ, throughput)
- **ਫੀਚਰ ਉਪਲਬਧਤਾ** (ਸਕੇਲਿੰਗ ਵਿਕਲਪ, SLA ਸਤਰ)
- **ਕੀਮਤ ਮਾਡਲ** (ਖਪਤ-ਅਧਾਰਤ, ਰਿਜ਼ਰਵਡ ਕੈਪਾਸਿਟੀ)
- **ਖੇਤਰੀ ਉਪਲਬਧਤਾ** (ਸਾਰੇ SKUs ਸਾਰੇ ਖੇਤਰਾਂ ਵਿੱਚ ਉਪਲਬਧ ਨਹੀਂ ਹੁੰਦੇ)

### SKU ਚੋਣ ਵਿੱਚ ਮੁੱਖ ਤੱਤ

1. **ਵਰਕਲੋਡ ਲੋੜਾਂ**
   - ਉਮੀਦ ਕੀਤੀ ਟ੍ਰੈਫਿਕ/ਲੋਡ ਪੈਟਰਨ
   - ਪ੍ਰਦਰਸ਼ਨ ਲੋੜਾਂ (CPU, ਮੈਮੋਰੀ, I/O)
   - ਸਟੋਰੇਜ ਦੀਆਂ ਲੋੜਾਂ ਅਤੇ ਐਕਸੈਸ ਪੈਟਰਨ

2. **ਵਾਤਾਵਰਣ ਦੀ ਕਿਸਮ**
   - ਡਿਵੈਲਪਮੈਂਟ/ਟੈਸਟਿੰਗ ਵర్సਸ ਪ੍ਰੋਡਕਸ਼ਨ
   - ਉਪਲਬਧਤਾ ਦੀਆਂ ਲੋੜਾਂ
   - ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਦੀਆਂ ਲੋੜਾਂ

3. **ਬਜਟ ਸੀਮਾਵਾਂ**
   - ਸ਼ੁਰੂਆਤੀ ਲਗਤਾਂ ਵਿਰੁੱਧ ਚਲਾਊ ਲਾਗਤ
   - ਰਿਜ਼ਰਵਡ ਕੈਪਾਸਿਟੀ ਛੂਟ
   - ਆਟੋ-ਸਕੇਲਿੰਗ ਦੇ ਲਾਗਤ ਪ੍ਰਭਾਵ

4. **ਵਿਕਾਸ ਅਨੁਮਾਨ**
   - ਸਕੇਲਬਿਲਿਟੀ ਦੀਆਂ ਲੋੜਾਂ
   - ਭਵਿੱਖੀ ਫੀਚਰ ਲੋੜਾਂ
   - ਮਾਈਗ੍ਰੇਸ਼ਨ ਦੀ ਜਟਿਲਤਾ

---

## ਵਾਤਾਵਰਣ-ਆਧਾਰਤ ਚੋਣ

### ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ

**ਤਰਜੀحات**: ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ, ਬੁਨਿਆਦੀ ਕਾਰਗੁਜ਼ਾਰੀ, ਆਸਾਨ ਪ੍ਰੋਵਿਜ਼ਨ/ਡਿਪ੍ਰੋਵਿਜ਼ਨ

#### ਪ੍ਰਸਤਾਵਿਤ SKUs
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

#### ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ
- **App Service**: F1 (Free) ਜਾਂ B1 (Basic) ਸਾਦੇ ਟੈਸਟਿੰਗ ਲਈ
- **Databases**: ਘੱਟੋ-ਘੱਟ ਸਰੋਤਾਂ ਵਾਲਾ Basic ਟੀਅਰ
- **Storage**: ਸਿਰਫ਼ ਲੋਕਲ ਰਿਡੰਡੰਸੀ ਵਾਲਾ Standard
- **Compute**: ਸਾਂਝੇ ਸਰੋਤ ਠੀਕ ਹਨ
- **Networking**: ਬੁਨਿਆਦੀ ਕਨਫਿਗਰੇਸ਼ਨ

### Staging/Testing ਵਾਤਾਵਰਣ

**ਤਰਜੀحات**: ਪ੍ਰੋਡਕਸ਼ਨ-ਨੁਮਾ ਕਨਫਿਗਰੇਸ਼ਨ, ਲਾਗਤ ਸੰਤੁਲਨ, ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ ਸਮਰੱਥਾ

#### ਪ੍ਰਸਤਾਵਿਤ SKUs
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

#### ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ
- **ਪਰਫਾਰਮੈਂਸ**: ਪ੍ਰੋਡਕਸ਼ਨ ਸਮਰੱਥਾ ਦਾ 70-80%
- **ਫੀਚਰ**: ਜ਼ਿਆਦਾਤਰ ਪ੍ਰੋਡਕਸ਼ਨ ਫੀਚਰ ਚਾਲੂ
- **ਰਿਡੰਡੰਸੀ**: ਕੁਝ ਭੂਗੋਲਿਕ ਰਿਡੰਡੰਸੀ
- **ਸਕੇਲਿੰਗ**: ਟੈਸਟਿੰਗ ਲਈ ਸੀਮਤ ਆਟੋ-ਸਕੇਲਿੰਗ
- **ਮੋਨੀਟਰਨਿੰਗ**: ਪੂਰਾ ਮੋਨੀਟਰਨਿੰਗ ਸਟੈਕ

### ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣ

**ਤਰਜੀحات**: ਪ੍ਰਦਰਸ਼ਨ, ਉਪਲਬਧਤਾ, ਸੁਰੱਖਿਆ, ਅਨੁਕੂਲਤਾ, ਸਕੇਲਬਿਲਿਟੀ

#### ਪ੍ਰਸਤਾਵਿਤ SKUs
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

#### ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ
- **ਉੱਚ ਉਪਲਬਧਤਾ**: 99.9%+ SLA ਲੋੜਾਂ
- **ਪਰਫਾਰਮੈਂਸ**: ਨਿਰਪੈਕਤ ਸਰੋਤ, ਉੱਚ throughput
- **ਸੁਰੱਖਿਆ**: ਪ੍ਰੀਮੀਅਮ ਸੁਰੱਖਿਆ ਫੀਚਰ
- **ਸਕੇਲਿੰਗ**: ਪੂਰੇ ਆਟੋ-ਸਕੇਲਿੰਗ ਸਮਰੱਥਾ
- **ਮੋਨੀਟਰਨਿੰਗ**: ਵਿਆਪਕ ਵੇਖਣਯੋਗਤਾ

---

## ਸਰਵਿਸ-ਨਿਰਧਾਰਤ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼

### Azure App Service

#### SKU ਫੈਸਲਾ ਮੈਟ੍ਰਿਕਸ

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | ਲਾਗਤ-ਕੁਸ਼ਲ, ਟੈਸਟਿੰਗ ਲਈ ਪ੍ਰਯਾਪਤ |
| Small production apps | S1 (Standard) | ਕਸਟਮ ਡੋਮੇਨ, SSL, ਆਟੋ-ਸਕੇਲਿੰਗ |
| Medium production apps | P1V3 (Premium V3) | ਬਿਹਤਰ ਪ੍ਰਦਰਸ਼ਨ, ਵੱਧ ਫੀਚਰ |
| High-traffic apps | P2V3 or P3V3 | ਨਿਰਪੈਕਤ ਸਰੋਤ, ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| Mission-critical apps | I1V2 (Isolated V2) | ਨੈਟਵਰਕ ਆਈਸੋਲੇਸ਼ਨ, ਨਿਰਪੈਕਤ ਹਾਰਡਵੇਅਰ |

#### ਸੰਰਚਨਾ ਉਦਾਹਰਣ

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

#### SKU ਚੋਣ ਫਰੇਮਵਰਕ

1. **DTU-based (Database Transaction Units)**
   - **Basic**: 5 DTU - ਡਿਵੈਲਪਮੈਂਟ/ਟੈਸਟਿੰਗ
   - **Standard**: S0-S12 (10-3000 DTU) - ਜਨਰਲ ਪਰਪਜ਼
   - **Premium**: P1-P15 (125-4000 DTU) - ਪ੍ਰਦਰਸ਼ਨ-ਆਵਸ਼ਕ

2. **vCore-based** (ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਸਿਫਾਰਸ਼ੀ)
   - **General Purpose**: ਸੰਤੁਲਿਤ compute ਅਤੇ ਸਟੋਰੇਜ
   - **Business Critical**: ਘੱਟ ਲੇਟੈਂਸੀ, ਉੱਚ IOPS
   - **Hyperscale**: ਬਹੁਤ ਸਕੇਲੇਬਲ ਸਟੋਰੇਜ (ਇੱਕਠੇ 100TB ਤੱਕ)

#### ਉਦਾਹਰਣ ਸੰਰਚਨਾਵਾਂ

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

#### ਵਾਤਾਵਰਣ ਦੀਆਂ ਕਿਸਮਾਂ

1. **Consumption-based**
   - ਪ੍ਰਯੋਗ-ਅਨੁਸਾਰ ਭੁਗਤਾਨ
   - ਡਿਵੈਲਪਮੈਂਟ ਅਤੇ ਬਦਲਦੀਆਂ ਵਰਕਲੋਡ ਲਈ ਉਚਿਤ
   - ਸਾਂਝਾ ਇੰਫ਼ਰਾਸਟਰਕਚਰ

2. **Dedicated (Workload Profiles)**
   - ਨਿਰਪੈਕਤ compute ਸਰੋਤ
   - ਪੇਸ਼ਗੋਇ ਪ੍ਰਦਰਸ਼ਨ
   - ਪ੍ਰੋਡਕਸ਼ਨ ਵਰਕਲੋਡ ਲਈ ਵਧੀਆ

#### ਸੰਰਚਨਾ ਉਦਾਹਰਣ

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

#### Throughput ਮਾਡਲ

1. **Manual Provisioned Throughput**
   - ਪੇਸ਼ਗੋਇ ਪ੍ਰਦਰਸ਼ਨ
   - ਰਿਜ਼ਰਵਡ ਕੈਪਾਸਿਟੀ ਛੂਟ
   - ਸਮਤੋਲ ਵਰਕਲੋਡ ਲਈ ਵਧੀਆ

2. **Autoscale Provisioned Throughput**
   - ਵਰਤੋਂ ਦੇ ਅਧਾਰ 'ਤੇ ਆਟੋਮੈਟਿਕ ਸਕੇਲਿੰਗ
   - ਤੁਸੀਂ ਜੋ ਵਰਤੋਂ ਕਰੋ ਉਸ ਲਈ ਭੁਗਤਾਨ (ਨਿਊਨਤਮ ਨਾਲ)
   - ਬਦਲਦੀਆਂ ਵਰਕਲੋਡ ਲਈ ਚੰਗਾ

3. **Serverless**
   - ਰਿਕਵੇਸਟ-ਅਨੁਸਾਰ ਭੁਗਤਾਨ
   - ਕੋਈ ਪ੍ਰੋਵਿਜਨਡ throughput ਨਹੀਂ
   - ਡਿਵੈਲਪਮੈਂਟ ਅਤੇ ਅੰਤਰਕਾਲਿਕ ਵਰਕਲੋਡ ਲਈ ਆਇਡੀਅਲ

#### SKU ਉਦਾਹਰਣ

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

#### Storage Account ਕਿਸਮਾਂ

1. **Standard_LRS** - ਡਿਵੈਲਪਮੈਂਟ, ਗੈਰ-ਨਿਓੜਾਹਟ ਡਾਟਾ
2. **Standard_GRS** - ਪ੍ਰੋਡਕਸ਼ਨ, ਜਿਓ-ਰਿਡੰਡੰਸੀ ਦੀ ਲੋੜ
3. **Premium_LRS** - ਉੱਚ-ਪਰਫਾਰਮੈਂਸ ਐਪਲੀਕੇਸ਼ਨ
4. **Premium_ZRS** - ਜ਼ੋਨ ਰਿਡੰਡੰਸੀ ਨਾਲ ਉੱਚ ਉਪਲਬਧਤਾ

#### ਪਰਫਾਰਮੈਂਸ ਟੀਅਰ

- **Standard**: ਜਨਰਲ ਪਰਪਜ਼, ਲਾਗਤ-ਪ੍ਰਭਾਵੀ
- **Premium**: ਉੱਚ-ਪਰਫਾਰਮੈਂਸ, ਘੱਟ ਲੇਟੈਂਸੀ ਸਥਿਤੀਆਂ

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

## ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ

### 1. ਰਿਜ਼ਰਵਡ ਕੈਪਾਸਿਟੀ

1-3 ਸਾਲ ਲਈ ਸਰੋਤ ਰਿਜ਼ਰਵ ਕਰੋ ਤਾਂ ਜੋ ਮਹੱਤਵਪੂਰਨ ਛੂਟ ਮਿਲ ਸਕੇ:

```bash
# ਰਿਜ਼रਵੇਸ਼ਨ ਵਿਕਲਪ ਚੈੱਕ ਕਰੋ
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. ਸਹੀ-ਸਾਈਜ਼ਿੰਗ

ਛੋਟੇ SKUs ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਅਸਲ ਵਰਤੋਂ ਦੇ ਅਧਾਰ 'ਤੇ ਉੱਪਰ ਸਕੇਲ ਕਰੋ:

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

### 3. ਆਟੋ-ਸਕੇਲਿੰਗ ਕਨਫਿਗਰੇਸ਼ਨ

ਸਮਝਦਾਰ ਸਕੇਲਿੰਗ ਲਾਗਤਾਂ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰਨ ਲਈ ਲਾਗੂ ਕਰੋ:

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

### 4. ਨਿਰਧਾਰਿਤ ਸਮੇਂ 'ਤੇ ਸਕੇਲਿੰਗ

ਆਫ਼-ਓਰਸ ਦੌਰਾਨ ਸਕੇਲ ਡਾਊਨ ਕਰੋ:

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

## ਪ੍ਰਦਰਸ਼ਨ ਵਿਚਾਰ

### ਬੇਸਲਾਈਨ ਪ੍ਰਦਰਸ਼ਨ ਲੋੜਾਂ

SKU ਚੋਣ ਤੋਂ ਪਹਿਲਾਂ ਸਾਫ਼ ਪ੍ਰਦਰਸ਼ਨ ਲੋੜਾਂ ਨੂੰ ਪਰਿਭਾਸ਼ਿਤ ਕਰੋ:

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

### ਲੋਡ ਟੈਸਟਿੰਗ

ਵੱਖ-ਵੱਖ SKUs ਦੀ ਜਾਂਚ ਕਰਕੇ ਪ੍ਰਦਰਸ਼ਨ ਵੈਲਿਡੇਟ ਕਰੋ:

```bash
# ਐਜ਼ਿਊਰ ਲੋਡ ਟੈਸਟਿੰਗ ਸੇਵਾ
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### ਮੋਨੀਟਰਨਿੰਗ ਅਤੇ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

ਵਿਆਪਕ ਮੋਨੀਟਰਨਿੰਗ ਸੈੱਟਅੱਪ ਕਰੋ:

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

## ਤੇਜ਼ ਸੰਦਰਭ ਸਾਰਣੀਆਂ

### App Service SKU ਤੇਜ਼ ਸੰਦਰਭ

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | ਡਿਵੈਲਪਮੈਂਟ |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | ਛੋਟੀਆਂ ਐਪਸ |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | ਉਤਪਾਦਨ |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | ਕਾਰੋਬਾਰੀ/ਐੰਟਰਪ੍ਰਾਈਜ਼ |

### SQL Database SKU ਤੇਜ਼ ਸੰਦਰਭ

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | ਡਿਵੈਲਪਮੈਂਟ |
| S2 | Standard | 50 DTU | 250GB | $$ | ਛੋਟਾ ਉਤਪਾਦਨ |
| P2 | Premium | 250 DTU | 1TB | $$$ | ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | ਸੰਤੁਲਿਤ |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | ਮਿਸ਼ਨ-ਕ੍ਰਿਟੀਕਲ |

### Container Apps SKU ਤੇਜ਼ ਸੰਦਰਭ

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | ਡਿਵੈਲਪਮੈਂਟ, ਬਦਲਦੀਆਂ ਲੋਡ |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | ਪ੍ਰੋਡਕਸ਼ਨ |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |

---

## ਵੈਲਿਡੇਸ਼ਨ ਟੂਲ

### SKU ਉਪਲਬਧਤਾ ਚੈੱਕਰ

```bash
#!/bin/bash
# ਨਿਸ਼ਾਨਿਤ ਖੇਤਰ ਵਿੱਚ SKU ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ

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

# ਵਰਤੋਂ
check_sku_availability "eastus" "app-service" "P1V3"
```

### ਲਾਗਤ ਅਨੁਮਾਨ ਸਕ੍ਰਿਪਟ

```powershell
# ਲਾਗਤ ਅੰਦਾਜ਼ੇ ਲਈ PowerShell ਸਕ੍ਰਿਪਟ
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
        
        # Azure Pricing API ਜਾਂ ਕੈਲਕੁਲੇਟਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# ਵਰਤੋਂ
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### ਪ੍ਰਦਰਸ਼ਨ ਵੈਲਿਡੇਸ਼ਨ

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

## ਸਭ ਤੋਂ ਵਧੀਆ ਅਭਿਆਸ ਸੰਖੇਪ

### ਕਰਨ ਯੋਗ

1. **ਛੋਟੇ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਅਸਲ ਵਰਤੋਂ ਦੇ ਅਧਾਰ 'ਤੇ ਉੱਪਰ ਸਕੇਲ ਕਰੋ**
2. **ਵੱਖ-ਵੱਖ ਵਾਤਾਵਰਣਾਂ ਲਈ ਵੱਖ-ਵੱਖ SKUs ਦੀ ਵਰਤੋਂ ਕਰੋ**
3. **ਪਰਫਾਰਮੈਂਸ ਅਤੇ ਲਾਗਤ ਦੀ ਲਗਾਤਾਰ ਨਿਗਰਾਨੀ ਕਰੋ**
4. **ਪ੍ਰੋਡਕਸ਼ਨ ਵਰਕਲੋਡ ਲਈ ਰਿਜ਼ਰਵਡ ਕੈਪਾਸਿਟੀ ਦਾ ਫ਼ਾਇਦਾ ਲਓ**
5. **ਜਿੱਥੇ ਢੁਕਵਾਂ ਹੋਵੇ ਆਟੋ-ਸਕੇਲਿੰਗ ਲਾਗੂ ਕਰੋ**
6. **ਹਕੀਕਤੀ ਵਰਕਲੋਡ ਨਾਲ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ**
7. **ਵਿਕਾਸ ਦੀ ਯੋਜਨਾ ਬਣਾਓ ਪਰ ਜ਼ਰੂਰਤ ਤੋਂ ਵੱਧ ਪ੍ਰੋਵਿਜ਼ਨ ਨਾ ਕਰੋ**
8. **ਸੰਭਵ ਹੋਵੇ ਤਾਂ ਡਿਵੈਲਪਮੈਂਟ ਲਈ ਮੁਫ਼ਤ ਟੀਅਰ ਵਰਤੋਂ**

### ਨਾ ਕਰੋ

1. **ਡਿਵੈਲਪਮੈਂਟ ਲਈ ਪ੍ਰੋਡਕਸ਼ਨ SKUs ਨਾ ਵਰਤੋ**
2. **ਖੇਤਰੀ SKU ਉਪਲਬਧਤਾ ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਨਾ ਕਰੋ**
3. **ਡਾਟਾ ਟ੍ਰਾਂਸਫਰ ਲਾਗਤਾਂ ਨੂੰ ਨਾ ਭੁੱਲੋ**
4. **ਬਿਨਾਂ ਜਾਇਜ਼ੇ ਦੇ ਨ੍ਹੱਡੇ ਪ੍ਰੋਵਿਜ਼ਨ ਨਾ ਕਰੋ**
5. **ਡਿਪੈਂਡੇਨਸੀਜ਼ ਦੇ ਪ੍ਰਭਾਵ ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਨਾ ਕਰੋ**
6. **ਆਟੋ-ਸਕੇਲਿੰਗ ਲਿਮਿਟਾਂ ਬਹੁਤ ਉੱਚ ਨਾ ਰੱਖੋ**
7. **ਅਨੁਕੂਲਤਾ ਲੋੜਾਂ ਨੂੰ ਨਾ ਭੁੱਲੋ**
8. **ਫ਼ਕਤ ਕੀਮਤ ਦੇ ਆਧਾਰ 'ਤੇ ਫੈਸਲੇ ਨਾ ਕਰੋ**

---

**Pro Tip**: Azure Cost Management ਅਤੇ Advisor ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਪਣੀ ਵਰਤੋਂ ਦੇ ਪੈਟਰਨ ਦੇ ਆਧਾਰ 'ਤੇ ਆਪਣੇ SKU ਚੋਣਾਂ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰਨ ਲਈ ਵਿਅਕਤੀਗਤ ਸਿਫਾਰਸ਼ੀਆਂ ਪ੍ਰਾਪਤ ਕਰੋ।

---

**Navigation**
- **Previous Lesson**: [Capacity Planning](capacity-planning.md)
- **Next Lesson**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਡਿਸਕਲੇਮਰ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ (ਆਟੋਮੇਟਿਕ) ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਦੀ ਉਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਾਲੀ ਪ੍ਰਤਿ ਹੀ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨੀ ਜਾਣੀ ਚਾਹੀਦੀ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਭ੍ਰਮਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
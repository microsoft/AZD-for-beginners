<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T19:51:44+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "pa"
}
-->
# SKU ਚੋਣ ਗਾਈਡ - ਸਹੀ Azure ਸੇਵਾ ਟੀਅਰ ਚੁਣਨਾ

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ ਵੱਖ-ਵੱਖ ਮਾਹੌਲਾਂ, ਵਰਕਲੋਡਾਂ ਅਤੇ ਜ਼ਰੂਰਤਾਂ ਲਈ ਉਤਮ Azure ਸੇਵਾ SKUs (ਸਟਾਕ ਕੀਪਿੰਗ ਯੂਨਿਟਸ) ਚੁਣਨ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ, ਲਾਗਤ ਦੇ ਵਿਚਾਰਾਂ ਅਤੇ ਸਕੇਲਬਿਲਟੀ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਨਾ ਸਿੱਖੋ ਤਾਂ ਜੋ ਆਪਣੇ Azure Developer CLI ਡਿਪਲੌਇਮੈਂਟਸ ਲਈ ਸਭ ਤੋਂ ਉਚਿਤ ਸੇਵਾ ਟੀਅਰ ਚੁਣ ਸਕੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੁਆਰਾ, ਤੁਸੀਂ:
- Azure SKU ਸੰਕਲਪਾਂ, ਕੀਮਤ ਮਾਡਲਾਂ ਅਤੇ ਫੀਚਰਾਂ ਦੇ ਅੰਤਰ ਨੂੰ ਸਮਝ ਸਕੋਗੇ
- ਵਿਕਾਸ, ਸਟੇਜਿੰਗ ਅਤੇ ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਮਾਹੌਲ-ਵਿਸ਼ੇਸ਼ SKU ਚੋਣ ਰਣਨੀਤੀਆਂ ਵਿੱਚ ਮਾਹਰ ਹੋਵੋਗੇ
- ਵਰਕਲੋਡ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਕੇ ਉਚਿਤ ਸੇਵਾ ਟੀਅਰਾਂ ਨਾਲ ਮੇਲ ਕਰ ਸਕੋਗੇ
- ਸਮਰੱਥ SKU ਚੋਣ ਦੁਆਰਾ ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- SKU ਚੋਣਾਂ ਲਈ ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ ਅਤੇ ਵੈਧਤਾ ਤਕਨੀਕਾਂ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- SKU ਦੀਆਂ ਸਿਫਾਰਸ਼ਾਂ ਅਤੇ ਨਿਗਰਾਨੀ ਲਈ ਆਟੋਮੇਟਿਕ ਸੰਰਚਨਾਵਾਂ ਸੰਰਚਿਤ ਕਰ ਸਕੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਉੱਤੇ, ਤੁਸੀਂ:
- ਵਰਕਲੋਡ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਅਤੇ ਪਾਬੰਦੀਆਂ ਦੇ ਅਧਾਰ 'ਤੇ ਉਚਿਤ Azure ਸੇਵਾ SKUs ਚੁਣ ਸਕੋਗੇ
- ਸਹੀ ਟੀਅਰ ਚੋਣ ਨਾਲ ਲਾਗਤ-ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਬਹੁ-ਮਾਹੌਲ ਆਰਕੀਟੈਕਚਰ ਡਿਜ਼ਾਈਨ ਕਰ ਸਕੋਗੇ
- SKU ਚੋਣਾਂ ਲਈ ਪ੍ਰਦਰਸ਼ਨ ਬੈਂਚਮਾਰਕਿੰਗ ਅਤੇ ਵੈਧਤਾ ਲਾਗੂ ਕਰ ਸਕੋਗੇ
- SKU ਸਿਫਾਰਸ਼ਾਂ ਅਤੇ ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ ਲਈ ਆਟੋਮੇਟਿਕ ਟੂਲ ਬਣਾਉਣ ਵਿੱਚ ਸਮਰੱਥ ਹੋਵੋਗੇ
- ਬਦਲ ਰਹੀਆਂ ਜ਼ਰੂਰਤਾਂ ਲਈ SKU ਮਾਈਗ੍ਰੇਸ਼ਨ ਅਤੇ ਸਕੇਲਿੰਗ ਰਣਨੀਤੀਆਂ ਦੀ ਯੋਜਨਾ ਬਣਾਉਣ ਵਿੱਚ ਮਾਹਰ ਹੋਵੋਗੇ
- Azure Well-Architected Framework ਦੇ ਸਿਧਾਂਤਾਂ ਨੂੰ ਸੇਵਾ ਟੀਅਰ ਚੋਣ 'ਤੇ ਲਾਗੂ ਕਰ ਸਕੋਗੇ

## ਸੂਚੀ

- [SKUs ਨੂੰ ਸਮਝਣਾ](../../../../docs/pre-deployment)
- [ਮਾਹੌਲ-ਅਧਾਰਿਤ ਚੋਣ](../../../../docs/pre-deployment)
- [ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼](../../../../docs/pre-deployment)
- [ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ](../../../../docs/pre-deployment)
- [ਪ੍ਰਦਰਸ਼ਨ ਦੇ ਵਿਚਾਰ](../../../../docs/pre-deployment)
- [ਤੁਰੰਤ ਸੰਦਰਭ ਟੇਬਲਾਂ](../../../../docs/pre-deployment)
- [ਵੈਧਤਾ ਟੂਲ](../../../../docs/pre-deployment)

---

## SKUs ਨੂੰ ਸਮਝਣਾ

### SKUs ਕੀ ਹਨ?

SKUs (ਸਟਾਕ ਕੀਪਿੰਗ ਯੂਨਿਟਸ) Azure ਸਰੋਤਾਂ ਲਈ ਵੱਖ-ਵੱਖ ਸੇਵਾ ਟੀਅਰਾਂ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਪੱਧਰਾਂ ਨੂੰ ਦਰਸਾਉਂਦੇ ਹਨ। ਹਰ SKU ਵੱਖ-ਵੱਖ ਪੇਸ਼ਕਸ਼ ਕਰਦਾ ਹੈ:

- **ਪ੍ਰਦਰਸ਼ਨ ਲੱਛਣ** (CPU, ਮੈਮੋਰੀ, throughput)
- **ਫੀਚਰ ਉਪਲਬਧਤਾ** (scaling options, SLA ਪੱਧਰ)
- **ਕੀਮਤ ਮਾਡਲ** (ਖਪਤ-ਅਧਾਰਿਤ, ਰਿਜ਼ਰਵਡ ਸਮਰੱਥਾ)
- **ਖੇਤਰੀ ਉਪਲਬਧਤਾ** (ਸਾਰੇ SKUs ਸਾਰੇ ਖੇਤਰਾਂ ਵਿੱਚ ਉਪਲਬਧ ਨਹੀਂ ਹਨ)

### SKU ਚੋਣ ਵਿੱਚ ਮੁੱਖ ਕਾਰਕ

1. **ਵਰਕਲੋਡ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ**
   - ਉਮੀਦਵਾਰ ਟ੍ਰੈਫਿਕ/ਲੋਡ ਪੈਟਰਨ
   - ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ (CPU, ਮੈਮੋਰੀ, I/O)
   - ਸਟੋਰੇਜ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਅਤੇ ਪਹੁੰਚ ਪੈਟਰਨ

2. **ਮਾਹੌਲ ਦੀ ਕਿਸਮ**
   - ਵਿਕਾਸ/ਟੈਸਟਿੰਗ ਵਿਰੁੱਧ ਪ੍ਰੋਡਕਸ਼ਨ
   - ਉਪਲਬਧਤਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ
   - ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ

3. **ਬਜਟ ਪਾਬੰਦੀਆਂ**
   - ਸ਼ੁਰੂਆਤੀ ਲਾਗਤਾਂ ਵਿਰੁੱਧ ਚਾਲੂ ਲਾਗਤਾਂ
   - ਰਿਜ਼ਰਵਡ ਸਮਰੱਥਾ ਛੂਟ
   - ਆਟੋ-ਸਕੇਲਿੰਗ ਲਾਗਤ ਦੇ ਪ੍ਰਭਾਵ

4. **ਵਿਕਾਸ ਦੀਆਂ ਅਨੁਮਾਨਾਂ**
   - ਸਕੇਲਬਿਲਟੀ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ
   - ਭਵਿੱਖ ਦੇ ਫੀਚਰ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ
   - ਮਾਈਗ੍ਰੇਸ਼ਨ ਦੀ ਜਟਿਲਤਾ

---

## ਮਾਹੌਲ-ਅਧਾਰਿਤ ਚੋਣ

### ਵਿਕਾਸ ਮਾਹੌਲ

**ਪ੍ਰਾਥਮਿਕਤਾਵਾਂ**: ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ, ਬੁਨਿਆਦੀ ਕਾਰਗੁਜ਼ਾਰੀ, ਆਸਾਨ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ/ਡੀ-ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ

#### ਸਿਫਾਰਸ਼ੀ SKUs
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

#### ਲੱਛਣ
- **ਐਪ ਸੇਵਾ**: F1 (ਮੁਫ਼ਤ) ਜਾਂ B1 (ਬੁਨਿਆਦੀ) ਸਧਾਰਨ ਟੈਸਟਿੰਗ ਲਈ
- **ਡਾਟਾਬੇਸ**: ਘੱਟ ਸਰੋਤਾਂ ਵਾਲਾ ਬੁਨਿਆਦੀ ਟੀਅਰ
- **ਸਟੋਰੇਜ**: ਸਿਰਫ਼ ਸਥਾਨਕ redundancy ਨਾਲ ਮਿਆਰੀ
- **ਕੰਪਿਊਟ**: ਸਾਂਝੇ ਸਰੋਤ ਸਵੀਕਾਰਯੋਗ
- **ਨੈਟਵਰਕਿੰਗ**: ਬੁਨਿਆਦੀ ਸੰਰਚਨਾਵਾਂ

### ਸਟੇਜਿੰਗ/ਟੈਸਟਿੰਗ ਮਾਹੌਲ

**ਪ੍ਰਾਥਮਿਕਤਾਵਾਂ**: ਪ੍ਰੋਡਕਸ਼ਨ-ਜਿਵੇਂ ਸੰਰਚਨਾ, ਲਾਗਤ ਸੰਤੁਲਨ, ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ ਸਮਰੱਥਾ

#### ਸਿਫਾਰਸ਼ੀ SKUs
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

#### ਲੱਛਣ
- **ਪ੍ਰਦਰਸ਼ਨ**: ਪ੍ਰੋਡਕਸ਼ਨ ਸਮਰੱਥਾ ਦਾ 70-80%
- **ਫੀਚਰ**: ਜ਼ਿਆਦਾਤਰ ਪ੍ਰੋਡਕਸ਼ਨ ਫੀਚਰ ਚਾਲੂ
- **Redundancy**: ਕੁਝ ਖੇਤਰੀ redundancy
- **ਸਕੇਲਿੰਗ**: ਟੈਸਟਿੰਗ ਲਈ ਸੀਮਿਤ ਆਟੋ-ਸਕੇਲਿੰਗ
- **ਨਿਗਰਾਨੀ**: ਪੂਰੀ ਨਿਗਰਾਨੀ ਸਟੈਕ

### ਪ੍ਰੋਡਕਸ਼ਨ ਮਾਹੌਲ

**ਪ੍ਰਾਥਮਿਕਤਾਵਾਂ**: ਪ੍ਰਦਰਸ਼ਨ, ਉਪਲਬਧਤਾ, ਸੁਰੱਖਿਆ, ਅਨੁਕੂਲਤਾ, ਸਕੇਲਬਿਲਟੀ

#### ਸਿਫਾਰਸ਼ੀ SKUs
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

#### ਲੱਛਣ
- **ਉੱਚ ਉਪਲਬਧਤਾ**: 99.9%+ SLA ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ
- **ਪ੍ਰਦਰਸ਼ਨ**: ਸਮਰਪਿਤ ਸਰੋਤ, ਉੱਚ throughput
- **ਸੁਰੱਖਿਆ**: ਪ੍ਰੀਮੀਅਮ ਸੁਰੱਖਿਆ ਫੀਚਰ
- **ਸਕੇਲਿੰਗ**: ਪੂਰੀ ਆਟੋ-ਸਕੇਲਿੰਗ ਸਮਰੱਥਾ
- **ਨਿਗਰਾਨੀ**: ਵਿਸਤ੍ਰਿਤ ਦ੍ਰਿਸ਼ਟੀ

---

## ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼

### Azure ਐਪ ਸੇਵਾ

#### SKU ਫੈਸਲਾ ਮੈਟ੍ਰਿਕਸ

| ਵਰਤੋਂ ਦਾ ਕੇਸ | ਸਿਫਾਰਸ਼ੀ SKU | ਕਾਰਨ |
|--------------|-------------|-------|
| ਵਿਕਾਸ/ਟੈਸਟਿੰਗ | F1 (ਮੁਫ਼ਤ) ਜਾਂ B1 (ਬੁਨਿਆਦੀ) | ਲਾਗਤ-ਪ੍ਰਭਾਵਸ਼ਾਲੀ, ਟੈਸਟਿੰਗ ਲਈ ਕਾਫ਼ੀ |
| ਛੋਟੇ ਪ੍ਰੋਡਕਸ਼ਨ ਐਪ | S1 (ਮਿਆਰੀ) | ਕਸਟਮ ਡੋਮੇਨ, SSL, ਆਟੋ-ਸਕੇਲਿੰਗ |
| ਮੱਧਮ ਪ੍ਰੋਡਕਸ਼ਨ ਐਪ | P1V3 (ਪ੍ਰੀਮੀਅਮ V3) | ਵਧੀਆ ਪ੍ਰਦਰਸ਼ਨ, ਵਧੇਰੇ ਫੀਚਰ |
| ਉੱਚ-ਟ੍ਰੈਫਿਕ ਐਪ | P2V3 ਜਾਂ P3V3 | ਸਮਰਪਿਤ ਸਰੋਤ, ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| ਮਿਸ਼ਨ-ਕ੍ਰਿਟਿਕਲ ਐਪ | I1V2 (Isolated V2) | ਨੈਟਵਰਕ isolation, ਸਮਰਪਿਤ ਹਾਰਡਵੇਅਰ |

#### ਸੰਰਚਨਾ ਉਦਾਹਰਨ

**ਵਿਕਾਸ**
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

**ਪ੍ਰੋਡਕਸ਼ਨ**
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

### Azure SQL ਡਾਟਾਬੇਸ

#### SKU ਚੋਣ ਫਰੇਮਵਰਕ

1. **DTU-ਅਧਾਰਿਤ (ਡਾਟਾਬੇਸ ਟ੍ਰਾਂਜ਼ੈਕਸ਼ਨ ਯੂਨਿਟਸ)**
   - **ਬੁਨਿਆਦੀ**: 5 DTU - ਵਿਕਾਸ/ਟੈਸਟਿੰਗ
   - **ਮਿਆਰੀ**: S0-S12 (10-3000 DTU) - ਜਨਰਲ ਪਰਪਜ਼
   - **ਪ੍ਰੀਮੀਅਮ**: P1-P15 (125-4000 DTU) - ਪ੍ਰਦਰਸ਼ਨ-ਕ੍ਰਿਟਿਕਲ

2. **vCore-ਅਧਾਰਿਤ** (ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਸਿਫਾਰਸ਼ੀ)
   - **ਜਨਰਲ ਪਰਪਜ਼**: ਸੰਤੁਲਿਤ ਕੰਪਿਊਟ ਅਤੇ ਸਟੋਰੇਜ
   - **ਬਿਜ਼ਨਸ ਕ੍ਰਿਟਿਕਲ**: ਘੱਟ latency, ਉੱਚ IOPS
   - **Hyperscale**: ਬਹੁਤ ਵਧੇਰੇ ਸਕੇਲਬਲ ਸਟੋਰੇਜ (100TB ਤੱਕ)

#### ਉਦਾਹਰਨ ਸੰਰਚਨਾਵਾਂ

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

### Azure ਕੰਟੇਨਰ ਐਪਸ

#### ਮਾਹੌਲ ਦੀਆਂ ਕਿਸਮਾਂ

1. **ਖਪਤ-ਅਧਾਰਿਤ**
   - ਵਰਤੋਂ-ਅਨੁਸਾਰ ਕੀਮਤ
   - ਵਿਕਾਸ ਅਤੇ ਬਦਲਦੇ ਵਰਕਲੋਡ ਲਈ ਉਚਿਤ
   - ਸਾਂਝੇ infrastructure

2. **ਸਮਰਪਿਤ (ਵਰਕਲੋਡ ਪ੍ਰੋਫਾਈਲ)**
   - ਸਮਰਪਿਤ ਕੰਪਿਊਟ ਸਰੋਤ
   - ਪੇਸ਼ਕਸ਼ਯੋਗ ਪ੍ਰਦਰਸ਼ਨ
   - ਪ੍ਰੋਡਕਸ਼ਨ ਵਰਕਲੋਡ ਲਈ ਵਧੀਆ

#### ਸੰਰਚਨਾ ਉਦਾਹਰਨ

**ਵਿਕਾਸ (ਖਪਤ)**
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

**ਪ੍ਰੋਡਕਸ਼ਨ (ਸਮਰਪਿਤ)**
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

1. **ਮੈਨੂਅਲ Provisioned Throughput**
   - ਪੇਸ਼ਕਸ਼ਯੋਗ ਪ੍ਰਦਰਸ਼ਨ
   - ਰਿਜ਼ਰਵਡ ਸਮਰੱਥਾ ਛੂਟ
   - ਸਥਿਰ ਵਰਕਲੋਡ ਲਈ ਵਧੀਆ

2. **Autoscale Provisioned Throughput**
   - ਵਰਤੋਂ ਦੇ ਅਧਾਰ 'ਤੇ ਆਟੋਮੈਟਿਕ ਸਕੇਲਿੰਗ
   - ਜੋ ਵਰਤੋਂ ਕਰੋ ਉਸ ਲਈ ਭੁਗਤਾਨ ਕਰੋ (ਘੱਟੋ-ਘੱਟ ਨਾਲ)
   - ਬਦਲਦੇ ਵਰਕਲੋਡ ਲਈ ਚੰਗਾ

3. **Serverless**
   - ਪ੍ਰਤੀ-ਅਨੁਰੋਧ ਭੁਗਤਾਨ
   - ਕੋਈ provisioned throughput ਨਹੀਂ
   - ਵਿਕਾਸ ਅਤੇ ਅਨਿਯਮਿਤ ਵਰਕਲੋਡ ਲਈ ਉਚਿਤ

#### SKU ਉਦਾਹਰਨ

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

### Azure ਸਟੋਰੇਜ ਅਕਾਊਂਟ

#### ਸਟੋਰੇਜ ਅਕਾਊਂਟ ਦੀਆਂ ਕਿਸਮਾਂ

1. **Standard_LRS** - ਵਿਕਾਸ, ਗੈਰ-ਕ੍ਰਿਟਿਕਲ ਡਾਟਾ
2. **Standard_GRS** - ਪ੍ਰੋਡਕਸ਼ਨ, geo-redundancy ਦੀ ਜ਼ਰੂਰਤ
3. **Premium_LRS** - ਉੱਚ-ਪ੍ਰਦਰਸ਼ਨ ਐਪਲੀਕੇਸ਼ਨ
4. **Premium_ZRS** - ਉੱਚ ਉਪਲਬਧਤਾ ਜ਼ੋਨ redundancy ਨਾਲ

#### ਪ੍ਰਦਰਸ਼ਨ ਟੀਅਰ

- **Standard**: ਜਨਰਲ ਪਰਪਜ਼, ਲਾਗਤ-ਪ੍ਰਭਾਵਸ਼ਾਲੀ
- **Premium**: ਉੱਚ-ਪ੍ਰਦਰਸ਼ਨ, ਘੱਟ latency ਸਥਿਤੀਆਂ

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

## ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ

### 1. ਰਿਜ਼ਰਵਡ ਸਮਰੱਥਾ

1-3 ਸਾਲਾਂ ਲਈ ਸਰੋਤ ਰਿਜ਼ਰਵ ਕਰੋ ਅਤੇ ਮਹੱਤਵਪੂਰਨ ਛੂਟ ਪ੍ਰਾਪਤ ਕਰੋ:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. ਸਹੀ-ਸਾਈਜ਼ਿੰਗ

ਛੋਟੇ SKUs ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਅਸਲ ਵਰਤੋਂ ਦੇ ਅਧਾਰ 'ਤੇ ਵਧਾਓ:

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

### 3. ਆਟੋ-ਸਕੇਲਿੰਗ ਸੰਰਚਨਾ

ਸਮਰੱਥ ਸਕੇਲਿੰਗ ਲਾਗਤ ਨੂੰ ਅਪਟਿਮਾਈਜ਼ ਕਰਨ ਲਈ ਲਾਗੂ ਕਰੋ:

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

### 4. ਸ਼ਡਿਊਲਡ ਸਕੇਲਿੰਗ

ਆਫ-ਆਵਰਾਂ ਦੌਰਾਨ ਸਕੇਲਿੰਗ ਘਟਾਓ:

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

## ਪ੍ਰਦਰਸ਼ਨ ਦੇ ਵਿਚਾਰ

### ਬੇਸਲਾਈਨ ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ

SKU ਚੋਣ ਤੋਂ ਪਹਿਲਾਂ ਸਪਸ਼ਟ ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਨੂੰ ਪਰਿਭਾਸ਼ਿਤ ਕਰੋ:

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

ਵੱਖ-ਵੱਖ SKUs ਦਾ ਟੈਸਟ ਕਰੋ ਤਾਂ ਜੋ ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਵੈਧਤਾ ਹੋ ਸਕੇ:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### ਨਿਗਰਾਨੀ ਅਤੇ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ

ਵਿਸਤ੍ਰਿਤ ਨਿਗਰਾਨੀ ਸੈਟਅਪ ਕਰੋ:

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

## ਤੁਰੰਤ ਸੰਦਰਭ ਟੇਬਲਾਂ

### ਐਪ ਸੇਵਾ SKU ਤੁਰੰਤ ਸੰਦਰਭ

| SKU | ਟੀਅਰ | vCPU | RAM | ਸਟੋਰੇਜ | ਕੀਮਤ ਰੇਂਜ | ਵਰਤੋਂ ਦਾ ਕੇਸ |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ਮੁਫ਼ਤ | ਸਾਂਝਾ | 1GB | 1GB | ਮੁਫ਼ਤ | ਵਿਕਾਸ |
| B1 | ਬੁਨਿਆਦੀ | 1 | 1.75GB | 10GB | $ | ਛੋਟੇ ਐਪ |
| S1 | ਮਿਆਰੀ | 1 | 1.75GB | 50GB | $$ | ਪ੍ਰੋਡਕਸ਼ਨ |
| P1V3 | ਪ੍ਰੀਮੀਅਮ V3 | 2 | 8GB | 250GB | $$$ | ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | ਐਂਟਰਪ੍ਰਾਈਜ਼ |

### SQL ਡਾਟਾਬੇਸ SKU ਤੁਰੰਤ ਸੰਦਰਭ

| SKU | ਟੀਅਰ | DTU/vCore | ਸਟੋਰੇਜ | ਕੀਮਤ ਰੇਂਜ | ਵਰਤੋਂ ਦਾ ਕੇਸ |
|-----|------|-----------|---------|-------------|----------|
| ਬੁਨਿਆਦੀ | ਬੁਨਿਆਦੀ | 5 DTU | 2GB | $ | ਵਿਕਾਸ |
| S2 | ਮਿਆਰੀ | 50 DTU | 250GB | $$ | ਛੋਟਾ ਪ੍ਰੋਡਕਸ਼ਨ |
| P2 | ਪ੍ਰੀਮੀਅਮ | 250 DTU | 1TB | $$$ | ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| GP_Gen5_4 | ਜਨਰਲ ਪਰਪਜ਼ | 4 vCore | 4TB | $$$ | ਸੰਤੁਲਿਤ |
| BC_Gen5_8 | ਬਿਜ਼ਨਸ ਕ੍ਰਿਟਿਕਲ | 8 vCore | 4TB | $$$$ | ਮਿਸ਼ਨ ਕ੍ਰਿਟਿਕਲ |

### ਕੰਟੇਨਰ ਐਪਸ SKU ਤੁਰੰਤ ਸੰਦਰਭ

| ਮਾਡਲ | ਕੀਮਤ | CPU/ਮੈਮੋਰੀ | ਵਰਤੋਂ ਦਾ ਕੇਸ |
|-------|---------|------------

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਨਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
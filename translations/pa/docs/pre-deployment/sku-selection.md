<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "952ed5af7f5db069c53a6840717e1801",
  "translation_date": "2025-09-17T21:06:43+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "pa"
}
-->
# SKU ਚੋਣ ਗਾਈਡ - ਸਹੀ Azure ਸੇਵਾ ਟੀਅਰ ਚੁਣਨਾ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 6 - ਪੂਰਵ-ਤਿਆਰੀ ਵੈਧਤਾ ਅਤੇ ਯੋਜਨਾ
- **⬅️ ਪਿਛਲਾ**: [ਸਮਰੱਥਾ ਯੋਜਨਾ](capacity-planning.md)
- **➡️ ਅਗਲਾ**: [ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕ](preflight-checks.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 7: ਟਰਬਲਸ਼ੂਟਿੰਗ](../troubleshooting/common-issues.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ ਵੱਖ-ਵੱਖ ਵਾਤਾਵਰਣਾਂ, ਵਰਕਲੋਡਾਂ ਅਤੇ ਜ਼ਰੂਰਤਾਂ ਲਈ ਉਤਮ Azure ਸੇਵਾ SKUs (ਸਟਾਕ ਕੀਪਿੰਗ ਯੂਨਿਟਸ) ਚੁਣਨ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ, ਲਾਗਤ ਦੇ ਵਿਚਾਰ ਅਤੇ ਸਕੇਲਬਿਲਟੀ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਨਾ ਸਿੱਖੋ ਤਾਂ ਜੋ ਆਪਣੇ Azure Developer CLI ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਸਭ ਤੋਂ ਉਚਿਤ ਸੇਵਾ ਟੀਅਰ ਚੁਣ ਸਕੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਦੁਆਰਾ, ਤੁਸੀਂ:
- Azure SKU ਸੰਕਲਪਾਂ, ਕੀਮਤ ਮਾਡਲਾਂ ਅਤੇ ਫੀਚਰਾਂ ਦੇ ਅੰਤਰ ਨੂੰ ਸਮਝ ਸਕਦੇ ਹੋ
- ਵਿਕਾਸ, ਸਟੇਜਿੰਗ ਅਤੇ ਉਤਪਾਦਨ ਲਈ ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ SKU ਚੋਣ ਰਣਨੀਤੀਆਂ ਵਿੱਚ ਮਾਹਰ ਹੋ ਸਕਦੇ ਹੋ
- ਵਰਕਲੋਡ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਕੇ ਉਚਿਤ ਸੇਵਾ ਟੀਅਰਾਂ ਨਾਲ ਮੇਲ ਕਰ ਸਕਦੇ ਹੋ
- ਸਮਰੱਥ SKU ਚੋਣ ਦੁਆਰਾ ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰ ਸਕਦੇ ਹੋ
- SKU ਚੋਣਾਂ ਲਈ ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ ਅਤੇ ਵੈਧਤਾ ਤਕਨੀਕਾਂ ਲਾਗੂ ਕਰ ਸਕਦੇ ਹੋ
- SKU ਦੀਆਂ ਸਿਫਾਰਸ਼ਾਂ ਅਤੇ ਨਿਗਰਾਨੀ ਲਈ ਆਟੋਮੈਟਿਕ ਸੰਰਚਨਾਵਾਂ ਸੰਰਚਿਤ ਕਰ ਸਕਦੇ ਹੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ:
- ਵਰਕਲੋਡ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਅਤੇ ਪਾਬੰਦੀਆਂ ਦੇ ਅਧਾਰ 'ਤੇ ਉਚਿਤ Azure ਸੇਵਾ SKUs ਚੁਣ ਸਕਦੇ ਹੋ
- ਸਹੀ ਟੀਅਰ ਚੋਣ ਨਾਲ ਲਾਗਤ-ਅਨੁਕੂਲ ਬਹੁ-ਵਾਤਾਵਰਣ ਆਰਕੀਟੈਕਚਰਾਂ ਡਿਜ਼ਾਈਨ ਕਰ ਸਕਦੇ ਹੋ
- SKU ਚੋਣਾਂ ਲਈ ਪ੍ਰਦਰਸ਼ਨ ਬੈਂਚਮਾਰਕਿੰਗ ਅਤੇ ਵੈਧਤਾ ਲਾਗੂ ਕਰ ਸਕਦੇ ਹੋ
- SKU ਦੀ ਸਿਫਾਰਸ਼ ਅਤੇ ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਲਈ ਆਟੋਮੈਟਿਕ ਟੂਲ ਬਣਾਉਣ
- ਬਦਲ ਰਹੀਆਂ ਜ਼ਰੂਰਤਾਂ ਲਈ SKU ਮਾਈਗ੍ਰੇਸ਼ਨ ਅਤੇ ਸਕੇਲਿੰਗ ਰਣਨੀਤੀਆਂ ਦੀ ਯੋਜਨਾ ਬਣਾਉਣ
- Azure Well-Architected Framework ਦੇ ਸਿਧਾਂਤਾਂ ਨੂੰ ਸੇਵਾ ਟੀਅਰ ਚੋਣ 'ਤੇ ਲਾਗੂ ਕਰ ਸਕਦੇ ਹੋ

## ਸੂਚੀ

- [SKUs ਨੂੰ ਸਮਝਣਾ](../../../../docs/pre-deployment)
- [ਵਾਤਾਵਰਣ-ਅਧਾਰਿਤ ਚੋਣ](../../../../docs/pre-deployment)
- [ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼](../../../../docs/pre-deployment)
- [ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਰਣਨੀਤੀਆਂ](../../../../docs/pre-deployment)
- [ਪ੍ਰਦਰਸ਼ਨ ਦੇ ਵਿਚਾਰ](../../../../docs/pre-deployment)
- [ਤੁਰੰਤ ਸੰਦਰਭ ਟੇਬਲ](../../../../docs/pre-deployment)
- [ਵੈਧਤਾ ਟੂਲ](../../../../docs/pre-deployment)

---

## SKUs ਨੂੰ ਸਮਝਣਾ

### SKUs ਕੀ ਹਨ?

SKUs (ਸਟਾਕ ਕੀਪਿੰਗ ਯੂਨਿਟਸ) Azure ਸਰੋਤਾਂ ਲਈ ਵੱਖ-ਵੱਖ ਸੇਵਾ ਟੀਅਰ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਪੱਧਰਾਂ ਨੂੰ ਦਰਸਾਉਂਦੇ ਹਨ। ਹਰ SKU ਵੱਖ-ਵੱਖ ਪੇਸ਼ ਕਰਦਾ ਹੈ:

- **ਪ੍ਰਦਰਸ਼ਨ ਲੱਛਣ** (CPU, ਮੈਮੋਰੀ, throughput)
- **ਫੀਚਰ ਉਪਲਬਧਤਾ** (scaling options, SLA ਪੱਧਰ)
- **ਕੀਮਤ ਮਾਡਲ** (ਖਪਤ-ਅਧਾਰਿਤ, ਰਿਜ਼ਰਵਡ ਸਮਰੱਥਾ)
- **ਖੇਤਰੀ ਉਪਲਬਧਤਾ** (ਸਾਰੇ SKUs ਸਾਰੇ ਖੇਤਰਾਂ ਵਿੱਚ ਉਪਲਬਧ ਨਹੀਂ ਹਨ)

### SKU ਚੋਣ ਵਿੱਚ ਮੁੱਖ ਕਾਰਕ

1. **ਵਰਕਲੋਡ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ**
   - ਉਮੀਦਵਾਰ ਟ੍ਰੈਫਿਕ/ਲੋਡ ਪੈਟਰਨ
   - ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ (CPU, ਮੈਮੋਰੀ, I/O)
   - ਸਟੋਰੇਜ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ ਅਤੇ ਪਹੁੰਚ ਪੈਟਰਨ

2. **ਵਾਤਾਵਰਣ ਦੀ ਕਿਸਮ**
   - ਵਿਕਾਸ/ਟੈਸਟਿੰਗ ਵਿਰੁੱਧ ਉਤਪਾਦਨ
   - ਉਪਲਬਧਤਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ
   - ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ

3. **ਬਜਟ ਪਾਬੰਦੀਆਂ**
   - ਸ਼ੁਰੂਆਤੀ ਲਾਗਤਾਂ ਵਿਰੁੱਧ ਚਾਲੂ ਲਾਗਤਾਂ
   - ਰਿਜ਼ਰਵਡ ਸਮਰੱਥਾ ਛੂਟ
   - ਆਟੋ-ਸਕੇਲਿੰਗ ਲਾਗਤ ਦੇ ਪ੍ਰਭਾਵ

4. **ਵਿਕਾਸ ਦੀਆਂ ਅਗਾਹਵਾਣਾਂ**
   - ਸਕੇਲਬਿਲਟੀ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ
   - ਭਵਿੱਖ ਦੇ ਫੀਚਰ ਦੀਆਂ ਜ਼ਰੂਰਤਾਂ
   - ਮਾਈਗ੍ਰੇਸ਼ਨ ਦੀ ਜਟਿਲਤਾ

---

## ਵਾਤਾਵਰਣ-ਅਧਾਰਿਤ ਚੋਣ

### ਵਿਕਾਸ ਵਾਤਾਵਰਣ

**ਤਰਜੀਹਾਂ**: ਲਾਗਤ ਅਨੁਕੂਲਤਾ, ਮੂਲ ਫੰਕਸ਼ਨਲਿਟੀ, ਆਸਾਨ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ/ਡਿਪ੍ਰੋਵਿਜ਼ਨਿੰਗ

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
- **ਐਪ ਸੇਵਾ**: F1 (ਮੁਫ਼ਤ) ਜਾਂ B1 (ਮੂਲ) ਸਧਾਰਨ ਟੈਸਟਿੰਗ ਲਈ
- **ਡਾਟਾਬੇਸ**: ਘੱਟ ਸਰੋਤਾਂ ਨਾਲ ਮੂਲ ਟੀਅਰ
- **ਸਟੋਰੇਜ**: ਸਿਰਫ ਸਥਾਨਕ redundancy ਨਾਲ ਸਟੈਂਡਰਡ
- **ਕੰਪਿਊਟ**: ਸਾਂਝੇ ਸਰੋਤ ਸਵੀਕਾਰਯੋਗ
- **ਨੈਟਵਰਕਿੰਗ**: ਮੂਲ ਸੰਰਚਨਾਵਾਂ

### ਸਟੇਜਿੰਗ/ਟੈਸਟਿੰਗ ਵਾਤਾਵਰਣ

**ਤਰਜੀਹਾਂ**: ਉਤਪਾਦਨ-ਜਿਵੇਂ ਸੰਰਚਨਾ, ਲਾਗਤ ਸੰਤੁਲਨ, ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ ਸਮਰੱਥਾ

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
- **ਪ੍ਰਦਰਸ਼ਨ**: ਉਤਪਾਦਨ ਸਮਰੱਥਾ ਦਾ 70-80%
- **ਫੀਚਰ**: ਜ਼ਿਆਦਾਤਰ ਉਤਪਾਦਨ ਫੀਚਰ ਚਾਲੂ
- **Redundancy**: ਕੁਝ ਖੇਤਰੀ redundancy
- **ਸਕੇਲਿੰਗ**: ਟੈਸਟਿੰਗ ਲਈ ਸੀਮਿਤ ਆਟੋ-ਸਕੇਲਿੰਗ
- **ਨਿਗਰਾਨੀ**: ਪੂਰੀ ਨਿਗਰਾਨੀ ਸਟੈਕ

### ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ

**ਤਰਜੀਹਾਂ**: ਪ੍ਰਦਰਸ਼ਨ, ਉਪਲਬਧਤਾ, ਸੁਰੱਖਿਆ, ਅਨੁਕੂਲਤਾ, ਸਕੇਲਬਿਲਟੀ

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
- **ਨਿਗਰਾਨੀ**: ਵਿਸਤ੍ਰਿਤ ਦ੍ਰਿਸ਼ਟੀਯੋਗਤਾ

---

## ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼

### Azure ਐਪ ਸੇਵਾ

#### SKU ਫੈਸਲਾ ਮੈਟ੍ਰਿਕਸ

| ਵਰਤੋਂ ਦਾ ਕੇਸ | ਸਿਫਾਰਸ਼ੀ SKU | ਕਾਰਨ |
|--------------|-------------|-------|
| ਵਿਕਾਸ/ਟੈਸਟਿੰਗ | F1 (ਮੁਫ਼ਤ) ਜਾਂ B1 (ਮੂਲ) | ਲਾਗਤ-ਅਨੁਕੂਲ, ਟੈਸਟਿੰਗ ਲਈ ਯੋਗ |
| ਛੋਟੇ ਉਤਪਾਦਨ ਐਪ | S1 (ਸਟੈਂਡਰਡ) | ਕਸਟਮ ਡੋਮੇਨ, SSL, ਆਟੋ-ਸਕੇਲਿੰਗ |
| ਮੱਧਮ ਉਤਪਾਦਨ ਐਪ | P1V3 (ਪ੍ਰੀਮੀਅਮ V3) | ਵਧੀਆ ਪ੍ਰਦਰਸ਼ਨ, ਵਧੇਰੇ ਫੀਚਰ |
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

**ਉਤਪਾਦਨ**
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
   - **ਮੂਲ**: 5 DTU - ਵਿਕਾਸ/ਟੈਸਟਿੰਗ
   - **ਸਟੈਂਡਰਡ**: S0-S12 (10-3000 DTU) - ਜਨਰਲ ਪਰਪਜ਼
   - **ਪ੍ਰੀਮੀਅਮ**: P1-P15 (125-4000 DTU) - ਪ੍ਰਦਰਸ਼ਨ-ਕ੍ਰਿਟਿਕਲ

2. **vCore-ਅਧਾਰਿਤ** (ਉਤਪਾਦਨ ਲਈ ਸਿਫਾਰਸ਼ੀ)
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

#### ਵਾਤਾਵਰਣ ਦੀਆਂ ਕਿਸਮਾਂ

1. **ਖਪਤ-ਅਧਾਰਿਤ**
   - ਵਰਤੋਂ-ਅਨੁਸਾਰ ਕੀਮਤ
   - ਵਿਕਾਸ ਅਤੇ ਬਦਲਦੇ ਵਰਕਲੋਡ ਲਈ ਯੋਗ
   - ਸਾਂਝੇ ਢਾਂਚੇ

2. **ਸਮਰਪਿਤ (ਵਰਕਲੋਡ ਪ੍ਰੋਫਾਈਲ)**
   - ਸਮਰਪਿਤ ਕੰਪਿਊਟ ਸਰੋਤ
   - ਪੇਸ਼ਕਸ਼ਯੋਗ ਪ੍ਰਦਰਸ਼ਨ
   - ਉਤਪਾਦਨ ਵਰਕਲੋਡ ਲਈ ਵਧੀਆ

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

**ਉਤਪਾਦਨ (ਸਮਰਪਿਤ)**
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

1. **ਮੈਨੂਅਲ ਪ੍ਰੋਵਿਜ਼ਨਡ Throughput**
   - ਪੇਸ਼ਕਸ਼ਯੋਗ ਪ੍ਰਦਰਸ਼ਨ
   - ਰਿਜ਼ਰਵਡ ਸਮਰੱਥਾ ਛੂਟ
   - ਸਥਿਰ ਵਰਕਲੋਡ ਲਈ ਵਧੀਆ

2. **Autoscale ਪ੍ਰੋਵਿਜ਼ਨਡ Throughput**
   - ਵਰਤੋਂ ਦੇ ਅਧਾਰ 'ਤੇ ਆਟੋਮੈਟਿਕ ਸਕੇਲਿੰਗ
   - ਜੋ ਵਰਤੋਂ ਕੀਤੀ ਗਈ ਹੈ ਉਸ ਲਈ ਭੁਗਤਾਨ ਕਰੋ (ਘੱਟੋ-ਘੱਟ ਨਾਲ)
   - ਬਦਲਦੇ ਵਰਕਲੋਡ ਲਈ ਚੰਗਾ

3. **ਸਰਵਰਲੈਸ**
   - ਪ੍ਰਤੀ-ਨਿਵੇਸ਼ ਭੁਗਤਾਨ
   - ਕੋਈ ਪ੍ਰੋਵਿਜ਼ਨਡ Throughput ਨਹੀਂ
   - ਵਿਕਾਸ ਅਤੇ ਅਨਿਯਮਿਤ ਵਰਕਲੋਡ ਲਈ ਆਦਰਸ਼

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
2. **Standard_GRS** - ਉਤਪਾਦਨ, geo-redundancy ਦੀ ਜ਼ਰੂਰਤ
3. **Premium_LRS** - ਉੱਚ-ਪ੍ਰਦਰਸ਼ਨ ਐਪਲੀਕੇਸ਼ਨ
4. **Premium_ZRS** - ਉੱਚ ਉਪਲਬਧਤਾ ਜ਼ੋਨ redundancy ਨਾਲ

#### ਪ੍ਰਦਰਸ਼ਨ ਟੀਅਰ

- **Standard**: ਜਨਰਲ ਪਰਪਜ਼, ਲਾਗਤ-ਅਨੁਕੂਲ
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

## ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਰਣਨੀਤੀਆਂ

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

ਲਾਗਤ ਨੂੰ ਅਨੁਕੂਲ ਕਰਨ ਲਈ ਸਮਰੱਥ ਸਕੇਲਿੰਗ ਲਾਗੂ ਕਰੋ:

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

ਆਫ-ਆਵਰ ਦੌਰਾਨ ਸਕੇਲਿੰਗ ਘਟਾਓ:

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

ਵੱਖ-ਵੱਖ SKUs ਦੀ ਪ੍ਰਦਰਸ਼ਨ ਵੈਧਤਾ ਲਈ ਟੈਸਟ ਕਰੋ:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### ਨਿਗਰਾਨੀ ਅਤੇ ਅਨੁਕੂਲਤਾ

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

## ਤੁਰੰਤ ਸੰਦਰਭ ਟੇਬਲ

### ਐਪ ਸੇਵਾ SKU ਤੁਰੰਤ ਸੰਦਰਭ

| SKU | ਟੀਅਰ | vCPU | RAM | ਸਟੋਰੇਜ | ਕੀਮਤ ਰੇਂਜ | ਵਰਤੋਂ ਦਾ ਕੇਸ |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ਮੁਫ਼ਤ | ਸਾਂਝਾ | 1GB | 1GB | ਮੁਫ਼ਤ | ਵਿਕਾਸ |
| B1 | ਮੂਲ | 1 | 1.75GB | 10GB | $ | ਛੋਟੇ ਐਪ |
| S1 | ਸਟੈਂਡਰਡ | 1 | 1.75GB | 50GB | $$ | ਉਤਪਾਦਨ |
| P1V3 | ਪ੍ਰੀਮੀਅਮ V3 | 2 | 8GB | 250GB | $$$ | ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | ਐਨਟਰਪ੍ਰਾਈਜ਼ |

### SQL ਡਾਟਾਬੇਸ SKU ਤੁਰੰਤ ਸੰਦਰਭ

| SKU | ਟੀਅਰ | DTU/vCore | ਸਟੋਰੇਜ | ਕੀਮਤ ਰੇਂਜ | ਵਰਤੋਂ ਦਾ ਕੇਸ |
|-----|------|-----------|---------|-------------|----------|
| ਮੂਲ | ਮੂਲ | 5 DTU | 2GB | $ | ਵਿਕਾਸ |
| S2 | ਸਟੈਂਡਰਡ | 50 DTU | 250GB | $$ | ਛੋਟਾ ਉਤਪਾਦਨ |
| P2 | ਪ੍ਰੀਮੀ

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਚਤਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੇ ਪ੍ਰਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
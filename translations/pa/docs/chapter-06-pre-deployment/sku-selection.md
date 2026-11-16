# SKU ਚੋਣ ਗਾਈਡ - ਸਹੀ Azure ਸੇਵਾ ਟੀਅਰ ਚੁਣਨਾ

**ਅਧਿਆਇ ਪ੍ਰਵਾਨਗੀ:**
- **📚 ਕੋਰਸ ਘਰ**: [AZD ਫੋਰ ਬਿਗਿਨਰਜ਼](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 6 - ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ ਅਤੇ ਯੋਜਨਾ ਬਣਾਉਣਾ
- **⬅️ ਪਿਛਲਾ**: [ਕੈਪੈਸਿਟੀ ਪਲੈਨਿੰਗ](capacity-planning.md)
- **➡️ ਅੱਗੇ**: [ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕਸ](preflight-checks.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 7: ਸਮੱਸਿਆ ਹੱਲ](../chapter-07-troubleshooting/common-issues.md)

## ਜਾਣ ਪਹਿਚਾਣ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਤੁਹਾਨੂੰ ਵੱਖ-ਵੱਖ ਮਾਹੌਲਾਂ, ਵर्कਲੋਡ ਅਤੇ ਲੋੜਾਂ ਲਈ ਸਭ ਤੋਂ ਵਧੀਆ Azure ਸੇਵਾ SKU (ਸਟੌਕ ਕੀਪਿੰਗ ਯੂਨਿਟਸ) ਚੁਣਨ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ। ਪ੍ਰਦਰਸ਼ਨ ਦੀਆਂ ਲੋੜਾਂ, ਲਾਗਤ ਦੇ ਵਿਚਾਰਾਂ ਅਤੇ ਸਕੇਲਬਿਲਟੀ ਦੀਆਂ ਲੋੜਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਨਾ ਸਿੱਖੋ ਤਾਂ ਜੋ ਆਪਣੇ Azure ਡਿਵੈਲਪਰ CLI ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਸਭ ਤੋਂ ਉਚਿਤ ਸੇਵਾ ਟੀਅਰ ਚੁਣੇ ਜਾ ਸਕਣ।

## ਸਿੱਖਣ ਦੇ ਲਕੜੇ

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- Azure SKU ਧਾਰਣਾਵਾਂ, ਕੀਮਤ ਦੇ ਮਾਡਲਾਂ ਅਤੇ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਦੇ ਫਰਕ ਨੂੰ ਸਮਝੋਗੇ
- ਵਿਕਾਸ, ਸਟੇਜਿੰਗ ਅਤੇ ਉਤਪਾਦਨ ਲਈ ਮਾਹੌਲ ਨਿਰਧਾਰਿਤ SKU ਚੋਣ ਰਣਨੀਤੀਆਂ ਵਿੱਚ ਮਾਹਿਰ ਹੋਵੋਗੇ
- ਵਰਕਲੋਡ ਲੋੜਾਂ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਕੇ ਉਚਿਤ ਸੇਵਾ ਟੀਅਰ ਨਾਲ ਮਿਲਾਓਗੇ
- ਸਮਾਰਟ SKU ਚੋਣ ਰਾਹੀਂ ਲਾਗਤ ਦਾ ਅਨੁਕੂਲਨ ਕਰਨ ਦੀ ਯੋਜਨਾ ਬਣਾਵੋਗੇ
- SKU ਚੋਣਾਂ ਲਈ ਪਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ ਅਤੇ ਮਾਨਤਾ ਤਕਨੀਕਾਂ ਲਾਗੂ ਕਰੋਗੇ
- ਆਟੋਮੇਟਡ SKU ਸੁਝਾਵ ਅਤੇ ਨਿਗਰਾਨੀ ਕনਫਿਗਰ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਗਾਈਡ ਦੇ ਪੂਰਾ ਹੋਣ ਤੇ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- ਵਰਕਲੋਡ ਲੋੜਾਂ ਅਤੇ ਪਾਬੰਦੀਆਂ ਦੇ ਆਧਾਰ 'ਤੇ ਉਚਿਤ Azure ਸੇਵਾ SKU ਚੁਣਨ ਲਈ
- ਠੀਕ ਟੀਅਰ ਚੋਣ ਨਾਲ ਲਾਗਤ-ਕਾਰਗਰ ਬਹੁ-ਮਾਹੌਲ ਢਾਂਚਾ ਡਿਜ਼ਾਈਨ ਕਰਨ ਲਈ
- SKU ਚੋਣਾਂ ਲਈ ਪ੍ਰਦਰਸ਼ਨ ਬੈਂਚਮਾਰਕਿੰਗ ਅਤੇ ਮਾਨਤਾ ਲਾਗੂ ਕਰਨ ਲਈ
- SKU ਸਿਫਾਰਸ਼ ਅਤੇ ਲਾਗਤ ਅਨੁਕੂਲਣ ਲਈ ਆਟੋਮੇਟਡ ਟੂਲ ਬਣਾਉਣ ਲਈ
- ਬਦਲਦੇ ਲੋੜਾਂ ਲਈ SKU ਮਾਈਗ੍ਰੇਸ਼ਨ ਅਤੇ ਸਕੇਲਿੰਗ ਰਣਨੀਤੀਆਂ ਦੀ ਯੋਜਨਾ ਬਣਾਉਣ ਲਈ
- ਸੇਵਾ ਟੀਅਰ ਚੋਣ ਲਈ Azure ਵੈਲ-ਆਰਕੀਟੈਕਟਡ ਫਰੇਮਵਰਕ ਦੇ ਨਿਯਮ ਲਾਗੂ ਕਰਨ ਲਈ

## ਸਾਰਣੀ ਸਮੱਗਰੀ

- [SKU ਸਮਝਣਾ](#understanding-skus)
- [ਮਾਹੌਲ ਅਧਾਰਿਤ ਚੋਣ](#environment-based-selection)
- [ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼](#service-specific-guidelines)
- [ਲਾਗਤ ਅਨੁਕੂਲਣ ਦੀਆਂ ਰਣਨੀਤੀਆਂ](#cost-optimization-strategies)
- [ਪਰਦਰਸ਼ਨ ਦੇ ਵਿਚਾਰ](#performance-considerations)
- [ਤੁਰੰਤ ਸੰਦਰਭ ਸਾਰਣੀਆਂ](#quick-reference-tables)
- [ਮਾਨਤਾ ਟੂਲ](#validation-tools)

---

## SKU ਸਮਝਣਾ

> **ਉਦਾਹਰਨ ਦਾਇਰਾ:** ਹੇਠਾਂ ਦੇ YAML SKU ਨਕਸ਼ੇ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਸੰਰਚਨਾਵਾਂ ਡਿਜ਼ਾਈਨ ਨੋਟ ਹਨ, ਕਿਸੇ `azure.yaml` ਸਕੀਮਾ ਜਾਂ ਲੋਡ-ਟੂਲ ਸੰਰਚਨਾ ਨਹੀਂ ਹਨ। ਬਾਈਸਪ ਬਲਾਕ ਵਿਕਲਪ/ਟੁਕੜੇ ਹਨ: ਉਨ੍ਹਾਂ ਦੇ ਪੈਰਾਮੀਟਰ ਅਤੇ ਮਾਪੇ ਰਿਸੋਰਸ ਡਿਕਲੇਅਰ ਕਰੋ, ਖ਼ਾਸ ਨਾਂਵ ਵਰਤਕੇ ਜੋੜੋ, ਅਤੇ ਮਾਡਿਊਲ ਨੂੰ ਕੰਮ ਕਰਨ ਵਾਲੇ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਵਾਇਰ ਕਰੋ। ਕੀਮਤਾਂ, ਸੀਮਾਵਾਂ ਅਤੇ ਖੇਤਰ/SKU ਉਪਲਬਧਤਾ ਤੁਹਾਡੇ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਲਈ ਡਿਪਲੋਇਮੈਂਟ ਪੂਰਵ ਚੈੱਕ ਕਰਨੀਆ ਹਨ।

### SKUs ਕੀ ਹਨ?

SKU (ਸਟੌਕ ਕੀਪਿੰਗ ਯੂਨਿਟਸ) Azure ਸਰੋਤਾਂ ਲਈ ਵੱਖ-ਵੱਖ ਸੇਵਾ ਟੀਅਰ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਪੱਧਰ ਦਰਸਾਉਂਦੇ ਹਨ। ਹਰ SKU ਵੱਖ-ਵੱਖ ਚੀਜ਼ਾਂ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:

- **ਪ੍ਰਦਰਸ਼ਨ ਵਿਸ਼ੇਸ਼ਤਾ** (CPU, ਮੇਮੋਰੀ, ਥਰੂਪੁੱਟ)
- **ਵਿਸ਼ੇਸ਼ਤਾ ਉਪਲਬਧਤਾ** (ਸਕੇਲਿੰਗ ਵਿਕਲਪ, SLA ਪੱਧਰ)
- **ਕੀਮਤ ਮਾਡਲ** (ਖ਼ਪਤ ਅਧਾਰਤ, ਰਿਜ਼ਰਵਡ ਕੈਪੈਸਿਟੀ)
- **ਖੇਤਰੀ ਉਪਲਬਧਤਾ** (ਸਾਰੇ ਖੇਤਰਾਂ ਵਿੱਚ ਸਾਰੇ SKU ਉਪਲਬਧ ਨਹੀਂ)

### SKU ਚੋਣ ਵਿੱਚ ਮੁੱਖ ਤੱਤ

1. **ਵਰਕਲੋਡ ਲੋੜਾਂ**
   - ਅੰਦਾਜ਼ਿਤ ਟ੍ਰੈਫਿਕ/ਲੋਡ ਨਮੂਨੇ
   - ਪ੍ਰਦਰਸ਼ਨ ਲੋੜਾਂ (CPU, ਮੇਮੋਰੀ, I/O)
   - ਸਟੋਰੇਜ ਲੋੜਾਂ ਅਤੇ ਪਹੁੰਚ ਨਮੂਨੇ

2. **ਮਾਹੌਲ ਕਿਸਮ**
   - ਵਿਕਾਸ/ਟੈਸਟਿੰਗ ਵਿਰੁੱਧ ਉਤਪਾਦਨ
   - ਉਪਲਬਧਤਾ ਲੋੜਾਂ
   - ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ ਲੋੜਾਂ

3. **ਬਜਟ ਸੀਮਾਵਾਂ**
   - ਸ਼ੁਰੂਆਤੀ ਲਾਗਤਾਂ ਅਤੇ ਚਾਲੂ ਖਰਚ
   - ਰਿਜ਼ਰਵਡ ਕੈਪੈਸਿਟੀ ਛੂਟ
   - ਆਟੋ-ਸਕੇਲਿੰਗ ਦੇ ਖ਼ਰਚ ਪ੍ਰਭਾਵ

4. **ਵਿਕਾਸ ਦੀ ਭਵਿੱਖਵਾਣੀ**
   - ਸਕੇਲਬਿਲਟੀ ਲੋੜਾਂ
   - ਭਵਿੱਖ ਦੀਆਂ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਦੀ ਲੋੜ
   - ਮਾਈਗ੍ਰੇਸ਼ਨ ਦੀ ਜਟਿਲਤਾ

---

## ਮਾਹੌਲ ਅਧਾਰਿਤ ਚੋਣ

### ਵਿਕਾਸ ਮਾਹੌਲ

**ਤਰਜੀحات**: ਲਾਗਤ ਅਨੁਕੂਲਨ, ਬੁਨਿਆਦੀ ਕਾਰਗੁਜ਼ਾਰੀ, ਆਸਾਨ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ/ਡਿਪ੍ਰੋਵੀਜ਼ਨਿੰਗ

#### ਸਿਫਾਰਸ਼ ਕੀਤੇ SKU
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

#### ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ
- **ਐਪ ਸੇਵਾ**: ਸਾਦਾ ਟੈਸਟਿੰਗ ਲਈ F1 (ਮੁਫਤ) ਜਾਂ B1 (ਬੇਸਿਕ)
- **ਡੇਟਾਬੇਸ**: ਘੱਟ ਸਰੋਤਾਂ ਨਾਲ ਬੇਸਿਕ ਟੀਅਰ
- **ਸਟੋਰੇਜ**: ਸਿਰਫ਼ ਸਥਾਨਕ ਤੋਂ ਦੁਹਰਾਈ ਵਾਲਾ ਮਿਆਰੀ
- **ਕੰਪਿਊਟ**: ਸਾਂਝੇ ਸਰੋਤ ਬਰਦਾਸ਼ਤ
- **ਨੈੱਟਵਰਕਿੰਗ**: ਬੁਨਿਆਦੀ ਕਨਫਿਗਰੇਸ਼ਨ

### ਸਟੇਜਿੰਗ/ਟੈਸਟਿੰਗ ਮਾਹੌਲ

**ਤਰਜੀحات**: ਉਤਪਾਦਨ ਵਰਗੀ ਸੰਰਚਨਾ, ਲਾਗਤ ਸੰਤੁਲਨ, ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ ਯੋਗਤਾ

#### ਸਿਫਾਰਸ਼ ਕੀਤੇ SKU
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
- **ਪਰਦਰਸ਼ਨ**: ਉਤਪਾਦਨ ਸਮਰੱਥਾ ਦਾ 70-80%
- **ਵਿਸ਼ੇਸ਼ਤਾ**: ਜ਼ਿਆਦਾਤਰ ਉਤਪਾਦਨ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਚਾਲੂ
- **ਰਿਡੰਡੇਸੀ**: ਕੁਝ ਭੂਗੋਲਿਕ ਦੁਹਰਾਈ
- **ਸਕੇਲਿੰਗ**: ਟੈਸਟਿੰਗ ਲਈ ਸੀਮਿਤ ਆਟੋ-ਸਕੇਲਿੰਗ
- **ਮਾਨੀਟਰਨਿੰਗ**: ਪੂਰੀ ਮਾਨੀਟਰਨਿੰਗ ਸਟੈਕ

### ਉਤਪਾਦਨ ਮਾਹੌਲ

**ਤਰਜੀحات**: ਪ੍ਰਦਰਸ਼ਨ, ਉਪਲਬਧਤਾ, ਸੁਰੱਖਿਆ, ਅਨੁਕੂਲਤਾ, ਸਕੇਲਬਿਲਟੀ

#### ਸਿਫਾਰਸ਼ ਕੀਤੇ SKU
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

#### ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ
- **ਉੱਚ ਉਪਲਬਧਤਾ**: 99.9%+ SLA ਲੋੜਾਂ
- **ਪਰਦਰਸ਼ਨ**: ਸਮਰਪਿਤ ਸਰੋਤ, ਉੱਚ ਥਰੂਪੁੱਟ
- **ਸੁਰੱਖਿਆ**: ਪ੍ਰੀਮੀਅਮ ਸੁਰੱਖਿਆ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ
- **ਸਕੇਲਿੰਗ**: ਪੂਰੀ ਆਟੋ-ਸਕੇਲਿੰਗ ਸਮਰੱਥਾ
- **ਮਾਨੀਟਰਨਿੰਗ**: ਵਿਆਪਕ ਨਿਗਰਾਨੀ

---

## ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼

### Azure ਐਪ ਸੇਵਾ

#### SKU ਫੈਸਲਾ ਮੈਟ੍ਰਿਕਸ

| ਵਰਤੋਂ ਦਾ ਕੇਸ | ਸਿਫਾਰਸ਼ੀ SKU | ਤਰਕ |
|----------|----------------|-----------|
| ਵਿਕਾਸ/ਟੈਸਟਿੰਗ | F1 (ਮੁਫ਼ਤ) ਜਾਂ B1 (ਬੇਸਿਕ) | ਲਾਗਤ-ਕੁਸ਼ਲ, ਟੈਸਟਿੰਗ ਲਈ ਯੋਗ |
| ਛੋਟੇ ਉਤਪਾਦਨ ਐਪ | S1 (ਮਿਆਰੀ) | ਕਸਟਮ ਡੋਮੇਨ, SSL, ਆਟੋ-ਸਕੇਲਿੰਗ |
| ਮਿਡੀਅਮ ਉਤਪਾਦਨ ਐਪ | P1V3 (ਪ੍ਰੀਮੀਅਮ V3) | ਬਿਹਤਰ ਪ੍ਰਦਰਸ਼ਨ, ਹੋਰ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ |
| ਉੱਚ-ਟਰੈਫਿਕ ਐਪ | P2V3 ਜਾਂ P3V3 | ਸਮਰਪਿਤ ਸਰੋਤ, ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| ਮਿਸ਼ਨ-ਸੰਵेदनਸ਼ੀਲ ਐਪ | I1V2 (ਇਸੋਲੇਟਡ V2) | ਨੈੱਟਵਰਕ ਵਿਛੋੜਾ, ਸਮਰਪਿਤ ਹਾਰਡਵੇਅਰ |

#### ਸੰਰਚਨਾ ਉਦਾਹਰਨਾਂ

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

### Azure SQL ਡੇਟਾਬੇਸ

#### SKU ਚੋਣ ਫਰੇਮਵਰਕ

1. **DTU-ਅਧਾਰਿਤ (ਡੇਟਾਬੇਸ ਟ੍ਰਾਂਜ਼ੈਕਸ਼ਨ ਯੂਨਿਟਸ)**
   - **ਬੇਸਿਕ**: 5 DTU - ਵਿਕਾਸ/ਟੈਸਟਿੰਗ
   - **ਮਿਆਰੀ**: S0-S12 (10-3000 DTU) - ਆਮ ਉਦੇਸ਼
   - **ਪ੍ਰੀਮੀਅਮ**: P1-P15 (125-4000 DTU) - ਪ੍ਰਦਰਸ਼ਨ-ਸੰਵੇਦਨਸ਼ੀਲ

2. **vCore-ਅਧਾਰਿਤ** (ਉਤਪਾਦਨ ਲਈ ਸੁਝਾਇਆ ਗਿਆ)
   - **ਆਮ ਉਦੇਸ਼**: ਸੰਤੁਲਿਤ ਕੰਪਿਊਟ ਅਤੇ ਸਟੋਰੇਜ
   - **ਵਪਾਰਕ ਸੰਵੇਦਨਸ਼ੀਲ**: ਘੱਟ ਦੇਰੀ, ਉੱਚ IOPS
   - **ਹਾਇਪਰਸਕੇਲ**: ਬਹੁਤ ਸਕੇਲਯੋਗ ਸਟੋਰੇਜ; ਮੌਜੂਦਾ ਆਕਾਰ ਸੀਮਾਵਾਂ ਅਤੇ ਖੇਤਰੀ ਸਹਾਇਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

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

### Azure ਕਨਟੇਨਰ ਐਪਸ

#### ਮਾਹੌਲ ਕਿਸਮਾਂ

1. **ਖ਼ਪਤ-ਅਧਾਰਿਤ**
   - ਦਰ-ਦਰ ਭੁਗਤਾਨ ਮਾਡਲ
   - ਵਿਕਾਸ ਅਤੇ ਬਦਲਦੇ ਵਰਕਲੋਡ ਲਈ ਯੋਗ
   - ਸਾਂਝਾ ਇੰਫ੍ਰਾਸਟ੍ਰੱਕਚਰ

2. **ਸਮਰਪਿਤ (ਵਰਕਲੋਡ ਪ੍ਰੋਫਾਈਲ)**
   - ਸਮਰਪਿਤ ਕੰਪਿਊਟ ਸਰੋਤ
   - ਪੇਸ਼ਬਣ ਪ੍ਰਭਾਵ
   - ਉਤਪਾਦਨ ਵਰਕਲੋਡ ਲਈ ਬਿਹਤਰ

#### ਸੰਰਚਨਾ ਉਦਾਹਰਨ

**ਵිකਾਸ (ਖ਼ਪਤ)**
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

**ਉਤਪਾਦਨ (ਸਮਰਪਿਤ)**
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

ਜ਼ੋਨ ਰਿਡੰਡੇਸੀ ਲਈ ਸਹਾਇਤਾਤਮਕ ਖੇਤਰੀ ਢਾਂਚਾ ਅਤੇ ਯੋਗ VNet/ਸਬਨੈੱਟ ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਲੋੜ ਹੈ, ਇੱਥੇ ਛੱਡਿਆ ਗਿਆ। ਇਸ ਉਦਾਹਰਨ ਵਿੱਚ ਤਿੰਨ ਸਮਰਪਿਤ ਨੋਡਾਂ ਦੀ ਬਜਟ ਹੈ; ਕਮ ਤੋਂ ਕਮ ਦੋ ਐਪ ਰੈਪਲਿਕਾ ਕ੍ਰਾਸ-ਜ਼ੋਨ ਵੰਡ ਲਈ ਸੈੱਟ ਕਰੋ ਅਤੇ ਜ਼ੋਨ ਫੇਲਯਰ ਲਈ ਦੋਨਾਂ ਰੈਪਲਿਕਾ ਅਤੇ ਨੋਡ ਸਾਈਜ਼ ਕਰੋ। ਵੇਖੋ [ਕੰਟੇਨਰ ਐਪਸ ਭਰੋਸੇਯੋਗਤਾ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps)। ਇਸ ਪ੍ਰੋਫਾਈਲ ’ਤੇ ਐਪ ਨੂੰ ਰੱਖਣ ਲਈ, ਇਸ ਦੀ `workloadProfileName: 'production-profile'` ਸੈੱਟ ਕਰੋ; ਸਿਰਫ਼ ਪ੍ਰੋਫਾਈਲ ਬਣਾਉਣਾ ਐਪ ਨੂੰ ਕਿਵੇਂ ਭੇਜਣਾ ਨਹੀਂ ਹੈ।

### Azure Cosmos DB

#### ਥਰੂਪੁੱਟ ਮਾਡਲ

1. **ਹੱਥੋਂ ਦਿੱਤੀ ਥਰੂਪੁੱਟ**
   - ਪੇਸ਼ਬਣ ਪਰਦਰਸ਼ਨ
   - ਰਿਜ਼ਰਵਡ ਕੈਪੈਸਿਟੀ ਛੂਟ
   - ਸਥਿਰ ਵਰਕਲੋਡ ਲਈ ਸਭ ਤੋਂ ਵਧੀਆ

2. **ਆਟੋਸਕੇਲ ਪ੍ਰਦਾਨ ਥਰੂਪੁੱਟ**
   - ਵਰਤੋਂ ਦੇ ਅਧਾਰ 'ਤੇ ਸਵੈ-ਚਲਤ ਸਕੇਲਿੰਗ
   - ਜੇਨਾ ਭੁਗਤਾਨ ਕਰੋ ਜੋ ਤੁਸੀਂ ਵਰਤਦੇ ਹੋ (ਘੱਟੋ-ਘੱਟ ਸਮੇਤ)
   - ਬਦਲਦੇ ਵਰਕਲੋਡ ਲਈ ਵਧੀਆ

3. **ਸਰਵਰਲੇੱਸ**
   - ਪ੍ਰਤੀ ਬੇਨਤੀ ਭੁਗਤਾਨ
   - ਕੋਈ ਪ੍ਰਦਾਨ ਥਰੂਪੁੱਟ ਨਹੀਂ
   - ਵਿਕਾਸ ਅਤੇ ਵਿਚਲੇ ਵਰਕਲੋਡ ਲਈ ਆਦਰਸ਼

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

### Azure ਸਟੋਰੇਜ ਅਕਾਉਂਟ

#### ਸਟੋਰੇਜ ਅਕਾਉਂਟ ਕਿਸਮਾਂ

1. **Standard_LRS** - ਵਿਕਾਸ, ਗੈਰ-ਸੰਵੇਦਨਸ਼ੀਲ ਡੇਟਾ
2. **Standard_GRS** - ਉਤਪਾਦਨ, ਭੂਗੋਲਿਕ ਦੋਹਰਾਈ ਲੋੜੀਂਦੀ
3. **Premium_LRS** - ਉੱਚ-ਪ੍ਰਦਰਸ਼ਨ ਐਪਲੀਕੇਸ਼ਨ
4. **Premium_ZRS** - ਜ਼ੋਨ ਰਿਡੰਡੇਸੀ ਨਾਲ ਉੱਚ ਉਪਲਬਧਤਾ

#### ਪ੍ਰਦਰਸ਼ਨ ਟੀਅਰ

- **ਮਿਆਰੀ**: ਆਮ ਉਦੇਸ਼, ਲਾਗਤ-ਕੁਸ਼ਲ
- **ਪ੍ਰੀਮੀਅਮ**: ਉੱਚ-ਪਰਦਰਸ਼ਨ, ਘੱਟ ਦੇਰੀ ਵਾਲੇ ਸੰਦਰਭ

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

## ਲਾਗਤ ਅਨੁਕੂਲਣ ਰਣਨੀਤੀਆਂ

### 1. ਰਿਜ਼ਰਵਡ ਕੈਪੈਸਿਟੀ

ਮਹੱਤਵਪੂਰਣ ਛੂਟ ਲਈ 1-3 ਸਾਲਾਂ ਲਈ ਸਰੋਤ ਰਿਜ਼ਰਵ ਕਰੋ:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

ਰਿਜ਼ਰਵੇਸ਼ਨ অফਰਿੰਗ ਅਤੇ ਯੋਗ ਸਰੋਤ ਕਿਸਮਾਂ ਵੱਖ-ਵੱਖ ਹੁੰਦੀਆਂ ਹਨ; ਕੈਟਾਲੌਗ ਅਤੇ ਖਰੀਦ ਸ਼ਰਤਾਂ ਨੂੰ ਜाँचੋ, ਨਾ ਕਿ ਹਰ ਸੇਵਾ/SKU ਲਈ ਰਿਜ਼ਰਵੇਸ਼ਨ ਮੰਤਵ ਕਰੋਂ।

### 2. ਸਹੀ ਆਕਾਰ ਦਿਓ

ਛੋਟੇ SKU ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਅਸਲੀ ਵਰਤੋਂ ਦੇ ਅਧਾਰ ’ਤੇ ਵਧਾਓ:

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

ਲਾਗਤ ਦਾ ਅਨੁਕੂਲਨ ਕਰਨ ਲਈ ਸਮਾਰਟ ਸਕੇਲਿੰਗ ਲਾਗੂ ਕਰੋ:

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

### 4. ਨਿਰਧਾਰਿਤ ਸਮੇਂ ਵਾਲੀ ਸਕੇਲਿੰਗ

ਬੰਦ ਸਮੇਂ ਦੌਰਾਨ ਘਟਾਓ:

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

### ਮੂਲ ਪ੍ਰਦਰਸ਼ਨ ਲੋੜਾਂ

SKU ਚੋਣ ਤੋਂ ਪਹਿਲਾਂ ਸਪਸ਼ਟ ਪ੍ਰਦਰਸ਼ਨ ਲੋੜਾਂ ਪਰਿਭਾਸ਼ਿਤ ਕਰੋ:

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

ਪ੍ਰਦਰਸ਼ਨ ਦੀ ਮਾਨਤਾ ਲਈ ਵੱਖ-ਵੱਖ SKU ਟੈਸਟ ਕਰੋ:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### ਨਿਗਰਾਨੀ ਅਤੇ ਅਨੁਕੂਲਨ

ਵਿਆਪਕ ਨਿਗਰਾਨੀ ਸੈੱਟ ਕਰੋ:

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

## ਤੁਰੰਤ ਸੰਦਰਭ ਸਾਰਣੀਆਂ

### ਐਪ ਸੇਵਾ SKU ਤੁਰੰਤ ਸੰਦਰਭ

| SKU | ਟੀਅਰ | vCPU | RAM | ਸਟੋਰੇਜ | ਕੀਮਤ ਵਾਰੀਅੰਟ | ਵਰਤੋਂ ਦਾ ਕੇਸ |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ਮੁਫਤ | ਸਾਂਝਾ | 1GB | 1GB | ਮੁਫਤ | ਵਿਕਾਸ |
| B1 | ਬੇਸਿਕ | 1 | 1.75GB | 10GB | $ | ਛੋਟੇ ਐਪ |
| S1 | ਮਿਆਰੀ | 1 | 1.75GB | 50GB | $$ | ਉਤਪਾਦਨ |
| P1V3 | ਪ੍ਰੀਮੀਅਮ V3 | 2 | 8GB | 250GB | $$$ | ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| I1V2 | ਇਸੋਲੇਟਡ V2 | 2 | 8GB | 1TB | $$$$ | ਕਾਰੋਬਾਰੀ |

### SQL ਡੇਟਾਬੇਸ SKU ਤੁਰੰਤ ਸੰਦਰਭ

| SKU | ਟੀਅਰ | DTU/vCore | ਸਟੋਰੇਜ | ਕੀਮਤ ਵਾਰੀਅੰਟ | ਵਰਤੋਂ ਦਾ ਕੇਸ |
|-----|------|-----------|---------|-------------|----------|
| ਬੇਸਿਕ | ਬੇਸਿਕ | 5 DTU | 2GB | $ | ਵਿਕਾਸ |
| S2 | ਮਿਆਰੀ | 50 DTU | 250GB | $$ | ਛੋਟੇ ਉਤਪਾਦਨ |
| P2 | ਪ੍ਰੀਮੀਅਮ | 250 DTU | 1TB | $$$ | ਉੱਚ ਪ੍ਰਦਰਸ਼ਨ |
| GP_Gen5_4 | ਆਮ ਉਦੇਸ਼ | 4 vCore | 4TB | $$$ | ਸੰਤੁਲਿਤ |
| BC_Gen5_8 | ਵਪਾਰਕ ਸੰਵੇਦਨਸ਼ੀਲ | 8 vCore | 4TB | $$$$ | ਮਿਸ਼ਨ ਸੰਵੇਦਨਸ਼ੀਲ |

### ਕਨਟੇਨਰ ਐਪਸ SKU ਤੁਰੰਤ ਸੰਦਰਭ

| ਮਾਡਲ | ਕੀਮਤ | CPU/ਮੇਮੋਰੀ | ਵਰਤੋਂ ਦਾ ਕੇਸ |
|-------|---------|------------|----------|
| ਖ਼ਪਤ | ਦਰ-ਦਰ ਭੁਗਤਾਨ | ਮਾਹੌਲ/ਪ੍ਰੋਫਾਈਲ ਦੇ ਅਨੁਸਾਰ CPU/ਮੇਮੋਰੀ ਸੰਯੋਜਨ ਨੂੰ ਸਹਾਰਿਆ ਜਾਂਦਾ | ਵਿਕਾਸ ਜਾਂ ਉਤਪਾਦਨ, ਬਦਲੀ ਲੋਡ |
| ਸਮਰਪਿਤ D4 | ਸਮਰਪਿਤ ਨੋਡ ਬਿਲਿੰਗ | ਹਰ ਨੋਡ ਲਈ 4 vCPU, 16GiB | ਲੰਬੇ ਸਮੇਂ ਤੇ ਲੋਡ/ਵਿਛੋੜੀ ਲੋੜਾਂ |
| ਸਮਰਪਿਤ D8 | ਸਮਰਪਿਤ ਨੋਡ ਬਿਲਿੰਗ | ਹਰ ਨੋਡ ਲਈ 8 vCPU, 32GiB | ਵੱਧ ਲੰਬੇ ਸਮੇਂ ਲੋਡ |

---

## ਮਾਨਤਾ ਟੂਲ

### SKU ਉਪਲਬਧਤਾ ਜਾਂਚਕਾਰ

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

### ਲਾਗਤ ਅੰਕੜਾ ਸਕ੍ਰਿਪਟ

**ਸਿਰਫ ਪਸੀਕੋਡ:** ਹੇਠਾਂ `Get-ResourceCost` ਇੱਕ ਪ੍ਰੋਜੈਕਟ-ਖਾਸ ਫੰਕਸ਼ਨ ਹੈ ਜੋ ਤੁਹਾਨੂੰ ਮੌਜੂਦਾ ਖੇਤਰੀ/ਠੇਕੇ ਦੀ ਕੀਮਤ ਅਤੇ ਵਰਤੋਗੇ ਅਨੁਮਾਨ ਨੂੰ ਵਰਤਕੇ ਲਾਗੂ ਕਰਨਾ ਪਵੇਗਾ। ਇਹ PowerShell ਜਾਂ Azure ਕਮਾਂਡਲੇਟ ਨਹੀਂ ਹੈ।

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

### ਪਰਦਰਸ਼ਨ ਮਾਨਤਾ

ਹੇਠਾਂ ਦਿੱਤਾ YAML ਲੋੜਾਂ ਦਾ ਖਾਕਾ ਹੈ, **ਨਹੀਂ** Azure ਲੋਡ ਟੈਸਟਿੰਗ, JMeter, Locust, ਜਾਂ k6 ਦੀ ਇਨਪੁੱਟ ਸਕੀਮਾ। ਇਸ ਨੂੰ ਆਪਣੇ ਚੁਣੇ ਹੋਏ ਟੂਲ ਦੀ ਅਸਲ ਸੰਰਚਨਾ ਵਿੱਚ ਬਦਲੋ ਅਤੇ ਉਪਰ ਦਿੱਤੇ ਲੋਡ-ਟੈਸਟ ਕਮਾਂਡ ਤੋਂ ਪਹਿਲਾਂ ਵਰਤੋ।

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

## ਵਧੀਆ ਪ੍ਰਿਥਕਤਾਂ ਸਾਰ

### ਕਰਨ ਯੋਗ

1. **ਛੋਟੇ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਅਸਲੀ ਵਰਤੋਂ ਦੇ ਅਧਾਰ ਤੇ ਵਧਾਓ**
2. **ਵੱਖ-ਵੱਖ ਮਾਹੌਲਾਂ ਲਈ ਵੱਖ-ਵੱਖ SKU ਵਰਤੋਂ ਕਰੋ**
3. **ਲਾਗਤ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਲਈ ਲਗਾਤਾਰ ਨਿਗਰਾਨੀ ਕਰੋ**
4. **ਉਤਪਾਦਨ ਵਰਕਲੋਡ ਲਈ ਰਿਜ਼ਰਵਡ ਕੈਪੈਸਿਟੀ ਦਾ ਲਾਭ ਲਓ**
5. **ਜਿੱਥੇ ਯੋਗ ਹੋਵੇ ਆਟੋ-ਸਕੇਲਿੰਗ ਲਾਗੂ ਕਰੋ**
6. **ਇਕ ਨਿਯਮਤ ਵਰਕਲੋਡ ਨਾਲ ਪਰਦਰਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ**
7. **ਵਿਕਾਸ ਦੀ ਯੋਜਨਾ ਬਣਾਓ ਪਰ ਜ਼ਰੂਰਤ ਤੋਂ ਵੱਧ ਪ੍ਰੋਵੀਜ਼ਨ ਨਾ ਕਰੋ**
8. **ਵਿਕਾਸ ਲਈ ਮੋਫ਼ਤ ਟੀਅਰਾਂ ਦਾ ਲਾਭ ਲਓ ਜਦੋਂ ਸੰਭਵ ਹੋਵੇ**

### ਨਾ ਕਰੋ

1. **ਵਿਕਾਸ ਲਈ ਉਤਪਾਦਨ SKU ਨਾ ਵਰਤੋਂ**
2. **ਖੇਤਰੀ SKU ਉਪਲਬਧਤਾ ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਨਾ ਕਰੋ**
3. **ਡੇਟਾ ਟ੍ਰਾਂਸਫਰ ਦੀਆਂ ਲਾਗਤਾਂ ਨਾ ਭੁੱਲੋ**
4. **ਬਿਨਾ ਜੁਸਟਿਫਿਕੇਸ਼ਨ ਦੇ ਜ਼ਿਆਦਾ ਪ੍ਰੋਵੀਜ਼ਨ ਨਾ ਕਰੋ**
5. **ਨਿਰਭਰਤਾਵਾਂ ਦੇ ਪ੍ਰਭਾਵ ਨੂੰ ਨਜ਼ਰਅੰਦਾਜ਼ ਨਾ ਕਰੋ**
6. **ਆਟੋ-ਸਕੇਲਿੰਗ ਹੱਦਾਂ ਨੂੰ ਬਹੁਤ ਉੱਚਾ ਨਾ ਰੱਖੋ**
7. **ਕੰਪਲਾਇੰਸ ਲੋੜਾਂ ਨੂੰ ਨਾ ਭੁੱਲੋ**
8. **ਕੇਵਲ ਕੀਮਤ ਦੇ ਆਧਾਰ ’ਤੇ ਫੈਸਲੇ ਨਾ ਕਰੋ**

---

**ਪ੍ਰੋ ਟਿਪ**: Azure ਲਾਗਤ ਪ੍ਰਬੰਧਨ ਅਤੇ ਸਲਾਹਕਾਰ ਦੀ ਵਰਤੋਂ ਕਰੋ ਤਾਂ ਜੋ ਤੁਹਾਡੇ SKU ਚੋਣਾਂ ਦੀ ਅਸਲੀ ਵਰਤੋਂ ਦੇ ਅਧਾਰ 'ਤੇ ਨਿੱਜੀ ਸਿਫਾਰਸ਼ਾਂ ਮਿਲ ਸਕਣ।

---

**ਮਾਰਗਦਰਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਕੈਪੈਸਿਟੀ ਪਲੈਨਿੰਗ](capacity-planning.md)
- **ਅਗਲਾ ਪਾਠ**: [ਪ੍ਰੀਫਲਾਈਟ ਚੈੱਕਸ](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
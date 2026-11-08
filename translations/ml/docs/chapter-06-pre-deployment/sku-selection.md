# SKU തിരഞ്ഞെടുപ്പ് ഗൈഡ് - ശരിയായ ആസ്യൂർ സർവീസ് ടിയർ തിരഞ്ഞെടുക്കൽ

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 ഇപ്പോഴത്തെ അധ്യായം**: Chapter 6 - പ്രീ-ഡിപ്ലോയ്മെന്റ് വാലിഡേഷൻ & പ്ലാനിംഗ്
- **⬅️ മுந்தയത്**: [Capacity Planning](capacity-planning.md)
- **➡️ അടുത്തത്**: [Pre-flight Checks](preflight-checks.md)
- **🚀 അടുത്ത അധ്യായം**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

## പരിചയം

വിവിധ പരിസരങ്ങൾ, വർക്ക്‌ലോഡുകൾ, ആവശ്യങ്ങൾ എന്നിവയ്ക്കായി അനുയോജ്യമായ ആസ്യൂർ സർവീസ് SKUs (സ്റ്റോക്ക് കീപ്പിങ് യൂണിറ്റുകൾ) തിരഞ്ഞെടുക്കാൻ സഹായിക്കുന്ന സമഗ്രമായ ഗൈഡാണ് ഇത്. പെർഫോർമൻസ് ആവശ്യങ്ങൾ, ചെലവ് പരിഗണനകൾ, സ്കെയലബിലിറ്റി ആവശ്യങ്ങൾ എന്നിവ വിശകലനം ചെയ്ത് നിങ്ങളുടെ ആസ്യൂർ ഡെവലപ്പർ CLI ഡിപ്ലോയ്മെന്റുകൾക്ക് ഏറ്റവും അനുയോജ്യമായ സർവീസ് ടിയറുകൾ തിരഞ്ഞെടുക്കുന്നതിൽ പഠിക്കുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കി നിങ്ങൾ നേടുക:
- ആസ്യൂർ SKU ആശയങ്ങൾ, പ്രൈസിംഗ് മോഡലുകൾ, ഫീച്ചർ വ്യത്യാസങ്ങൾ മനസിലാക്കുക
- ഡെവലപ്മെന്റ്, സ്റ്റേജിംഗ്, പ്രൊഡക്ഷന്‌ സാധാരണമായ പരിസരങ്ങളിൽ SKU തിരഞ്ഞെടുപ്പ് തന്ത്രങ്ങൾ നിപുണമായി
- വർക്ക്‌ലോഡ് ആവശ്യങ്ങൾ വിശകലനം ചെയ്ത് അനുയോജ്യമായ സർവീസ് ടിയറുകളോട് പൊരുത്തപ്പെടുത്തുക
- ബുദ്ധിമുട്ടുള്ള SKU തിരഞ്ഞെടുപ്പിലൂടെ ചെലവ് ഓപ്റ്റിമൈസേഷൻ തന്ത്രങ്ങൾ നടപ്പിലാക്കുക
- SKU തിരഞ്ഞെടുപ്പിനായുള്ള പെർഫോർമൻസ് ടസ്റ്റിംഗ്, വാലിഡേഷൻ സാങ്കേതികവിദ്യകൾ പ്രയോഗിക്കുക
- ഓട്ടോമേറ്റഡ് SKU რეკമൻഡേഷൻസും മോണിറ്ററിംഗും കോൺഫിഗർ ചെയ്യുക

## പഠന ഫലങ്ങൾ

പൂർത്തിയായതിന് ശേഷം നിങ്ങൾക്ക് കഴിയും:
- വർക്ക്‌ലോഡ് ആവശ്യങ്ങൾക്കും നിയന്ത്രണങ്ങൾക്കുമനുസരിച്ച് അനുയോജ്യമായ ആസ്യൂർ സർവീസ് SKUs തെരഞ്ഞെടുക്കുക
- ശരിയായ ടിയർ തിരഞ്ഞെടുപ്പ് കൊണ്ട് ചെലവ്-പ്രഭാവിയായ മൾട്ടി-പരിസര ആർക്കിടെക്ചറുകൾ രൂപകൽപ്പന ചെയ്യുക
- SKU തിരഞ്ഞെടുപ്പിനായി പെർഫോർമൻസ് ബഞ്ച്മാർക്കിംഗ്, വാലിഡേഷൻ നടപ്പിലാക്കുക
- SKU ശിപാർശകളും ചെലവ് ഓപ്റ്റിമൈസേഷനും വേണ്ടി ഓട്ടോമേറ്റഡ് ഉപകരണങ്ങൾ സൃഷ്ടിക്കുക
- ആവശ്യങ്ങൾ മാറുമ്പോൾ SKU മൈഗ്രേഷനുകളും സ്കെയ്ലിംഗ് തന്ത്രങ്ങളും പദ്ധതിയിടുക
- സർവീസ് ടിയർ തിരഞ്ഞെടുപ്പിനായി ആസ്യൂർ വെൽ-ആർക്കിടെക്ടഡ് ഫ്രെയിംവർക്കിന്റെ സിദ്ധാന്തങ്ങൾ പ്രയോഗിക്കുക

## ഉള്ളടക്ക പട്ടിക

- [SKUകൾ മനസ്സിലാക്കൽ](#understanding-skus)
- [പരിസരത്തിന്റെ അടിസ്ഥാനത്തിൽ തിരഞ്ഞെടുപ്പ്](#environment-based-selection)
- [സർവീസ്-സവിശേഷ മാർഗനിർദ്ദേശങ്ങൾ](#service-specific-guidelines)
- [ചെലവ് ഓപ്റ്റിമൈസേഷൻ തന്ത്രങ്ങൾ](#cost-optimization-strategies)
- [പെർഫോർമൻസ് പരിഗണനകൾ](#performance-considerations)
- [ക്വിക് റിഫറൻസ് ടേബിളുകൾ](#quick-reference-tables)
- [വാലിഡേഷൻ ഉപകരണങ്ങൾ](#validation-tools)

---

## SKUകൾ മനസ്സിലാക്കൽ

> **ഉദാഹരണ പരിധി:** താഴെ ഉള്ള YAML SKU മാപുകളും പെർഫോർമൻസ് കോൺഫിഗറേഷനുകളും നിർമ്മാണ കുറിപ്പുകളാണ്, `azure.yaml` സ്കീമ അല്ല അല്ലെങ്കിൽ ലോഡ്-ടൂൾ കോൺഫിഗറേഷൻ. ബൈcep ബ്ലോകുകൾ ബദൽ/ഭാഗങ്ങളാണ്: അവയുടെ പാരാമീറ്ററുകളും മാതൃക ռിസോഴ്‌സുകളും പ്രഖ്യാപിക്കുക, അവ ചേർക്കുമ്പോൾ വ്യത്യസ്ത സാങ്കേതിക പേരുകൾ ഉപയോഗിക്കുക, പ്രോജക്റ്റിൽ മോഡ്യൂളുകൾ കണക്റ്റ് ചെയ്യുക. വിലകൾ, ലിമിറ്റുകൾ, പ്രദേശം/SKU ലഭ്യത നിങ്ങളുടെ സബ്സ്ക്രിപ്ഷനിൽ പരിശോധിക്കേണ്ടതാണ് ഡിപ്ലോയ്മെന്റിന് മുൻപ്.

### SKUകൾ എന്താണ്?

SKUകൾ (Stock Keeping Units) ആസ്യൂർ റിസോഴ്‌സുകൾക്ക് വ്യത്യസ്ത സർവീസ് ടിയറുകളും പെർഫോർമൻസ് തലങ്ങളിലും പ്രതിനിധാനം ചെയ്യുന്നു. ഓരോ SKU മുതലായി ലഭ്യമാണ്:

- **പെർഫോർമൻസ് ഗുണങ്ങൾ** (CPU, മെമ്മറി, ത്രൂപുട്ട്)
- **ഫീച്ചർ ലഭ്യത** (സ്കെയിലിംഗ് ഓപ്ഷനുകൾ, SLA തലങ്ങൾ)
- **വിലമാന മാതൃകകൾ** (ഉപഭോഗ-അടിസ്ഥാനമാക്കിയ, റിസർവ് ചെയ്ത ശേഷിയുള്ള)
- **പ്രാദേശിക ലഭ്യത** (എല്ലാ പ്രദേശത്തും എല്ലാ SKUകളും ലഭ്യമല്ല)

### SKU തിരഞ്ഞെടുപ്പിലെ പ്രധാന കാരക്റ്ററുകൾ

1. **വർക്ക്‌ളോഡ് ആവശ്യങ്ങൾ**
   - പ്രതീക്ഷിക്കുന്ന ട്രാഫിക്/ലോഡ് പാറ്റേണുകൾ
   - പെർഫോർമൻസ് ആവശ്യങ്ങൾ (CPU, മെമ്മറി, I/O)
   - സ്റ്റോറേജ് ആവശ്യകതകൾ, ആക്‌സസ് പാറ്റേണുകൾ

2. **പരിസര തരം**
   - ഡെവലപ്പ്മെന്റ്/ടസ്റ്റിംഗ് ವಿರುದ್ಧ പ്രൊഡക്ഷൻ
   - ലഭ്യത ആവശ്യങ്ങൾ
   - സുരക്ഷയും അനുസരണാനിർദ്ദേശങ്ങളും

3. **ബജറ്റ് നിയന്ത്രണങ്ങൾ**
   - ആദ്യം ചിലവുകളും ഓപ്പറേഷൻ ചിലവുകളും
   - റിസർവ് ചെയ്ത ശേഷിയുള്ള ഡിസ്കൗണ്ടുകൾ
   - ഓട്ടോ-സ്കെയിലിംഗ് ചെലവുകളുടെ ഫലങ്ങൾ

4. **വളർച്ച പ്രവചനങ്ങൾ**
   - സ്കെയിലബിലിറ്റി ആവശ്യങ്ങൾ
   - ഭാവിയിലെ ഫീച്ചർ ആവശ്യങ്ങൾ
   - മൈഗ്രേഷൻ സങ്കീർണത

---

## പരിസരത്തിന്റെ അടിസ്ഥാനത്തിൽ തിരഞ്ഞെടുപ്പ്

### ഡെവലപ്പ്മെന്റ് പരിസരം

**മுக்கியത്വങ്ങൾ**: ചെലവ് ഓപ്റ്റിമൈസേഷൻ, അടിസ്ഥാന പ്രവർത്തനം, എളുപ്പത്തിലുള്ള പ്രൊവിഷനിങ്/ഡീ-പ്രൊവിഷനിങ്

#### ശിപാർശ ചെയ്ത SKUകൾ
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

#### ലക്ഷണങ്ങൾ
- **ആപ്പ് സർവീസ്**: എളുപ്പമായ പരിശോധനയ്ക്ക് F1 (ഫ്രീ) അല്ലെങ്കിൽ B1 (ബേസിക്ക്)
- **ഡാറ്റാബേസുകൾ**: കുറഞ്ഞ സ്രോതസസഹിതം ബേസിക്ക് ടിയർ
- **സ്റ്റോറേജ്**: ലോക്കൽ റെഡണ്ടൻസിയോടു കൂടിയ സ്റ്റാൻഡേർഡ്
- **കമ്പ്യൂട്ട്**: ഷെയർ ചെയ്ത സ്രോതസുകൾ അംഗീകരിക്കപ്പെടുന്നു
- **നെറ്റ്‌വർക്കിംഗ്**: അടിസ്ഥാന കോൺഫിഗറേഷനുകൾ

### സ്റ്റേജിംഗ്/ടസ്റ്റിംഗ് പരിസരം

**മികച്ചത്വങ്ങൾ**: പ്രൊഡക്ഷൻ പോലെ കോൺഫിഗറേഷൻ, ചെലവ് തുല്യനില, പെർഫോർമൻസ് പരിശോധനാ ശേഷി

#### ശിപാർശ ചെയ്ത SKUകൾ
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

#### ലക്ഷണങ്ങൾ
- **പെർഫോർമൻസ്**: 70-80% പ്രൊഡക്ഷൻ ശേഷി
- **ഫീച്ചറുകൾ**: മിക്ക പ്രൊഡക്ഷൻ ഫീച്ചറുകളും പ്രവർത്തനക്ഷമം
- **റെഡണ്ടൻസി**: ചില പ്രദേശിക റെഡണ്ടൻസി
- **സ്കെയിലിംഗ്**: ടെസ്റ്റിംഗിന് പരിമിതമായ ഓട്ടോ-സ്കെയിലിംഗ്
- **മോണിറ്ററിംഗ്**: സമ്പൂർണ്ണ മോണിറ്ററിംഗ് സ്റ്റാക്

### പ്രൊഡക്ഷൻ പരിസരം

**മികച്ചത്വങ്ങൾ**: പെർഫോർമൻസ്, ലഭ്യത, സുരക്ഷ, അനുസരണം, സ്കെയിലബിലിറ്റി

#### ശിപാർശ ചെയ്ത SKUകൾ
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

#### ലക്ഷണങ്ങൾ
- **ഉയർന്ന ലഭ്യത**: 99.9%+ SLA ആവശ്യകതകൾ
- **പെർഫോർമൻസ്**: സമർപ്പിച്ച സ്രോതസ്സുകൾ, ഉയർന്ന ത്രൂപുട്ട്
- **സുരക്ഷ**: പ്രീമിയം സുരക്ഷാ സവിശേഷതകൾ
- **സ്കെയിലിംഗ്**: പൂർണ്ണ ഓട്ടോ-സ്കെയിലിംഗ് കഴിവുകൾ
- **മോണിറ്ററിംഗ്**: സമഗ്രമായ നിരീക്ഷണം

---

## സർവീസ്-സവിശേഷ മാർഗനിർദ്ദേശങ്ങൾ

### ആസ്യൂർ ആപ്പ് സർവീസ്

#### SKU തീരുമാനമാറ്റ്രിക്സ്

| ഉപയോഗകേസ് | ശിപാർശ ചെയ്ത SKU | കാരണവിശദാംശം |
|----------|----------------|-----------|
| ഡെവലപ്പ്മെന്റ്/ടസ്റ്റിംഗ് | F1 (ഫ്രീ) അല്ലെങ്കിൽ B1 (ബേസിക്ക്) | ചെലവ്-പ്രഭാവവത്കരണം, പരിശോധനയ്ക്കു പറ്റിയുള്ളത് |
| ചെറിയ പ്രൊഡക്ഷൻ ആപ്പുകൾ | S1 (സ്റ്റാൻഡേർഡ്) | കസ്റ്റം ഡൊമെയിൻസ്, SSL, ഓട്ടോ-സ്കെയിലിംഗ് |
| മധ്യമ നിലവാര പ്രൊഡക്ഷൻ ആപ്പുകൾ | P1V3 (പ്രീമിയം V3) | ഉന്നത പ്രകടനം, കൂടുതൽ സവിശേഷതകൾ |
| ഉയർന്ന ട്രാഫിക് ആപ്പുകൾ | P2V3 അല്ലെങ്കിൽ P3V3 | സമർപ്പിച്ച സ്രോതസ്സുകൾ, ഉയർന്ന പ്രകടനം |
| മിഷൻ-ക്രിട്ടിക്കൽ ആപ്പുകൾ | I1V2 (ഐസോലേറ്റഡ് V2) | നെറ്റ്‌വർക്ക് ഐസൊലേഷൻ, സമർപ്പിച്ച ഹാർഡ്വെയർ |

#### കോൺഫിഗറേഷന്‍ ഉദാഹരണങ്ങൾ

**ഡെവലപ്പ്മെന്റ്**
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

**പ്രൊഡക്ഷൻ**
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

### ആസ്യൂർ SQL ഡാറ്റാബേസ്

#### SKU തിരഞ്ഞെടുപ്പ് ഘടന

1. **DTU-അധിഷ്ഠിതം (ഡാറ്റാബേസ് ട്രാൻസാക്ഷൻ യൂണിറ്റുകൾ)**
   - **ബേസിക്ക്**: 5 DTU - ഡെവലപ്പ്മെന്റ്/ടസ്റ്റിംഗ്
   - **സ്റ്റാൻഡേർഡ്**: S0-S12 (10-3000 DTU) - ജനറൽ പർപ്പസ്
   - **പ്രീമിയം**: P1-P15 (125-4000 DTU) - പെർഫോർമൻസ്-ക്രിട്ടിക്കൽ

2. **vCore-അധിഷ്ഠിതം** (പ്രൊഡക്ഷന് വേണ്ട ശിപാർശ)
   - **ജനറൽ പർപ്പസ്**: ബാലൻസുചെയ്‌ത കമ്പ്യൂട്ട്, സ്റ്റോറേജ്
   - **ബിസിനസ് ക്രിട്ടിക്കൽ**: കുറഞ്ഞ ലെയ്റ്റൻസി, ഉയർന്ന IOPS
   - **ഹൈപർസ്‌കെയിൽ**: ഉയർന്ന സ്കെയിലബിള്‍ സ്റ്റോറേജ്; നിലവിലെ വലുപ്പ പരിധികളും പ്രദേശിക പിന്തുണയും പരിശോധിക്കുക

#### കോൺഫിഗറേഷൻ ഉദാഹരണങ്ങൾ

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

### ആസ്യൂർ കണ്ടെയ്നർ ആപ്പുകൾ

#### പരിസര തരം

1. **ഉപഭോഗം അടിസ്ഥാനമാക്കിയുള്ള**
   - ഉപഭോഗം അനുസരിച്ച് പണം നൽകൽ
   - ഡെവലപ്പ്മെന്റിനും വ്യത്യസ്ത വർക്ക്‌ലോഡുകൾക്കും അനുയോജ്യം
   - പങ്കുവെച്ച അടിസ്ഥാനസൗകര്യം

2. **സമർപ്പിച്ച (വർക്ക്‌ലോഡ് പ്രൊഫൈൽ)**
   - സമർപ്പിച്ച കമ്പ്യൂട്ട് സ്രോതസ്സുകൾ
   - പ്രവചനീയമായ പെർഫോർമൻസ്
   - പ്രൊഡക്ഷൻ വർക്ക്‌ലോഡുകൾക്കു മേൽ

#### കോൺഫിഗറേഷൻ ഉദാഹരണങ്ങൾ

**ഡെവലപ്പ്മെന്റ് (ഉപഭോഗം)**
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

**പ്രൊഡക്ഷൻ (സമർപ്പിച്ച)**
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

സോൺ റെഡണ്ടൻസി പിന്തുണയ്ക്കുന്ന പ്രദേശ ഇൻഫ്രാസ്ട്രക്ചറിയും അനുയോജ്യമായ VNet/സബ്നെറ്റ് കോൺഫിഗറേഷനും ആവശ്യമാണ്, ഇവ ഇവിടെ ഒഴിവാക്കിയിരിക്കുന്നു. ഈ ഉദാഹരണം മൂന്ന് സമർപ്പിച്ച നോഡുകൾക്ക് ബജറ്റ് വച്ചിരിക്കുന്നു; ക്രോസ്-സോൺ വിതരണത്തിനായി കുറഞ്ഞപക്ഷം രണ്ട് ആപ്പ് റെപ്ലിക്കകൾ കോൺഫിഗർ ചെയ്യുക, സോൺ പരാജയങ്ങൾക്ക് വേണ്ടി റെപ്ലിക്കയും നോഡുകളും വലുപ്പമിടുക. [Container Apps വിശ്വാസ്യത മാർഗനിർദ്ദേശം](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps) കാണുക. ഒരു ആപ്പ് ഈ പ്രൊഫൈലിൽ സ്ഥാപിക്കാൻ, അതിന്റെ `workloadProfileName: 'production-profile'` എടുക്കുക; പ്രൊഫൈൽ മാത്രം സൃഷ്ടിക്കുന്നത് ആപ്പുകൾ അവിടേക്ക് മാറ്റുകയല്ല.

### ആസ്യൂർ കോസ്മോസ് ഡിബി

#### ത്രൂപുട്ട് മോഡലുകൾ

1. **മാന്വൽ പ്രൊവിഷൻഡ് ത്രൂപുട്ട്**
   - പ്രവചനീയ പ്രകടനം
   - റിസർവ് ചെയ്ത ശേഷിയുള്ള ഡിസ്കൗണ്ടുകൾ
   - സ്ഥിരമായ വർക്ക്‌ലോഡുകൾക്ക് മികച്ചത്

2. **ഓട്ടോസ്കെയിൽ പ്രൊവിഷൻഡ് ത്രൂപുട്ട്**
   - ഉപയോഗം അടിസ്ഥാനമാക്കി തനതു സ്കെയിലിംഗ്
   - നിങ്ങൾ ഉപയോഗിക്കുന്നതിനു പണം നൽകുക (നെറസ്റ്റ് മിനിമം സഹിതം)
   - വ്യത്യസ്ത വർക്ക്‌ലോഡുകൾക്ക് നല്ലത്

3. **സെർവർലെസ്**
   - അഭ്യർത്ഥനപ്രതി പണം നൽകുക
   - പ്രൊവിഷൻഡ് ത്രൂപുട്ട് ഇല്ല
   - വികസനത്തിനും ഇടവിടെയുള്ള വർക്ക്‌ലോഡുകൾക്കും അനുയോജ്യം

#### SKU ഉദാഹരണങ്ങൾ

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

### ആസ്യൂർ സ്റ്റോറേജ് അക്കൗണ്ട്

#### സ്റ്റോറേജ് അക്കൗണ്ട് തരം

1. **സ്റ്റാൻഡേർഡ്_LRS** - ഡെവലപ്പ്മെന്റ്, അത്യാവശ്യമല്ലാത്ത ഡേറ്റാഗൾ
2. **സ്റ്റാൻഡേർഡ്_GRS** - പ്രൊഡക്ഷൻ, ജിയോ-റെഡണ്ടൻസി ആവശ്യമായപ്പോൾ
3. **പ്രീമിയം_LRS** - ഉയർന്ന പ്രകടന ആവശ്യങ്ങൾ
4. **പ്രീമിയം_ZRS** - സോൺ റെഡണ്ടൻസിയുള്ള ഉയർന്ന ലഭ്യത

#### പെർഫോർമൻസ് ടിയറുകൾ

- **സ്റ്റാൻഡേർഡ്**: പൊതുവായ ഉപയോഗം, ചെലവ്-സുകൃതം
- **പ്രീമിയം**: ഉയർന്ന പ്രകടനവും കുറഞ്ഞ ലെയ്റ്റൻസിയും ആവശ്യമായ സ്ഥിതികൾ

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

## ചെലവ് ഓപ്റ്റിമൈസേഷൻ തന്ത്രങ്ങൾ

### 1. റിസർവ് ചെയ്ത ശേഷി

1-3 വർഷം വരെ സ്രോതസുകൾ റിസർവ് ചെയ്ത് വ്യത്യസ്തമായ ഡിസ്കൗണ്ടുകൾ നേടുക:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

റിസർവേഷൻ ഓഫറുകളും യോഗ്യമായ റിസോഴ്‌സ് തരങ്ങളും വ്യത്യസ്തമാണ്; ഓരോ സർവീസ്/SKUയും റിസർവേഷൻ പിന്തുണയ്ക്കുമെന്ന് അനുമാനിക്കാതെ കാറ്റലോഗും വാങ്ങൽ നിബന്ധനകളും പരിശോധിക്കുക.

### 2. ശരിയായ വലിപ്പം തെരഞ്ഞെടുപ്പു

ചെറിയ SKUs ഉപയോഗിച്ച് ആരംഭിച്ച് യാഥാർത്ഥ്യ ഉപയോഗം അനുസരിച്ച് വലുതാക്കുക:

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

### 3. ഓട്ടോ-സ്കെയിലിംഗ് കോൺഫിഗറേഷൻ

ചെലവ് ഓപ്റ്റിമൈസേഷനായി ബുദ്ധിമുട്ടുള്ള സ്കെയിലിംഗ് നടപ്പിലാക്കുക:

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

### 4. നിശ്ചിത സ്കെയിലിംഗ്

ഓഫ്ലൈൻ സമയങ്ങളിൽ വലിപ്പം കുറയ്ക്കുക:

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

## പെർഫോർമൻസ് പരിഗണനകൾ

### അടിസ്ഥാന പെർഫോർമൻസ് ആവശ്യങ്ങൾ

SKU തിരഞ്ഞെടുക്കുന്നതിന് മുമ്പായി വ്യക്തമായ പെർഫോർമൻസ് ആവശ്യങ്ങൾ നിർവചിക്കുക:

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

### ലോഡ് ടെസ്റ്റിംഗ്

വ്യത്യസ്ത SKUs പരീക്ഷിച്ച് പെർഫോർമൻസ് സ്ഥിരീകരിക്കുക:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### നിരീക്ഷണവും ഓപ്റ്റിമൈസേഷനും

സമ്പൂർണ്ണമായ മോണിറ്ററിംഗ് ഒരുക്കുക:

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

## ക്വിക് റിഫറൻസ് ടേബിളുകൾ

### ആപ്പ് സർവീസ് SKU ശീഘ്രം റിഫറൻസ്

| SKU | ടിയർ | vCPU | RAM | സ്റ്റോറേജ് | വില പരിധി | ഉപയോഗകേസ് |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ഫ്രീ | ഷെയർഡ് | 1GB | 1GB | ഫ്രീ | ഡെവലപ്പ്മെന്റ് |
| B1 | ബേസിക്ക് | 1 | 1.75GB | 10GB | $ | ചെറിയ ആപ്പുകൾ |
| S1 | സ്റ്റാൻഡേർഡ് | 1 | 1.75GB | 50GB | $$ | പ്രൊഡക്ഷൻ |
| P1V3 | പ്രീമിയം V3 | 2 | 8GB | 250GB | $$$ | ഉയർന്ന പ്രകടനം |
| I1V2 | ഐസൊലേറ്റഡ് V2 | 2 | 8GB | 1TB | $$$$ | എന്റർപ്രൈസ് |

### SQL ഡാറ്റാബേസ് SKU ശീഘ്രം റിഫറൻസ്

| SKU | ടിയർ | DTU/vCore | സ്റ്റോറേജ് | വില പരിധി | ഉപയോഗകേസ് |
|-----|------|-----------|---------|-------------|----------|
| ബേസിക്ക് | ബേസിക്ക് | 5 DTU | 2GB | $ | ഡെവലപ്പ്മെന്റ് |
| S2 | സ്റ്റാൻഡേർഡ് | 50 DTU | 250GB | $$ | ചെറിയ പ്രൊഡക്ഷൻ |
| P2 | പ്രീമിയം | 250 DTU | 1TB | $$$ | ഉയർന്ന പ്രകടനം |
| GP_Gen5_4 | ജനറൽ പർപ്പസ് | 4 vCore | 4TB | $$$ | ബാലൻസ്ഡ് |
| BC_Gen5_8 | ബിസിനസ് ക്രിട്ടിക്കൽ | 8 vCore | 4TB | $$$$ | മിഷൻ ക്രിട്ടിക്കൽ |

### കണ്ടെയ്നർ ആപ്പുകൾ SKU ശീഘ്രം റിഫറൻസ്

| മോഡൽ | പ്രൈസിംഗ് | CPU/മെമ്മറി | ഉപയോഗകേസ് |
|-------|---------|------------|----------|
| ഉപഭോഗം | ഉപഭോഗം അനുസരിച്ച് പണം നൽകൽ | പരിസര/പ്രൊഫൈൽ അടിസ്ഥാനമാക്കിയുള്ള പിന്തുണയുള്ള CPU/മെമ്മറി കോമ്പിനേഷൻ | ഡെവലപ്പ്മെന്റ് അല്ലെങ്കിൽ പ്രൊഡക്ഷൻ, വ്യത്യസ്ത ലോഡ് |
| സമർപ്പിച്ച D4 | സമർപ്പിച്ച നോഡ് ബില്ലിംഗ് | 4 vCPU, 16GiB प्रति നോഡ് | സ്ഥിരമുണ്ട് ലോഡ്/ഐസൊലേഷൻ ആവശ്യങ്ങൾ |
| സമർപ്പിച്ച D8 | സമർപ്പിച്ച നോഡ് ബില്ലിംഗ് | 8 vCPU, 32GiB प्रति നോഡ് | ഉയർന്ന സ്ഥിരമായ ലോഡ് |

---

## വാലിഡേഷൻ ഉപകരണങ്ങൾ

### SKU ലഭ്യത പരിശോധകൻ

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

### ചെലവ് കണക്കാക്കൽ സ്ക്രിപ്റ്റ്

**പ്യൂഡോകോഡ് മാത്രം:** താഴെക്കൊടുത്തിരിക്കുന്ന `Get-ResourceCost` ഒരു പ്രോജക്റ്റ്-സവിശേഷ ഫംഗ്ഷനാണ്, നിങ്ങളുടെ നിലവിലെ പ്രദേശിക/കരാറിലേതായ പ്രയോജനവും വിലയും അനുസരിച്ച് നടപ്പിലാക്കേണ്ടത്. ഇത് ഒരു പവർഷെൽ അല്ലെങ്കിൽ ആസ്യൂർ കമാൻഡ്‌ലെറ്റ് അല്ല.

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

### പെർഫോർമൻസ് വാലിഡേഷൻ

ഈ YAML ആവശ്യകതകൾ രേഖയാണു, **ആസ്യൂർ ലോഡ് ടെസ്റ്റിംഗ്, JMeter, Locust, അല്ലെങ്കിൽ k6 ഇൻപുട്ട് സ്കീമ അല്ല**. ഇത് നിങ്ങളുടെ തിരഞ്ഞെടുക്കുന്ന ടൂളിന്റെ യഥാർത്ഥ കോൺഫിഗറേഷനായി തർജ്ജമ ചെയ്ത് മുകളിൽ കമാൻഡ് ഉപയോഗിച്ച് ലോഡ്-ടെസ്റ്റ് നടത്തുക.

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

## മികച്ച പ്രയോഗങ്ങളുടെ സംക്ഷേപം

### ചെയ്യേണ്ട കാര്യങ്ങൾ

1. **ചെറുതായി ആരംഭിച്ച് യഥാർത്ഥ ഉപയോഗം അനുസരിച്ച് വലുതാക്കുക**
2. **വ്യത്യസ്ത പരിസരങ്ങൾക്ക് വ്യത്യസ്ത SKUകൾ ഉപയോഗിക്കുക**
3. **പെർഫോർമൻസ്, ചെലവുകൾ നിരന്തരം നിരീക്ഷിക്കുക**
4. **പ്രൊഡക്ഷനായി റിസർവ് ചെയ്ത ശേഷി ഉപയോഗിക്കുക**
5. **ആവശ്യത്തിന് ഓട്ടോ-സ്കെയിലിംഗ് നടപ്പിലാക്കുക**
6. **യഥാർത്ഥ വർക്ക്‌ലോഡുകളോടെ പെർഫോർമൻസ് പരീക്ഷണം നടത്തുക**
7. **വളർച്ചക്ക് പദ്ധതിയിടുക, എന്നാൽ过മാത്രമായി സംഭരണമിടരുത്**
8. **ഡെവലപ്പ്മെന്റിനായി സൗജന്യ ടിയറുകൾ ഉപയോഗിക്കുക**

### ചെയ്യാൻ പാടില്ലാത്ത കാര്യങ്ങൾ

1. **ഡെവലപ്പ്മെന്റിന് പ്രൊഡക്ഷൻ SKUകൾ ഉപയോഗിക്കുന്നതു ഒഴിവാക്കുക**
2. **പ്രാദേശിക SKU ലഭ്യതയെ അവഗണിക്കരുത്**
3. **ഡേറ്റാ ട്രാൻസ്ഫർ ചെലവുകൾ മറക്കരുത്**
4. **കാരണമില്ലാതെ过മാത്രമായി സംഭരണമിടരുത്**
5. **അവലംബങ്ങളുടെ സ്വാധീനം അവഗണിക്കരുത്**
6. **ഓട്ടോ-സ്കെയിലിംഗ് പരിധികൾ വളരെ ഉയർന്ന് നിർത്തരുത്**
7. **അനുസരണ ആവശ്യങ്ങൾ മറക്കരുത്**
8. **വില മാത്രം അടിസ്ഥാനമാക്കി തീരുമാനങ്ങളെടുക്കരുത്**

---

**പ്രോ ടിപ്പ്**: നിങ്ങളുടെ യഥാർത്ഥ ഉപയോഗ പാറ്റേണുകളെ അടിസ്ഥാനമാക്കി SKU തിരഞ്ഞെടുപ്പുകൾ മെച്ചപ്പെടുത്താൻ ആസ്യൂർ ചെലവ് മേധാവിത്വവും ആഡ്വൈസറും ഉപയോഗിക്കുക.

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [Capacity Planning](capacity-planning.md)
- **അടുത്ത പാഠം**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
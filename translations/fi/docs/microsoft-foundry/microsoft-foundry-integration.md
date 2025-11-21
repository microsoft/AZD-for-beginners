<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-21T19:20:52+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "fi"
}
-->
# Microsoft Foundry - Integraatio AZD:n kanssa

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensimmäinen Kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../getting-started/first-project.md)
- **➡️ Seuraava**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)

## Yleiskatsaus

Tämä opas näyttää, kuinka Microsoft Foundry -palvelut integroidaan Azure Developer CLI:n (AZD) kanssa AI-sovellusten käyttöönoton tehostamiseksi. Microsoft Foundry tarjoaa kattavan alustan AI-sovellusten rakentamiseen, käyttöönottoon ja hallintaan, kun taas AZD yksinkertaistaa infrastruktuurin ja käyttöönoton prosessia.

## Mikä on Microsoft Foundry?

Microsoft Foundry on Microsoftin yhtenäinen alusta AI-kehitykseen, joka sisältää:

- **Mallikatalogi**: Pääsy huippuluokan AI-malleihin
- **Prompt Flow**: Visuaalinen suunnittelutyökalu AI-työnkuluille
- **AI Foundry -portaali**: Integroitu kehitysympäristö AI-sovelluksille
- **Käyttöönottoasetukset**: Useita isännöinti- ja skaalausvaihtoehtoja
- **Turvallisuus ja vastuullisuus**: Sisäänrakennetut vastuullisen AI:n ominaisuudet

## AZD + Microsoft Foundry: Parempi yhdessä

| Ominaisuus | Microsoft Foundry | AZD-integraation etu |
|------------|-------------------|----------------------|
| **Mallin käyttöönotto** | Manuaalinen portaali | Automatisoidut, toistettavat käyttöönotot |
| **Infrastruktuuri** | Klikkaamalla provisiointi | Infrastructure as Code (Bicep) |
| **Ympäristön hallinta** | Yhden ympäristön painotus | Moniympäristö (kehitys/testaus/tuotanto) |
| **CI/CD-integraatio** | Rajoitettu | Natiivi GitHub Actions -tuki |
| **Kustannusten hallinta** | Perusseuranta | Ympäristökohtainen kustannusoptimointi |

## Esivaatimukset

- Azure-tilaus, jossa on asianmukaiset käyttöoikeudet
- Azure Developer CLI asennettuna
- Pääsy Azure OpenAI -palveluihin
- Perustiedot Microsoft Foundrystä

## Keskeiset integraatiomallit

### Malli 1: Azure OpenAI -integraatio

**Käyttötapaus**: Chat-sovellusten käyttöönotto Azure OpenAI -malleilla

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Infrastruktuuri (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Malli 2: AI-haku + RAG-integraatio

**Käyttötapaus**: Retrieval-augmented generation (RAG) -sovellusten käyttöönotto

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Malli 3: Dokumenttiälyn integraatio

**Käyttötapaus**: Dokumenttien käsittely- ja analyysityönkulut

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Konfigurointimallit

### Ympäristömuuttujien asettaminen

**Tuotantokonfiguraatio:**
```bash
# Keskeiset tekoälypalvelut
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mallin asetukset
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Suorituskykyasetukset
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Kehityskonfiguraatio:**
```bash
# Kustannusoptimoidut asetukset kehitykseen
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ilmainen taso
```

### Turvallinen konfiguraatio Key Vaultilla

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Käyttöönoton työnkulut

### Yhden komennon käyttöönotto

```bash
# Ota kaikki käyttöön yhdellä komennolla
azd up

# Tai ota käyttöön asteittain
azd provision  # Vain infrastruktuuri
azd deploy     # Vain sovellus
```

### Ympäristökohtaiset käyttöönotot

```bash
# Kehitysympäristö
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Tuotantoympäristö
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Seuranta ja havainnointi

### Application Insights -integraatio

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Kustannusseuranta

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

## 🔐 Turvallisuuden parhaat käytännöt

### Hallitun identiteetin konfiguraatio

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Verkkoturvallisuus

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## Suorituskyvyn optimointi

### Välimuististrategiat

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

### Automaattisen skaalaamisen konfiguraatio

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Yleisimpien ongelmien vianmääritys

### Ongelma 1: OpenAI-kiintiö ylittynyt

**Oireet:**
- Käyttöönotto epäonnistuu kiintiövirheiden vuoksi
- 429-virheet sovelluslokissa

**Ratkaisut:**
```bash
# Tarkista nykyinen kiintiön käyttö
az cognitiveservices usage list --location eastus

# Kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia tilapäisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Ongelma 2: Todennusvirheet

**Oireet:**
- 401/403-virheet AI-palveluja kutsuttaessa
- "Pääsy estetty" -viestit

**Ratkaisut:**
```bash
# Vahvista roolien määritykset
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tarkista hallitun identiteetin määritys
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Vahvista Key Vault -pääsy
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Ongelma 3: Mallin käyttöönotto-ongelmat

**Oireet:**
- Mallit eivät ole saatavilla käyttöönotossa
- Tietyt malliversiot epäonnistuvat

**Ratkaisut:**
```bash
# Luettele saatavilla olevat mallit alueittain
az cognitiveservices model list --location eastus

# Päivitä malliversio bicep-mallissa
# Tarkista mallin kapasiteettivaatimukset
```

## Esimerkkimallit

### Perus chat-sovellus

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Palvelut**: Azure OpenAI + Cognitive Search + App Service

**Pika-aloitus**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumenttien käsittelyputki

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Palvelut**: Dokumenttiäly + Tallennus + Funktiot

**Pika-aloitus**:
```bash
azd init --template ai-document-processing
azd up
```

### Yrityschat RAG:lla

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Palvelut**: Azure OpenAI + Haku + Container Apps + Cosmos DB

**Pika-aloitus**:
```bash
azd init --template contoso-chat
azd up
```

## Seuraavat askeleet

1. **Kokeile esimerkkejä**: Aloita valmiilla mallilla, joka vastaa käyttötapaustasi
2. **Mukauta tarpeisiisi**: Muokkaa infrastruktuuria ja sovelluskoodia
3. **Lisää seuranta**: Toteuta kattava havainnointi
4. **Optimoi kustannukset**: Hienosäädä konfiguraatiot budjetillesi
5. **Turvaa käyttöönotto**: Toteuta yritystason turvallisuusmallit
6. **Skaalaa tuotantoon**: Lisää monialue- ja korkean saatavuuden ominaisuuksia

## 🎯 Käytännön harjoitukset

### Harjoitus 1: Azure OpenAI Chat -sovelluksen käyttöönotto (30 minuuttia)
**Tavoite**: Ota käyttöön ja testaa tuotantovalmis AI-chat-sovellus

```bash
# Alusta malli
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Aseta ympäristömuuttujat
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Ota käyttöön
azd up

# Testaa sovellus
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Seuraa tekoälyn toimintaa
azd monitor

# Siivoa
azd down --force --purge
```

**Onnistumisen kriteerit:**
- [ ] Käyttöönotto onnistuu ilman kiintiövirheitä
- [ ] Chat-käyttöliittymä on käytettävissä selaimessa
- [ ] Kysymyksiin voi vastata AI:n avulla
- [ ] Application Insights näyttää telemetriatiedot
- [ ] Resurssit on onnistuneesti siivottu

**Arvioitu kustannus**: $5-10 30 minuutin testaukselle

### Harjoitus 2: Monimallin käyttöönoton konfigurointi (45 minuuttia)
**Tavoite**: Ota käyttöön useita AI-malleja eri konfiguraatioilla

```bash
# Luo mukautettu Bicep-konfiguraatio
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Ota käyttöön ja varmista
azd provision
azd show
```

**Onnistumisen kriteerit:**
- [ ] Useat mallit otettu onnistuneesti käyttöön
- [ ] Eri kapasiteettiasetukset sovellettu
- [ ] Mallit käytettävissä API:n kautta
- [ ] Molempia malleja voi kutsua sovelluksesta

### Harjoitus 3: Kustannusseurannan toteuttaminen (20 minuuttia)
**Tavoite**: Aseta budjettihälytykset ja kustannusseuranta

```bash
# Lisää budjettihälytys Bicepiin
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# Ota budjettihälytys käyttöön
azd provision

# Tarkista nykyiset kustannukset
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Onnistumisen kriteerit:**
- [ ] Budjettihälytys luotu Azureen
- [ ] Sähköposti-ilmoitukset konfiguroitu
- [ ] Kustannustiedot näkyvät Azure-portaalissa
- [ ] Budjettirajat asetettu asianmukaisesti

## 💡 Usein kysytyt kysymykset

<details>
<summary><strong>Kuinka voin vähentää Azure OpenAI -kustannuksia kehityksen aikana?</strong></summary>

1. **Käytä ilmaista tasoa**: Azure OpenAI tarjoaa 50 000 tokenia/kuukausi ilmaiseksi
2. **Vähennä kapasiteettia**: Aseta kapasiteetti 10 TPM:ksi 30+ sijaan kehityksessä
3. **Käytä azd down**: Vapauta resurssit, kun et aktiivisesti kehitä
4. **Välimuisti vastaukset**: Toteuta Redis-välimuisti toistuville kyselyille
5. **Käytä Prompt Engineering**: Vähennä tokenien käyttöä tehokkailla kehotteilla

```bash
# Kehityskonfiguraatio
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mikä ero on Azure OpenAI:n ja OpenAI API:n välillä?</strong></summary>

**Azure OpenAI**:
- Yritystason turvallisuus ja vaatimustenmukaisuus
- Yksityisverkkointegraatio
- SLA-takuut
- Hallitun identiteetin todennus
- Korkeammat kiintiöt saatavilla

**OpenAI API**:
- Nopeampi pääsy uusiin malleihin
- Yksinkertaisempi asennus
- Matala aloituskynnys
- Vain julkinen internet

Tuotantosovelluksille **Azure OpenAI on suositeltava**.
</details>

<details>
<summary><strong>Kuinka käsittelen Azure OpenAI -kiintiö ylittynyt -virheitä?</strong></summary>

```bash
# Tarkista nykyinen kiintiö
az cognitiveservices usage list --location eastus2

# Kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia väliaikaisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Pyydä kiintiön korotusta
# Siirry Azure-portaaliin > Kiintiöt > Pyydä korotusta
```
</details>

<details>
<summary><strong>Voinko käyttää omaa dataani Azure OpenAI:n kanssa?</strong></summary>

Kyllä! Käytä **Azure AI Search** -palvelua RAG:lle (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Katso [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) -malli.
</details>

<details>
<summary><strong>Kuinka turvaan AI-mallin päätepisteet?</strong></summary>

**Parhaat käytännöt**:
1. Käytä hallittua identiteettiä (ei API-avaimia)
2. Ota käyttöön yksityiset päätepisteet
3. Konfiguroi verkkoturvallisuusryhmät
4. Toteuta nopeusrajoitukset
5. Käytä Azure Key Vaultia salaisuuksien hallintaan

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Yhteisö ja tuki

- **Microsoft Foundry Discord**: [#Azure-kanava](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Ongelmat ja keskustelut](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Virallinen dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)

---

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensimmäinen Kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../getting-started/first-project.md)
- **➡️ Seuraava**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)

**Tarvitsetko apua?** Liity yhteisökeskusteluihin tai avaa ongelma repositoriossa. Azure AI + AZD -yhteisö on täällä auttamassa sinua onnistumaan!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Microsoft Foundry -integraatio AZD:n kanssa

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensimmäinen kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Yleiskatsaus

Tämä opas näyttää, miten Microsoft Foundry -palvelut integroidaan Azure Developer CLI:n (AZD) kanssa AI-sovellusten helppoon käyttöönottoon. Microsoft Foundry tarjoaa kattavan alustan AI-sovellusten rakentamiseen, käyttöönottoon ja hallintaan, kun taas AZD yksinkertaistaa infrastruktuuria ja julkaisuprosessia.

## Mikä on Microsoft Foundry?

Microsoft Foundry on Microsoftin yhtenäinen alusta AI-kehitykseen, joka sisältää:

- **Model Catalog**: Pääsy huipputason AI-malleihin
- **Prompt Flow**: Visuaalinen suunnittelija AI-työnkuluille
- **AI Foundry Portal**: Integroitu kehitysympäristö AI-sovelluksille
- **Deployment Options**: Useita isännöinti- ja skaalausvaihtoehtoja
- **Safety and Security**: Sisäänrakennetut vastuullisen AI:n ominaisuudet

## AZD + Microsoft Foundry: Parempia yhdessä

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Esivaatimukset

- Azure-tilaus sopivilla käyttöoikeuksilla
- Azure Developer CLI asennettuna
- Pääsy Azure OpenAI -palveluihin
- Perustuntemus Microsoft Foundrysta

## Keskeiset integraatiomallit

### Malli 1: Azure OpenAI -integraatio

**Käyttötapaus**: Julkaise chat-sovelluksia Azure OpenAI -malleilla

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

### Malli 2: AI-haku + RAG -integraatio

**Käyttötapaus**: Julkaise retrieval-augmented generation (RAG) -sovelluksia

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

### Malli 3: Dokumenttien älykkyys -integraatio

**Käyttötapaus**: Asiakirjojen käsittely- ja analyysityönkulut

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

## 🔧 Konfiguraatiomallit

### Ympäristömuuttujien asetukset

**Tuotantokonfiguraatio:**
```bash
# Tekoälyn keskeiset palvelut
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mallien kokoonpanot
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Suorituskykyasetukset
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Kehityskonfiguraatio:**
```bash
# Kustannustehokkaat asetukset kehitystä varten
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ilmainen taso
```

### Turvallinen konfigurointi Key Vaultin avulla

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

## Julkaisutyönkulut

### Yhden komennon julkaisu

```bash
# Ota kaikki käyttöön yhdellä komennolla
azd up

# Tai ota käyttöön vaiheittain
azd provision  # Vain infrastruktuuri
azd deploy     # Vain sovellus
```

### Ympäristökohtaiset julkaisut

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

## Valvonta ja havaittavuus

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

### Managed Identity -konfigurointi

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

### Verkon suojaus

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

### Automaattisen skaalauksen konfiguraatio

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

## Yleisten ongelmien vianmääritys

### Ongelma 1: OpenAI-kvota ylittynyt

**Oireet:**
- Julkaisu epäonnistuu kvota-virheiden vuoksi
- 429-virheitä sovelluksen lokeissa

**Ratkaisut:**
```bash
# Tarkista kiintiön nykyinen käyttö
az cognitiveservices usage list --location eastus

# Kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia väliaikaisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Ongelma 2: Autentikointivirheet

**Oireet:**
- 401/403-virheitä AI-palveluita kutsuttaessa
- "Pääsy estetty" -viestit

**Ratkaisut:**
```bash
# Varmista roolien määritykset
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tarkista hallinnoidun identiteetin määritys
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Vahvista Key Vaultin käyttöoikeudet
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Ongelma 3: Mallien julkaisuongelmat

**Oireet:**
- Mallit eivät ole saatavilla julkaisussa
- Tiettyjen malliversioiden virheellinen toiminta

**Ratkaisut:**
```bash
# Luettele alueittain saatavilla olevat mallit
az cognitiveservices model list --location eastus

# Päivitä mallin versio Bicep-mallipohjaan
# Tarkista mallin kapasiteettivaatimukset
```

## Esimerkkimallit

### Peruschat-sovellus

**Arkisto**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Palvelut**: Azure OpenAI + Cognitive Search + App Service

**Pika-aloitus**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Asiakirjakäsittelyputki

**Arkisto**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Palvelut**: Document Intelligence + Storage + Functions

**Pika-aloitus**:
```bash
azd init --template ai-document-processing
azd up
```

### Yrityschat RAG:lla

**Arkisto**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Palvelut**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Pika-aloitus**:
```bash
azd init --template contoso-chat
azd up
```

## Seuraavat askeleet

1. **Kokeile esimerkkejä**: Aloita valmiilla mallilla, joka vastaa käyttötapaustasi
2. **Räätälöi tarpeisiisi**: Muokkaa infrastruktuuria ja sovelluskoodia
3. **Lisää valvonta**: Ota käyttöön kattava observoitavuus
4. **Optimoi kustannuksia**: Hienosäädä konfiguraatiot budjetillesi
5. **Varmista käyttöönotto**: Ota käyttöön yritystason turvallisuuskäytännöt
6. **Skaalaa tuotantoon**: Lisää moni-alueinen ja korkean käytettävyyden ominaisuudet

## 🎯 Käytännön harjoitukset

### Harjoitus 1: Ota Azure OpenAI -chat-sovellus käyttöön (30 minuuttia)
**Tavoite**: Ota käyttöön ja testaa tuotantovalmiiksi sovitettu AI-chat-sovellus

```bash
# Alusta mallipohja
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

# Valvo tekoälyn toimintoja
azd monitor

# Siivoa
azd down --force --purge
```

**Onnistumiskriteerit:**
- [ ] Julkaisu suoritetaan ilman kvota-virheitä
- [ ] Pääset chat-käyttöliittymään selaimessa
- [ ] Voit esittää kysymyksiä ja saada AI-vastausten
- [ ] Application Insights näyttää telemetriatietoja
- [ ] Resurssit on onnistuneesti siivottu

**Arvioidut kustannukset**: $5-10 30 minuutin testaukselle

### Harjoitus 2: Määritä moni-mallien julkaisu (45 minuuttia)
**Tavoite**: Julkaise useita AI-malleja eri konfiguraatioilla

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

**Onnistumiskriteerit:**
- [ ] Useita malleja julkaistu onnistuneesti
- [ ] Eri kapasiteettiasetukset käytössä
- [ ] Mallit saatavilla API:n kautta
- [ ] Sovelluksesta voidaan kutsua molempia malleja

### Harjoitus 3: Ota käyttöön kustannusseuranta (20 minuuttia)
**Tavoite**: Määritä budjetti-ilmoitukset ja kustannusseuranta

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

**Onnistumiskriteerit:**
- [ ] Budjettihälytys luotu Azureen
- [ ] Sähköposti-ilmoitukset määritetty
- [ ] Kustannustiedot näkyvissä Azure-portaalissa
- [ ] Budjetin kynnykset asetettu sopivasti

## 💡 Usein kysytyt kysymykset

<details>
<summary><strong>Kuinka vähennän Azure OpenAI -kustannuksia kehityksen aikana?</strong></summary>

1. **Käytä ilmaista tasoa**: Azure OpenAI tarjoaa 50 000 tokenia/kuukausi ilmaiseksi
2. **Vähennä kapasiteettia**: Aseta kapasiteetti kehitystä varten 10 TPM:ään 30+:n sijaan
3. **Käytä azd down**: Poista resurssien allokointi, kun et aktiivisesti kehitä
4. **Välimuistita vastauksia**: Ota Redis-välimuisti käyttöön toistuviin kyselyihin
5. **Käytä prompt-optimointia**: Vähennä tokenien käyttöä tehokkailla kehotteilla

```bash
# Kehitysasetukset
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mikä on ero Azure OpenAI:n ja OpenAI API:n välillä?</strong></summary>

**Azure OpenAI**:
- Yritystason turvallisuus ja vaatimustenmukaisuus
- Yksityisen verkon integraatio
- SLA-takuut
- Managed identity -autentikointi
- Korkeammat kvotat saatavilla

**OpenAI API**:
- Nopeampi pääsy uusiin malleihin
- Yksinkertaisempi käyttöönotto
- Matalampi aloituskynnys
- Julkinen internet-yhteys ainoana vaihtoehtona

Tuotantosovelluksille **Azure OpenAI on suositeltava**.
</details>

<details>
<summary><strong>Kuinka käsittelen Azure OpenAI -kvotan ylitykset?</strong></summary>

```bash
# Tarkista nykyinen kiintiö
az cognitiveservices usage list --location eastus2

# Kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up

# Vähennä kapasiteettia väliaikaisesti
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Pyydä kiintiön nostoa
# Siirry Azure-portaaliin > Kiintiöt > Pyydä korotusta
```
</details>

<details>
<summary><strong>Voinko käyttää omia tietojani Azure OpenAI:n kanssa?</strong></summary>

Kyllä! Käytä **Azure AI Search** -palvelua RAG:iin (Retrieval Augmented Generation):

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
<summary><strong>Kuinka varmistan AI-mallien päätepisteiden turvallisuuden?</strong></summary>

**Parhaat käytännöt**:
1. Käytä Managed Identityä (ei API-avaimia)
2. Ota Private Endpoints käyttöön
3. Konfiguroi verkon suojausryhmät
4. Ota käyttöön rate limiting
5. Käytä Azure Key Vaultia salasanoille

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Virallinen dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)

---

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensimmäinen kehitys
- **⬅️ Edellinen luku**: [Luku 1: Ensimmäinen projektisi](../chapter-01-foundation/first-project.md)
- **➡️ Seuraava**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisökeskusteluihin tai avaa issue arkistossa. Azure AI + AZD -yhteisö on täällä auttaakseen sinua menestymään!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää ensisijaisena ja sitovana lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
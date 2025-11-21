<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a248f574dbb58c1f58a7bcc3f47e361",
  "translation_date": "2025-11-21T00:21:26+00:00",
  "source_file": "docs/microsoft-foundry/production-ai-practices.md",
  "language_code": "tr"
}
-->
# AZD ile Üretim AI İş Yükü En İyi Uygulamaları

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Başlangıç Kılavuzu](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 8 - Üretim ve Kurumsal Kalıplar
- **⬅️ Önceki Bölüm**: [Bölüm 7: Sorun Giderme](../troubleshooting/debugging.md)
- **⬅️ İlgili Bölüm**: [AI Atölye Laboratuvarı](ai-workshop-lab.md)
- **🎯 Kurs Tamamlandı**: [AZD Başlangıç Kılavuzu](../../README.md)

## Genel Bakış

Bu rehber, Azure Developer CLI (AZD) kullanarak üretime hazır AI iş yüklerini dağıtmak için kapsamlı en iyi uygulamaları sunar. Microsoft Foundry Discord topluluğundan alınan geri bildirimler ve gerçek müşteri dağıtımları temel alınarak, bu uygulamalar üretim AI sistemlerindeki en yaygın zorlukları ele alır.

## Ele Alınan Temel Zorluklar

Topluluk anket sonuçlarına göre, geliştiricilerin karşılaştığı en büyük zorluklar şunlardır:

- **%45** çok hizmetli AI dağıtımlarıyla mücadele ediyor
- **%38** kimlik bilgileri ve gizli yönetimi sorunları yaşıyor  
- **%35** üretim hazırlığı ve ölçeklendirmeyi zor buluyor
- **%32** daha iyi maliyet optimizasyon stratejilerine ihtiyaç duyuyor
- **%29** izleme ve sorun giderme konusunda iyileştirme talep ediyor

## Üretim AI için Mimari Kalıplar

### Kalıp 1: Mikroservisler AI Mimarisi

**Ne zaman kullanılır**: Birden fazla yeteneğe sahip karmaşık AI uygulamaları

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Web Frontend  │────│   API Gateway   │────│  Load Balancer  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │
                ┌───────────────┼───────────────┐
                │               │               │
        ┌───────▼──────┐ ┌──────▼──────┐ ┌─────▼──────┐
        │ Chat Service │ │Image Service│ │Text Service│
        └──────────────┘ └─────────────┘ └────────────┘
                │               │               │
        ┌───────▼──────┐ ┌──────▼──────┐ ┌─────▼──────┐
        │Azure OpenAI  │ │Computer     │ │Document    │
        │              │ │Vision       │ │Intelligence│
        └──────────────┘ └─────────────┘ └────────────┘
```

**AZD Uygulaması**:

```yaml
# azure.yaml
name: enterprise-ai-platform
services:
  web:
    project: ./web
    host: staticwebapp
  api-gateway:
    project: ./api-gateway
    host: containerapp
  chat-service:
    project: ./services/chat
    host: containerapp
  vision-service:
    project: ./services/vision
    host: containerapp
  text-service:
    project: ./services/text
    host: containerapp
```

### Kalıp 2: Olay Tabanlı AI İşleme

**Ne zaman kullanılır**: Toplu işleme, belge analizi, asenkron iş akışları

```bicep
// Event Hub for AI processing pipeline
resource eventHub 'Microsoft.EventHub/namespaces@2023-01-01-preview' = {
  name: eventHubNamespaceName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
}

// Service Bus for reliable message processing
resource serviceBus 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: serviceBusNamespaceName
  location: location
  sku: {
    name: 'Premium'
    tier: 'Premium'
    capacity: 1
  }
}

// Function App for processing
resource functionApp 'Microsoft.Web/sites@2023-01-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp,linux'
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'AZURE_OPENAI_ENDPOINT'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=openai-endpoint)'
        }
      ]
    }
  }
}
```

## Güvenlik En İyi Uygulamaları

### 1. Sıfır Güvenlik Modeli

**Uygulama Stratejisi**:
- Kimlik doğrulama olmadan hizmetler arası iletişim yok
- Tüm API çağrıları yönetilen kimlikler kullanır
- Özel uç noktalarla ağ izolasyonu
- En az ayrıcalık erişim kontrolleri

```bicep
// Managed Identity for each service
resource chatServiceIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'chat-service-identity'
  location: location
}

// Role assignments with minimal permissions
resource openAIUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, chatServiceIdentity.id, openAIUserRoleDefinitionId)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: chatServiceIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### 2. Güvenli Gizli Yönetimi

**Key Vault Entegrasyon Kalıbı**:

```bicep
// Key Vault with proper access policies
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'premium'  // Use premium for production
    }
    enableRbacAuthorization: true  // Use RBAC instead of access policies
    enablePurgeProtection: true    // Prevent accidental deletion
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
  }
}

// Store all AI service credentials
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
    attributes: {
      enabled: true
    }
  }
}
```

### 3. Ağ Güvenliği

**Özel Uç Nokta Yapılandırması**:

```bicep
// Virtual Network for AI services
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'ai-services-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
        }
      }
      {
        name: 'app-services-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'Microsoft.Web/serverFarms'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private endpoints for all AI services
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

## Performans ve Ölçeklendirme

### 1. Otomatik Ölçeklendirme Stratejileri

**Container Apps Otomatik Ölçeklendirme**:

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
        transport: 'http'
      }
    }
    template: {
      scale: {
        minReplicas: 2  // Always have 2 instances minimum
        maxReplicas: 50 // Scale up to 50 for high load
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '20'  // Scale when >20 concurrent requests
              }
            }
          }
          {
            name: 'cpu-scaling'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'  // Scale when CPU >70%
              }
            }
          }
        ]
      }
    }
  }
}
```

### 2. Önbellek Stratejileri

**AI Yanıtları için Redis Önbelleği**:

```bicep
// Redis Premium for production workloads
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Premium'
      family: 'P'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
    redisConfiguration: {
      'maxmemory-policy': 'allkeys-lru'
    }
    // Enable clustering for high availability
    redisVersion: '6.0'
    shardCount: 2
  }
}

// Cache configuration in application
var cacheConnectionString = '${redisCache.properties.hostName}:6380,password=${redisCache.listKeys().primaryKey},ssl=True,abortConnect=False'
```

### 3. Yük Dengeleme ve Trafik Yönetimi

**WAF ile Uygulama Geçidi**:

```bicep
// Application Gateway with Web Application Firewall
resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: appGatewayName
  location: location
  properties: {
    sku: {
      name: 'WAF_v2'
      tier: 'WAF_v2'
      capacity: 2
    }
    webApplicationFirewallConfiguration: {
      enabled: true
      firewallMode: 'Prevention'
      ruleSetType: 'OWASP'
      ruleSetVersion: '3.2'
    }
    // Backend pools for AI services
    backendAddressPools: [
      {
        name: 'ai-services-pool'
        properties: {
          backendAddresses: [
            {
              fqdn: '${containerApp.properties.configuration.ingress.fqdn}'
            }
          ]
        }
      }
    ]
  }
}
```

## 💰 Maliyet Optimizasyonu

### 1. Kaynak Boyutlandırma

**Ortam-Specifik Yapılandırmalar**:

```bash
# Geliştirme ortamı
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Üretim ortamı
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Maliyet İzleme ve Bütçeler

```bicep
// Cost management and budgets
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 2000  // $2000 monthly budget
    category: 'Cost'
    notifications: {
      warning: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'finance@company.com'
          'engineering@company.com'
        ]
        contactRoles: [
          'Owner'
          'Contributor'
        ]
      }
      critical: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 95
        contactEmails: [
          'cto@company.com'
        ]
      }
    }
  }
}
```

### 3. Token Kullanımı Optimizasyonu

**OpenAI Maliyet Yönetimi**:

```typescript
// Uygulama düzeyinde token optimizasyonu
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Bağlamı kısalt, kullanıcı girdisini değil
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Kabaca tahmin: 1 token ≈ 4 karakter
    return Math.ceil(text.length / 4);
  }
}
```

## İzleme ve Görünürlük

### 1. Kapsamlı Uygulama İçgörüleri

```bicep
// Application Insights with advanced features
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    SamplingPercentage: 100  // Full sampling for AI apps
    DisableIpMasking: false  // Enable for security
  }
}

// Custom metrics for AI operations
resource aiMetricAlerts 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'ai-high-error-rate'
  location: 'global'
  properties: {
    description: 'Alert when AI service error rate is high'
    severity: 2
    enabled: true
    scopes: [
      applicationInsights.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'high-error-rate'
          metricName: 'requests/failed'
          operator: 'GreaterThan'
          threshold: 10
          timeAggregation: 'Count'
        }
      ]
    }
  }
}
```

### 2. AI-Specifik İzleme

**AI Metrikleri için Özel Panolar**:

```json
// Dashboard configuration for AI workloads
{
  "dashboard": {
    "name": "AI Application Monitoring",
    "tiles": [
      {
        "name": "OpenAI Request Volume",
        "query": "requests | where name contains 'openai' | summarize count() by bin(timestamp, 5m)"
      },
      {
        "name": "AI Response Latency",
        "query": "requests | where name contains 'openai' | summarize avg(duration) by bin(timestamp, 5m)"
      },
      {
        "name": "Token Usage",
        "query": "customMetrics | where name == 'openai_tokens_used' | summarize sum(value) by bin(timestamp, 1h)"
      },
      {
        "name": "Cost per Hour",
        "query": "customMetrics | where name == 'openai_cost' | summarize sum(value) by bin(timestamp, 1h)"
      }
    ]
  }
}
```

### 3. Sağlık Kontrolleri ve Çalışma Süresi İzleme

```bicep
// Application Insights availability tests
resource availabilityTest 'Microsoft.Insights/webtests@2022-06-15' = {
  name: 'ai-app-availability-test'
  location: location
  tags: {
    'hidden-link:${applicationInsights.id}': 'Resource'
  }
  properties: {
    SyntheticMonitorId: 'ai-app-availability-test'
    Name: 'AI Application Availability Test'
    Description: 'Tests AI application endpoints'
    Enabled: true
    Frequency: 300  // 5 minutes
    Timeout: 120    // 2 minutes
    Kind: 'ping'
    Locations: [
      {
        Id: 'us-east-2-azr'
      }
      {
        Id: 'us-west-2-azr'
      }
    ]
    Configuration: {
      WebTest: '''
        <WebTest Name="AI Health Check" 
                 Id="8d2de8d2-a2b0-4c2e-9a0d-8f9c9a0b8c8d" 
                 Enabled="True" 
                 CssProjectStructure="" 
                 CssIteration="" 
                 Timeout="120" 
                 WorkItemIds="" 
                 xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010" 
                 Description="" 
                 CredentialUserName="" 
                 CredentialPassword="" 
                 PreAuthenticate="True" 
                 Proxy="default" 
                 StopOnError="False" 
                 RecordedResultFile="" 
                 ResultsLocale="">
          <Items>
            <Request Method="GET" 
                     Guid="a5f10126-e4cd-570d-961c-cea43999a200" 
                     Version="1.1" 
                     Url="${webApp.properties.defaultHostName}/health" 
                     ThinkTime="0" 
                     Timeout="120" 
                     ParseDependentRequests="True" 
                     FollowRedirects="True" 
                     RecordResult="True" 
                     Cache="False" 
                     ResponseTimeGoal="0" 
                     Encoding="utf-8" 
                     ExpectedHttpStatusCode="200" 
                     ExpectedResponseUrl="" 
                     ReportingName="" 
                     IgnoreHttpStatusCode="False" />
          </Items>
        </WebTest>
      '''
    }
  }
}
```

## Felaket Kurtarma ve Yüksek Kullanılabilirlik

### 1. Çok Bölge Dağıtımı

```yaml
# azure.yaml - Multi-region configuration
name: ai-app-multiregion
services:
  api-primary:
    project: ./api
    host: containerapp
    env:
      - AZURE_REGION=eastus
  api-secondary:
    project: ./api
    host: containerapp
    env:
      - AZURE_REGION=westus2
```

```bicep
// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficManagerProfiles@2022-04-01' = {
  name: trafficManagerProfileName
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: trafficManagerProfileName
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
      intervalInSeconds: 30
      toleratedNumberOfFailures: 3
      timeoutInSeconds: 10
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryAppService.id
          endpointStatus: 'Enabled'
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryAppService.id
          endpointStatus: 'Enabled'
          priority: 2
        }
      }
    ]
  }
}
```

### 2. Veri Yedekleme ve Kurtarma

```bicep
// Backup configuration for critical data
resource backupVault 'Microsoft.DataProtection/backupVaults@2023-05-01' = {
  name: backupVaultName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    storageSettings: [
      {
        datastoreType: 'VaultStore'
        type: 'LocallyRedundant'
      }
    ]
  }
}

// Backup policy for AI models and data
resource backupPolicy 'Microsoft.DataProtection/backupVaults/backupPolicies@2023-05-01' = {
  parent: backupVault
  name: 'ai-data-backup-policy'
  properties: {
    policyRules: [
      {
        backupParameters: {
          backupType: 'Full'
          objectType: 'AzureBackupParams'
        }
        trigger: {
          schedule: {
            repeatingTimeIntervals: [
              'R/2024-01-01T02:00:00+00:00/P1D'  // Daily at 2 AM
            ]
          }
          objectType: 'ScheduleBasedTriggerContext'
        }
        dataStore: {
          datastoreType: 'VaultStore'
          objectType: 'DataStoreInfoBase'
        }
        name: 'BackupDaily'
        objectType: 'AzureBackupRule'
      }
    ]
  }
}
```

## DevOps ve CI/CD Entegrasyonu

### 1. GitHub Actions İş Akışı

```yaml
# .github/workflows/deploy-ai-app.yml
name: Deploy AI Application

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
          
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          pip install pytest
          
      - name: Run tests
        run: pytest tests/
        
      - name: AI Safety Tests
        run: |
          python scripts/test_ai_safety.py
          python scripts/validate_prompts.py

  deploy-staging:
    needs: test
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1.0.0
        
      - name: Login to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
          
      - name: Deploy to Staging
        run: |
          azd env select staging
          azd deploy

  deploy-production:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1.0.0
        
      - name: Login to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
          
      - name: Deploy to Production
        run: |
          azd env select production
          azd deploy
          
      - name: Run Production Health Checks
        run: |
          python scripts/health_check.py --env production
```

### 2. Altyapı Doğrulama

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Tüm gerekli hizmetlerin çalışıp çalışmadığını kontrol et
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# OpenAI model dağıtımlarını doğrula
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# AI hizmeti bağlantısını test et
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Üretim Hazırlık Kontrol Listesi

### Güvenlik ✅
- [ ] Tüm hizmetler yönetilen kimlikler kullanıyor
- [ ] Gizli bilgiler Key Vault'ta saklanıyor
- [ ] Özel uç noktalar yapılandırıldı
- [ ] Ağ güvenlik grupları uygulandı
- [ ] En az ayrıcalık ile RBAC
- [ ] Genel uç noktalarda WAF etkinleştirildi

### Performans ✅
- [ ] Otomatik ölçeklendirme yapılandırıldı
- [ ] Önbellek uygulandı
- [ ] Yük dengeleme ayarlandı
- [ ] Statik içerik için CDN
- [ ] Veritabanı bağlantı havuzu
- [ ] Token kullanımı optimizasyonu

### İzleme ✅
- [ ] Uygulama İçgörüleri yapılandırıldı
- [ ] Özel metrikler tanımlandı
- [ ] Uyarı kuralları ayarlandı
- [ ] Pano oluşturuldu
- [ ] Sağlık kontrolleri uygulandı
- [ ] Günlük saklama politikaları

### Güvenilirlik ✅
- [ ] Çok bölge dağıtımı
- [ ] Yedekleme ve kurtarma planı
- [ ] Devre kesiciler uygulandı
- [ ] Yeniden deneme politikaları yapılandırıldı
- [ ] Zarif bozulma
- [ ] Sağlık kontrol uç noktaları

### Maliyet Yönetimi ✅
- [ ] Bütçe uyarıları yapılandırıldı
- [ ] Kaynak boyutlandırma
- [ ] Geliştirme/test indirimleri uygulandı
- [ ] Rezerve edilmiş örnekler satın alındı
- [ ] Maliyet izleme panosu
- [ ] Düzenli maliyet incelemeleri

### Uyumluluk ✅
- [ ] Veri yerleşim gereksinimleri karşılandı
- [ ] Denetim günlükleri etkinleştirildi
- [ ] Uyumluluk politikaları uygulandı
- [ ] Güvenlik temel ayarları uygulandı
- [ ] Düzenli güvenlik değerlendirmeleri
- [ ] Olay müdahale planı

## Performans Kıyaslamaları

### Tipik Üretim Metrikleri

| Metrik | Hedef | İzleme |
|--------|--------|------------|
| **Yanıt Süresi** | < 2 saniye | Uygulama İçgörüleri |
| **Kullanılabilirlik** | %99.9 | Çalışma süresi izleme |
| **Hata Oranı** | < %0.1 | Uygulama günlükleri |
| **Token Kullanımı** | < $500/ay | Maliyet yönetimi |
| **Eşzamanlı Kullanıcılar** | 1000+ | Yük testi |
| **Kurtarma Süresi** | < 1 saat | Felaket kurtarma testleri |

### Yük Testi

```bash
# AI uygulamaları için yük testi betiği
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Topluluk En İyi Uygulamaları

Microsoft Foundry Discord topluluğundan alınan geri bildirimlere dayanarak:

### Topluluk Tavsiyeleri:

1. **Küçük Başlayın, Kademeli Ölçeklendirin**: Temel SKU'larla başlayın ve gerçek kullanım temelinde ölçeklendirin
2. **Her Şeyi İzleyin**: İlk günden itibaren kapsamlı izleme kurun
3. **Güvenliği Otomatikleştirin**: Tutarlı güvenlik için altyapıyı kod olarak kullanın
4. **İyi Test Edin**: AI özel testlerini hattınıza dahil edin
5. **Maliyetleri Planlayın**: Token kullanımını izleyin ve erken bütçe uyarıları ayarlayın

### Kaçınılması Gereken Yaygın Hatalar:

- ❌ API anahtarlarını kodda sabitlemek
- ❌ Uygun izleme kurmamak
- ❌ Maliyet optimizasyonunu göz ardı etmek
- ❌ Hata senaryolarını test etmemek
- ❌ Sağlık kontrolleri olmadan dağıtım yapmak

## Ek Kaynaklar

- **Azure İyi Mimari Çerçevesi**: [AI iş yükü rehberi](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Belgeleri**: [Resmi belgeler](https://learn.microsoft.com/azure/ai-studio/)
- **Topluluk Şablonları**: [Azure Örnekleri](https://github.com/Azure-Samples)
- **Discord Topluluğu**: [#Azure kanalı](https://discord.gg/microsoft-azure)

---

**Bölüm Navigasyonu:**
- **📚 Kurs Ana Sayfası**: [AZD Başlangıç Kılavuzu](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 8 - Üretim ve Kurumsal Kalıplar
- **⬅️ Önceki Bölüm**: [Bölüm 7: Sorun Giderme](../troubleshooting/debugging.md)
- **⬅️ İlgili Bölüm**: [AI Atölye Laboratuvarı](ai-workshop-lab.md)
- **🎆 Kurs Tamamlandı**: [AZD Başlangıç Kılavuzu](../../README.md)

**Unutmayın**: Üretim AI iş yükleri dikkatli planlama, izleme ve sürekli optimizasyon gerektirir. Bu kalıplarla başlayın ve özel gereksinimlerinize göre uyarlayın.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çeviriler hata veya yanlışlıklar içerebilir. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
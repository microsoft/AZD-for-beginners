# Práticas recomendadas para cargas de trabalho de IA em produção com AZD

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 8 - Padrões de Produção & Empresariais
- **⬅️ Capítulo Anterior**: [Capítulo 7: Solução de Problemas](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Também Relacionado**: [Laboratório do Workshop de IA](ai-workshop-lab.md)
- **🎯 Curso Completo**: [AZD Para Iniciantes](../../README.md)

## Visão Geral

Este guia fornece práticas recomendadas abrangentes para implantar cargas de trabalho de IA prontas para produção usando o Azure Developer CLI (AZD). Baseado no feedback da comunidade Microsoft Foundry no Discord e em implantações de clientes no mundo real, essas práticas abordam os desafios mais comuns em sistemas de IA de produção.

## Principais Desafios Abordados

Com base nos resultados da nossa enquete na comunidade, estes são os principais desafios que os desenvolvedores enfrentam:

- **45%** têm dificuldades com implantações de IA com múltiplos serviços
- **38%** têm problemas com gerenciamento de credenciais e segredos  
- **35%** acham difícil prontidão para produção e escalabilidade
- **32%** precisam de melhores estratégias de otimização de custos
- **29%** exigem monitoramento e solução de problemas aprimorados

## Padrões de Arquitetura para IA em Produção

### Padrão 1: Arquitetura de IA por Microserviços

**Quando usar**: Aplicações de IA complexas com múltiplas capacidades

```mermaid
graph TD
    Frontend[Frontend Web] --- Gateway[Gateway de API] --- LB[Balanceador de Carga]
    Gateway --> Chat[Serviço de Chat]
    Gateway --> Image[Serviço de Imagem]
    Gateway --> Text[Serviço de Texto]
    Chat --> OpenAI[Modelos da Microsoft Foundry]
    Image --> Vision[Visão Computacional]
    Text --> DocIntel[Inteligência de Documentos]
```
**Implementação com AZD**:

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

### Padrão 2: Processamento de IA Orientado a Eventos

**Quando usar**: Processamento em lote, análise de documentos, fluxos de trabalho assíncronos

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

## Pensando na Saúde do Agente de IA

Quando um app web tradicional quebra, os sintomas são familiares: uma página não carrega, uma API retorna um erro ou uma implantação falha. Aplicações com IA podem falhar de todas essas mesmas maneiras — mas também podem se comportar mal de formas mais sutis que não produzem mensagens de erro óbvias.

Esta seção ajuda você a construir um modelo mental para monitorar cargas de trabalho de IA para que saiba onde procurar quando algo parecer errado.

### Como a Saúde do Agente Difere da Saúde de um App Tradicional

Um app tradicional funciona ou não. Um agente de IA pode parecer funcionar, mas produzir resultados ruins. Pense na saúde do agente em duas camadas:

| Camada | O que Observar | Onde Procurar |
|-------|--------------|---------------|
| **Saúde da infraestrutura** | O serviço está em execução? Os recursos estão provisionados? Os endpoints são acessíveis? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Saúde do comportamento** | O agente está respondendo com precisão? As respostas são pontuais? O modelo está sendo chamado corretamente? | rastreios do Application Insights, métricas de latência das chamadas ao modelo, logs de qualidade das respostas |

A saúde da infraestrutura é familiar—é a mesma para qualquer azd app. A saúde do comportamento é a nova camada que as cargas de trabalho de IA introduzem.

### Onde Procurar Quando Apps de IA Não Se Comportam Como Esperado

Se sua aplicação de IA não está produzindo os resultados esperados, aqui está uma lista de verificação conceitual:

1. **Comece pelo básico.** A aplicação está em execução? Consegue alcançar suas dependências? Verifique `azd monitor` e a integridade dos recursos assim como faria para qualquer aplicação.
2. **Verifique a conexão com o modelo.** Sua aplicação está chamando o modelo de IA com sucesso? Chamadas ao modelo com falha ou que expiram são a causa mais comum de problemas em apps de IA e aparecerão nos logs da sua aplicação.
3. **Veja o que o modelo recebeu.** As respostas de IA dependem da entrada (o prompt e qualquer contexto recuperado). Se a saída está errada, a entrada geralmente está errada. Verifique se sua aplicação está enviando os dados corretos para o modelo.
4. **Revise a latência das respostas.** Chamadas a modelos de IA são mais lentas que chamadas típicas de API. Se sua aplicação parece lenta, verifique se os tempos de resposta do modelo aumentaram — isso pode indicar limitação de taxa, limites de capacidade ou congestionamento por região.
5. **Fique atento a sinais de custo.** Picos inesperados no uso de tokens ou chamadas de API podem indicar um loop, um prompt mal configurado ou tentativas excessivas.

Você não precisa dominar ferramentas de observabilidade imediatamente. A principal conclusão é que aplicações de IA têm uma camada extra de comportamento a ser monitorada, e o monitoramento embutido do azd (`azd monitor`) oferece um ponto de partida para investigar ambas as camadas.

---

## Práticas de Segurança

### 1. Modelo de Segurança Zero-Trust

**Estratégia de Implementação**:
- Nenhuma comunicação serviço-a-serviço sem autenticação
- Todas as chamadas de API usam identidades gerenciadas
- Isolamento de rede com endpoints privados
- Controles de acesso com princípio do menor privilégio

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

### 2. Gerenciamento Seguro de Segredos

**Padrão de Integração com Key Vault**:

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

### 3. Segurança de Rede

**Configuração de Endpoint Privado**:

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

## Desempenho e Escalabilidade

### 1. Estratégias de Autoescalonamento

**Autoescalonamento do Container Apps**:

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

### 2. Estratégias de Cache

**Redis Cache para Respostas de IA**:

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

### 3. Balanceamento de Carga e Gerenciamento de Tráfego

**Application Gateway com WAF**:

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

## 💰 Otimização de Custos

### 1. Dimensionamento Adequado de Recursos

**Configurações Específicas por Ambiente**:

```bash
# Ambiente de desenvolvimento
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Ambiente de produção
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Monitoramento de Custos e Orçamentos

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

### 3. Otimização do Uso de Tokens

**Gerenciamento de Custos do OpenAI**:

```typescript
// Otimização de tokens em nível de aplicação
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Truncar o contexto, não a entrada do usuário
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Estimativa aproximada: 1 token ≈ 4 caracteres
    return Math.ceil(text.length / 4);
  }
}
```

## Monitoramento e Observabilidade

### 1. Application Insights Abrangente

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

### 2. Monitoramento Específico para IA

**Painéis Personalizados para Métricas de IA**:

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

### 3. Verificações de Saúde e Monitoramento de Tempo de Atividade

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

## Recuperação de Desastres e Alta Disponibilidade

### 1. Implantação Multi-Região

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

### 2. Backup e Recuperação de Dados

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

## Integração DevOps e CI/CD

### 1. Workflow do GitHub Actions

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
        uses: Azure/setup-azd@v2
        
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
        uses: Azure/setup-azd@v2
        
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

### 2. Validação da Infraestrutura

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Verifique se todos os serviços necessários estão em execução
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Validar implantações de modelos OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-4.1-mini"* ]]; then
  echo "ERROR: Required model gpt-4.1-mini not deployed"
    exit 1
fi

# Testar conectividade com o serviço de IA
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Lista de Verificação de Prontidão para Produção

### Segurança ✅
- [ ] Todos os serviços usam identidades gerenciadas
- [ ] Segredos armazenados no Key Vault
- [ ] Endpoints privados configurados
- [ ] Grupos de segurança de rede implementados
- [ ] RBAC com menor privilégio
- [ ] WAF habilitado em endpoints públicos

### Desempenho ✅
- [ ] Autoescalonamento configurado
- [ ] Cache implementado
- [ ] Balanceamento de carga configurado
- [ ] CDN para conteúdo estático
- [ ] Pool de conexões do banco de dados
- [ ] Otimização do uso de tokens

### Monitoramento ✅
- [ ] Application Insights configurado
- [ ] Métricas personalizadas definidas
- [ ] Regras de alerta configuradas
- [ ] Painel criado
- [ ] Verificações de saúde implementadas
- [ ] Políticas de retenção de logs

### Confiabilidade ✅
- [ ] Implantação multi-região
- [ ] Plano de backup e recuperação
- [ ] Circuit breakers implementados
- [ ] Políticas de retry configuradas
- [ ] Degradação graciosa
- [ ] Endpoints de verificação de saúde

### Gerenciamento de Custos ✅
- [ ] Alertas de orçamento configurados
- [ ] Dimensionamento adequado de recursos
- [ ] Descontos para dev/test aplicados
- [ ] Instâncias reservadas adquiridas
- [ ] Painel de monitoramento de custos
- [ ] Revisões regulares de custos

### Conformidade ✅
- [ ] Requisitos de residência de dados atendidos
- [ ] Registro de auditoria habilitado
- [ ] Políticas de conformidade aplicadas
- [ ] Padrões de segurança implementados
- [ ] Avaliações de segurança regulares
- [ ] Plano de resposta a incidentes

## Benchmarks de Desempenho

### Métricas Típicas de Produção

| Métrica | Meta | Monitoramento |
|--------|--------|------------|
| **Tempo de Resposta** | < 2 segundos | Application Insights |
| **Disponibilidade** | 99,9% | Monitoramento de tempo de atividade |
| **Taxa de Erro** | < 0,1% | Logs da aplicação |
| **Uso de Tokens** | < $500/mês | Gerenciamento de custos |
| **Usuários Concorrentes** | 1000+ | Teste de carga |
| **Tempo de Recuperação** | < 1 hora | Testes de recuperação de desastres |

### Teste de Carga

```bash
# Script de teste de carga para aplicações de IA
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Práticas recomendadas da Comunidade

Com base no feedback da comunidade Microsoft Foundry no Discord:

### Principais Recomendações da Comunidade:

1. **Comece Pequeno, Escale Gradualmente**: Comece com SKUs básicos e aumente conforme o uso real
2. **Monitore Tudo**: Configure monitoramento abrangente desde o primeiro dia
3. **Automatize a Segurança**: Use infraestrutura como código para segurança consistente
4. **Teste Exaustivamente**: Inclua testes específicos de IA em seu pipeline
5. **Planeje os Custos**: Monitore o uso de tokens e configure alertas de orçamento cedo

### Armadilhas Comuns a Evitar:

- ❌ Inserir chaves de API diretamente no código
- ❌ Não configurar monitoramento adequado
- ❌ Ignorar otimização de custos
- ❌ Não testar cenários de falha
- ❌ Implantar sem verificações de saúde

## Comandos e Extensões AZD AI CLI

O AZD inclui um conjunto crescente de comandos e extensões específicos para IA que simplificam fluxos de trabalho de IA em produção. Essas ferramentas reduzem a lacuna entre o desenvolvimento local e a implantação em produção para cargas de trabalho de IA.

### Extensões AZD para IA

O AZD usa um sistema de extensões para adicionar capacidades específicas de IA. Instale e gerencie extensões com:

```bash
# Listar todas as extensões disponíveis (incluindo IA)
azd extension list

# Inspecionar detalhes da extensão instalada
azd extension show azure.ai.agents

# Instalar a extensão Foundry Agents
azd extension install azure.ai.agents

# Instalar a extensão de ajuste fino
azd extension install azure.ai.finetune

# Instalar a extensão de modelos personalizados
azd extension install azure.ai.models

# Atualizar todas as extensões instaladas
azd extension upgrade --all
```

**Extensões de IA disponíveis:**

| Extensão | Propósito | Status |
|-----------|---------|--------|
| `azure.ai.agents` | Gerenciamento do Foundry Agent Service | Preview |
| `azure.ai.finetune` | Ajuste fino de modelos Foundry | Preview |
| `azure.ai.models` | Modelos personalizados do Foundry | Preview |
| `azure.coding-agent` | Configuração do agente de codificação | Available |

### Inicializando Projetos de Agente com `azd ai agent init`

O comando `azd ai agent init` gera a estrutura de um projeto de agente de IA pronto para produção integrado ao Microsoft Foundry Agent Service:

```bash
# Inicialize um novo projeto de agente a partir de um manifesto de agente
azd ai agent init -m <manifest-path-or-uri>

# Inicialize e aponte para um projeto Foundry específico
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Inicialize com um diretório de origem personalizado
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Aponte o Container Apps como host
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Principais flags:**

| Flag | Descrição |
|------|-------------|
| `-m, --manifest` | Caminho ou URI para um manifesto de agente a ser adicionado ao seu projeto |
| `-p, --project-id` | ID de Projeto existente do Microsoft Foundry para o seu ambiente azd |
| `-s, --src` | Diretório para baixar a definição do agente (padrão `src/<agent-id>`) |
| `--host` | Substitui o host padrão (ex.: `containerapp`) |
| `-e, --environment` | O ambiente azd a ser usado |

**Dica para produção**: Use `--project-id` para conectar diretamente a um projeto Foundry existente, mantendo seu código do agente e recursos na nuvem vinculados desde o início.

### Protocolo de Contexto de Modelo (MCP) com `azd mcp`

O AZD inclui suporte integrado ao servidor MCP (Alpha), permitindo que agentes e ferramentas de IA interajam com seus recursos do Azure através de um protocolo padronizado:

```bash
# Inicie o servidor MCP para o seu projeto
azd mcp start

# Revise as regras atuais de consentimento do Copilot para a execução de ferramentas
azd copilot consent list
```

O servidor MCP expõe o contexto do seu projeto azd — ambientes, serviços e recursos do Azure — para ferramentas de desenvolvimento com IA. Isso possibilita:

- **Implantação assistida por IA**: Permita que agentes de codificação consultem o estado do seu projeto e iniciem implantações
- **Descoberta de recursos**: Ferramentas de IA podem descobrir quais recursos do Azure seu projeto usa
- **Gerenciamento de ambientes**: Agentes podem alternar entre ambientes de desenvolvimento/homologação/produção

### Geração de Infraestrutura com `azd infra generate`

Para cargas de trabalho de IA em produção, você pode gerar e customizar Infrastructure as Code em vez de depender do provisionamento automático:

```bash
# Gerar arquivos Bicep/Terraform a partir da definição do seu projeto
azd infra generate
```

Isto grava IaC no disco para que você possa:
- Revisar e auditar a infraestrutura antes de implantar
- Adicionar políticas de segurança personalizadas (regras de rede, endpoints privados)
- Integrar com processos existentes de revisão de IaC
- Controlar versão das mudanças de infraestrutura separadamente do código da aplicação

### Hooks do Ciclo de Vida de Produção

Os hooks do AZD permitem injetar lógica personalizada em cada estágio do ciclo de vida da implantação — crítico para fluxos de trabalho de IA em produção:

```yaml
# azure.yaml - Production hooks example
name: ai-production-app
hooks:
  preprovision:
    shell: sh
    run: scripts/validate-quotas.sh    # Check AI model quota before provisioning
  postprovision:
    shell: sh
    run: scripts/configure-networking.sh  # Set up private endpoints
  predeploy:
    shell: sh
    run: scripts/run-ai-safety-tests.sh  # Run prompt safety checks
  postdeploy:
    shell: sh
    run: scripts/smoke-test.sh           # Verify agent responses post-deploy
services:
  agent-api:
    project: ./src/agent
    host: containerapp
    hooks:
      predeploy:
        shell: sh
        run: scripts/validate-model-access.sh  # Per-service hook
```

```bash
# Execute um hook específico manualmente durante o desenvolvimento
azd hooks run predeploy
```

**Hooks recomendados para produção em cargas de trabalho de IA:**

| Hook | Caso de Uso |
|------|----------|
| `preprovision` | Validar cotas de assinatura para capacidade de modelos de IA |
| `postprovision` | Configurar endpoints privados, implantar pesos do modelo |
| `predeploy` | Executar testes de segurança de IA, validar templates de prompt |
| `postdeploy` | Teste de fumaça das respostas do agente, verificar conectividade com o modelo |

### Configuração de Pipeline CI/CD

Use `azd pipeline config` para conectar seu projeto ao GitHub Actions ou Azure Pipelines com autenticação segura do Azure:

```bash
# Configurar pipeline de CI/CD (interativo)
azd pipeline config

# Configurar com um provedor específico
azd pipeline config --provider github
```

Este comando:
- Cria um service principal com acesso de menor privilégio
- Configura credenciais federadas (sem segredos armazenados)
- Gera ou atualiza seu arquivo de definição de pipeline
- Define variáveis de ambiente necessárias no seu sistema CI/CD

**Fluxo de trabalho de produção com a configuração do pipeline:**

```bash
# 1. Configure o ambiente de produção
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Configure o pipeline
azd pipeline config --provider github

# 3. O pipeline executa azd deploy a cada push para a branch main
```

### Adicionando Componentes com `azd add`

Adicione incrementalmente serviços do Azure a um projeto existente:

```bash
# Adicionar um novo componente de serviço interativamente
azd add
```

Isso é particularmente útil para expandir aplicações de IA em produção — por exemplo, adicionar um serviço de busca vetorial, um novo endpoint de agente ou um componente de monitoramento a uma implantação existente.

## Recursos Adicionais
- **Azure Well-Architected Framework**: [Orientações para cargas de trabalho de IA](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Documentação oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Modelos da comunidade**: [Azure Samples](https://github.com/Azure-Samples)
- **Comunidade no Discord**: [canal #Azure](https://discord.gg/microsoft-azure)
- **Habilidades de agente para Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 habilidades de agente abertas para Azure AI, Foundry, implantação, otimização de custos e diagnósticos. Instale em seu editor:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Navegação do Capítulo:**
- **📚 Página inicial do curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 8 - Padrões de Produção e Empresariais
- **⬅️ Capítulo Anterior**: [Capítulo 7: Solução de problemas](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Também relacionado**: [AI Workshop Lab](ai-workshop-lab.md)
- **� Curso Completo**: [AZD Para Iniciantes](../../README.md)

**Lembre-se**: Cargas de trabalho de IA em produção requerem planejamento cuidadoso, monitoramento e otimização contínua. Comece com esses padrões e adapte-os aos seus requisitos específicos.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
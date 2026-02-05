# Guia de Seleção de SKU - Escolhendo os Níveis de Serviço do Azure

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 6 - Validação e Planejamento Pré-Implantação
- **⬅️ Anterior**: [Planejamento de Capacidade](capacity-planning.md)
- **➡️ Próximo**: [Verificações Pré-Implantação](preflight-checks.md)
- **🚀 Próximo Capítulo**: [Capítulo 7: Solução de Problemas](../troubleshooting/common-issues.md)

## Introdução

Este guia abrangente ajuda você a selecionar os SKUs (Unidades de Manutenção de Estoque) de serviços do Azure mais adequados para diferentes ambientes, cargas de trabalho e requisitos. Aprenda a analisar necessidades de desempenho, considerações de custo e requisitos de escalabilidade para escolher os níveis de serviço mais apropriados para suas implantações com o Azure Developer CLI.

## Objetivos de Aprendizado

Ao concluir este guia, você será capaz de:
- Compreender os conceitos de SKU do Azure, modelos de preços e diferenças de recursos
- Dominar estratégias de seleção de SKU específicas para ambientes de desenvolvimento, homologação e produção
- Analisar os requisitos de carga de trabalho e associá-los aos níveis de serviço apropriados
- Implementar estratégias de otimização de custos por meio de uma seleção inteligente de SKUs
- Aplicar técnicas de teste de desempenho e validação para escolhas de SKU
- Configurar recomendações automáticas de SKU e monitoramento

## Resultados de Aprendizado

Ao final, você será capaz de:
- Selecionar SKUs de serviços do Azure apropriados com base nos requisitos e restrições de carga de trabalho
- Projetar arquiteturas multiambiente econômicas com seleção adequada de níveis
- Implementar benchmarking de desempenho e validação para escolhas de SKU
- Criar ferramentas automatizadas para recomendação de SKUs e otimização de custos
- Planejar migrações de SKU e estratégias de escalabilidade para requisitos em evolução
- Aplicar os princípios do Azure Well-Architected Framework à seleção de níveis de serviço

## Índice

- [Compreendendo os SKUs](../../../../docs/pre-deployment)
- [Seleção Baseada em Ambiente](../../../../docs/pre-deployment)
- [Diretrizes Específicas de Serviço](../../../../docs/pre-deployment)
- [Estratégias de Otimização de Custos](../../../../docs/pre-deployment)
- [Considerações de Desempenho](../../../../docs/pre-deployment)
- [Tabelas de Referência Rápida](../../../../docs/pre-deployment)
- [Ferramentas de Validação](../../../../docs/pre-deployment)

---

## Compreendendo os SKUs

### O que são SKUs?

SKUs (Unidades de Manutenção de Estoque) representam diferentes níveis de serviço e desempenho para recursos do Azure. Cada SKU oferece diferentes:

- **Características de desempenho** (CPU, memória, taxa de transferência)
- **Disponibilidade de recursos** (opções de escalabilidade, níveis de SLA)
- **Modelos de preços** (baseados em consumo, capacidade reservada)
- **Disponibilidade regional** (nem todos os SKUs estão disponíveis em todas as regiões)

### Fatores-chave na Seleção de SKU

1. **Requisitos de Carga de Trabalho**
   - Padrões esperados de tráfego/carga
   - Requisitos de desempenho (CPU, memória, I/O)
   - Necessidades de armazenamento e padrões de acesso

2. **Tipo de Ambiente**
   - Desenvolvimento/teste vs. produção
   - Requisitos de disponibilidade
   - Necessidades de segurança e conformidade

3. **Restrições de Orçamento**
   - Custos iniciais vs. custos operacionais
   - Descontos de capacidade reservada
   - Implicações de custo do autoescalonamento

4. **Projeções de Crescimento**
   - Requisitos de escalabilidade
   - Necessidades futuras de recursos
   - Complexidade de migração

---

## Seleção Baseada em Ambiente

### Ambiente de Desenvolvimento

**Prioridades**: Otimização de custos, funcionalidade básica, provisionamento/desprovisionamento fácil

#### SKUs Recomendados
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

#### Características
- **App Service**: F1 (Gratuito) ou B1 (Básico) para testes simples
- **Bancos de Dados**: Nível básico com recursos mínimos
- **Armazenamento**: Padrão com redundância local apenas
- **Computação**: Recursos compartilhados aceitáveis
- **Rede**: Configurações básicas

### Ambiente de Homologação/Teste

**Prioridades**: Configuração semelhante à produção, equilíbrio de custos, capacidade de teste de desempenho

#### SKUs Recomendados
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

#### Características
- **Desempenho**: 70-80% da capacidade de produção
- **Recursos**: A maioria dos recursos de produção habilitados
- **Redundância**: Alguma redundância geográfica
- **Escalabilidade**: Autoescalonamento limitado para testes
- **Monitoramento**: Pilha completa de monitoramento

### Ambiente de Produção

**Prioridades**: Desempenho, disponibilidade, segurança, conformidade, escalabilidade

#### SKUs Recomendados
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

#### Características
- **Alta disponibilidade**: Requisitos de SLA de 99,9%+
- **Desempenho**: Recursos dedicados, alta taxa de transferência
- **Segurança**: Recursos de segurança premium
- **Escalabilidade**: Capacidades completas de autoescalonamento
- **Monitoramento**: Observabilidade abrangente

---

## Diretrizes Específicas de Serviço

### Azure App Service

#### Matriz de Decisão de SKU

| Caso de Uso | SKU Recomendado | Justificativa |
|-------------|-----------------|---------------|
| Desenvolvimento/Teste | F1 (Gratuito) ou B1 (Básico) | Econômico, suficiente para testes |
| Aplicativos pequenos de produção | S1 (Standard) | Domínios personalizados, SSL, autoescalonamento |
| Aplicativos médios de produção | P1V3 (Premium V3) | Melhor desempenho, mais recursos |
| Aplicativos de alto tráfego | P2V3 ou P3V3 | Recursos dedicados, alto desempenho |
| Aplicativos críticos | I1V2 (Isolated V2) | Isolamento de rede, hardware dedicado |

#### Exemplos de Configuração

**Desenvolvimento**
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

**Produção**
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

#### Estrutura de Seleção de SKU

1. **Baseado em DTU (Unidades de Transação de Banco de Dados)**
   - **Básico**: 5 DTU - Desenvolvimento/teste
   - **Standard**: S0-S12 (10-3000 DTU) - Uso geral
   - **Premium**: P1-P15 (125-4000 DTU) - Crítico para desempenho

2. **Baseado em vCore** (Recomendado para produção)
   - **Uso Geral**: Computação e armazenamento equilibrados
   - **Crítico para Negócios**: Baixa latência, alta IOPS
   - **Hyperscale**: Armazenamento altamente escalável (até 100TB)

#### Exemplos de Configuração

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

#### Tipos de Ambiente

1. **Baseado em Consumo**
   - Preço por uso
   - Adequado para desenvolvimento e cargas variáveis
   - Infraestrutura compartilhada

2. **Dedicado (Perfis de Carga de Trabalho)**
   - Recursos de computação dedicados
   - Desempenho previsível
   - Melhor para cargas de produção

#### Exemplos de Configuração

**Desenvolvimento (Consumo)**
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

**Produção (Dedicado)**
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

#### Modelos de Taxa de Transferência

1. **Taxa de Transferência Provisionada Manualmente**
   - Desempenho previsível
   - Descontos de capacidade reservada
   - Melhor para cargas de trabalho estáveis

2. **Taxa de Transferência Provisionada com Autoescalonamento**
   - Escalonamento automático com base no uso
   - Pague pelo que usar (com mínimo)
   - Bom para cargas variáveis

3. **Serverless**
   - Pague por solicitação
   - Sem taxa de transferência provisionada
   - Ideal para desenvolvimento e cargas intermitentes

#### Exemplos de SKU

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

#### Tipos de Conta de Armazenamento

1. **Standard_LRS** - Desenvolvimento, dados não críticos
2. **Standard_GRS** - Produção, necessidade de redundância geográfica
3. **Premium_LRS** - Aplicações de alto desempenho
4. **Premium_ZRS** - Alta disponibilidade com redundância de zona

#### Níveis de Desempenho

- **Standard**: Uso geral, econômico
- **Premium**: Cenários de alto desempenho e baixa latência

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

## Estratégias de Otimização de Custos

### 1. Capacidade Reservada

Reserve recursos por 1-3 anos para descontos significativos:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Dimensionamento Correto

Comece com SKUs menores e escale com base no uso real:

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

### 3. Configuração de Autoescalonamento

Implemente escalonamento inteligente para otimizar custos:

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

### 4. Escalonamento Programado

Reduza durante horários de menor uso:

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

## Considerações de Desempenho

### Requisitos Básicos de Desempenho

Defina requisitos claros de desempenho antes da seleção de SKU:

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

### Teste de Carga

Teste diferentes SKUs para validar o desempenho:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitoramento e Otimização

Configure monitoramento abrangente:

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

## Tabelas de Referência Rápida

### Referência Rápida de SKU do App Service

| SKU | Nível | vCPU | RAM | Armazenamento | Faixa de Preço | Caso de Uso |
|-----|-------|------|-----|---------------|----------------|-------------|
| F1 | Gratuito | Compartilhado | 1GB | 1GB | Gratuito | Desenvolvimento |
| B1 | Básico | 1 | 1.75GB | 10GB | $ | Aplicativos pequenos |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Produção |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Alto desempenho |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Empresarial |

### Referência Rápida de SKU do SQL Database

| SKU | Nível | DTU/vCore | Armazenamento | Faixa de Preço | Caso de Uso |
|-----|-------|-----------|---------------|----------------|-------------|
| Básico | Básico | 5 DTU | 2GB | $ | Desenvolvimento |
| S2 | Standard | 50 DTU | 250GB | $$ | Produção pequena |
| P2 | Premium | 250 DTU | 1TB | $$$ | Alto desempenho |
| GP_Gen5_4 | Uso Geral | 4 vCore | 4TB | $$$ | Equilibrado |
| BC_Gen5_8 | Crítico para Negócios | 8 vCore | 4TB | $$$$ | Missão crítica |

### Referência Rápida de SKU do Container Apps

| Modelo | Preço | CPU/Memória | Caso de Uso |
|--------|-------|-------------|-------------|
| Consumo | Pague por uso | 0.25-2 vCPU | Desenvolvimento, carga variável |
| Dedicado D4 | Reservado | 4 vCPU, 16GB | Produção |
| Dedicado D8 | Reservado | 8 vCPU, 32GB | Alto desempenho |

---

## Ferramentas de Validação

### Verificador de Disponibilidade de SKU

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
            az storage account check-name --name "test" --output table
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### Script de Estimativa de Custos

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

### Validação de Desempenho

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

## Resumo de Melhores Práticas

### O que Fazer

1. **Comece pequeno e escale** com base no uso real
2. **Use SKUs diferentes para ambientes diferentes**
3. **Monitore continuamente desempenho e custos**
4. **Aproveite capacidade reservada para cargas de produção**
5. **Implemente autoescalonamento quando apropriado**
6. **Teste desempenho com cargas realistas**
7. **Planeje o crescimento, mas evite superprovisionamento**
8. **Use níveis gratuitos para desenvolvimento sempre que possível**

### O que Não Fazer

1. **Não use SKUs de produção para desenvolvimento**
2. **Não ignore a disponibilidade regional de SKUs**
3. **Não esqueça os custos de transferência de dados**
4. **Não superprovisione sem justificativa**
5. **Não ignore o impacto das dependências**
6. **Não defina limites de autoescalonamento muito altos**
7. **Não esqueça os requisitos de conformidade**
8. **Não tome decisões baseadas apenas no preço**

---

**Dica**: Use o Azure Cost Management e o Advisor para obter recomendações personalizadas de otimização de seleção de SKUs com base nos padrões reais de uso.

---

**Navegação**
- **Lição Anterior**: [Planejamento de Capacidade](capacity-planning.md)
- **Próxima Lição**: [Verificações Pré-Implantação](preflight-checks.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
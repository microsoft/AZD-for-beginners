# Guia de Seleção de SKU - Escolha dos Níveis Certos de Serviço Azure

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 6 - Validação e Planeamento Pré-Desdobramento
- **⬅️ Anterior**: [Planeamento de Capacidade](capacity-planning.md)
- **➡️ Seguinte**: [Verificações Pré-voo](preflight-checks.md)
- **🚀 Próximo Capítulo**: [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/common-issues.md)

## Introdução

Este guia abrangente ajuda-o a selecionar SKUs (Unidades de Manutenção de Stock) ótimos dos serviços Azure para diferentes ambientes, cargas de trabalho e requisitos. Aprenda a analisar necessidades de desempenho, considerações de custo e requisitos de escalabilidade para escolher os níveis de serviço mais adequados para as suas implementações com Azure Developer CLI.

## Objetivos de Aprendizagem

Ao concluir este guia, irá:
- Compreender os conceitos de SKU Azure, modelos de preços e diferenças de funcionalidades
- Dominar estratégias de seleção de SKU específicas para ambientes de desenvolvimento, staging e produção
- Analisar requisitos de carga de trabalho e correspondê-los aos níveis de serviço apropriados
- Implementar estratégias de otimização de custos através da seleção inteligente de SKUs
- Aplicar técnicas de teste e validação de desempenho para escolhas de SKU
- Configurar recomendações automáticas de SKU e monitorização

## Resultados de Aprendizagem

Após a conclusão, será capaz de:
- Selecionar SKUs de serviço Azure apropriados com base nos requisitos e restrições da carga de trabalho
- Projetar arquiteturas econômicas para múltiplos ambientes com seleção adequada dos níveis
- Implementar benchmarking de desempenho e validação para escolhas de SKU
- Criar ferramentas automáticas para recomendação de SKU e otimização de custos
- Planear migrações de SKU e estratégias de escalabilidade para requisitos em mudança
- Aplicar os princípios do Azure Well-Architected Framework à seleção dos níveis de serviço

## Índice

- [Compreender SKUs](#understanding-skus)
- [Seleção Baseada no Ambiente](#environment-based-selection)
- [Diretrizes Específicas de Serviço](#service-specific-guidelines)
- [Estratégias de Otimização de Custos](#cost-optimization-strategies)
- [Considerações de Desempenho](#performance-considerations)
- [Tabelas de Referência Rápida](#quick-reference-tables)
- [Ferramentas de Validação](#validation-tools)

---

## Compreender SKUs

> **Exemplo de âmbito:** Os mapas de SKU YAML e configurações de desempenho abaixo são notas de design, não um esquema `azure.yaml` ou configuração de ferramenta de carga. Os blocos Bicep são alternativas/fragments: declaram os seus parâmetros e recursos pai, use nomes simbólicos únicos ao combiná-los, e ligue os módulos num projeto a funcionar. Os preços, limites e a disponibilidade da região/SKU devem ser verificados para a sua subscrição antes do desdobramento.

### O que são SKUs?

SKUs (Unidades de Manutenção de Stock) representam diferentes níveis de serviço e níveis de desempenho para recursos Azure. Cada SKU oferece diferentes:

- **Características de desempenho** (CPU, memória, débito)
- **Disponibilidade de funcionalidades** (opções de escalabilidade, níveis SLA)
- **Modelos de preço** (baseados no consumo, capacidade reservada)
- **Disponibilidade regional** (nem todos os SKUs disponíveis em todas as regiões)

### Factores chave na seleção de SKU

1. **Requisitos da carga de trabalho**
   - Padrões esperados de tráfego/carga
   - Requisitos de desempenho (CPU, memória, I/O)
   - Necessidades de armazenamento e padrões de acesso

2. **Tipo de ambiente**
   - Desenvolvimento/testes vs produção
   - Requisitos de disponibilidade
   - Necessidades de segurança e conformidade

3. **Restrições orçamentais**
   - Custos iniciais vs custos operacionais
   - Descontos por capacidade reservada
   - Implicações de custo da auto-escalabilidade

4. **Projeções de crescimento**
   - Requisitos de escalabilidade
   - Necessidades futuras de funcionalidades
   - Complexidade da migração

---

## Seleção Baseada no Ambiente

### Ambiente de Desenvolvimento

**Prioridades**: Optimização de custos, funcionalidade básica, fácil aprovisionamento/desaprovisionamento

#### SKUs Recomendados
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

#### Características
- **App Service**: F1 (Gratuito) ou B1 (Básico) para testes simples
- **Bases de dados**: nível Básico com recursos mínimos
- **Armazenamento**: Standard com redundância local apenas
- **Computação**: recursos partilhados aceitáveis
- **Rede**: configurações básicas

### Ambiente de Staging/Testes

**Prioridades**: configuração semelhante à produção, equilíbrio de custos, capacidade de teste de desempenho

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
- **Funcionalidades**: a maioria das funcionalidades de produção ativadas
- **Redundância**: alguma redundância geográfica
- **Escalabilidade**: auto-escalabilidade limitada para testes
- **Monitorização**: pilha completa de monitorização

### Ambiente de Produção

**Prioridades**: desempenho, disponibilidade, segurança, conformidade, escalabilidade

#### SKUs Recomendados
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

#### Características
- **Alta disponibilidade**: requisitos SLA de 99,9%+
- **Desempenho**: recursos dedicados, alto débito
- **Segurança**: funcionalidades de segurança premium
- **Escalabilidade**: capacidades completas de auto-escalabilidade
- **Monitorização**: observabilidade abrangente

---

## Diretrizes Específicas de Serviço

### Azure App Service

#### Matriz de Decisão de SKU

| Caso de Uso | SKU Recomendado | Justificação |
|----------|----------------|-----------|
| Desenvolvimento/Testes | F1 (Gratuito) ou B1 (Básico) | Custo-efetivo, suficiente para testes |
| Aplicações pequenas em produção | S1 (Standard) | Domínios customizados, SSL, auto-escalabilidade |
| Aplicações médias em produção | P1V3 (Premium V3) | Melhor desempenho, mais funcionalidades |
| Aplicações de alto tráfego | P2V3 ou P3V3 | Recursos dedicados, alto desempenho |
| Aplicações críticas | I1V2 (Isolado V2) | Isolamento de rede, hardware dedicado |

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

1. **Baseado em DTU (Unidades de Transação de Base de Dados)**
   - **Básico**: 5 DTU - Desenvolvimento/testes
   - **Standard**: S0-S12 (10-3000 DTU) - Propósito geral
   - **Premium**: P1-P15 (125-4000 DTU) - Crítico para desempenho

2. **Baseado em vCore** (Recomendado para produção)
   - **Propósito Geral**: computação e armazenamento equilibrados
   - **Crítico para Negócios**: baixa latência, altas IOPS
   - **Hyperscale**: armazenamento altamente escalável; verifique limites de tamanho atuais e suporte regional

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

1. **Baseado em consumo**
   - Preço pago por uso
   - Adequado para desenvolvimento e cargas de trabalho variáveis
   - Infraestrutura partilhada

2. **Dedicado (Perfis de Carga de Trabalho)**
   - Recursos de computação dedicados
   - Desempenho previsível
   - Melhor para cargas de trabalho em produção

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

**Produção (Dedicado)**
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

A redundância de zona também requer infraestrutura em região suportada e configuração adequada de VNet/sub-rede, omitida aqui. Este exemplo prevê três nós dedicados; configure pelo menos duas réplicas de aplicação para distribuição cross-zone e dimensione tanto réplicas como nós para falhas de zona. Veja [orientação de fiabilidade dos Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Para colocar uma aplicação neste perfil, defina o seu `workloadProfileName: 'production-profile'`; criar apenas o perfil não move as apps para ele.

### Azure Cosmos DB

#### Modelos de Débito

1. **Débito Previamente Provisonado Manualmente**
   - Desempenho previsível
   - Descontos por capacidade reservada
   - Melhor para cargas de trabalho estáveis

2. **Débito Provisonado com Autoescala**
   - Escalabilidade automática baseada no uso
   - Pague pelo que usar (com mínimo)
   - Bom para cargas de trabalho variáveis

3. **Serverless**
   - Pague por pedido
   - Sem débito provisonado
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

### Conta de Armazenamento Azure

#### Tipos de Conta de Armazenamento

1. **Standard_LRS** - Desenvolvimento, dados não críticos
2. **Standard_GRS** - Produção, redundância geográfica necessária
3. **Premium_LRS** - Aplicações de alto desempenho
4. **Premium_ZRS** - Alta disponibilidade com redundância de zona

#### Níveis de Desempenho

- **Standard**: propósito geral, custo-efetivo
- **Premium**: cenários de alto desempenho, baixa latência

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
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

As ofertas de reserva e tipos de recursos elegíveis variam; inspecione o catálogo e os termos de compra em vez de assumir que cada serviço/SKU suporta uma reserva.

### 2. Dimensionamento Adequado

Comece com SKUs menores e aumente com base no uso real:

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

### 3. Configuração de Auto-escala

Implemente escalabilidade inteligente para otimizar custos:

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

### 4. Escala Agendada

Reduza durante horários de menor atividade:

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

### Requisitos Baseline de Desempenho

Defina requisitos claros antes da seleção do SKU:

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
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Monitorização e Otimização

Configure uma monitorização abrangente:

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

## Tabelas de Referência Rápida

### Referência Rápida de SKU do App Service

| SKU | Nível | vCPU | RAM | Armazenamento | Faixa de Preço | Caso de Uso |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Gratuito | Partilhado | 1GB | 1GB | Grátis | Desenvolvimento |
| B1 | Básico | 1 | 1,75GB | 10GB | $ | Apps pequenas |
| S1 | Standard | 1 | 1,75GB | 50GB | $$ | Produção |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Alto desempenho |
| I1V2 | Isolado V2 | 2 | 8GB | 1TB | $$$$ | Empresarial |

### Referência Rápida de SKU do SQL Database

| SKU | Nível | DTU/vCore | Armazenamento | Faixa de Preço | Caso de Uso |
|-----|------|-----------|---------|-------------|----------|
| Básico | Básico | 5 DTU | 2GB | $ | Desenvolvimento |
| S2 | Standard | 50 DTU | 250GB | $$ | Pequena produção |
| P2 | Premium | 250 DTU | 1TB | $$$ | Alto desempenho |
| GP_Gen5_4 | Propósito Geral | 4 vCore | 4TB | $$$ | Equilibrado |
| BC_Gen5_8 | Crítico para Negócios | 8 vCore | 4TB | $$$$ | Crítico para missão |

### Referência Rápida de SKU dos Container Apps

| Modelo | Preço | CPU/Memória | Caso de Uso |
|-------|---------|------------|----------|
| Consumo | Pague pelo uso | Combinações suportadas de CPU/memória dependem do ambiente/perfil | Desenvolvimento ou produção, carga variável |
| Dedicado D4 | Cobrança por nó dedicado | 4 vCPU, 16GiB por nó | Carga sustentada/necessidades de isolamento |
| Dedicado D8 | Cobrança por nó dedicado | 8 vCPU, 32GiB por nó | Carga sustentada maior |

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

### Script de Estimativa de Custos

**Apenas pseudocódigo:** `Get-ResourceCost` abaixo é uma função específica de projeto que deve implementar usando preços regionais/contratuais atuais e pressupostos de uso. Não é um cmdlet PowerShell ou Azure.

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

O YAML seguinte é um esboço de requisitos, **não** um esquema de entrada para Azure Load Testing, JMeter, Locust, ou k6. Traduza-o para a configuração real da sua ferramenta escolhida antes de usar o comando de teste de carga acima.

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

## Resumo das Melhores Práticas

### O que fazer

1. **Comece pequeno e aumente** com base no uso real
2. **Use SKUs diferentes para ambientes diferentes**
3. **Monitorize desempenho e custos continuamente**
4. **Aproveite a capacidade reservada para cargas de produção**
5. **Implemente auto-escalabilidade onde adequado**
6. **Teste desempenho com cargas de trabalho realistas**
7. **Planeie para o crescimento mas evite sobreprovisionamento**
8. **Use níveis gratuitos para desenvolvimento quando possível**

### O que não fazer

1. **Não use SKUs de produção para desenvolvimento**
2. **Não ignore a disponibilidade regional de SKUs**
3. **Não se esqueça dos custos de transferência de dados**
4. **Não faça sobreprovisionamento sem justificação**
5. **Não ignore o impacto das dependências**
6. **Não defina limites de auto-escalabilidade demasiado altos**
7. **Não se esqueça dos requisitos de conformidade**
8. **Não tome decisões baseadas só no preço**

---

**Dica Profissional**: Use Azure Cost Management e Advisor para obter recomendações personalizadas para otimizar a seleção dos seus SKUs com base em padrões reais de utilização.

---

**Navegação**
- **Lição Anterior**: [Planeamento de Capacidade](capacity-planning.md)
- **Lição Seguinte**: [Verificações Pré-voo](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
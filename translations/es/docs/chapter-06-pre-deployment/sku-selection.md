# Guía de Selección de SKU - Elegir los niveles de servicio de Azure adecuados

**Chapter Navigation:**
- **📚 Inicio del Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo actual**: Capítulo 6 - Pre-Deployment Validation & Planning
- **⬅️ Anterior**: [Planificación de Capacidad](capacity-planning.md)
- **➡️ Siguiente**: [Comprobaciones previas](preflight-checks.md)
- **🚀 Siguiente Capítulo**: [Capítulo 7: Resolución de problemas](../chapter-07-troubleshooting/common-issues.md)

## Introducción

Esta guía completa te ayuda a seleccionar los SKU (Stock Keeping Units) óptimos de los servicios de Azure para diferentes entornos, cargas de trabajo y requerimientos. Aprende a analizar las necesidades de rendimiento, consideraciones de coste y requisitos de escalabilidad para elegir los niveles de servicio más apropiados para tus despliegues con Azure Developer CLI.

## Objetivos de aprendizaje

Al completar esta guía, usted:
- Comprenderá los conceptos de SKU de Azure, los modelos de precios y las diferencias de características
- Dominará las estrategias de selección de SKU específicas por entorno para desarrollo, staging y producción
- Analizará los requisitos de la carga de trabajo y los emparejará con los niveles de servicio apropiados
- Implementará estrategias de optimización de costes mediante selección inteligente de SKU
- Aplicará técnicas de pruebas de rendimiento y validación para las elecciones de SKU
- Configurará recomendaciones automáticas de SKU y monitorización

## Resultados del aprendizaje

Al finalizar, podrás:
- Seleccionar los SKU de servicios de Azure apropiados según los requisitos y restricciones de la carga de trabajo
- Diseñar arquitecturas multi-entorno rentables con la selección de niveles adecuada
- Implementar benchmarking de rendimiento y validación para las elecciones de SKU
- Crear herramientas automatizadas para recomendación de SKU y optimización de costes
- Planificar migraciones de SKU y estrategias de escalado para requisitos cambiantes
- Aplicar los principios del Azure Well-Architected Framework a la selección de niveles de servicio

## Tabla de contenidos

- [Understanding SKUs](../../../../docs/chapter-06-pre-deployment)
- [Environment-Based Selection](../../../../docs/chapter-06-pre-deployment)
- [Service-Specific Guidelines](../../../../docs/chapter-06-pre-deployment)
- [Cost Optimization Strategies](../../../../docs/chapter-06-pre-deployment)
- [Performance Considerations](../../../../docs/chapter-06-pre-deployment)
- [Quick Reference Tables](../../../../docs/chapter-06-pre-deployment)
- [Validation Tools](../../../../docs/chapter-06-pre-deployment)

---

## Understanding SKUs

### What are SKUs?

Los SKUs (Stock Keeping Units) representan diferentes niveles de servicio y niveles de rendimiento para los recursos de Azure. Cada SKU ofrece diferente:

- **Características de rendimiento** (CPU, memoria, throughput)
- **Disponibilidad de características** (opciones de escalado, niveles de SLA)
- **Modelos de precios** (basados en consumo, capacidad reservada)
- **Disponibilidad regional** (no todos los SKUs están disponibles en todas las regiones)

### Factores clave en la selección de SKU

1. **Requisitos de la carga de trabajo**
   - Patrones esperados de tráfico/carga
   - Requisitos de rendimiento (CPU, memoria, I/O)
   - Necesidades de almacenamiento y patrones de acceso

2. **Tipo de entorno**
   - Desarrollo/pruebas vs. producción
   - Requisitos de disponibilidad
   - Necesidades de seguridad y cumplimiento

3. **Restricciones presupuestarias**
   - Costes iniciales vs. costes operativos
   - Descuentos por capacidad reservada
   - Implicaciones de coste del autoescalado

4. **Proyecciones de crecimiento**
   - Requisitos de escalabilidad
   - Necesidades futuras de características
   - Complejidad de migración

---

## Environment-Based Selection

### Entorno de Desarrollo

**Prioridades**: Optimización de costes, funcionalidad básica, aprovisionamiento/desaprovisionamiento sencillo

#### SKUs recomendados
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
- **App Service**: F1 (Free) o B1 (Basic) para pruebas simples
- **Bases de datos**: Nivel Basic con recursos mínimos
- **Almacenamiento**: Estándar con redundancia local únicamente
- **Cómputo**: Recursos compartidos aceptables
- **Redes**: Configuraciones básicas

### Entorno de Staging/Pruebas

**Prioridades**: Configuración similar a producción, equilibrio de costes, capacidad de pruebas de rendimiento

#### SKUs recomendados
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
- **Rendimiento**: 70-80% de la capacidad de producción
- **Características**: La mayoría de las funciones de producción habilitadas
- **Redundancia**: Alguna redundancia geográfica
- **Escalado**: Autoescalado limitado para pruebas
- **Monitorización**: Pila de monitorización completa

### Entorno de Producción

**Prioridades**: Rendimiento, disponibilidad, seguridad, cumplimiento, escalabilidad

#### SKUs recomendados
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
- **Alta disponibilidad**: Requisitos de SLA del 99.9%+
- **Rendimiento**: Recursos dedicados, alto throughput
- **Seguridad**: Características de seguridad premium
- **Escalado**: Capacidades completas de autoescalado
- **Monitorización**: Observabilidad integral

---

## Service-Specific Guidelines

### Azure App Service

#### Matriz de decisión de SKU

| Use Case | Recommended SKU | Rationale |
|----------|----------------|-----------|
| Development/Testing | F1 (Free) or B1 (Basic) | Cost-effective, sufficient for testing |
| Small production apps | S1 (Standard) | Custom domains, SSL, auto-scaling |
| Medium production apps | P1V3 (Premium V3) | Better performance, more features |
| High-traffic apps | P2V3 or P3V3 | Dedicated resources, high performance |
| Mission-critical apps | I1V2 (Isolated V2) | Network isolation, dedicated hardware |

#### Ejemplos de configuración

**Development**
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

**Production**
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

#### Marco de selección de SKU

1. **Basado en DTU (Database Transaction Units)**
   - **Basic**: 5 DTU - Desarrollo/pruebas
   - **Standard**: S0-S12 (10-3000 DTU) - Propósito general
   - **Premium**: P1-P15 (125-4000 DTU) - Crítico para rendimiento

2. **Basado en vCore** (Recomendado para producción)
   - **General Purpose**: Equilibrio entre cómputo y almacenamiento
   - **Business Critical**: Baja latencia, altas IOPS
   - **Hyperscale**: Almacenamiento altamente escalable (hasta 100TB)

#### Configuraciones de ejemplo

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

#### Tipos de entorno

1. **Basado en consumo**
   - Precios pay-per-use
   - Adecuado para desarrollo y cargas variables
   - Infraestructura compartida

2. **Dedicado (Perfiles de carga)**
   - Recursos de cómputo dedicados
   - Rendimiento predecible
   - Mejor para cargas de producción

#### Ejemplos de configuración

**Development (Consumption)**
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

**Production (Dedicated)**
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

#### Modelos de throughput

1. **Throughput aprovisionado manualmente**
   - Rendimiento predecible
   - Descuentos por capacidad reservada
   - Mejor para cargas constantes

2. **Throughput aprovisionado con Autoscale**
   - Escalado automático basado en uso
   - Pago por lo que usas (con un mínimo)
   - Bueno para cargas variables

3. **Serverless**
   - Pago por solicitud
   - Sin throughput aprovisionado
   - Ideal para desarrollo y cargas intermitentes

#### Ejemplos de SKU

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

#### Tipos de cuenta de almacenamiento

1. **Standard_LRS** - Desarrollo, datos no críticos
2. **Standard_GRS** - Producción, se necesita geo-redundancia
3. **Premium_LRS** - Aplicaciones de alto rendimiento
4. **Premium_ZRS** - Alta disponibilidad con redundancia por zonas

#### Niveles de rendimiento

- **Standard**: Propósito general, rentable
- **Premium**: Escenarios de alto rendimiento y baja latencia

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

## Estrategias de optimización de costes

### 1. Capacidad reservada

Reserva recursos por 1-3 años para descuentos significativos:

```bash
# Comprobar opciones de reserva
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Dimensionamiento adecuado (Right-Sizing)

Comienza con SKUs más pequeños y escala según el uso real:

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

### 3. Configuración de autoescalado

Implementa escalado inteligente para optimizar costes:

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

### 4. Escalado programado

Reduce la escala durante horas inactivas:

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

## Consideraciones de rendimiento

### Requisitos de rendimiento base

Define requisitos claros de rendimiento antes de la selección de SKU:

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

### Pruebas de carga

Prueba diferentes SKUs para validar el rendimiento:

```bash
# Servicio de pruebas de carga de Azure
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Monitorización y optimización

Configura una monitorización integral:

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

## Tablas de referencia rápida

### Referencia rápida de SKU de App Service

| SKU | Tier | vCPU | RAM | Storage | Price Range | Use Case |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | Development |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | Small apps |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Production |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | High performance |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Enterprise |

### Referencia rápida de SKU de SQL Database

| SKU | Tier | DTU/vCore | Storage | Price Range | Use Case |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | Development |
| S2 | Standard | 50 DTU | 250GB | $$ | Small production |
| P2 | Premium | 250 DTU | 1TB | $$$ | High performance |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | Balanced |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | Mission critical |

### Referencia rápida de SKU de Container Apps

| Model | Pricing | CPU/Memory | Use Case |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | Development, variable load |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | Production |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | High performance |

---

## Herramientas de validación

### Comprobador de disponibilidad de SKU

```bash
#!/bin/bash
# Comprobar la disponibilidad del SKU en la región de destino

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

# Uso
check_sku_availability "eastus" "app-service" "P1V3"
```

### Script de estimación de costes

```powershell
# Script de PowerShell para estimación de costes
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
        
        # Usar la API de precios de Azure o la calculadora
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Uso
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### Validación de rendimiento

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

## Resumen de buenas prácticas

### Qué hacer

1. **Empieza pequeño y escala** según el uso real
2. **Usa SKUs diferentes para distintos entornos**
3. **Monitorea rendimiento y costes continuamente**
4. **Aprovecha la capacidad reservada para cargas de producción**
5. **Implementa autoescalado donde corresponda**
6. **Prueba el rendimiento con cargas realistas**
7. **Planifica el crecimiento pero evita el sobreaprovisionamiento**
8. **Usa niveles gratuitos para desarrollo cuando sea posible**

### Qué no hacer

1. **No uses SKUs de producción para desarrollo**
2. **No ignores la disponibilidad regional de SKUs**
3. **No olvides los costes de transferencia de datos**
4. **No sobreaprovisiones sin justificación**
5. **No ignores el impacto de las dependencias**
6. **No establezcas límites de autoescalado demasiado altos**
7. **No olvides los requisitos de cumplimiento**
8. **No tomes decisiones basadas solo en el precio**

---

**Consejo profesional**: Usa Azure Cost Management y Advisor para obtener recomendaciones personalizadas para optimizar tus selecciones de SKU en función de los patrones de uso reales.

---

**Navigation**
- **Previous Lesson**: [Planificación de Capacidad](capacity-planning.md)
- **Next Lesson**: [Comprobaciones previas](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
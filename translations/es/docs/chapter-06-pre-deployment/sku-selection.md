# Guía de Selección de SKU - Elegir los Niveles de Servicio Azure Adecuados

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 6 - Validación y Planificación Pre-Despliegue
- **⬅️ Anterior**: [Planificación de Capacidad](capacity-planning.md)
- **➡️ Siguiente**: [Verificaciones Previas](preflight-checks.md)
- **🚀 Próximo Capítulo**: [Capítulo 7: Resolución de Problemas](../chapter-07-troubleshooting/common-issues.md)

## Introducción

Esta guía completa te ayuda a seleccionar los SKU (Unidades de Mantenimiento de Stock) óptimos para servicios de Azure en diferentes entornos, cargas de trabajo y requisitos. Aprende a analizar necesidades de rendimiento, consideraciones de costos y requisitos de escalabilidad para elegir los niveles de servicio más apropiados para tus implementaciones con Azure Developer CLI.

## Objetivos de Aprendizaje

Al completar esta guía, podrás:
- Entender los conceptos de SKU de Azure, modelos de precios y diferencias de características
- Dominar estrategias de selección de SKU específicas para entornos de desarrollo, pruebas y producción
- Analizar los requisitos de carga de trabajo y relacionarlos con niveles de servicio adecuados
- Implementar estrategias de optimización de costos mediante una selección inteligente de SKU
- Aplicar técnicas de prueba y validación de rendimiento para elecciones de SKU
- Configurar recomendaciones y monitoreo automatizados de SKU

## Resultados de Aprendizaje

Al finalizar, serás capaz de:
- Seleccionar SKU de servicios Azure adecuados basados en requisitos y limitaciones de carga de trabajo
- Diseñar arquitecturas multi-entorno rentables con selección correcta de niveles
- Implementar benchmarking y validación de rendimiento para elecciones de SKU
- Crear herramientas automatizadas para recomendación de SKU y optimización de costos
- Planificar migraciones y estrategias de escalado de SKU para requisitos cambiantes
- Aplicar los principios del Marco Azure Well-Architected en la selección de niveles de servicio

## Tabla de Contenidos

- [Entendiendo los SKUs](#understanding-skus)
- [Selección Basada en el Entorno](#environment-based-selection)
- [Directrices Específicas por Servicio](#service-specific-guidelines)
- [Estrategias de Optimización de Costos](#cost-optimization-strategies)
- [Consideraciones de Rendimiento](#performance-considerations)
- [Tablas de Referencia Rápida](#quick-reference-tables)
- [Herramientas de Validación](#validation-tools)

---

## Entendiendo los SKUs

> **Ejemplo de alcance:** Los mapas YAML de SKU y configuraciones de rendimiento a continuación son notas de diseño, no un esquema `azure.yaml` ni configuración de herramienta de carga. Los bloques Bicep son alternativas/fragments: declaran sus parámetros y recursos padre, usan nombres simbólicos únicos al combinarlos, y conectan módulos en un proyecto funcional. Los precios, límites y disponibilidad regional/SKU deben verificarse para tu suscripción antes del despliegue.

### ¿Qué son los SKUs?

Los SKU (Unidades de Mantenimiento de Stock) representan diferentes niveles de servicio y niveles de rendimiento para recursos de Azure. Cada SKU ofrece diferentes:

- **Características de rendimiento** (CPU, memoria, rendimiento)
- **Disponibilidad de características** (opciones de escalado, niveles de SLA)
- **Modelos de precios** (basados en consumo, capacidad reservada)
- **Disponibilidad regional** (no todos los SKU están disponibles en todas las regiones)

### Factores Clave en la Selección de SKU

1. **Requisitos de Carga de Trabajo**
   - Tráfico/patrones de carga esperados
   - Requisitos de rendimiento (CPU, memoria, E/S)
   - Necesidades de almacenamiento y patrones de acceso

2. **Tipo de Entorno**
   - Desarrollo/pruebas vs. producción
   - Requisitos de disponibilidad
   - Necesidades de seguridad y cumplimiento

3. **Restricciones Presupuestarias**
   - Costos iniciales vs. costos operativos
   - Descuentos por capacidad reservada
   - Implicaciones de costos de autoescalado

4. **Proyecciones de Crecimiento**
   - Requisitos de escalabilidad
   - Necesidades futuras de características
   - Complejidad de migración

---

## Selección Basada en el Entorno

### Entorno de Desarrollo

**Prioridades**: Optimización de costos, funcionalidad básica, fácil aprovisionamiento y desaprovisionamiento

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
- **App Service**: F1 (Gratis) o B1 (Básico) para pruebas simples
- **Bases de datos**: Nivel básico con recursos mínimos
- **Almacenamiento**: Estándar con redundancia local solamente
- **Cómputo**: Recursos compartidos aceptables
- **Redes**: Configuraciones básicas

### Entorno de Preproducción/Pruebas

**Prioridades**: Configuración similar a producción, equilibrio de costos, capacidad para pruebas de rendimiento

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
- **Rendimiento**: 70-80% de la capacidad de producción
- **Características**: La mayoría de características de producción habilitadas
- **Redundancia**: Algo de redundancia geográfica
- **Escalado**: Autoescalado limitado para pruebas
- **Monitoreo**: Stack completo de monitoreo

### Entorno de Producción

**Prioridades**: Rendimiento, disponibilidad, seguridad, cumplimiento, escalabilidad

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
- **Alta disponibilidad**: Requerimientos de SLA de 99.9%+
- **Rendimiento**: Recursos dedicados, alto rendimiento
- **Seguridad**: Características premium de seguridad
- **Escalado**: Capacidades completas de autoescalado
- **Monitoreo**: Observabilidad integral

---

## Directrices Específicas por Servicio

### Azure App Service

#### Matriz de Decisión de SKU

| Caso de Uso | SKU Recomendado | Justificación |
|----------|----------------|-----------|
| Desarrollo/Pruebas | F1 (Gratis) o B1 (Básico) | Rentable, suficiente para pruebas |
| Aplicaciones pequeñas de producción | S1 (Estándar) | Dominios personalizados, SSL, autoescalado |
| Aplicaciones medianas de producción | P1V3 (Premium V3) | Mejor rendimiento, más características |
| Aplicaciones de alto tráfico | P2V3 o P3V3 | Recursos dedicados, alto rendimiento |
| Aplicaciones críticas | I1V2 (Aislado V2) | Aislamiento de red, hardware dedicado |

#### Ejemplos de Configuración

**Desarrollo**
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

**Producción**
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

#### Marco de Selección de SKU

1. **Basado en DTU (Unidades de Transacción de Base de Datos)**
   - **Básico**: 5 DTU - Desarrollo/pruebas
   - **Estándar**: S0-S12 (10-3000 DTU) - Propósito general
   - **Premium**: P1-P15 (125-4000 DTU) - Crítico en rendimiento

2. **Basado en vCore** (Recomendado para producción)
   - **Propósito General**: Equilibrio entre cómputo y almacenamiento
   - **Crítico para Negocios**: Baja latencia, alto IOPS
   - **Hyperscale**: Almacenamiento altamente escalable; verificar límites actuales y soporte regional

#### Ejemplos de Configuración

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

#### Tipos de Entorno

1. **Basado en consumo**
   - Precio por uso
   - Adecuado para desarrollo y cargas de trabajo variables
   - Infraestructura compartida

2. **Dedicado (Perfiles de carga de trabajo)**
   - Recursos de cómputo dedicados
   - Rendimiento predecible
   - Mejor para cargas de producción

#### Ejemplos de Configuración

**Desarrollo (Consumo)**
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

**Producción (Dedicado)**
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

La redundancia por zonas también requiere infraestructura en regiones soportadas y configuración adecuada de VNet/subred, omitidos aquí. Este ejemplo presupone tres nodos dedicados; configura al menos dos réplicas de app para distribución cruzada por zona y dimensiona réplicas y nodos para fallos de zona. Consulta [guía de confiabilidad de Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Para asignar una app a este perfil, configura su `workloadProfileName: 'production-profile'`; crear solo el perfil no mueve las apps a él.

### Azure Cosmos DB

#### Modelos de Rendimiento

1. **Rendimiento Provisionado Manual**
   - Rendimiento predecible
   - Descuentos por capacidad reservada
   - Mejor para cargas constantes

2. **Rendimiento Provisionado con Autoescalado**
   - Escalado automático basado en uso
   - Pago por consumo (con mínimo)
   - Bueno para cargas variables

3. **Serverless**
   - Pago por solicitud
   - Sin rendimiento provisionado
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

### Cuenta de Almacenamiento Azure

#### Tipos de Cuentas de Almacenamiento

1. **Standard_LRS** - Desarrollo, datos no críticos
2. **Standard_GRS** - Producción, redundancia geográfica necesaria
3. **Premium_LRS** - Aplicaciones de alto rendimiento
4. **Premium_ZRS** - Alta disponibilidad con redundancia por zona

#### Niveles de Rendimiento

- **Estándar**: Propósito general, rentable
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

## Estrategias de Optimización de Costos

### 1. Capacidad Reservada

Reserva recursos por 1-3 años para obtener descuentos significativos:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Las ofertas de reserva y tipos de recursos elegibles varían; inspecciona el catálogo y términos de compra en lugar de asumir que todos los servicios/SKU admiten reserva.

### 2. Dimensionamiento Correcto

Comienza con SKU más pequeños y escala según uso real:

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

### 3. Configuración de Autoescalado

Implementa escalado inteligente para optimizar costos:

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

### 4. Escalado Programado

Reduce escala durante horas de baja actividad:

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

## Consideraciones de Rendimiento

### Requisitos Básicos de Rendimiento

Define requisitos claros de rendimiento antes de seleccionar SKU:

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

### Pruebas de Carga

Prueba diferentes SKU para validar rendimiento:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Monitoreo y Optimización

Configura monitoreo integral:

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

## Tablas de Referencia Rápida

### Referencia Rápida de SKU para App Service

| SKU | Nivel | vCPU | RAM | Almacenamiento | Rango de Precio | Caso de Uso |
|-----|------|------|-----|---------------|-----------------|------------|
| F1 | Gratis | Compartido | 1GB | 1GB | Gratis | Desarrollo |
| B1 | Básico | 1 | 1.75GB | 10GB | $ | Aplicaciones pequeñas |
| S1 | Estándar | 1 | 1.75GB | 50GB | $$ | Producción |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Alto rendimiento |
| I1V2 | Aislado V2 | 2 | 8GB | 1TB | $$$$ | Empresarial |

### Referencia Rápida de SKU para Base de Datos SQL

| SKU | Nivel | DTU/vCore | Almacenamiento | Rango de Precio | Caso de Uso |
|-----|------|-----------|---------------|-----------------|------------|
| Básico | Básico | 5 DTU | 2GB | $ | Desarrollo |
| S2 | Estándar | 50 DTU | 250GB | $$ | Producción pequeña |
| P2 | Premium | 250 DTU | 1TB | $$$ | Alto rendimiento |
| GP_Gen5_4 | Propósito General | 4 vCore | 4TB | $$$ | Balanceado |
| BC_Gen5_8 | Crítico para Negocios | 8 vCore | 4TB | $$$$ | Misión crítica |

### Referencia Rápida de SKU para Container Apps

| Modelo | Precio | CPU/Memoria | Caso de Uso |
|--------|--------|------------|------------|
| Consumo | Pago por uso | Combinaciones de CPU/memoria soportadas dependen del entorno/perfil | Desarrollo o producción, carga variable |
| Dedicado D4 | Facturación por nodo dedicado | 4 vCPU, 16GiB por nodo | Carga sostenida/necesidades de aislamiento |
| Dedicado D8 | Facturación por nodo dedicado | 8 vCPU, 32GiB por nodo | Carga sostenida mayor |

---

## Herramientas de Validación

### Verificador de Disponibilidad de SKU

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

### Script de Estimación de Costos

**Solo pseudocódigo:** `Get-ResourceCost` abajo es una función específica del proyecto que debes implementar usando los precios regionales/contractuales actuales y supuestos de uso. No es un cmdlet de PowerShell o Azure.

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

### Validación de Rendimiento

El siguiente YAML es un bosquejo de requisitos, **no** es un esquema de entrada para Azure Load Testing, JMeter, Locust o k6. Tradúcelo a la configuración real de la herramienta que utilices antes de usar el comando de prueba de carga arriba.

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

## Resumen de Mejores Prácticas

### Recomendaciones

1. **Comienza pequeño y escala según uso real**
2. **Usa diferentes SKU para diferentes entornos**
3. **Monitorea rendimiento y costos continuamente**
4. **Aprovecha la capacidad reservada para cargas de producción**
5. **Implementa autoescalado donde sea apropiado**
6. **Prueba el rendimiento con cargas realistas**
7. **Planea para crecimiento pero evita sobreaprovisionamiento**
8. **Usa niveles gratuitos para desarrollo cuando sea posible**

### Lo que NO debes hacer

1. **No uses SKU de producción para desarrollo**
2. **No ignores la disponibilidad regional de SKU**
3. **No olvides los costos de transferencia de datos**
4. **No sobreaprovisiones sin justificación**
5. **No ignores el impacto de dependencias**
6. **No establezcas límites de autoescalado demasiado altos**
7. **No olvides los requisitos de cumplimiento**
8. **No tomes decisiones basadas solo en el precio**

---

**Consejo Profesional**: Usa Azure Cost Management y Advisor para obtener recomendaciones personalizadas para optimizar tus selecciones de SKU basadas en los patrones reales de uso.

---

**Navegación**
- **Lección Anterior**: [Planificación de Capacidad](capacity-planning.md)
- **Próxima Lección**: [Verificaciones Previas](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# SKU 선택 가이드 - 적합한 Azure 서비스 계층 선택하기

**Chapter Navigation:**
- **📚 Course Home**: [초보자를 위한 AZD](../../README.md)
- **📖 Current Chapter**: 챕터 6 - 배포 전 검증 및 계획
- **⬅️ Previous**: [용량 계획](capacity-planning.md)
- **➡️ Next**: [사전 점검](preflight-checks.md)
- **🚀 Next Chapter**: [7장: 문제 해결](../chapter-07-troubleshooting/common-issues.md)

## 소개

이 포괄적인 가이드는 다양한 환경, 워크로드 및 요구 사항에 적합한 Azure 서비스 SKU(Stock Keeping Units)를 선택하는 데 도움을 줍니다. 성능 요구사항, 비용 고려사항 및 확장성 요구를 분석하여 Azure Developer CLI 배포에 가장 적합한 서비스 계층을 선택하는 방법을 배우십시오.

## 학습 목표

이 가이드를 완료하면 다음을 할 수 있습니다:
- Azure SKU 개념, 가격 모델 및 기능 차이를 이해합니다
- 개발, 스테이징 및 운영 환경별 SKU 선택 전략을 숙달합니다
- 워크로드 요구사항을 분석하고 적절한 서비스 계층과 매칭합니다
- 지능적인 SKU 선택을 통해 비용 최적화 전략을 구현합니다
- SKU 선택을 위한 성능 테스트 및 검증 기법을 적용합니다
- 자동화된 SKU 권장 사항 및 모니터링을 구성합니다

## 학습 성과

완료 후 다음을 수행할 수 있습니다:
- 워크로드 요구사항 및 제약을 기반으로 적절한 Azure 서비스 SKU를 선택합니다
- 적절한 계층 선택으로 비용 효율적인 멀티 환경 아키텍처를 설계합니다
- SKU 선택에 대한 성능 벤치마크 및 검증을 구현합니다
- SKU 권장 및 비용 최적화를 위한 자동화 도구를 만듭니다
- 변화하는 요구사항에 대한 SKU 마이그레이션 및 확장 전략을 계획합니다
- 서비스 계층 선택에 Azure Well-Architected Framework 원칙을 적용합니다

## 목차

- [SKU 이해](../../../../docs/chapter-06-pre-deployment)
- [환경 기반 선택](../../../../docs/chapter-06-pre-deployment)
- [서비스별 가이드라인](../../../../docs/chapter-06-pre-deployment)
- [비용 최적화 전략](../../../../docs/chapter-06-pre-deployment)
- [성능 고려사항](../../../../docs/chapter-06-pre-deployment)
- [빠른 참조 표](../../../../docs/chapter-06-pre-deployment)
- [검증 도구](../../../../docs/chapter-06-pre-deployment)

---

## SKU 이해

### SKU란?

SKU(Stock Keeping Units)는 Azure 리소스의 서로 다른 서비스 계층 및 성능 수준을 나타냅니다. 각 SKU는 다음과 같은 차이를 제공합니다:

- **성능 특성** (CPU, 메모리, 처리량)
- **기능 가용성** (스케일링 옵션, SLA 수준)
- **가격 모델** (사용량 기반, 예약 용량)
- **지역 가용성** (모든 SKU가 모든 지역에서 제공되는 것은 아님)

### SKU 선택의 핵심 요소

1. **워크로드 요구사항**
   - 예상 트래픽/부하 패턴
   - 성능 요구사항 (CPU, 메모리, I/O)
   - 스토리지 필요량 및 접근 패턴

2. **환경 유형**
   - 개발/테스트 대 운영
   - 가용성 요구사항
   - 보안 및 규정 준수 필요

3. **예산 제약**
   - 초기 비용 대 운영 비용
   - 예약 용량 할인
   - 자동 확장 시 비용 영향

4. **성장 예측**
   - 확장성 요구사항
   - 향후 기능 필요
   - 마이그레이션 복잡성

---

## 환경 기반 선택

### 개발 환경

**우선순위**: 비용 최적화, 기본 기능, 손쉬운 프로비저닝/해제

#### 권장 SKU
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

#### 특성
- **App Service**: 간단한 테스트에는 F1 (무료) 또는 B1 (Basic)
- **Databases**: 최소 리소스의 Basic 계층
- **Storage**: 로컬 중복성만 있는 Standard
- **Compute**: 공유 리소스 허용 가능
- **Networking**: 기본 구성

### 스테이징/테스트 환경

**우선순위**: 운영 환경과 유사한 구성, 비용 균형, 성능 테스트 기능

#### 권장 SKU
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

#### 특성
- **성능**: 운영 용량의 70-80%
- **기능**: 대부분의 운영 기능 활성화
- **중복성**: 일부 지리적 중복성
- **스케일링**: 테스트를 위한 제한된 자동 확장
- **모니터링**: 전체 모니터링 스택

### 운영 환경

**우선순위**: 성능, 가용성, 보안, 규정 준수, 확장성

#### 권장 SKU
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

#### 특성
- **고가용성**: 99.9%+ SLA 요구사항
- **성능**: 전용 리소스, 높은 처리량
- **보안**: 프리미엄 보안 기능
- **스케일링**: 완전한 자동 확장 기능
- **모니터링**: 종합적인 관찰 가능성

---

## 서비스별 가이드라인

### Azure App Service

#### SKU 결정 매트릭스

| 사용 사례 | 권장 SKU | 근거 |
|----------|----------------|-----------|
| 개발/테스트 | F1 (Free) or B1 (Basic) | 비용 효율적, 테스트에 충분함 |
| 소규모 운영 앱 | S1 (Standard) | 커스텀 도메인, SSL, 자동 확장 |
| 중간 규모 운영 앱 | P1V3 (Premium V3) | 더 나은 성능, 추가 기능 |
| 대규모 트래픽 앱 | P2V3 or P3V3 | 전용 리소스, 고성능 |
| 미션 크리티컬 앱 | I1V2 (Isolated V2) | 네트워크 격리, 전용 하드웨어 |

#### 구성 예시

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

#### SKU 선택 프레임워크

1. **DTU 기반 (Database Transaction Units)**
   - **Basic**: 5 DTU - 개발/테스트
   - **Standard**: S0-S12 (10-3000 DTU) - 범용
   - **Premium**: P1-P15 (125-4000 DTU) - 성능 중요

2. **vCore 기반** (운영에 권장)
   - **General Purpose**: 컴퓨트와 스토리지의 균형
   - **Business Critical**: 낮은 지연, 높은 IOPS
   - **Hyperscale**: 매우 확장 가능한 스토리지 (최대 100TB)

#### 구성 예시

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

#### 환경 유형

1. **Consumption 기반**
   - 사용량별 과금
   - 개발 및 변동 워크로드에 적합
   - 공유 인프라

2. **Dedicated (워크로드 프로파일)**
   - 전용 컴퓨트 리소스
   - 예측 가능한 성능
   - 운영 워크로드에 적합

#### 구성 예시

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

#### 처리량 모델

1. **수동 프로비저닝 처리량**
   - 예측 가능한 성능
   - 예약 용량 할인
   - 안정적인 워크로드에 적합

2. **자동확장 프로비저닝 처리량**
   - 사용량에 따른 자동 확장
   - 사용한 만큼 지불(최소값 존재)
   - 가변 워크로드에 적합

3. **서버리스**
   - 요청당 과금
   - 프로비저닝 처리량 없음
   - 개발 및 간헐적 워크로드에 이상적

#### SKU 예시

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

#### 스토리지 계정 유형

1. **Standard_LRS** - 개발, 비중요 데이터
2. **Standard_GRS** - 운영, 지리적 중복 필요
3. **Premium_LRS** - 고성능 애플리케이션
4. **Premium_ZRS** - 영역 중복을 통한 고가용성

#### 성능 계층

- **Standard**: 범용, 비용 효율적
- **Premium**: 고성능, 저지연 시나리오

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

## 비용 최적화 전략

### 1. 예약 용량

1-3년 단위로 리소스를 예약하여 큰 폭의 할인을 받으세요:

```bash
# 예약 옵션을 확인하세요
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 적정 사이징

작은 SKU로 시작하고 실제 사용량에 따라 확장하세요:

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

### 3. 자동 확장 구성

비용을 최적화하기 위해 지능형 스케일링을 구현하세요:

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

### 4. 예약된 스케일링

비업무 시간에 축소하세요:

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

## 성능 고려사항

### 기본 성능 요구사항

SKU 선택 전에 명확한 성능 요구사항을 정의하세요:

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

### 부하 테스트

다양한 SKU를 테스트하여 성능을 검증하세요:

```bash
# Azure 부하 테스트 서비스
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### 모니터링 및 최적화

종합적인 모니터링을 설정하세요:

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

## 빠른 참조 표

### App Service SKU 빠른 참조

| SKU | 계층 | vCPU | RAM | Storage | 가격대 | 사용 사례 |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Free | Shared | 1GB | 1GB | Free | 개발 |
| B1 | Basic | 1 | 1.75GB | 10GB | $ | 소규모 앱 |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | 운영 |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | 고성능 |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | 엔터프라이즈 |

### SQL Database SKU 빠른 참조

| SKU | 계층 | DTU/vCore | Storage | 가격대 | 사용 사례 |
|-----|------|-----------|---------|-------------|----------|
| Basic | Basic | 5 DTU | 2GB | $ | 개발 |
| S2 | Standard | 50 DTU | 250GB | $$ | 소규모 운영 |
| P2 | Premium | 250 DTU | 1TB | $$$ | 고성능 |
| GP_Gen5_4 | General Purpose | 4 vCore | 4TB | $$$ | 균형형 |
| BC_Gen5_8 | Business Critical | 8 vCore | 4TB | $$$$ | 미션 크리티컬 |

### Container Apps SKU 빠른 참조

| 모델 | 가격 정책 | CPU/메모리 | 사용 사례 |
|-------|---------|------------|----------|
| Consumption | Pay-per-use | 0.25-2 vCPU | 개발, 변동 부하 |
| Dedicated D4 | Reserved | 4 vCPU, 16GB | 운영 |
| Dedicated D8 | Reserved | 8 vCPU, 32GB | 고성능 |

---

## 검증 도구

### SKU 가용성 확인기

```bash
#!/bin/bash
# 대상 지역의 SKU 가용성 확인

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

# 사용법
check_sku_availability "eastus" "app-service" "P1V3"
```

### 비용 추정 스크립트

```powershell
# 비용 추정을 위한 PowerShell 스크립트
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
        
        # Azure 가격 책정 API 또는 계산기 사용
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# 사용법
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### 성능 검증

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

## 권장 모범 사례 요약

### 해야 할 일

1. **작게 시작하고 실제 사용량에 따라 확장하기**
2. **환경별로 다른 SKU 사용하기**
3. **성능과 비용을 지속적으로 모니터링하기**
4. **운영 워크로드에는 예약 용량 활용하기**
5. **적절한 곳에 자동 확장 구현하기**
6. **현실적인 워크로드로 성능 테스트하기**
7. **성장을 계획하되 과다 프로비저닝을 피하기**
8. **가능하면 개발에는 무료 계층 사용하기**

### 하지 말아야 할 일

1. **개발에 운영 SKU를 사용하지 않기**
2. **지역별 SKU 가용성을 무시하지 않기**
3. **데이터 전송 비용을 잊지 않기**
4. **정당한 이유 없이 과다 프로비저닝하지 않기**
5. **종속성의 영향을 무시하지 않기**
6. **자동 확장 한도를 너무 높게 설정하지 않기**
7. **규정 준수 요구사항을 잊지 않기**
8. **가격만 보고 결정하지 않기**

---

**Pro Tip**: Azure Cost Management 및 Advisor를 사용하여 실제 사용 패턴을 기반으로 한 개인화된 SKU 최적화 권장사항을 받으세요.

---

**Navigation**
- **Previous Lesson**: [용량 계획](capacity-planning.md)
- **Next Lesson**: [사전 점검](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원문(원어로 된 문서)을 권위 있는 출처로 간주하시기 바랍니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
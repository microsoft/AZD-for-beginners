<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T17:25:31+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "ko"
}
-->
# SKU 선택 가이드 - 적합한 Azure 서비스 계층 선택하기

## 소개

이 포괄적인 가이드는 다양한 환경, 워크로드 및 요구 사항에 맞는 최적의 Azure 서비스 SKU(Stock Keeping Units)를 선택하는 방법을 제공합니다. 성능 요구 사항, 비용 고려 사항, 확장성 요구 사항을 분석하여 Azure Developer CLI 배포에 가장 적합한 서비스 계층을 선택하는 방법을 배울 수 있습니다.

## 학습 목표

이 가이드를 완료하면 다음을 이해할 수 있습니다:
- Azure SKU 개념, 가격 모델 및 기능 차이
- 개발, 스테이징, 프로덕션 환경에 맞는 SKU 선택 전략
- 워크로드 요구 사항을 분석하고 적합한 서비스 계층과 매칭
- 지능적인 SKU 선택을 통한 비용 최적화 전략 구현
- SKU 선택에 대한 성능 테스트 및 검증 기술 적용
- 자동화된 SKU 추천 및 모니터링 구성

## 학습 결과

가이드를 완료하면 다음을 수행할 수 있습니다:
- 워크로드 요구 사항 및 제약 조건에 따라 적합한 Azure 서비스 SKU 선택
- 적절한 계층 선택을 통해 비용 효율적인 다중 환경 아키텍처 설계
- SKU 선택에 대한 성능 벤치마킹 및 검증 구현
- SKU 추천 및 비용 최적화를 위한 자동화 도구 생성
- 요구 사항 변화에 따른 SKU 마이그레이션 및 확장 전략 계획
- Azure Well-Architected Framework 원칙을 서비스 계층 선택에 적용

## 목차

- [SKU 이해하기](../../../../docs/pre-deployment)
- [환경 기반 선택](../../../../docs/pre-deployment)
- [서비스별 가이드라인](../../../../docs/pre-deployment)
- [비용 최적화 전략](../../../../docs/pre-deployment)
- [성능 고려 사항](../../../../docs/pre-deployment)
- [빠른 참조 표](../../../../docs/pre-deployment)
- [검증 도구](../../../../docs/pre-deployment)

---

## SKU 이해하기

### SKU란 무엇인가?

SKU(Stock Keeping Units)는 Azure 리소스의 다양한 서비스 계층과 성능 수준을 나타냅니다. 각 SKU는 다음과 같은 특징을 제공합니다:

- **성능 특성** (CPU, 메모리, 처리량)
- **기능 가용성** (확장 옵션, SLA 수준)
- **가격 모델** (소비 기반, 예약 용량)
- **지역 가용성** (모든 지역에서 모든 SKU를 사용할 수 있는 것은 아님)

### SKU 선택의 주요 요소

1. **워크로드 요구 사항**
   - 예상 트래픽/로드 패턴
   - 성능 요구 사항 (CPU, 메모리, I/O)
   - 스토리지 필요량 및 액세스 패턴

2. **환경 유형**
   - 개발/테스트 vs. 프로덕션
   - 가용성 요구 사항
   - 보안 및 규정 준수 필요

3. **예산 제약**
   - 초기 비용 vs. 운영 비용
   - 예약 용량 할인
   - 자동 확장 비용 영향

4. **성장 예측**
   - 확장성 요구 사항
   - 미래 기능 필요
   - 마이그레이션 복잡성

---

## 환경 기반 선택

### 개발 환경

**우선순위**: 비용 최적화, 기본 기능, 쉬운 프로비저닝/해제

#### 추천 SKU
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

#### 특징
- **App Service**: F1(무료) 또는 B1(기본) - 간단한 테스트용
- **데이터베이스**: 최소 리소스를 사용하는 기본 계층
- **스토리지**: 로컬 중복성만 있는 표준
- **컴퓨팅**: 공유 리소스 허용
- **네트워킹**: 기본 구성

### 스테이징/테스트 환경

**우선순위**: 프로덕션과 유사한 구성, 비용 균형, 성능 테스트 가능성

#### 추천 SKU
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

#### 특징
- **성능**: 프로덕션 용량의 70-80%
- **기능**: 대부분의 프로덕션 기능 활성화
- **중복성**: 일부 지역 중복성
- **확장성**: 테스트를 위한 제한된 자동 확장
- **모니터링**: 전체 모니터링 스택

### 프로덕션 환경

**우선순위**: 성능, 가용성, 보안, 규정 준수, 확장성

#### 추천 SKU
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

#### 특징
- **고가용성**: 99.9% 이상의 SLA 요구 사항
- **성능**: 전용 리소스, 높은 처리량
- **보안**: 프리미엄 보안 기능
- **확장성**: 완전한 자동 확장 기능
- **모니터링**: 포괄적인 관찰 가능성

---

## 서비스별 가이드라인

### Azure App Service

#### SKU 결정 매트릭스

| 사용 사례 | 추천 SKU | 이유 |
|----------|----------|------|
| 개발/테스트 | F1(무료) 또는 B1(기본) | 비용 효율적, 테스트에 충분 |
| 소규모 프로덕션 앱 | S1(표준) | 사용자 지정 도메인, SSL, 자동 확장 |
| 중간 규모 프로덕션 앱 | P1V3(프리미엄 V3) | 더 나은 성능, 더 많은 기능 |
| 고트래픽 앱 | P2V3 또는 P3V3 | 전용 리소스, 높은 성능 |
| 미션 크리티컬 앱 | I1V2(격리 V2) | 네트워크 격리, 전용 하드웨어 |

#### 구성 예시

**개발**
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

**프로덕션**
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
   - **Basic**: 5 DTU - 개발/테스트용
   - **Standard**: S0-S12 (10-3000 DTU) - 일반 목적
   - **Premium**: P1-P15 (125-4000 DTU) - 성능이 중요한 경우

2. **vCore 기반** (프로덕션에 추천)
   - **General Purpose**: 균형 잡힌 컴퓨팅 및 스토리지
   - **Business Critical**: 낮은 대기 시간, 높은 IOPS
   - **Hyperscale**: 최대 100TB까지 확장 가능한 스토리지

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

1. **소비 기반**
   - 사용량 기반 요금
   - 개발 및 가변 워크로드에 적합
   - 공유 인프라

2. **전용 (워크로드 프로필)**
   - 전용 컴퓨팅 리소스
   - 예측 가능한 성능
   - 프로덕션 워크로드에 적합

#### 구성 예시

**개발 (소비 기반)**
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

**프로덕션 (전용)**
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

2. **자동 확장 프로비저닝 처리량**
   - 사용량에 따라 자동 확장
   - 최소 사용량 기준으로 요금 부과
   - 가변 워크로드에 적합

3. **서버리스**
   - 요청당 요금 부과
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

1. **Standard_LRS** - 개발, 중요하지 않은 데이터
2. **Standard_GRS** - 프로덕션, 지리적 중복 필요
3. **Premium_LRS** - 고성능 애플리케이션
4. **Premium_ZRS** - 영역 중복성을 갖춘 고가용성

#### 성능 계층

- **Standard**: 일반 목적, 비용 효율적
- **Premium**: 고성능, 낮은 대기 시간 시나리오

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

1-3년 동안 리소스를 예약하여 상당한 할인 혜택을 받으세요:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. 적정 크기 조정

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

지능적인 확장을 구현하여 비용을 최적화하세요:

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

### 4. 예약된 확장

비사용 시간 동안 확장 축소:

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

## 성능 고려 사항

### 기본 성능 요구 사항

SKU 선택 전에 명확한 성능 요구 사항을 정의하세요:

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
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### 모니터링 및 최적화

포괄적인 모니터링을 설정하세요:

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

| SKU | 계층 | vCPU | RAM | 스토리지 | 가격 범위 | 사용 사례 |
|-----|------|------|-----|----------|-----------|----------|
| F1 | 무료 | 공유 | 1GB | 1GB | 무료 | 개발 |
| B1 | 기본 | 1 | 1.75GB | 10GB | $ | 소규모 앱 |
| S1 | 표준 | 1 | 1.75GB | 50GB | $$ | 프로덕션 |
| P1V3 | 프리미엄 V3 | 2 | 8GB | 250GB | $$$ | 고성능 |
| I1V2 | 격리 V2 | 2 | 8GB | 1TB | $$$$ | 엔터프라이즈 |

### SQL Database SKU 빠른 참조

| SKU | 계층 | DTU/vCore | 스토리지 | 가격 범위 | 사용 사례 |
|-----|------|-----------|----------|-----------|----------|
| Basic | 기본 | 5 DTU | 2GB | $ | 개발 |
| S2 | 표준 | 50 DTU | 250GB | $$ | 소규모 프로덕션 |
| P2 | 프리미엄 | 250 DTU | 1TB | $$$ | 고성능 |
| GP_Gen5_4 | 일반 목적 | 4 vCore | 4TB | $$$ | 균형 잡힌 |
| BC_Gen5_8 | 비즈니스 크리티컬 | 8 vCore | 4TB | $$$$ | 미션 크리티컬 |

### Container Apps SKU 빠른 참조

| 모델 | 가격 | CPU/메모리 | 사용 사례 |
|------|------|------------|----------|
| 소비 기반 | 사용량 기반 | 0.25-2 vCPU | 개발, 가변 로드 |
| 전용 D4 | 예약 | 4 vCPU, 16GB | 프로덕션 |
| 전용 D8 | 예약 | 8 vCPU, 32GB | 고성능 |

---

## 검증 도구

### SKU 가용성 확인기

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

### 비용 추정 스크립트

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

## 모범 사례 요약

### 해야 할 일

1. **작게 시작하고 실제 사용량에 따라 확장**하세요
2. **환경별로 다른 SKU를 사용**하세요
3. **성능과 비용을 지속적으로 모니터링**하세요
4. **프로덕션 워크로드에 예약 용량을 활용**하세요
5. **적절한 경우 자동 확장을 구현**하세요
6. **현실적인 워크로드로 성능을 테스트**하세요
7. **성장을 계획하되 과도한 프로비저닝은 피하세요**
8. **가능한 경우 개발에 무료 계층을 사용**하세요

### 하지 말아야 할 일

1. **개발에 프로덕션 SKU를 사용하지 마세요**
2. **지역 SKU 가용성을 무시하지 마세요**
3. **데이터 전송 비용을 잊지 마세요**
4. **정당한 이유 없이 과도한 프로비저닝을 하지 마세요**
5. **종속성의 영향을 무시하지 마세요**
6. **자동 확장 한도를 너무 높게 설정하지 마세요**
7. **규정 준수 요구 사항을 잊지 마세요**
8. **가격만을 기준으로 결정하지 마세요**

---

**팁**: Azure Cost Management와 Advisor를 사용하여 실제 사용 패턴에 기반한 SKU 선택 최적화에 대한 개인화된 추천을 받으세요.

---

**탐색**
- **이전 레슨**: [용량 계획](capacity-planning.md)
- **다음 레슨**: [사전 점검](preflight-checks.md)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 신뢰할 수 있는 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.
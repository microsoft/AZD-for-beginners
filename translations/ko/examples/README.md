<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:07:11+00:00",
  "source_file": "examples/README.md",
  "language_code": "ko"
}
-->
# 예제 - 실용적인 AZD 템플릿 및 구성

## 소개

이 디렉터리에는 Azure Developer CLI를 실습을 통해 배울 수 있도록 돕는 실용적인 예제, 템플릿, 실제 시나리오가 포함되어 있습니다. 각 예제는 다양한 애플리케이션 아키텍처와 배포 패턴에 대한 완전한 작동 코드, 인프라 템플릿, 상세한 지침을 제공합니다.

## 학습 목표

이 예제를 통해 다음을 학습할 수 있습니다:
- 현실적인 애플리케이션 시나리오를 통해 Azure Developer CLI 워크플로우를 연습
- 다양한 애플리케이션 아키텍처와 그에 대한 azd 구현 이해
- 다양한 Azure 서비스에 대한 코드로서의 인프라 패턴 숙달
- 환경별 배포 전략 및 구성 관리 적용
- 모니터링, 보안, 확장 패턴을 실용적인 맥락에서 구현
- 실제 배포 시나리오에서 문제 해결 및 디버깅 경험 구축

## 학습 결과

이 예제를 완료하면 다음을 수행할 수 있습니다:
- Azure Developer CLI를 사용하여 다양한 애플리케이션 유형을 자신 있게 배포
- 제공된 템플릿을 자신의 애플리케이션 요구사항에 맞게 조정
- Bicep을 사용하여 맞춤형 인프라 패턴 설계 및 구현
- 적절한 종속성을 가진 복잡한 다중 서비스 애플리케이션 구성
- 실제 시나리오에서 보안, 모니터링 및 성능 모범 사례 적용
- 실용적인 경험을 바탕으로 배포 문제를 해결하고 최적화

## 디렉터리 구조

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## 빠른 시작 예제

### 초보자를 위한 예제
1. **[Simple Web App](../../../examples/simple-web-app)** - 기본 Node.js 웹 애플리케이션 배포
2. **[Static Website](../../../examples/static-website)** - Azure Storage에 정적 웹사이트 호스팅
3. **[Container App](../../../examples/container-app)** - 컨테이너화된 애플리케이션 배포

### 중급 사용자용 예제
4. **[Database App](../../../examples/database-app)** - PostgreSQL 데이터베이스를 사용하는 웹 애플리케이션
5. **[Serverless Function](../../../examples/serverless-function)** - HTTP 트리거를 사용하는 Azure Functions
6. **[Microservices](../../../examples/microservices)** - API 게이트웨이를 포함한 다중 서비스 애플리케이션

## 📋 사용 지침

### 로컬에서 예제 실행

1. **예제 복제 또는 복사**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD 환경 초기화**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **환경 구성**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **배포**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### 예제 조정

각 예제에는 다음이 포함됩니다:
- **README.md** - 상세한 설정 및 사용자 정의 지침
- **azure.yaml** - 주석이 포함된 AZD 구성
- **infra/** - 매개변수 설명이 포함된 Bicep 템플릿
- **src/** - 샘플 애플리케이션 코드
- **scripts/** - 일반 작업을 위한 도우미 스크립트

## 🎯 학습 목표

### 예제 카테고리

#### **기본 배포**
- 단일 서비스 애플리케이션
- 간단한 인프라 패턴
- 기본 구성 관리
- 비용 효율적인 개발 환경

#### **고급 시나리오**
- 다중 서비스 아키텍처
- 복잡한 네트워킹 구성
- 데이터베이스 통합 패턴
- 보안 및 규정 준수 구현

#### **프로덕션 준비 패턴**
- 고가용성 구성
- 모니터링 및 관찰 가능성
- CI/CD 통합
- 재해 복구 설정

## 📖 예제 설명

### Simple Web App
**기술 스택**: Node.js, App Service, Application Insights  
**난이도**: 초급  
**개념**: 기본 배포, 환경 변수, 상태 확인

### Static Website
**기술 스택**: HTML/CSS/JS, Storage Account, CDN  
**난이도**: 초급  
**개념**: 정적 호스팅, CDN 통합, 사용자 지정 도메인

### Container App
**기술 스택**: Docker, Container Apps, Container Registry  
**난이도**: 중급  
**개념**: 컨테이너화, 확장, 인그레스 구성

### Database App
**기술 스택**: Python Flask, PostgreSQL, App Service  
**난이도**: 중급  
**개념**: 데이터베이스 연결, 비밀 관리, 마이그레이션

### Serverless Function
**기술 스택**: Azure Functions, Cosmos DB, API Management  
**난이도**: 중급  
**개념**: 이벤트 기반 아키텍처, 바인딩, API 관리

### Microservices
**기술 스택**: 다중 서비스, Service Bus, API Gateway  
**난이도**: 고급  
**개념**: 서비스 간 통신, 메시지 큐잉, 로드 밸런싱

## 🛠 구성 예제

`configurations/` 디렉터리에는 재사용 가능한 구성 요소가 포함되어 있습니다:

### 환경 구성
- 개발 환경 설정
- 스테이징 환경 구성
- 프로덕션 준비 구성
- 다중 지역 배포 설정

### Bicep 모듈
- 재사용 가능한 인프라 구성 요소
- 일반적인 리소스 패턴
- 보안 강화 템플릿
- 비용 최적화 구성

### 도우미 스크립트
- 환경 설정 자동화
- 데이터베이스 마이그레이션 스크립트
- 배포 검증 도구
- 비용 모니터링 유틸리티

## 🔧 사용자 정의 가이드

### 예제를 자신의 사용 사례에 맞게 조정

1. **사전 요구사항 검토**
   - Azure 서비스 요구사항 확인
   - 구독 제한 확인
   - 비용 영향 이해

2. **구성 수정**
   - `azure.yaml` 서비스 정의 업데이트
   - Bicep 템플릿 사용자 정의
   - 환경 변수 조정

3. **철저히 테스트**
   - 먼저 개발 환경에 배포
   - 기능 검증
   - 확장 및 성능 테스트

4. **보안 검토**
   - 액세스 제어 검토
   - 비밀 관리 구현
   - 모니터링 및 경고 활성화

## 📊 비교 매트릭스

| 예제 | 서비스 | 데이터베이스 | 인증 | 모니터링 | 난이도 |
|------|--------|-------------|------|----------|--------|
| Simple Web App | 1 | ❌ | 기본 | 기본 | ⭐ |
| Static Website | 1 | ❌ | ❌ | 기본 | ⭐ |
| Container App | 1 | ❌ | 기본 | 전체 | ⭐⭐ |
| Database App | 2 | ✅ | 전체 | 전체 | ⭐⭐⭐ |
| Serverless Function | 3 | ✅ | 전체 | 전체 | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | 전체 | 전체 | ⭐⭐⭐⭐ |

## 🎓 학습 경로

### 추천 진행 순서

1. **Simple Web App부터 시작**
   - 기본 AZD 개념 학습
   - 배포 워크플로우 이해
   - 환경 관리 연습

2. **Static Website 시도**
   - 다양한 호스팅 옵션 탐색
   - CDN 통합 학습
   - DNS 구성 이해

3. **Container App으로 이동**
   - 컨테이너화 기본 학습
   - 확장 개념 이해
   - Docker 연습

4. **데이터베이스 통합 추가**
   - 데이터베이스 프로비저닝 학습
   - 연결 문자열 이해
   - 비밀 관리 연습

5. **Serverless 탐색**
   - 이벤트 기반 아키텍처 이해
   - 트리거 및 바인딩 학습
   - API 연습

6. **Microservices 구축**
   - 서비스 간 통신 학습
   - 분산 시스템 이해
   - 복잡한 배포 연습

## 🔍 적합한 예제 찾기

### 기술 스택별
- **Node.js**: Simple Web App, Microservices
- **Python**: Database App, Serverless Function
- **정적 사이트**: Static Website
- **컨테이너**: Container App, Microservices
- **데이터베이스**: Database App, Serverless Function

### 아키텍처 패턴별
- **모놀리식**: Simple Web App, Database App
- **정적**: Static Website
- **마이크로서비스**: Microservices 예제
- **서버리스**: Serverless Function
- **하이브리드**: Container App

### 난이도별
- **초급**: Simple Web App, Static Website
- **중급**: Container App, Database App, Serverless Function  
- **고급**: Microservices

## 📚 추가 자료

### 문서 링크
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### 커뮤니티 예제
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

### 모범 사례
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 예제 기여

유용한 예제를 공유하고 싶으신가요? 기여를 환영합니다!

### 제출 지침
1. 정해진 디렉터리 구조를 따르세요
2. 포괄적인 README.md를 포함하세요
3. 구성 파일에 주석을 추가하세요
4. 제출 전에 철저히 테스트하세요
5. 비용 추정 및 사전 요구사항을 포함하세요

### 예제 템플릿 구조
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**팁**: 자신의 기술 스택에 맞는 가장 간단한 예제부터 시작한 후 점차 복잡한 시나리오로 진행하세요. 각 예제는 이전 예제의 개념을 기반으로 구축됩니다!

**다음 단계**: 
- 자신의 기술 수준에 맞는 예제를 선택하세요
- 예제의 README에 있는 설정 지침을 따르세요
- 사용자 정의를 실험해보세요
- 커뮤니티와 학습 내용을 공유하세요

---

**탐색**
- **이전 학습**: [학습 가이드](../resources/study-guide.md)
- **돌아가기**: [메인 README](../README.md)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전이 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.
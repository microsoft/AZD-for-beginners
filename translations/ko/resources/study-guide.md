<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-19T18:58:42+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "ko"
}
-->
# 학습 가이드 - 종합 학습 목표

**학습 경로 탐색**
- **📚 코스 홈**: [AZD 초보자를 위한 가이드](../README.md)
- **📖 학습 시작**: [1장: 기초 및 빠른 시작](../README.md#-chapter-1-foundation--quick-start)
- **🎯 진행 상황 추적**: [코스 완료](../README.md#-course-completion--certification)

## 소개

이 종합 학습 가이드는 Azure Developer CLI(azd)를 마스터하기 위한 체계적인 학습 목표, 핵심 개념, 실습 과제 및 평가 자료를 제공합니다. 이 가이드를 사용하여 학습 진행 상황을 추적하고 필수 주제를 모두 다루었는지 확인하세요.

## 학습 목표

이 학습 가이드를 완료하면 다음을 달성할 수 있습니다:
- Azure Developer CLI의 기본 및 고급 개념을 완벽히 이해
- Azure 애플리케이션 배포 및 관리 실무 능력 개발
- 배포 문제 해결 및 최적화에 대한 자신감 구축
- 프로덕션 준비 배포 관행 및 보안 고려 사항 이해

## 학습 결과

이 학습 가이드의 모든 섹션을 완료한 후, 다음을 수행할 수 있습니다:
- azd를 사용하여 완전한 애플리케이션 아키텍처 설계, 배포 및 관리
- 포괄적인 모니터링, 보안 및 비용 최적화 전략 구현
- 복잡한 배포 문제를 독립적으로 해결
- 사용자 정의 템플릿 생성 및 azd 커뮤니티에 기여

## 8장 학습 구조

### 1장: 기초 및 빠른 시작 (1주차)
**소요 시간**: 30-45분 | **난이도**: ⭐

#### 학습 목표
- Azure Developer CLI의 핵심 개념과 용어 이해
- 개발 플랫폼에 AZD를 성공적으로 설치 및 구성
- 기존 템플릿을 사용하여 첫 번째 애플리케이션 배포
- AZD 명령줄 인터페이스를 효과적으로 탐색

#### 마스터해야 할 핵심 개념
- AZD 프로젝트 구조 및 구성 요소(azure.yaml, infra/, src/)
- 템플릿 기반 배포 워크플로
- 환경 구성 기본 사항
- 리소스 그룹 및 구독 관리

#### 실습 과제
1. **설치 확인**: AZD를 설치하고 `azd version`으로 확인
2. **첫 번째 배포**: todo-nodejs-mongo 템플릿을 성공적으로 배포
3. **환경 설정**: 첫 번째 환경 변수를 구성
4. **리소스 탐색**: Azure 포털에서 배포된 리소스 탐색

#### 평가 질문
- AZD 프로젝트의 핵심 구성 요소는 무엇인가요?
- 템플릿에서 새 프로젝트를 초기화하는 방법은 무엇인가요?
- `azd up`과 `azd deploy`의 차이점은 무엇인가요?
- AZD로 여러 환경을 어떻게 관리하나요?

---

### 2장: AI 우선 개발 (2주차)
**소요 시간**: 1-2시간 | **난이도**: ⭐⭐

#### 학습 목표
- Microsoft Foundry 서비스를 AZD 워크플로와 통합
- AI 기반 애플리케이션 배포 및 구성
- RAG(검색 증강 생성) 구현 패턴 이해
- AI 모델 배포 및 확장 관리

#### 마스터해야 할 핵심 개념
- Azure OpenAI 서비스 통합 및 API 관리
- AI 검색 구성 및 벡터 인덱싱
- 모델 배포 전략 및 용량 계획
- AI 애플리케이션 모니터링 및 성능 최적화

#### 실습 과제
1. **AI 채팅 배포**: azure-search-openai-demo 템플릿 배포
2. **RAG 구현**: 문서 인덱싱 및 검색 구성
3. **모델 구성**: 다양한 목적의 AI 모델 설정
4. **AI 모니터링**: AI 워크로드에 Application Insights 구현

#### 평가 질문
- AZD 템플릿에서 Azure OpenAI 서비스를 어떻게 구성하나요?
- RAG 아키텍처의 주요 구성 요소는 무엇인가요?
- AI 모델 용량 및 확장을 어떻게 관리하나요?
- AI 애플리케이션에 중요한 모니터링 지표는 무엇인가요?

---

### 3장: 구성 및 인증 (3주차)
**소요 시간**: 45-60분 | **난이도**: ⭐⭐

#### 학습 목표
- 환경 구성 및 관리 전략 마스터
- 안전한 인증 패턴 및 관리 ID 구현
- 적절한 명명 규칙으로 리소스 구성
- 다중 환경 배포(dev, staging, prod) 구성

#### 마스터해야 할 핵심 개념
- 환경 계층 구조 및 구성 우선순위
- 관리 ID 및 서비스 주체 인증
- Key Vault 통합을 통한 비밀 관리
- 환경별 매개변수 관리

#### 실습 과제
1. **다중 환경 설정**: dev, staging, prod 환경 구성
2. **보안 구성**: 관리 ID 인증 구현
3. **비밀 관리**: 민감한 데이터를 위한 Azure Key Vault 통합
4. **매개변수 관리**: 환경별 구성 생성

#### 평가 질문
- AZD로 다른 환경을 어떻게 구성하나요?
- 관리 ID를 서비스 주체보다 사용하는 이점은 무엇인가요?
- 애플리케이션 비밀을 안전하게 관리하는 방법은 무엇인가요?
- AZD의 구성 계층 구조는 무엇인가요?

---

### 4장: 코드로서의 인프라 및 배포 (4-5주차)
**소요 시간**: 1-1.5시간 | **난이도**: ⭐⭐⭐

#### 학습 목표
- Bicep 인프라 템플릿 생성 및 사용자 정의
- 고급 배포 패턴 및 워크플로 구현
- 리소스 프로비저닝 전략 이해
- 확장 가능한 다중 서비스 아키텍처 설계

- AZD를 사용하여 컨테이너화된 애플리케이션 배포

#### 마스터해야 할 핵심 개념
- Bicep 템플릿 구조 및 모범 사례
- 리소스 종속성 및 배포 순서
- 매개변수 파일 및 템플릿 모듈화
- 사용자 정의 훅 및 배포 자동화
- 컨테이너 앱 배포 패턴(빠른 시작, 프로덕션, 마이크로서비스)

#### 실습 과제
1. **사용자 정의 템플릿 생성**: 다중 서비스 애플리케이션 템플릿 생성
2. **Bicep 숙달**: 모듈화된 재사용 가능한 인프라 구성 요소 생성
3. **배포 자동화**: 사전/사후 배포 훅 구현
4. **아키텍처 설계**: 복잡한 마이크로서비스 아키텍처 배포
5. **컨테이너 앱 배포**: AZD를 사용하여 [Simple Flask API](../../../examples/container-app/simple-flask-api) 및 [Microservices Architecture](../../../examples/container-app/microservices) 예제 배포

#### 평가 질문
- AZD를 위한 사용자 정의 Bicep 템플릿을 어떻게 생성하나요?
- 인프라 코드를 구성하는 모범 사례는 무엇인가요?
- 템플릿에서 리소스 종속성을 어떻게 처리하나요?
- 무중단 업데이트를 지원하는 배포 패턴은 무엇인가요?

---

### 5장: 다중 에이전트 AI 솔루션 (6-7주차)
**소요 시간**: 2-3시간 | **난이도**: ⭐⭐⭐⭐

#### 학습 목표
- 다중 에이전트 AI 아키텍처 설계 및 구현
- 에이전트 조정 및 통신 오케스트레이션
- 모니터링이 포함된 프로덕션 준비 AI 솔루션 배포
- 에이전트 전문화 및 워크플로 패턴 이해
- 다중 에이전트 솔루션의 일부로 컨테이너화된 마이크로서비스 통합

#### 마스터해야 할 핵심 개념
- 다중 에이전트 아키텍처 패턴 및 설계 원칙
- 에이전트 통신 프로토콜 및 데이터 흐름
- AI 에이전트의 부하 분산 및 확장 전략
- 다중 에이전트 시스템의 프로덕션 모니터링
- 컨테이너화된 환경에서의 서비스 간 통신

#### 실습 과제
1. **소매 솔루션 배포**: 완전한 다중 에이전트 소매 시나리오 배포
2. **에이전트 사용자 정의**: 고객 및 재고 에이전트 동작 수정
3. **아키텍처 확장**: 부하 분산 및 자동 확장 구현
4. **프로덕션 모니터링**: 포괄적인 모니터링 및 경고 설정
5. **마이크로서비스 통합**: [Microservices Architecture](../../../examples/container-app/microservices) 예제를 확장하여 에이전트 기반 워크플로 지원

#### 평가 질문
- 효과적인 다중 에이전트 통신 패턴을 어떻게 설계하나요?
- AI 에이전트 워크로드를 확장하기 위한 주요 고려 사항은 무엇인가요?
- 다중 에이전트 AI 시스템을 어떻게 모니터링하고 디버그하나요?
- AI 에이전트의 신뢰성을 보장하는 프로덕션 패턴은 무엇인가요?

---

### 6장: 사전 배포 검증 및 계획 (8주차)
**소요 시간**: 1시간 | **난이도**: ⭐⭐

#### 학습 목표
- 포괄적인 용량 계획 및 리소스 검증 수행
- 비용 효율성을 위한 최적의 Azure SKU 선택
- 자동화된 사전 점검 및 검증 구현
- 비용 최적화 전략으로 배포 계획

#### 마스터해야 할 핵심 개념
- Azure 리소스 할당량 및 용량 제한
- SKU 선택 기준 및 비용 최적화
- 자동화된 검증 스크립트 및 테스트
- 배포 계획 및 위험 평가

#### 실습 과제
1. **용량 분석**: 애플리케이션의 리소스 요구 사항 분석
2. **SKU 최적화**: 비용 효율적인 서비스 계층 비교 및 선택
3. **검증 자동화**: 사전 배포 점검 스크립트 구현
4. **비용 계획**: 배포 비용 추정 및 예산 생성

#### 평가 질문
- 배포 전에 Azure 용량을 어떻게 검증하나요?
- SKU 선택 결정에 영향을 미치는 요인은 무엇인가요?
- 사전 배포 검증을 어떻게 자동화하나요?
- 배포 비용을 최적화하는 전략은 무엇인가요?

---

### 7장: 문제 해결 및 디버깅 (9주차)
**소요 시간**: 1-1.5시간 | **난이도**: ⭐⭐

#### 학습 목표
- AZD 배포를 위한 체계적인 디버깅 접근법 개발
- 일반적인 배포 및 구성 문제 해결
- AI 관련 문제 및 성능 문제 디버깅
- 사전 문제 감지를 위한 모니터링 및 경고 구현

#### 마스터해야 할 핵심 개념
- 진단 기술 및 로깅 전략
- 일반적인 실패 패턴 및 해결책
- 성능 모니터링 및 최적화
- 사고 대응 및 복구 절차

#### 실습 과제
1. **진단 기술**: 의도적으로 깨진 배포로 연습
2. **로그 분석**: Azure Monitor 및 Application Insights 효과적으로 사용
3. **성능 튜닝**: 느리게 작동하는 애플리케이션 최적화
4. **복구 절차**: 백업 및 재해 복구 구현

#### 평가 질문
- 가장 일반적인 AZD 배포 실패는 무엇인가요?
- 인증 및 권한 문제를 어떻게 디버깅하나요?
- 프로덕션 문제를 방지하는 모니터링 전략은 무엇인가요?
- Azure에서 애플리케이션 성능을 어떻게 최적화하나요?

---

### 8장: 프로덕션 및 엔터프라이즈 패턴 (10-11주차)
**소요 시간**: 2-3시간 | **난이도**: ⭐⭐⭐⭐

#### 학습 목표
- 엔터프라이즈급 배포 전략 구현
- 보안 패턴 및 준수 프레임워크 설계
- 모니터링, 거버넌스 및 비용 관리 수립
- AZD 통합으로 확장 가능한 CI/CD 파이프라인 생성
- 프로덕션 컨테이너 앱 배포를 위한 모범 사례 적용(보안, 모니터링, 비용, CI/CD)

#### 마스터해야 할 핵심 개념
- 엔터프라이즈 보안 및 준수 요구 사항
- 거버넌스 프레임워크 및 정책 구현
- 고급 모니터링 및 비용 관리
- CI/CD 통합 및 자동화된 배포 파이프라인
- 컨테이너화된 워크로드를 위한 블루-그린 및 카나리 배포 전략

#### 실습 과제
1. **엔터프라이즈 보안**: 포괄적인 보안 패턴 구현
2. **거버넌스 프레임워크**: Azure Policy 및 리소스 관리 설정
3. **고급 모니터링**: 대시보드 및 자동 경고 생성
4. **CI/CD 통합**: 자동화된 배포 파이프라인 구축
5. **프로덕션 컨테이너 앱**: [Microservices Architecture](../../../examples/container-app/microservices) 예제에 보안, 모니터링 및 비용 최적화 적용

#### 평가 질문
- AZD 배포에서 엔터프라이즈 보안을 어떻게 구현하나요?
- 준수 및 비용 관리를 보장하는 거버넌스 패턴은 무엇인가요?
- 프로덕션 시스템을 위한 확장 가능한 모니터링을 어떻게 설계하나요?
- AZD 워크플로와 가장 잘 맞는 CI/CD 패턴은 무엇인가요?

#### 학습 목표
- Azure Developer CLI의 기본 및 핵심 개념 이해
- 개발 환경에서 azd를 성공적으로 설치 및 구성
- 기존 템플릿을 사용하여 첫 번째 배포 완료
- azd 프로젝트 구조를 탐색하고 주요 구성 요소 이해

#### 마스터해야 할 핵심 개념
- 템플릿, 환경 및 서비스
- azure.yaml 구성 구조
- 기본 azd 명령(init, up, down, deploy)
- 코드로서의 인프라 원칙
- Azure 인증 및 권한 부여

#### 실습 과제

**실습 1.1: 설치 및 설정**
```bash
# 이 작업들을 완료하세요:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**실습 1.2: 첫 번째 배포**
```bash
# 간단한 웹 애플리케이션 배포:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**실습 1.3: 프로젝트 구조 분석**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### 자기 평가 질문
1. azd 아키텍처의 세 가지 핵심 개념은 무엇인가요?
2. azure.yaml 파일의 목적은 무엇인가요?
3. 환경은 다른 배포 대상을 관리하는 데 어떻게 도움이 되나요?
4. azd에서 사용할 수 있는 인증 방법은 무엇인가요?
5. 처음으로 `azd up`을 실행하면 어떤 일이 발생하나요?

---

## 진행 상황 추적 및 평가 프레임워크
```bash
# 여러 환경을 생성하고 구성합니다:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**실습 2.2: 고급 구성**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**실습 2.3: 보안 구성**
```bash
# 보안 모범 사례 구현:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 자기 평가 질문
1. azd는 환경 변수 우선순위를 어떻게 처리하나요?
2. 배포 훅이란 무엇이며 언제 사용해야 하나요?
3. 다른 환경에 대해 다른 SKU를 어떻게 구성하나요?
4. 다양한 인증 방법의 보안 영향은 무엇인가요?
5. 비밀 및 민감한 구성 데이터를 어떻게 관리하나요?

### 모듈 3: 배포 및 프로비저닝 (4주차)

#### 학습 목표
- 배포 워크플로 및 모범 사례 마스터
- Bicep 템플릿을 사용한 코드로서의 인프라 이해
- 복잡한 다중 서비스 아키텍처 구현
- 배포 성능 및 신뢰성 최적화

#### 마스터해야 할 핵심 개념
- Bicep 템플릿 구조 및 모듈
- 리소스 종속성 및 순서
- 배포 전략(블루-그린, 롤링 업데이트)
- 다중 지역 배포
- 데이터베이스 마이그레이션 및 데이터 관리

#### 실습 과제

**실습 3.1: 사용자 정의 인프라**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**실습 3.2: 다중 서비스 애플리케이션**
```bash
# 마이크로서비스 아키텍처 배포:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**실습 3.3: 데이터베이스 통합**
```bash
# 데이터베이스 배포 패턴 구현:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 자기 평가 질문
1. Bicep을 ARM 템플릿보다 사용하는 이점은 무엇인가요?
2. azd 배포에서 데이터베이스 마이그레이션을 어떻게 처리하나요?
3. 무중단 배포를 위한 전략은 무엇인가요?
4. 서비스 간 종속성을 어떻게 관리하나요?
5. 다지역 배포를 위한 고려 사항은 무엇인가요?

### 모듈 4: 배포 전 검증 (5주차)

#### 학습 목표
- 포괄적인 배포 전 점검 구현
- 용량 계획 및 리소스 검증 숙달
- SKU 선택 및 비용 최적화 이해
- 자동화된 검증 파이프라인 구축

#### 숙달해야 할 주요 개념
- Azure 리소스 할당량 및 제한
- SKU 선택 기준 및 비용 영향
- 자동화된 검증 스크립트 및 도구
- 용량 계획 방법론
- 성능 테스트 및 최적화

#### 실습 과제

**실습 4.1: 용량 계획**
```bash
# 용량 검증 구현:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**실습 4.2: 사전 점검**
```powershell
# 포괄적인 검증 파이프라인 구축:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**실습 4.3: SKU 최적화**
```bash
# 서비스 구성 최적화:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 자기 평가 질문
1. SKU 선택 결정에 영향을 미치는 요인은 무엇인가요?
2. 배포 전에 Azure 리소스 가용성을 어떻게 검증하나요?
3. 사전 점검 시스템의 주요 구성 요소는 무엇인가요?
4. 배포 비용을 어떻게 추정하고 관리하나요?
5. 용량 계획을 위해 필수적인 모니터링은 무엇인가요?

### 모듈 5: 문제 해결 및 디버깅 (6주차)

#### 학습 목표
- 체계적인 문제 해결 방법론 숙달
- 복잡한 배포 문제 디버깅 전문성 개발
- 포괄적인 모니터링 및 경고 구현
- 사고 대응 및 복구 절차 구축

#### 숙달해야 할 주요 개념
- 일반적인 배포 실패 패턴
- 로그 분석 및 상관 관계 기술
- 성능 모니터링 및 최적화
- 보안 사고 탐지 및 대응
- 재해 복구 및 비즈니스 연속성

#### 실습 과제

**실습 5.1: 문제 해결 시나리오**
```bash
# 일반적인 문제 해결 연습:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**실습 5.2: 모니터링 구현**
```bash
# 포괄적인 모니터링 설정:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**실습 5.3: 사고 대응**
```bash
# 사고 대응 절차 구축:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 자기 평가 질문
1. azd 배포 문제를 해결하는 체계적인 접근 방식은 무엇인가요?
2. 여러 서비스와 리소스 간의 로그를 어떻게 상관시키나요?
3. 초기 문제 탐지를 위해 가장 중요한 모니터링 메트릭은 무엇인가요?
4. 효과적인 재해 복구 절차를 어떻게 구현하나요?
5. 사고 대응 계획의 주요 구성 요소는 무엇인가요?

### 모듈 6: 고급 주제 및 모범 사례 (7-8주차)

#### 학습 목표
- 엔터프라이즈급 배포 패턴 구현
- CI/CD 통합 및 자동화 숙달
- 커스텀 템플릿 개발 및 커뮤니티 기여
- 고급 보안 및 규정 요구 사항 이해

#### 숙달해야 할 주요 개념
- CI/CD 파이프라인 통합 패턴
- 커스텀 템플릿 개발 및 배포
- 엔터프라이즈 거버넌스 및 규정 준수
- 고급 네트워킹 및 보안 구성
- 성능 최적화 및 비용 관리

#### 실습 과제

**실습 6.1: CI/CD 통합**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**실습 6.2: 커스텀 템플릿 개발**
```bash
# 사용자 지정 템플릿 생성 및 게시:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**실습 6.3: 엔터프라이즈 구현**
```bash
# 엔터프라이즈급 기능 구현:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 자기 평가 질문
1. 기존 CI/CD 워크플로에 azd를 어떻게 통합하나요?
2. 커스텀 템플릿 개발을 위한 주요 고려 사항은 무엇인가요?
3. azd 배포에서 거버넌스와 규정 준수를 어떻게 구현하나요?
4. 엔터프라이즈 규모 배포를 위한 모범 사례는 무엇인가요?
5. azd 커뮤니티에 효과적으로 기여하는 방법은 무엇인가요?

## 실습 프로젝트

### 프로젝트 1: 개인 포트폴리오 웹사이트
**복잡도**: 초급  
**소요 시간**: 1-2주

다음을 사용하여 개인 포트폴리오 웹사이트를 구축하고 배포하세요:
- Azure Storage를 이용한 정적 웹사이트 호스팅
- 커스텀 도메인 구성
- 글로벌 성능을 위한 CDN 통합
- 자동화된 배포 파이프라인

**결과물**:
- Azure에 배포된 작동하는 웹사이트
- 포트폴리오 배포를 위한 커스텀 azd 템플릿
- 배포 과정 문서화
- 비용 분석 및 최적화 권장 사항

### 프로젝트 2: 작업 관리 애플리케이션
**복잡도**: 중급  
**소요 시간**: 2-3주

다음 기능을 갖춘 풀스택 작업 관리 애플리케이션을 만드세요:
- App Service에 배포된 React 프론트엔드
- 인증 기능이 포함된 Node.js API 백엔드
- 마이그레이션이 포함된 PostgreSQL 데이터베이스
- Application Insights 모니터링

**결과물**:
- 사용자 인증이 포함된 완전한 애플리케이션
- 데이터베이스 스키마 및 마이그레이션 스크립트
- 모니터링 대시보드 및 경고 규칙
- 다중 환경 배포 구성

### 프로젝트 3: 마이크로서비스 기반 전자상거래 플랫폼
**복잡도**: 고급  
**소요 시간**: 4-6주

마이크로서비스 기반 전자상거래 플랫폼을 설계하고 구현하세요:
- 여러 API 서비스(카탈로그, 주문, 결제, 사용자)
- Service Bus를 이용한 메시지 큐 통합
- 성능 최적화를 위한 Redis 캐시
- 포괄적인 로깅 및 모니터링

**참고 예제**: [Microservices Architecture](../../../examples/container-app/microservices)에서 프로덕션 준비 템플릿 및 배포 가이드를 확인하세요

**결과물**:
- 완전한 마이크로서비스 아키텍처
- 서비스 간 통신 패턴
- 성능 테스트 및 최적화
- 프로덕션 준비 보안 구현

## 평가 및 인증

### 지식 점검

각 모듈 완료 후 다음 평가를 진행하세요:

**모듈 1 평가**: 기본 개념 및 설치
- 핵심 개념에 대한 객관식 질문
- 실습 설치 및 구성 작업
- 간단한 배포 실습

**모듈 2 평가**: 구성 및 환경
- 환경 관리 시나리오
- 구성 문제 해결 실습
- 보안 구성 구현

**모듈 3 평가**: 배포 및 프로비저닝
- 인프라 설계 과제
- 다중 서비스 배포 시나리오
- 성능 최적화 실습

**모듈 4 평가**: 배포 전 검증
- 용량 계획 사례 연구
- 비용 최적화 시나리오
- 검증 파이프라인 구현

**모듈 5 평가**: 문제 해결 및 디버깅
- 문제 진단 실습
- 모니터링 구현 작업
- 사고 대응 시뮬레이션

**모듈 6 평가**: 고급 주제
- CI/CD 파이프라인 설계
- 커스텀 템플릿 개발
- 엔터프라이즈 아키텍처 시나리오

### 최종 캡스톤 프로젝트

모든 개념을 숙달했음을 보여주는 완전한 솔루션을 설계하고 구현하세요:

**요구 사항**:
- 다중 계층 애플리케이션 아키텍처
- 여러 배포 환경
- 포괄적인 모니터링 및 경고
- 보안 및 규정 준수 구현
- 비용 최적화 및 성능 조정
- 완전한 문서화 및 실행 매뉴얼

**평가 기준**:
- 기술 구현 품질
- 문서화 완성도
- 보안 및 모범 사례 준수
- 성능 및 비용 최적화
- 문제 해결 및 모니터링 효과

## 학습 자료 및 참고 문헌

### 공식 문서
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### 커뮤니티 자료
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### 실습 환경
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 추가 도구
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 학습 일정 추천

### 풀타임 학습 (8주)
- **1-2주차**: 모듈 1-2 (시작하기, 구성)
- **3-4주차**: 모듈 3-4 (배포, 배포 전)
- **5-6주차**: 모듈 5-6 (문제 해결, 고급 주제)
- **7-8주차**: 실습 프로젝트 및 최종 평가

### 파트타임 학습 (16주)
- **1-4주차**: 모듈 1 (시작하기)
- **5-7주차**: 모듈 2 (구성 및 환경)
- **8-10주차**: 모듈 3 (배포 및 프로비저닝)
- **11-12주차**: 모듈 4 (배포 전 검증)
- **13-14주차**: 모듈 5 (문제 해결 및 디버깅)
- **15-16주차**: 모듈 6 (고급 주제 및 평가)

---

## 진행 추적 및 평가 프레임워크

### 챕터 완료 체크리스트

각 챕터를 완료하며 다음 측정 가능한 결과로 진행 상황을 추적하세요:

#### 📚 챕터 1: 기초 및 빠른 시작
- [ ] **설치 완료**: AZD가 플랫폼에 설치 및 확인됨
- [ ] **첫 배포**: todo-nodejs-mongo 템플릿 성공적으로 배포
- [ ] **환경 설정**: 첫 환경 변수 구성 완료
- [ ] **리소스 탐색**: Azure Portal에서 배포된 리소스 탐색
- [ ] **명령 숙달**: 기본 AZD 명령에 익숙해짐

#### 🤖 챕터 2: AI 우선 개발  
- [ ] **AI 템플릿 배포**: azure-search-openai-demo 성공적으로 배포
- [ ] **RAG 구현**: 문서 인덱싱 및 검색 구성
- [ ] **모델 설정**: 다양한 목적의 AI 모델 설정
- [ ] **AI 모니터링**: AI 워크로드에 Application Insights 구현
- [ ] **성능 최적화**: AI 애플리케이션 성능 조정

#### ⚙️ 챕터 3: 구성 및 인증
- [ ] **다중 환경 설정**: dev, staging, prod 환경 구성
- [ ] **보안 구현**: 관리 ID 인증 설정
- [ ] **비밀 관리**: 민감한 데이터를 위한 Azure Key Vault 통합
- [ ] **매개변수 관리**: 환경별 구성 생성
- [ ] **인증 숙달**: 안전한 액세스 패턴 구현

#### 🏗️ 챕터 4: 코드로서의 인프라 및 배포
- [ ] **커스텀 템플릿 생성**: 다중 서비스 애플리케이션 템플릿 구축
- [ ] **Bicep 숙달**: 모듈화된 재사용 가능한 인프라 구성 요소 생성
- [ ] **배포 자동화**: 배포 전/후 훅 구현
- [ ] **아키텍처 설계**: 복잡한 마이크로서비스 아키텍처 배포
- [ ] **템플릿 최적화**: 성능 및 비용을 위한 템플릿 최적화

#### 🎯 챕터 5: 다중 에이전트 AI 솔루션
- [ ] **소매 솔루션 배포**: 완전한 다중 에이전트 소매 시나리오 배포
- [ ] **에이전트 커스터마이징**: 고객 및 재고 에이전트 동작 수정
- [ ] **아키텍처 확장**: 로드 밸런싱 및 자동 확장 구현
- [ ] **프로덕션 모니터링**: 포괄적인 모니터링 및 경고 설정
- [ ] **성능 조정**: 다중 에이전트 시스템 성능 최적화

#### 🔍 챕터 6: 배포 전 검증 및 계획
- [ ] **용량 분석**: 애플리케이션의 리소스 요구 사항 분석
- [ ] **SKU 최적화**: 비용 효율적인 서비스 계층 선택
- [ ] **검증 자동화**: 배포 전 점검 스크립트 구현
- [ ] **비용 계획**: 배포 비용 추정 및 예산 생성
- [ ] **위험 평가**: 배포 위험 식별 및 완화

#### 🚨 챕터 7: 문제 해결 및 디버깅
- [ ] **진단 기술**: 의도적으로 깨진 배포 성공적으로 디버깅
- [ ] **로그 분석**: Azure Monitor 및 Application Insights 효과적으로 사용
- [ ] **성능 조정**: 느리게 작동하는 애플리케이션 최적화
- [ ] **복구 절차**: 백업 및 재해 복구 구현
- [ ] **모니터링 설정**: 사전 예방적 모니터링 및 경고 생성

#### 🏢 챕터 8: 프로덕션 및 엔터프라이즈 패턴
- [ ] **엔터프라이즈 보안**: 포괄적인 보안 패턴 구현
- [ ] **거버넌스 프레임워크**: Azure Policy 및 리소스 관리 설정
- [ ] **고급 모니터링**: 대시보드 및 자동 경고 생성
- [ ] **CI/CD 통합**: 자동화된 배포 파이프라인 구축
- [ ] **규정 준수 구현**: 엔터프라이즈 규정 준수 요구 사항 충족

### 학습 일정 및 주요 목표

#### 1-2주차: 기초 구축
- **목표**: AZD를 사용하여 첫 AI 애플리케이션 배포
- **검증**: 공용 URL을 통해 접근 가능한 작동 애플리케이션
- **기술**: 기본 AZD 워크플로 및 AI 서비스 통합

#### 3-4주차: 구성 숙달
- **목표**: 안전한 인증을 갖춘 다중 환경 배포
- **검증**: 동일한 애플리케이션을 dev/staging/prod에 배포
- **기술**: 환경 관리 및 보안 구현

#### 5-6주차: 인프라 전문성
- **목표**: 복잡한 다중 서비스 애플리케이션을 위한 커스텀 템플릿
- **검증**: 다른 팀원이 배포 가능한 재사용 템플릿
- **기술**: Bicep 숙달 및 인프라 자동화

#### 7-8주차: 고급 AI 구현
- **목표**: 프로덕션 준비 다중 에이전트 AI 솔루션
- **검증**: 실세계 부하를 처리하며 모니터링되는 시스템
- **기술**: 다중 에이전트 오케스트레이션 및 성능 최적화

#### 9-10주차: 프로덕션 준비
- **목표**: 완전한 규정을 준수하는 엔터프라이즈급 배포
- **검증**: 보안 검토 및 비용 최적화 감사 통과
- **기술**: 거버넌스, 모니터링 및 CI/CD 통합

### 평가 및 인증

#### 지식 검증 방법
1. **실습 배포**: 각 챕터별 작동 애플리케이션
2. **코드 리뷰**: 템플릿 및 구성 품질 평가
3. **문제 해결**: 문제 해결 시나리오 및 솔루션
4. **동료 교육**: 다른 학습자에게 개념 설명
5. **커뮤니티 기여**: 템플릿 또는 개선 사항 공유

#### 전문 개발 결과
- **포트폴리오 프로젝트**: 8개의 프로덕션 준비 완료 배포
- **기술 역량**: 업계 표준 AZD 및 AI 배포 전문성
- **문제 해결 능력**: 독립적인 문제 해결 및 최적화
- **커뮤니티 인정**: Azure 개발자 커뮤니티에서 활발한 참여
- **경력 발전**: 클라우드 및 AI 역할에 직접 적용 가능한 기술

#### 성공 지표
- **배포 성공률**: >95% 성공적인 배포
- **문제 해결 시간**: 일반적인 문제에 대해 30분 이내
- **성능 최적화**: 비용 및 성능에서 입증 가능한 개선
- **보안 준수**: 모든 배포가 기업 보안 표준을 충족
- **지식 전수**: 다른 개발자를 멘토링할 수 있는 능력

### 지속적인 학습과 커뮤니티 참여

#### 최신 정보 유지
- **Azure 업데이트**: Azure Developer CLI 릴리스 노트 팔로우
- **커뮤니티 이벤트**: Azure 및 AI 개발자 이벤트 참여
- **문서화**: 커뮤니티 문서 및 예제에 기여
- **피드백 루프**: 강의 내용 및 Azure 서비스에 대한 피드백 제공

#### 경력 개발
- **전문 네트워크**: Azure 및 AI 전문가와 연결
- **발표 기회**: 컨퍼런스 또는 밋업에서 학습 내용 발표
- **오픈 소스 기여**: AZD 템플릿 및 도구에 기여
- **멘토링**: 다른 개발자들이 AZD 학습 여정을 진행하도록 지도

---

**챕터 탐색:**
- **📚 강의 홈**: [AZD For Beginners](../README.md)
- **📖 학습 시작**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 진행 추적**: 포괄적인 8챕터 학습 시스템을 통해 발전 상황 추적
- **🤝 커뮤니티**: [Azure Discord](https://discord.gg/microsoft-azure)에서 지원 및 토론

**학습 진행 추적**: 이 구조화된 가이드를 사용하여 Azure Developer CLI를 점진적이고 실용적인 학습을 통해 숙달하고, 측정 가능한 결과와 전문 개발 혜택을 얻으세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
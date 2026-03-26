# 학습 가이드 - 포괄적인 학습 목표

**학습 경로 탐색**
- **📚 과정 홈**: [AZD 초보자용](../README.md)
- **📖 학습 시작**: [1장: 기초 및 빠른 시작](../README.md#-chapter-1-foundation--quick-start)
- **🎯 진행 상황 추적**: [과정 완료](../README.md#-course-completion--certification)

## 소개

이 포괄적인 학습 가이드는 Azure Developer CLI(azd)를 마스터하는 데 도움이 되는 체계적인 학습 목표, 주요 개념, 실습 연습 및 평가 자료를 제공합니다. 이 가이드를 사용하여 학습 진행 상황을 추적하고 필수 주제를 모두 커버했는지 확인하세요.

## 학습 목표

이 학습 가이드를 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI의 모든 기본 및 고급 개념을 숙달
- Azure 애플리케이션 배포 및 관리에 관한 실무 기술 개발
- 문제 해결 및 배포 최적화에 대한 자신감 구축
- 프로덕션 준비 배포 관행 및 보안 고려사항 이해

## 학습 성과

이 학습 가이드의 모든 섹션을 완료하면 다음을 할 수 있습니다:
- azd를 사용하여 완벽한 애플리케이션 아키텍처 설계, 배포 및 관리
- 포괄적인 모니터링, 보안 및 비용 최적화 전략 구현
- 복잡한 배포 문제를 독립적으로 해결
- 맞춤 템플릿 생성 및 azd 커뮤니티에 기여

## 8장 학습 구조

### 1장: 기초 및 빠른 시작 (1주차)
**소요 시간**: 30-45분 | <strong>난이도</strong>: ⭐

#### 학습 목표
- Azure Developer CLI 핵심 개념과 용어 이해
- 개발 플랫폼에 AZD 성공적으로 설치 및 구성
- 기존 템플릿을 사용하여 첫 애플리케이션 배포
- AZD 명령줄 인터페이스 효과적으로 탐색

#### 마스터해야 할 핵심 개념
- AZD 프로젝트 구조 및 구성 요소 (azure.yaml, infra/, src/)
- 템플릿 기반 배포 워크플로우
- 환경 구성 기본
- 리소스 그룹 및 구독 관리

#### 실습 연습
1. **설치 확인**: AZD 설치 후 `azd version` 명령으로 확인
2. **첫 배포**: todo-nodejs-mongo 템플릿 성공적으로 배포
3. **환경 설정**: 첫 환경 변수 구성
4. **리소스 탐색**: Azure 포털에서 배포된 리소스 탐색

#### 평가 질문
- AZD 프로젝트의 핵심 구성 요소는 무엇인가요?
- 템플릿에서 새 프로젝트를 초기화하는 방법은?
- `azd up`과 `azd deploy`의 차이점은 무엇인가요?
- AZD로 여러 환경을 어떻게 관리하나요?

---

### 2장: AI-퍼스트 개발 (2주차)
**소요 시간**: 1-2시간 | <strong>난이도</strong>: ⭐⭐

#### 학습 목표
- Microsoft Foundry 서비스를 AZD 워크플로우에 통합
- AI 기반 애플리케이션 배포 및 구성
- RAG(검색 보강 생성) 구현 패턴 이해
- AI 모델 배포 및 스케일링 관리

#### 마스터해야 할 핵심 개념
- Microsoft Foundry Models 서비스 통합 및 API 관리
- AI 검색 구성 및 벡터 인덱싱
- 모델 배포 전략 및 용량 계획
- AI 애플리케이션 모니터링 및 성능 최적화

#### 실습 연습
1. **AI 챗 배포**: azure-search-openai-demo 템플릿 배포
2. **RAG 구현**: 문서 인덱싱 및 검색 구성
3. **모델 구성**: 목적별 다양한 AI 모델 설정
4. **AI 모니터링**: AI 작업에 애플리케이션 인사이트 구현

#### 평가 질문
- AZD 템플릿에서 Microsoft Foundry Models 서비스를 어떻게 구성하나요?
- RAG 아키텍처의 주요 구성 요소는 무엇인가요?
- AI 모델 용량 및 스케일링은 어떻게 관리하나요?
- AI 애플리케이션 모니터링에 중요한 지표는 무엇인가요?

---

### 3장: 구성 및 인증 (3주차)
**소요 시간**: 45-60분 | <strong>난이도</strong>: ⭐⭐

#### 학습 목표
- 환경 구성 및 관리 전략 숙달
- 보안 인증 패턴 및 관리 ID 구현
- 적절한 명명 규칙으로 리소스 조직
- 다중 환경 배포 구성(개발, 스테이징, 프로덕션)

#### 마스터해야 할 핵심 개념
- 환경 계층 구조 및 구성 우선순위
- 관리 ID 및 서비스 주체 인증
- Key Vault 통합을 통한 비밀 관리
- 환경별 매개변수 관리

#### 실습 연습
1. **다중 환경 설정**: 개발, 스테이징 및 프로덕션 환경 구성
2. **보안 구성**: 관리 ID 인증 구현
3. **비밀 관리**: Azure Key Vault 통합
4. **매개변수 관리**: 환경별 구성 생성

#### 평가 질문
- AZD에서 다양한 환경을 어떻게 구성하나요?
- 서비스 주체보다 관리 ID를 사용하는 이점은 무엇인가요?
- 애플리케이션 비밀을 어떻게 안전하게 관리하나요?
- AZD에서 구성 계층 구조는 무엇인가요?

---

### 4장: 인프라 코드 및 배포 (4-5주차)
**소요 시간**: 1-1.5시간 | <strong>난이도</strong>: ⭐⭐⭐

#### 학습 목표
- Bicep 인프라 템플릿 생성 및 맞춤화
- 고급 배포 패턴 및 워크플로우 구현
- 리소스 프로비저닝 전략 이해
- 확장 가능한 다중 서비스 아키텍처 설계
- Azure Container Apps 및 AZD를 활용한 컨테이너화된 앱 배포

#### 마스터해야 할 핵심 개념
- Bicep 템플릿 구조 및 모범 사례
- 리소스 의존성 및 배포 순서 관리
- 매개변수 파일 및 템플릿 모듈화
- 맞춤 훅 및 배포 자동화
- 컨테이너 앱 배포 패턴(빠른 시작, 프로덕션, 마이크로서비스)

#### 실습 연습
1. **맞춤 템플릿 생성**: 다중 서비스 애플리케이션 템플릿 구축
2. **Bicep 숙달**: 모듈화 가능하며 재사용 가능한 인프라 컴포넌트 제작
3. **배포 자동화**: 사전/사후 배포 훅 구현
4. **아키텍처 설계**: 복잡한 마이크로서비스 아키텍처 배포
5. **컨테이너 앱 배포**: AZD를 이용해 [Simple Flask API](../../../examples/container-app/simple-flask-api)와 [Microservices Architecture](../../../examples/container-app/microservices) 예제 배포

#### 평가 질문
- AZD용 맞춤 Bicep 템플릿은 어떻게 생성하나요?
- 인프라 코드를 조직하는 최선의 방법은 무엇인가요?
- 템플릿 내 리소스 의존성은 어떻게 처리하나요?
- 어떤 배포 패턴이 무중단 업데이트를 지원하나요?

---

### 5장: 다중 에이전트 AI 솔루션 (6-7주차)
**소요 시간**: 2-3시간 | <strong>난이도</strong>: ⭐⭐⭐⭐

#### 학습 목표
- 다중 에이전트 AI 아키텍처 설계 및 구현
- 에이전트 간 조정 및 통신 오케스트레이션
- 프로덕션 준비된 AI 솔루션 배포 및 모니터링
- 에이전트 특화 및 워크플로우 패턴 이해
- 컨테이너화된 마이크로서비스를 다중 에이전트 솔루션에 통합

#### 마스터해야 할 핵심 개념
- 다중 에이전트 아키텍처 패턴 및 설계 원칙
- 에이전트 통신 프로토콜 및 데이터 흐름
- AI 에이전트의 부하 분산 및 스케일링 전략
- 다중 에이전트 시스템의 프로덕션 모니터링
- 컨테이너화 환경 내 서비스 간 통신

#### 실습 연습
1. **소매 솔루션 배포**: 완전한 다중 에이전트 소매 시나리오 배포
2. **에이전트 커스터마이징**: 고객 및 재고 에이전트 행동 수정
3. **아키텍처 스케일링**: 부하 분산 및 자동 스케일링 구현
4. **프로덕션 모니터링**: 종합 모니터링 및 알림 설정
5. **마이크로서비스 통합**: 에이전트 기반 워크플로우를 지원하도록 [마이크로서비스 아키텍처](../../../examples/container-app/microservices) 예제 확장

#### 평가 질문
- 효과적인 다중 에이전트 통신 패턴은 어떻게 설계하나요?
- AI 에이전트 작업량 스케일링 시 고려사항은 무엇인가요?
- 다중 에이전트 AI 시스템을 어떻게 모니터링하고 디버그하나요?
- AI 에이전트의 신뢰성 확보를 위한 프로덕션 패턴은 무엇인가요?

---

### 6장: 사전 배포 검증 및 계획 (8주차)
**소요 시간**: 1시간 | <strong>난이도</strong>: ⭐⭐

#### 학습 목표
- 포괄적인 용량 계획 및 리소스 검증 수행
- 비용 효율적인 최적 Azure SKU 선택
- 자동화된 사전 검사 및 검증 구현
- 비용 최적화 전략을 포함한 배포 계획 수립

#### 마스터해야 할 핵심 개념
- Azure 리소스 할당량 및 용량 제한
- SKU 선택 기준 및 비용 최적화
- 자동화된 검증 스크립트 및 테스트
- 배포 계획 및 위험 평가

#### 실습 연습
1. **용량 분석**: 애플리케이션 리소스 요구사항 분석
2. **SKU 최적화**: 비용 효율적인 서비스 티어 비교 및 선택
3. **검증 자동화**: 사전 배포 검사 스크립트 구현
4. **비용 계획**: 배포 비용 추산 및 예산 수립

#### 평가 질문
- 배포 전에 Azure 용량을 어떻게 검증하나요?
- SKU 선택 결정에 영향을 미치는 요소는 무엇인가요?
- 사전 배포 검증을 어떻게 자동화하나요?
- 배포 비용 최적화에 도움이 되는 전략은 무엇인가요?

---

### 7장: 문제 해결 및 디버깅 (9주차)
**소요 시간**: 1-1.5시간 | <strong>난이도</strong>: ⭐⭐

#### 학습 목표
- AZD 배포에 대한 체계적인 디버깅 기법 개발
- 일반적인 배포 및 구성 문제 해결
- AI 특화 문제 및 성능 문제 디버깅
- 사전 문제 감지를 위한 모니터링 및 알림 구현

#### 마스터해야 할 핵심 개념
- 진단 기법 및 로깅 전략
- 일반적인 실패 패턴 및 해결책
- 성능 모니터링 및 최적화
- 사고 대응 및 복구 절차

#### 실습 연습
1. **진단 능력 향상**: 의도적으로 실패된 배포 실습
2. **로그 분석**: Azure 모니터 및 애플리케이션 인사이트 효과적 사용
3. **성능 튜닝**: 느린 애플리케이션 최적화
4. **복구 절차**: 백업 및 재해 복구 구현

#### 평가 질문
- 가장 흔한 AZD 배포 실패 유형은 무엇인가요?
- 인증 및 권한 문제를 어떻게 디버깅하나요?
- 프로덕션 문제 예방에 도움되는 모니터링 전략은?
- Azure에서 애플리케이션 성능을 어떻게 최적화하나요?

---

### 8장: 프로덕션 및 엔터프라이즈 패턴 (10-11주차)
**소요 시간**: 2-3시간 | <strong>난이도</strong>: ⭐⭐⭐⭐

#### 학습 목표
- 엔터프라이즈급 배포 전략 구현
- 보안 패턴 및 컴플라이언스 프레임워크 설계
- 모니터링, 거버넌스 및 비용 관리 확립
- AZD 통합 확장 가능한 CI/CD 파이프라인 구축
- 프로덕션 컨테이너 앱 배포를 위한 모범 사례 적용(보안, 모니터링, 비용, CI/CD)

#### 마스터해야 할 핵심 개념
- 엔터프라이즈 보안 및 컴플라이언스 요구사항
- 거버넌스 프레임워크 및 정책 구현
- 고급 모니터링 및 비용 관리
- CI/CD 통합 및 자동화된 배포 파이프라인
- 컨테이너화 워크로드를 위한 블루-그린 및 카나리 배포 전략

#### 실습 연습
1. **엔터프라이즈 보안**: 포괄적 보안 패턴 구현
2. **거버넌스 프레임워크**: Azure 정책 및 리소스 관리 설정
3. **고급 모니터링**: 대시보드 생성 및 자동화된 알림 구축
4. **CI/CD 통합**: 자동화 배포 파이프라인 구축
5. **프로덕션 컨테이너 앱**: [마이크로서비스 아키텍처](../../../examples/container-app/microservices) 예제에 보안, 모니터링, 비용 최적화 적용

#### 평가 질문
- AZD 배포에서 엔터프라이즈 보안을 어떻게 구현하나요?
- 컴플라이언스 및 비용 관리를 위한 거버넌스 패턴은 무엇인가요?
- 프로덕션 시스템을 위한 확장 가능한 모니터링 설계 방법은?
- AZD 워크플로우와 잘 맞는 CI/CD 패턴은 무엇인가요?

#### 학습 목표
- Azure Developer CLI 기본 및 핵심 개념 이해
- 개발 환경에 azd 성공적으로 설치 및 구성
- 기존 템플릿을 사용하여 첫 배포 완료
- azd 프로젝트 구조 탐색 및 핵심 구성 요소 이해

#### 마스터해야 할 핵심 개념
- 템플릿, 환경 및 서비스
- azure.yaml 구성 구조
- 기본 azd 명령어(init, up, down, deploy)
- 코드형 인프라 원칙
- Azure 인증 및 권한 부여

#### 실습 연습

**연습 1.1: 설치 및 설정**
```bash
# 다음 작업을 완료하세요:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**연습 1.2: 첫 배포**
```bash
# 간단한 웹 애플리케이션 배포:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**연습 1.3: 프로젝트 구조 분석**
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
3. 환경은 다른 배포 대상을 어떻게 관리하나요?
4. azd에서 사용할 수 있는 인증 방법은 무엇인가요?
5. 처음으로 `azd up`을 실행하면 어떤 일이 발생하나요?

---

## 진행 상황 추적 및 평가 프레임워크
```bash
# 여러 환경 생성 및 구성:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**연습 2.2: 고급 구성**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**연습 2.3: 보안 구성**
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
3. 다른 환경에 대해 어떻게 다양한 SKU를 구성하나요?
4. 다양한 인증 방법이 가진 보안상의 영향은 무엇인가요?
5. 비밀 및 민감한 구성 데이터를 어떻게 관리하나요?

### 모듈 3: 배포 및 프로비저닝 (4주차)

#### 학습 목표
- 배포 워크플로우 및 최선의 관행 숙달
- Bicep 템플릿을 활용한 코드형 인프라 이해
- 복잡한 다중 서비스 아키텍처 구현
- 배포 성능 및 안정성 최적화

#### 마스터해야 할 핵심 개념
- Bicep 템플릿 구조 및 모듈
- 리소스 의존성 및 순서 관리
- 배포 전략(블루-그린, 롤링 업데이트)
- 다중 지역 배포
- 데이터베이스 마이그레이션 및 데이터 관리

#### 실습 연습

**연습 3.1: 맞춤 인프라**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**연습 3.2: 다중 서비스 애플리케이션**
```bash
# 마이크로서비스 아키텍처 배포:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**연습 3.3: 데이터베이스 통합**
```bash
# 데이터베이스 배포 패턴 구현:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 자기 평가 질문
1. ARM 템플릿 대비 Bicep의 장점은 무엇인가요?
2. azd 배포에서 데이터베이스 마이그레이션은 어떻게 처리하나요?
3. 무중단 배포를 위한 전략은 무엇인가요?
4. 서비스 간 의존성은 어떻게 관리하나요?
5. 다중 지역 배포 시 고려사항은 무엇인가요?

### 모듈 4: 사전 배포 검증 (5주차)

#### 학습 목표
- 포괄적인 배포 전 점검 구현
- 용량 계획 및 리소스 검증 숙달
- SKU 선택과 비용 최적화 이해
- 자동 검증 파이프라인 구축

#### 숙달할 핵심 개념
- Azure 리소스 쿼터 및 한도
- SKU 선택 기준 및 비용 영향
- 자동 검증 스크립트 및 도구
- 용량 계획 방법론
- 성능 테스트 및 최적화

#### 실습 과제

**과제 4.1: 용량 계획**
```bash
# 용량 검증 구현:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**과제 4.2: 사전 점검(validation)**
```powershell
# 종합적인 검증 파이프라인 구축:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**과제 4.3: SKU 최적화**
```bash
# 서비스 구성 최적화:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 자기 평가 질문
1. SKU 선택 결정에 영향을 미치는 요소는 무엇인가요?
2. 배포 전에 Azure 리소스 가용성을 어떻게 검증하나요?
3. 사전 점검 시스템의 주요 구성 요소는 무엇인가요?
4. 배포 비용을 어떻게 추정하고 제어하나요?
5. 용량 계획에 필수적인 모니터링은 무엇인가요?

### 모듈 5: 문제 해결 및 디버깅 (6주차)

#### 학습 목표
- 체계적인 문제 해결 방법론 숙달
- 복잡한 배포 문제 디버깅 전문성 개발
- 포괄적인 모니터링 및 경고 구현
- 사고 대응 및 복구 절차 구축

#### 숙달할 핵심 개념
- 일반적인 배포 실패 패턴
- 로그 분석 및 상관관계 기법
- 성능 모니터링 및 최적화
- 보안 사고 탐지 및 대응
- 재해 복구 및 비즈니스 연속성

#### 실습 과제

**과제 5.1: 문제 해결 시나리오**
```bash
# 일반적인 문제 해결 연습:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**과제 5.2: 모니터링 구현**
```bash
# 종합적인 모니터링 설정:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**과제 5.3: 사고 대응**
```bash
# 사고 대응 절차 구축:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 자기 평가 질문
1. azd 배포 문제 해결에 대한 체계적인 접근법은 무엇인가요?
2. 여러 서비스와 리소스 간 로그를 어떻게 연계하나요?
3. 조기 문제 감지를 위한 핵심 모니터링 지표는 무엇인가요?
4. 효과적인 재해 복구 절차를 어떻게 구현하나요?
5. 사고 대응 계획의 주요 구성 요소는 무엇인가요?

### 모듈 6: 고급 주제 및 모범 사례 (7~8주차)

#### 학습 목표
- 엔터프라이즈급 배포 패턴 구현
- CI/CD 통합 및 자동화 숙달
- 맞춤 템플릿 개발 및 커뮤니티 기여
- 고급 보안 및 준수 요건 이해

#### 숙달할 핵심 개념
- CI/CD 파이프라인 통합 패턴
- 맞춤 템플릿 개발 및 배포
- 엔터프라이즈 거버넌스 및 준수
- 고급 네트워킹 및 보안 구성
- 성능 최적화 및 비용 관리

#### 실습 과제

**과제 6.1: CI/CD 통합**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**과제 6.2: 맞춤 템플릿 개발**
```bash
# 사용자 정의 템플릿 생성 및 게시:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**과제 6.3: 엔터프라이즈 구현**
```bash
# 기업용 등급 기능 구현:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 자기 평가 질문
1. azd를 기존 CI/CD 워크플로우에 어떻게 통합하나요?
2. 맞춤 템플릿 개발 시 고려해야 할 핵심 사항은 무엇인가요?
3. azd 배포에서 거버넌스 및 준수를 어떻게 구현하나요?
4. 엔터프라이즈 규모 배포의 모범 사례는 무엇인가요?
5. azd 커뮤니티에 효과적으로 기여하는 방법은 무엇인가요?

## 실습 프로젝트

### 프로젝트 1: 개인 포트폴리오 웹사이트
<strong>난이도</strong>: 초급  
<strong>기간</strong>: 1~2주

다음 항목을 사용하여 개인 포트폴리오 웹사이트 구축 및 배포:
- Azure Storage에서 정적 웹사이트 호스팅
- 맞춤 도메인 구성
- 전 세계 성능을 위한 CDN 통합
- 자동화된 배포 파이프라인

<strong>결과물</strong>:
- Azure에 배포된 작동 웹사이트
- 포트폴리오 배포용 맞춤 azd 템플릿
- 배포 프로세스 문서화
- 비용 분석 및 최적화 권고안

### 프로젝트 2: 태스크 관리 애플리케이션
<strong>난이도</strong>: 중급  
<strong>기간</strong>: 2~3주

다음 요소를 포함한 풀스택 태스크 관리 애플리케이션 제작:
- App Service에 배포된 React 프론트엔드
- 인증 기능을 갖춘 Node.js API 백엔드
- 마이그레이션 포함 PostgreSQL 데이터베이스
- Application Insights 모니터링

<strong>결과물</strong>:
- 사용자 인증 기능 포함 완성 애플리케이션
- 데이터베이스 스키마 및 마이그레이션 스크립트
- 모니터링 대시보드 및 경고 규칙
- 다중 환경 배포 구성

### 프로젝트 3: 마이크로서비스 전자상거래 플랫폼
<strong>난이도</strong>: 고급  
<strong>기간</strong>: 4~6주

마이크로서비스 기반 전자상거래 플랫폼 설계 및 구현:
- 다수의 API 서비스 (카탈로그, 주문, 결제, 사용자)
- Service Bus와 메시지 큐 통합
- 성능 최적화를 위한 Redis 캐시
- 포괄적인 로깅 및 모니터링

**참고 예제**: 프로덕션 준비 템플릿 및 배포 가이드는 [Microservices Architecture](../../../examples/container-app/microservices) 참고

<strong>결과물</strong>:
- 완전한 마이크로서비스 아키텍처
- 서비스 간 통신 패턴
- 성능 테스트 및 최적화
- 프로덕션 수준 보안 구현

## 평가 및 인증

### 지식 확인

각 모듈 후 다음 평가 완료:

**모듈 1 평가**: 기본 개념 및 설치
- 핵심 개념에 대한 객관식 질문
- 실습 설치 및 구성 과제
- 간단한 배포 연습

**모듈 2 평가**: 구성 및 환경
- 환경 관리 시나리오
- 구성 문제 해결 연습
- 보안 구성 구현

**모듈 3 평가**: 배포 및 프로비저닝
- 인프라 설계 과제
- 다중 서비스 배포 시나리오
- 성능 최적화 연습

**모듈 4 평가**: 사전 배포 검증
- 용량 계획 사례 연구
- 비용 최적화 시나리오
- 검증 파이프라인 구현

**모듈 5 평가**: 문제 해결 및 디버깅
- 문제 진단 연습
- 모니터링 구현 과제
- 사고 대응 시뮬레이션

**모듈 6 평가**: 고급 주제
- CI/CD 파이프라인 설계
- 맞춤 템플릿 개발
- 엔터프라이즈 아키텍처 시나리오

### 최종 캡스톤 프로젝트

모든 개념 숙달을 증명하는 완전한 솔루션 설계 및 구현:

**요구 사항**:
- 다계층 애플리케이션 아키텍처
- 다수의 배포 환경
- 포괄적인 모니터링 및 경고
- 보안 및 준수 구현
- 비용 최적화 및 성능 튜닝
- 완전한 문서 및 런북

**평가 기준**:
- 기술 구현 품질
- 문서 완성도
- 보안 및 모범 사례 준수
- 성능 및 비용 최적화
- 문제 해결 및 모니터링 효율성

## 학습 자료 및 참고 문헌

### 공식 문서
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### 커뮤니티 리소스
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

## 학습 일정 권장안

### 전일제 학습 (8주)
- **1-2주차**: 모듈 1-2 (시작하기, 구성)
- **3-4주차**: 모듈 3-4 (배포, 사전 배포)
- **5-6주차**: 모듈 5-6 (문제 해결, 고급 주제)
- **7-8주차**: 실습 프로젝트 및 최종 평가

### 파트타임 학습 (16주)
- **1-4주차**: 모듈 1 (시작하기)
- **5-7주차**: 모듈 2 (구성 및 환경)
- **8-10주차**: 모듈 3 (배포 및 프로비저닝)
- **11-12주차**: 모듈 4 (사전 배포 검증)
- **13-14주차**: 모듈 5 (문제 해결 및 디버깅)
- **15-16주차**: 모듈 6 (고급 주제 및 평가)

---

## 진행 상황 추적 및 평가 프레임워크

### 장별 완료 체크리스트

각 장의 진행 상황을 다음 가시적 결과로 추적하세요:

#### 📚 1장: 기초 및 빠른 시작
- [ ] **설치 완료**: 플랫폼에 AZD 설치 및 확인 완료
- [ ] **첫 배포**: todo-nodejs-mongo 템플릿 성공적으로 배포
- [ ] **환경 설정**: 첫 번째 환경 변수 구성 완료
- [ ] **리소스 탐색**: Azure 포털에서 배포된 리소스 탐색 완료
- [ ] **명령어 숙달**: 기본 AZD 명령어에 익숙함

#### 🤖 2장: AI-First 개발  
- [ ] **AI 템플릿 배포**: azure-search-openai-demo 성공적 배포
- [ ] **RAG 구현**: 문서 인덱싱 및 검색 구성
- [ ] **모델 구성**: 다양한 목적의 AI 모델 다수 설정
- [ ] **AI 모니터링**: AI 작업 부하에 대해 Application Insights 구현
- [ ] **성능 최적화**: AI 애플리케이션 성능 조정

#### ⚙️ 3장: 구성 및 인증
- [ ] **다중 환경 설정**: dev, staging, prod 환경 구성 완료
- [ ] **보안 구현**: 관리 아이덴티티 인증 구성 완료
- [ ] **비밀 정보 관리**: 민감 데이터용 Azure Key Vault 통합
- [ ] **매개변수 관리**: 환경별 구성 생성
- [ ] **인증 숙달**: 안전한 접근 패턴 구현

#### 🏗️ 4장: 인프라 코드 및 배포
- [ ] **맞춤 템플릿 생성**: 다중 서비스 애플리케이션 템플릿 제작
- [ ] **Bicep 숙달**: 모듈화되고 재사용 가능한 인프라 구성요소 개발
- [ ] **배포 자동화**: 사전/사후 배포 훅 구현
- [ ] **아키텍처 설계**: 복잡한 마이크로서비스 아키텍처 배포
- [ ] **템플릿 최적화**: 성능 및 비용을 위한 템플릿 최적화

#### 🎯 5장: 다중 에이전트 AI 솔루션
- [ ] **소매 솔루션 배포**: 완전한 다중 에이전트 소매 시나리오 배포
- [ ] **에이전트 맞춤화**: 고객 및 재고 에이전트 동작 수정
- [ ] **아키텍처 확장**: 부하 분산 및 자동 확장 구현
- [ ] **프로덕션 모니터링**: 포괄적 모니터링 및 경고 설정
- [ ] **성능 튜닝**: 다중 에이전트 시스템 성능 최적화

#### 🔍 6장: 사전 배포 검증 및 계획
- [ ] **용량 분석**: 애플리케이션 요구 리소스 분석
- [ ] **SKU 최적화**: 비용 효율적인 서비스 티어 선택
- [ ] **검증 자동화**: 사전 배포 점검 스크립트 구현
- [ ] **비용 계획**: 배포 비용 추정 및 예산 수립
- [ ] **위험 평가**: 배포 위험 식별 및 완화

#### 🚨 7장: 문제 해결 및 디버깅
- [ ] **진단 기술**: 일부러 고장 낸 배포 디버깅 성공
- [ ] **로그 분석**: Azure Monitor 및 Application Insights 효과적 활용
- [ ] **성능 튜닝**: 성능 저하 애플리케이션 최적화
- [ ] **복구 절차**: 백업 및 재해 복구 구현
- [ ] **모니터링 설정**: 선제적 모니터링 및 경고 생성

#### 🏢 8장: 프로덕션 및 엔터프라이즈 패턴
- [ ] **엔터프라이즈 보안**: 포괄적인 보안 패턴 구현
- [ ] **거버넌스 프레임워크**: Azure Policy 및 리소스 관리 구성
- [ ] **고급 모니터링**: 대시보드 및 자동 경고 생성
- [ ] **CI/CD 통합**: 자동화된 배포 파이프라인 구축
- [ ] **준수 구현**: 엔터프라이즈 준수 요건 충족

### 학습 일정 및 마일스톤

#### 1~2주차: 기초 구축
- <strong>마일스톤</strong>: AZD로 첫 AI 애플리케이션 배포
- <strong>검증</strong>: 공개 URL로 접속 가능한 작동 애플리케이션
- <strong>기술</strong>: 기본 AZD 워크플로우 및 AI 서비스 통합

#### 3~4주차: 구성 숙달
- <strong>마일스톤</strong>: 안전한 인증을 갖춘 다중 환경 배포
- <strong>검증</strong>: 동일한 앱을 dev/staging/prod 환경에 배포
- <strong>기술</strong>: 환경 관리 및 보안 구현

#### 5~6주차: 인프라 전문성
- <strong>마일스톤</strong>: 복잡한 다중 서비스용 맞춤 템플릿 제작
- <strong>검증</strong>: 다른 팀원이 재사용 가능한 템플릿 배포
- <strong>기술</strong>: Bicep 숙달 및 인프라 자동화

#### 7~8주차: 고급 AI 구현
- <strong>마일스톤</strong>: 프로덕션 준비 다중 에이전트 AI 솔루션
- <strong>검증</strong>: 실사용 부하를 감당하는 모니터링 시스템
- <strong>기술</strong>: 다중 에이전트 조율 및 성능 최적화

#### 9~10주차: 프로덕션 준비
- <strong>마일스톤</strong>: 완전한 준수를 갖춘 엔터프라이즈급 배포
- <strong>검증</strong>: 보안 검토 및 비용 최적화 감사 통과
- <strong>기술</strong>: 거버넌스, 모니터링, CI/CD 통합

### 평가 및 인증

#### 지식 검증 방법
1. **실습 배포**: 각 장별 작동 애플리케이션
2. **코드 리뷰**: 템플릿 및 구성 품질 평가
3. **문제 해결**: 문제 해결 시나리오 및 솔루션
4. **동료 교육**: 다른 학습자에게 개념 설명
5. **커뮤니티 기여**: 템플릿 또는 개선 사항 공유

#### 전문성 개발 성과
- **포트폴리오 프로젝트**: 8개의 프로덕션 준비 완료 배포
- **기술 역량**: 업계 표준 AZD 및 AI 배포 전문 지식
- **문제 해결 능력**: 독립적인 문제 해결 및 최적화
- **커뮤니티 인정**: Azure 개발자 커뮤니티에서 활발한 참여
- **경력 향상**: 클라우드 및 AI 역할에 직접적으로 적용 가능한 기술

#### 성공 지표
- **배포 성공률**: >95% 성공적인 배포
- **문제 해결 시간**: 일반적인 문제에 대해 30분 미만
- **성능 최적화**: 비용 및 성능에서 입증된 향상
- **보안 준수**: 모든 배포가 기업 보안 표준 충족
- **지식 이전**: 다른 개발자를 멘토링할 수 있는 능력

### 지속적인 학습 및 커뮤니티 참여

#### 최신 정보 유지
- **Azure 업데이트**: Azure Developer CLI 릴리스 노트 팔로우
- **커뮤니티 이벤트**: Azure 및 AI 개발자 이벤트 참여
- **문서화 기여**: 커뮤니티 문서 및 예제에 기여
- **피드백 루프**: 강의 내용과 Azure 서비스에 대한 피드백 제공

#### 경력 개발
- **전문 네트워크**: Azure 및 AI 전문가와 연결
- **발표 기회**: 컨퍼런스나 밋업에서 학습 내용 발표
- **오픈 소스 기여**: AZD 템플릿 및 도구에 기여
- <strong>멘토링</strong>: 다른 개발자의 AZD 학습 여정 지도

---

**챕터 내비게이션:**
- **📚 강의 홈**: [AZD For Beginners](../README.md)
- **📖 학습 시작**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 진행 상황 추적**: 8개 챕터의 종합 학습 시스템을 통한 진도 추적
- **🤝 커뮤니티**: 지원 및 토론을 위한 [Azure Discord](https://discord.gg/microsoft-azure)

**학습 진행 추적**: 이 구조화된 가이드를 사용하여 측정 가능한 결과와 전문성 개발 혜택을 통해 Azure Developer CLI를 단계적으로 실습하며 마스터하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확한 내용이 있을 수 있음을 알려드립니다. 원본 문서는 해당 언어로 된 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문 인력의 번역을 권장합니다. 이 번역 사용으로 인한 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
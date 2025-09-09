<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:40:55+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "ko"
}
-->
# 초보자를 위한 AZD 학습 가이드

## 소개

이 포괄적인 학습 가이드는 Azure Developer CLI(azd)를 마스터하기 위한 체계적인 학습 목표, 핵심 개념, 실습 과제 및 평가 자료를 제공합니다. 이 가이드를 사용하여 학습 진행 상황을 추적하고 필수 주제를 모두 다루었는지 확인하세요.

## 학습 목표

이 학습 가이드를 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI의 기본 및 고급 개념을 완벽히 이해
- Azure 애플리케이션 배포 및 관리에 대한 실무 능력 개발
- 배포 문제 해결 및 최적화에 대한 자신감 구축
- 프로덕션 준비 배포 관행 및 보안 고려 사항 이해

## 학습 결과

이 학습 가이드의 모든 섹션을 완료한 후, 다음을 수행할 수 있습니다:
- azd를 사용하여 완전한 애플리케이션 아키텍처를 설계, 배포 및 관리
- 포괄적인 모니터링, 보안 및 비용 최적화 전략 구현
- 복잡한 배포 문제를 독립적으로 해결
- 사용자 정의 템플릿을 생성하고 azd 커뮤니티에 기여

## 과정 구조

### 모듈 1: 시작하기 (1-2주)

#### 학습 목표
- Azure Developer CLI의 기본 및 핵심 개념 이해
- 개발 환경에서 azd를 성공적으로 설치 및 구성
- 기존 템플릿을 사용하여 첫 번째 배포 완료
- azd 프로젝트 구조를 탐색하고 주요 구성 요소 이해

#### 마스터해야 할 핵심 개념
- 템플릿, 환경 및 서비스
- azure.yaml 구성 구조
- 기본 azd 명령어(init, up, down, deploy)
- 코드형 인프라 원칙
- Azure 인증 및 권한 부여

#### 실습 과제

**실습 1.1: 설치 및 설정**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**실습 1.2: 첫 번째 배포**  
```bash
# Deploy a simple web application:
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
3. 환경은 서로 다른 배포 대상 관리를 어떻게 돕나요?
4. azd에서 사용할 수 있는 인증 방법은 무엇인가요?
5. 처음으로 `azd up`을 실행하면 어떤 일이 발생하나요?

### 모듈 2: 구성 및 환경 (3주차)

#### 학습 목표
- 환경 관리 및 구성 마스터
- 고급 azure.yaml 구성 이해
- 환경별 설정 및 변수 구현
- 다양한 시나리오에 대한 인증 구성

#### 마스터해야 할 핵심 개념
- 환경 계층 구조 및 변수 우선순위
- 서비스 구성 및 매개변수
- 훅 및 라이프사이클 이벤트
- 인증 방법(사용자, 서비스 주체, 관리 ID)
- 구성 파일 관리

#### 실습 과제

**실습 2.1: 다중 환경 설정**  
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 자기 평가 질문
1. azd는 환경 변수 우선순위를 어떻게 처리하나요?
2. 배포 훅이란 무엇이며 언제 사용해야 하나요?
3. 서로 다른 환경에 대해 다양한 SKU를 어떻게 구성하나요?
4. 다양한 인증 방법의 보안적 함의는 무엇인가요?
5. 비밀 및 민감한 구성 데이터를 어떻게 관리하나요?

### 모듈 3: 배포 및 프로비저닝 (4주차)

#### 학습 목표
- 배포 워크플로 및 모범 사례 마스터
- Bicep 템플릿을 사용한 코드형 인프라 이해
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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**실습 3.3: 데이터베이스 통합**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 자기 평가 질문
1. ARM 템플릿보다 Bicep을 사용하는 장점은 무엇인가요?
2. azd 배포에서 데이터베이스 마이그레이션을 어떻게 처리하나요?
3. 무중단 배포를 위한 전략은 무엇인가요?
4. 서비스 간 종속성을 어떻게 관리하나요?
5. 다중 지역 배포를 위한 고려 사항은 무엇인가요?

### 모듈 4: 배포 전 검증 (5주차)

#### 학습 목표
- 포괄적인 배포 전 체크 구현
- 용량 계획 및 리소스 검증 마스터
- SKU 선택 및 비용 최적화 이해
- 자동화된 검증 파이프라인 구축

#### 마스터해야 할 핵심 개념
- Azure 리소스 할당량 및 제한
- SKU 선택 기준 및 비용 함의
- 자동화된 검증 스크립트 및 도구
- 용량 계획 방법론
- 성능 테스트 및 최적화

#### 실습 과제

**실습 4.1: 용량 계획**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**실습 4.2: 사전 검증**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**실습 4.3: SKU 최적화**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 자기 평가 질문
1. SKU 선택 결정에 영향을 미치는 요인은 무엇인가요?
2. 배포 전에 Azure 리소스 가용성을 어떻게 검증하나요?
3. 사전 체크 시스템의 주요 구성 요소는 무엇인가요?
4. 배포 비용을 어떻게 추정하고 제어하나요?
5. 용량 계획을 위한 필수 모니터링은 무엇인가요?

### 모듈 5: 문제 해결 및 디버깅 (6주차)

#### 학습 목표
- 체계적인 문제 해결 방법론 마스터
- 복잡한 배포 문제 디버깅 전문성 개발
- 포괄적인 모니터링 및 경고 구현
- 사고 대응 및 복구 절차 구축

#### 마스터해야 할 핵심 개념
- 일반적인 배포 실패 패턴
- 로그 분석 및 상관 관계 기술
- 성능 모니터링 및 최적화
- 보안 사고 감지 및 대응
- 재해 복구 및 비즈니스 연속성

#### 실습 과제

**실습 5.1: 문제 해결 시나리오**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**실습 5.2: 모니터링 구현**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**실습 5.3: 사고 대응**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 자기 평가 질문
1. azd 배포 문제를 체계적으로 해결하는 방법은 무엇인가요?
2. 여러 서비스 및 리소스 간 로그를 어떻게 상관시키나요?
3. 초기 문제 감지를 위한 가장 중요한 모니터링 메트릭은 무엇인가요?
4. 효과적인 재해 복구 절차를 어떻게 구현하나요?
5. 사고 대응 계획의 주요 구성 요소는 무엇인가요?

### 모듈 6: 고급 주제 및 모범 사례 (7-8주차)

#### 학습 목표
- 엔터프라이즈급 배포 패턴 구현
- CI/CD 통합 및 자동화 마스터
- 사용자 정의 템플릿 개발 및 커뮤니티 기여
- 고급 보안 및 규정 준수 요구 사항 이해

#### 마스터해야 할 핵심 개념
- CI/CD 파이프라인 통합 패턴
- 사용자 정의 템플릿 개발 및 배포
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

**실습 6.2: 사용자 정의 템플릿 개발**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**실습 6.3: 엔터프라이즈 구현**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 자기 평가 질문
1. 기존 CI/CD 워크플로에 azd를 어떻게 통합하나요?
2. 사용자 정의 템플릿 개발을 위한 주요 고려 사항은 무엇인가요?
3. azd 배포에서 거버넌스 및 규정 준수를 어떻게 구현하나요?
4. 엔터프라이즈 규모 배포를 위한 모범 사례는 무엇인가요?
5. azd 커뮤니티에 효과적으로 기여하는 방법은 무엇인가요?

## 실습 프로젝트

### 프로젝트 1: 개인 포트폴리오 웹사이트
**복잡도**: 초급  
**기간**: 1-2주

다음을 사용하여 개인 포트폴리오 웹사이트를 구축 및 배포:
- Azure Storage를 통한 정적 웹사이트 호스팅
- 사용자 정의 도메인 구성
- 글로벌 성능을 위한 CDN 통합
- 자동화된 배포 파이프라인

**산출물**:
- Azure에 배포된 작동하는 웹사이트
- 포트폴리오 배포를 위한 사용자 정의 azd 템플릿
- 배포 과정 문서화
- 비용 분석 및 최적화 권장 사항

### 프로젝트 2: 작업 관리 애플리케이션
**복잡도**: 중급  
**기간**: 2-3주

다음 기능을 갖춘 풀스택 작업 관리 애플리케이션 생성:
- App Service에 배포된 React 프론트엔드
- 인증 기능이 포함된 Node.js API 백엔드
- 마이그레이션이 포함된 PostgreSQL 데이터베이스
- Application Insights 모니터링

**산출물**:
- 사용자 인증이 포함된 완전한 애플리케이션
- 데이터베이스 스키마 및 마이그레이션 스크립트
- 모니터링 대시보드 및 경고 규칙
- 다중 환경 배포 구성

### 프로젝트 3: 마이크로서비스 기반 전자상거래 플랫폼
**복잡도**: 고급  
**기간**: 4-6주

다음 기능을 갖춘 마이크로서비스 기반 전자상거래 플랫폼 설계 및 구현:
- 여러 API 서비스(카탈로그, 주문, 결제, 사용자)
- Service Bus를 사용한 메시지 큐 통합
- 성능 최적화를 위한 Redis 캐시
- 포괄적인 로깅 및 모니터링

**산출물**:
- 완전한 마이크로서비스 아키텍처
- 서비스 간 통신 패턴
- 성능 테스트 및 최적화
- 프로덕션 준비 보안 구현

## 평가 및 인증

### 지식 점검

각 모듈 완료 후 다음 평가를 수행하세요:

**모듈 1 평가**: 기본 개념 및 설치
- 핵심 개념에 대한 객관식 질문
- 설치 및 구성 실습 과제
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
- 모니터링 구현 과제
- 사고 대응 시뮬레이션

**모듈 6 평가**: 고급 주제
- CI/CD 파이프라인 설계
- 사용자 정의 템플릿 개발
- 엔터프라이즈 아키텍처 시나리오

### 최종 캡스톤 프로젝트

모든 개념을 마스터했음을 입증하는 완전한 솔루션 설계 및 구현:

**요구 사항**:
- 다중 계층 애플리케이션 아키텍처
- 여러 배포 환경
- 포괄적인 모니터링 및 경고
- 보안 및 규정 준수 구현
- 비용 최적화 및 성능 튜닝
- 완전한 문서화 및 실행 매뉴얼

**평가 기준**:
- 기술 구현 품질
- 문서화 완성도
- 보안 및 모범 사례 준수
- 성능 및 비용 최적화
- 문제 해결 및 모니터링 효과

## 학습 자료 및 참고 문헌

### 공식 문서
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep 문서](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)

### 커뮤니티 자료
- [AZD 템플릿 갤러리](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub 조직](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub 저장소](https://github.com/Azure/azure-dev)

### 실습 환경
- [Azure 무료 계정](https://azure.microsoft.com/free/)
- [Azure DevOps 무료 계층](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 추가 도구
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools 확장팩](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 학습 일정 추천

### 풀타임 학습 (8주)
- **1-2주차**: 모듈 1-2(시작하기, 구성)
- **3-4주차**: 모듈 3-4(배포, 배포 전)
- **5-6주차**: 모듈 5-6(문제 해결, 고급 주제)
- **7-8주차**: 실습 프로젝트 및 최종 평가

### 파트타임 학습 (16주)
- **1-4주차**: 모듈 1(시작하기)
- **5-7주차**: 모듈 2(구성 및 환경)
- **8-10주차**: 모듈 3(배포 및 프로비저닝)
- **11-12주차**: 모듈 4(배포 전 검증)
- **13-14주차**: 모듈 5(문제 해결 및 디버깅)
- **15-16주차**: 모듈 6(고급 주제 및 평가)

### 자기 주도 학습
- 각 모듈을 자신의 속도에 맞게 완료
- 어려운 개념에 추가 시간 투자
- 숙달할 때까지 실습 반복
- 커뮤니티 토론에 참여하고 질문하기

## 성공 팁

### 효과적인 학습 전략
1. **정기적으로 연습하기**: 애플리케이션을 자주 배포하여 실력을 쌓으세요
2. **두려움 없이 실험하기**: 개발 환경에서 새로운 구성을 시도하세요
3. **학습 기록하기**: 문제 해결 방법에 대한 노트를 작성하세요
4. **커뮤니티 참여하기**: 토론에 참여하고 프로젝트에 기여하세요
5. **최신 상태 유지하기**: Azure 업데이트 및 새로운 azd 기능을 팔로우하세요

### 피해야 할 일반적인 실수
1. **기초 건너뛰기**: 적절한 기초 지식을 갖추세요
2. **개념을 서두르기**: 기본을 철저히 이해하는 데 시간을 투자하세요
3. **보안 무시하기**: 처음부터 보안 모범 사례를 구현하세요
4. **테스트 부족**: 여러 환경에서 배포를 테스트하세요
5. **문서화 회피**: 좋은 문서화는 유지 관리에 필수적입니다

### 실무 경험 쌓기
1. **작게 시작하기**: 간단한 애플리케이션부터 시작하여 점차 복잡성을 높이세요
2. **실패에서 배우기**: 문제 해결 실습을 학습 기회로 활용하세요
3. **오픈 소스에 기여하기**: 템플릿과 솔루션을 커뮤니티와 공유하세요  
4. **다른 사람을 가르치기**: 개념을 다른 사람에게 설명하면 자신의 이해도도 강화됩니다  
5. **호기심 유지하기**: 새로운 Azure 서비스와 통합 패턴을 지속적으로 탐구하세요  

---

**탐색**  
- **이전 강의**: [FAQ](faq.md)  
- **다음 강의**: [Changelog](../changelog.md)  

**학습 진행 추적**: 이 가이드를 사용하여 학습 여정을 추적하고 Azure Developer CLI의 모든 개념과 실습을 포괄적으로 다루세요.  

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.
# 3장: 구성 및 인증

**📚 강의**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 통합 연습 포함 90-150분 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 Azure 개발자 CLI 배포를 위한 환경 구성, 인증 패턴 및 보안 모범 사례를 다룹니다.

> 명령 및 구성 검토 대상: `azd 1.37.2` (2026년 11월). 검토 중 라이브 Azure 프로비저닝은 실행되지 않았습니다.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- AZD 구성 계층 구조를 숙달합니다
- 여러 환경(dev, staging, prod)을 관리합니다
- 관리형 ID를 통해 안전한 인증을 구현합니다
- 환경별 설정을 구성합니다

---

## 📚 강의 목록

| # | 강의 | 설명 | 소요 시간 |
|---|--------|-------------|------|
| 1 | [구성 가이드](configuration.md) | 환경 설정 및 관리 | 30분 |
| 2 | [인증 및 보안](authsecurity.md) | 관리형 ID 및 RBAC 패턴 | 30분 |

---

## 🚀 빠른 시작

<strong>이미 초기화된 azd 애플리케이션</strong>의 루트에서 실행하세요, 강의 저장소가 아닙니다. 이미 존재하는 경우 사용하지 않은 환경 이름을 사용하세요.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME`은 예시입니다: 템플릿에서 명시적으로 사용하지 않으면 인프라에 영향을 주지 않습니다. 일반 `azd env set` 값은 평문으로 로컬에 저장되며, 안전한 비밀 저장소가 아닙니다.

---

## 🔧 구성 계층

세 가지 다른 구성 표면을 분리하세요: 전역 환경설정(`azd config`), 프로젝트 구조(`azure.yaml`), 그리고 환경별 값(`azd env`). 플래그는 실제로 지원하는 설정만 덮어쓰며, `azure.yaml` 또는 Bicep에 임의 환경 변수를 보편적으로 오버레이하지 않습니다.

---

## 🔐 보안 모범 사례

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 내비게이션

| 방향 | 장 |
|-----------|---------|
| <strong>이전</strong> | [2장: AI 개발](../chapter-02-ai-development/README.md) |
| <strong>다음</strong> | [4장: 인프라](../chapter-04-infrastructure/README.md) |

---

## 📖 관련 자료

- [배포 전 점검](../chapter-06-pre-deployment/README.md)
- [문제 해결](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
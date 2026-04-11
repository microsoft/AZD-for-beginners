# 3장: 구성 및 인증

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 45-60분 | **⭐ Complexity**: 중급

---

## 개요

이 장에서는 Azure Developer CLI 배포를 위한 환경 구성, 인증 패턴 및 보안 모범 사례를 다룹니다.

> 2026년 3월에 `azd 1.23.12`로 검증됨.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- AZD 구성 계층을 숙달합니다
- 여러 환경(dev, staging, prod)을 관리합니다
- 관리형 ID로 안전한 인증을 구현합니다
- 환경별 설정을 구성합니다

---

## 📚 강의

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | 환경 설정 및 관리 | 30분 |
| 2 | [Authentication & Security](authsecurity.md) | 관리형 ID 및 RBAC 패턴 | 30분 |

---

## 🚀 Quick Start

```bash
# 여러 환경 생성
azd env new dev
azd env new staging
azd env new prod

# 환경 전환
azd env select prod

# 환경 변수 설정
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# 구성 보기
azd env get-values
```

---

## 🔧 구성 계층

AZD는 다음 순서로 설정을 적용합니다(나중 항목이 이전 항목을 재정의함):

1. <strong>기본값</strong> (템플릿에 내장됨)
2. **azure.yaml** (프로젝트 구성)
3. **환경 변수** (`azd env set`)
4. **명령줄 플래그** (`--location eastus`)

---

## 🔐 보안 모범 사례

```bash
# 관리형 ID 사용(권장)
azd env set AZURE_USE_MANAGED_IDENTITY true

# AZD 인증 상태 확인
azd auth status

# 선택 사항: az 명령을 실행할 계획이라면 Azure CLI 컨텍스트를 확인하세요
az account show

# 필요한 경우 재인증하세요
azd auth login

# 선택 사항: az 명령을 위해 Azure CLI 인증을 갱신하세요
az login
```

---

## 🔗 탐색

| 방향 | 챕터 |
|-----------|---------|
| <strong>이전</strong> | [2장: AI 개발](../chapter-02-ai-development/README.md) |
| <strong>다음</strong> | [4장: 인프라](../chapter-04-infrastructure/README.md) |

---

## 📖 관련 자료

- [사전 배포 점검](../chapter-06-pre-deployment/README.md)
- [문제 해결](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 고지**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원어로 된 원문 문서를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 오역에 대해서는 당사가 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
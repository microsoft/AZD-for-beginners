# 3장: 구성 및 인증

**📚 과정**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 45-60분 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 Azure Developer CLI 배포를 위한 환경 구성, 인증 패턴 및 보안 모범 사례를 다룹니다.

## 학습 목표

이 장을 완료하면 다음을 수행할 수 있습니다:
- AZD 구성 계층 구조 숙달
- 여러 환경(dev, staging, prod) 관리
- 관리 ID를 사용한 안전한 인증 구현
- 환경별 설정 구성

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | 환경 설정 및 관리 | 30분 |
| 2 | [Authentication & Security](authsecurity.md) | 관리 ID 및 RBAC 패턴 | 30분 |

---

## 🚀 빠른 시작

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

AZD는 다음 순서로 설정을 적용합니다(나중 것이 이전 것을 재정의함):

1. **기본값** (템플릿에 내장됨)
2. **azure.yaml** (프로젝트 구성)
3. **환경 변수** (`azd env set`)
4. **명령줄 플래그** (`--location eastus`)

---

## 🔐 보안 모범 사례

```bash
# 관리되는 ID 사용(권장)
azd env set AZURE_USE_MANAGED_IDENTITY true

# 인증 상태 확인
azd auth whoami
az account show

# 필요한 경우 재인증
azd auth login
az login
```

---

## 🔗 탐색

| Direction | Chapter |
|-----------|---------|
| **이전** | [2장: AI 개발](../chapter-02-ai-development/README.md) |
| **다음** | [4장: 인프라](../chapter-04-infrastructure/README.md) |

---

## 📖 관련 자료

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 고지:
본 문서는 AI 번역 서비스 Co-op Translator(https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나 자동 번역에는 오류나 부정확성이 포함될 수 있음을 양지해 주십시오. 원문은 해당 문서의 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우에는 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생한 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
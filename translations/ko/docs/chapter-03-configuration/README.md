# Chapter 3: 구성 및 인증

**📚 강좌**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 45-60분 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 Azure Developer CLI 배포를 위한 환경 구성, 인증 패턴 및 보안 모범 사례를 다룹니다.

> 2026년 6월 `azd 1.25.6`에서 검증되었습니다.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- AZD 구성 계층 마스터하기
- 여러 환경(개발, 스테이징, 운영) 관리하기
- 관리형 ID를 사용한 안전한 인증 구현하기
- 환경별 설정 구성하기

---

## 📚 강의

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [구성 가이드](configuration.md) | 환경 설정 및 관리 | 30분 |
| 2 | [인증 및 보안](authsecurity.md) | 관리형 ID 및 RBAC 패턴 | 30분 |

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

AZD는 이 순서로 설정을 적용합니다(나중이 먼저 것을 덮어씀):

1. <strong>기본값</strong> (템플릿에 내장됨)
2. **azure.yaml** (프로젝트 구성)
3. **환경 변수** (`azd env set`)
4. **명령줄 플래그** (`--location eastus`)

---

## 🔐 보안 모범 사례

```bash
# 관리 ID 사용 (권장)
azd env set AZURE_USE_MANAGED_IDENTITY true

# AZD 인증 상태 확인
azd auth status

# 선택 사항: az 명령어를 실행할 계획이라면 Azure CLI 컨텍스트 확인
az account show

# 필요 시 재인증
azd auth login

# 선택 사항: az 명령어를 위한 Azure CLI 인증 갱신
az login
```

---

## 🔗 이동

| 방향 | 장 |
|-----------|---------|
| <strong>이전</strong> | [Chapter 2: AI 개발](../chapter-02-ai-development/README.md) |
| <strong>다음</strong> | [Chapter 4: 인프라](../chapter-04-infrastructure/README.md) |

---

## 📖 관련 자료

- [배포 전 점검](../chapter-06-pre-deployment/README.md)
- [문제 해결](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
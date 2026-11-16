# 7장: 문제 해결 및 디버깅

**📚 강좌**: [AZD 초보자용](../../README.md) | **⏱️ 소요 시간**: 1-1.5시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 Azure Developer CLI 사용 시 자주 발생하는 문제를 진단하고 해결하는 방법을 안내합니다. 배포 실패부터 AI 관련 문제까지 다룹니다.

> 명령어 가이드는 출시된 `azd 1.37.2` 참고 문서와 대조하여 검토되었습니다. 클라우드 배포는 실행되지 않았습니다. 명령어 사용 전에 예제 리소스 이름과 ID를 교체하세요.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- 일반적인 AZD 배포 실패 진단
- 인증 및 권한 문제 디버깅
- AI 서비스 연결 문제 해결
- 문제 해결을 위한 Azure 포털 및 CLI 사용

---

## 📚 강의 목록

| 번호 | 강의 | 설명 | 소요 시간 |
|---|--------|-------------|------|
| 1 | [일반 문제](common-issues.md) | 자주 발생하는 문제 | 30분 |
| 2 | [디버깅 가이드](debugging.md) | 단계별 디버깅 전략 | 45분 |
| 3 | [AI 문제 해결](ai-troubleshooting.md) | AI 관련 문제 | 30분 |

---

## 🚨 빠른 해결책

### 인증 문제
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### 프로비저닝 실패
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### 리소스 충돌
기존 리소스 및 배포 오류를 먼저 확인하세요. 이름 충돌 문제를 해결하기 위해 공유 또는 프로덕션 환경을 삭제하지 마세요. <strong>새로 생성하는 일회성 환경</strong>에는 고유한 이름을 사용하세요:

```bash
azd env new different-name
azd up
```

### 할당량 초과
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

`AZURE_LOCATION`을 변경해도 기존 리소스가 이동하지 않으며 재배포 시 위치 충돌이 발생할 수 있습니다.

---

## 📋 오류 코드 참조

| 오류 | 원인 | 해결책 |
|-------|-------|----------|
| `AuthenticationError` | 로그인하지 않음 | `azd auth login` |
| `ResourceNotFound` | 리소스 없음 | 리소스 이름 확인 |
| `QuotaExceeded` | 구독 한도 | 할당량 증가 요청 |
| `InvalidTemplate` | Bicep 문법 오류 | `az bicep build` |
| `Conflict` | 리소스 존재 | 새 이름 사용 또는 삭제 |
| `Forbidden` | 권한 부족 | RBAC 역할 확인 |

---

## 🔄 초기화 및 복구

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

하드 리셋은 데이터를 삭제하며 엔드포인트가 변경될 수 있습니다. 먼저 백업하고 대화형 삭제 메시지를 확인하세요. `--force --purge`은 되돌릴 수 없는 삭제가 목적일 때 일회성 환경에만 사용하세요.

---

## 🔗 탐색

| 방향 | 챕터 |
|-----------|---------|
| <strong>이전</strong> | [6장: 사전 배포](../chapter-06-pre-deployment/README.md) |
| <strong>다음</strong> | [8장: 프로덕션](../chapter-08-production/README.md) |

---

## 📖 관련 자료

- [사전 배포 점검](../chapter-06-pre-deployment/preflight-checks.md)
- [구성 가이드](../chapter-03-configuration/configuration.md)
- [AZD GitHub 이슈](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
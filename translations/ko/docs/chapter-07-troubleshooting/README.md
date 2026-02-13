# 챕터 7: 문제 해결 및 디버깅

**📚 강좌**: [AZD 초보자용](../../README.md) | **⏱️ 소요 시간**: 1-1.5시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 Azure Developer CLI를 사용할 때 발생하는 일반적인 문제를 진단하고 해결하는 데 도움을 줍니다. 배포 실패부터 AI 관련 문제까지 다룹니다.

## 학습 목표

이 장을 완료하면 다음을 수행할 수 있습니다:
- 일반적인 AZD 배포 실패 진단
- 인증 및 권한 문제 디버깅
- AI 서비스 연결 문제 해결
- 문제 해결을 위한 Azure 포털 및 CLI 사용

---

## 📚 강의

| # | 강의 | 설명 | 기간 |
|---|--------|-------------|------|
| 1 | [자주 발생하는 문제](common-issues.md) | 자주 발생하는 문제 | 30분 |
| 2 | [디버깅 가이드](debugging.md) | 단계별 디버깅 전략 | 45분 |
| 3 | [AI 문제 해결](ai-troubleshooting.md) | AI 관련 문제 | 30분 |

---

## 🚨 빠른 해결책

### 인증 문제
```bash
azd auth login
az login
azd auth whoami
```

### 프로비저닝 실패
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### 리소스 충돌
```bash
azd down --force --purge
azd env new different-name
azd up
```

### 할당량 초과
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 오류 코드 참조

| 오류 | 원인 | 해결 방법 |
|-------|-------|----------|
| `AuthenticationError` | 로그인되어 있지 않음 | `azd auth login` |
| `ResourceNotFound` | 리소스 없음 | 리소스 이름을 확인하세요 |
| `QuotaExceeded` | 구독 한도 초과 | 할당량 증액 요청 |
| `InvalidTemplate` | Bicep 구문 오류 | `az bicep build` |
| `Conflict` | 리소스가 이미 존재함 | 새 이름 사용 또는 삭제 |
| `Forbidden` | 권한 부족 | RBAC 역할을 확인하세요 |

---

## 🔄 재설정 및 복구

```bash
# 소프트 리셋(리소스 유지, 코드 재배포)
azd deploy --force

# 하드 리셋(모든 것을 삭제하고 새로 시작)
azd down --force --purge
azd up
```

---

## 🔗 탐색

| 방향 | 챕터 |
|-----------|---------|
| **이전** | [챕터 6: 사전 배포](../chapter-06-pre-deployment/README.md) |
| **다음** | [챕터 8: 프로덕션](../chapter-08-production/README.md) |

---

## 📖 관련 자료

- [사전 배포 점검](../chapter-06-pre-deployment/preflight-checks.md)
- [구성 가이드](../chapter-03-configuration/configuration.md)
- [AZD GitHub 이슈](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 조항:
이 문서는 AI 번역 서비스인 Co-op Translator (https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 포함될 수 있음을 알려드립니다. 원문(원어) 문서를 권위 있는 출처로 간주하시기 바랍니다. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
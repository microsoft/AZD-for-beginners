# 1장: 기초 및 빠른 시작

**📚 코스**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 첫 배포 포함 75-120분; 추가 연습은 더 오래 걸릴 수 있음 | **⭐ 난이도**: 초급

---

## 개요

이 장에서는 Azure Developer CLI(azd)의 기본을 소개합니다. 핵심 개념을 배우고 도구를 설치한 후 첫 애플리케이션을 Azure에 배포합니다.

> 명령어 및 구성 검토 대상: `azd 1.37.2` (2026년 11월). 검토 중 라이브 Azure 프로비저닝은 실행되지 않았습니다.

## 학습 목표

이 장을 완료하면 다음을 수행할 수 있습니다:
- Azure Developer CLI가 무엇이며 Azure CLI와 어떻게 다른지 이해하기
- 플랫폼에 AZD 설치 및 구성하기
- `azd up`로 Azure에 첫 애플리케이션 배포하기
- `azd down`로 리소스 정리하기

---

## 📚 강의

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [AZD 기초](azd-basics.md) | 핵심 개념, 용어 및 프로젝트 구조 | 15분 |
| 2 | [설치 및 설정](installation.md) | 플랫폼별 설치 가이드 | 10분 |
| 3 | [첫 번째 프로젝트](first-project.md) | 실습: 웹 앱을 Azure에 배포 | 20분 |
| 4 | [기존 앱 가져오기](bring-your-own-app.md) | 이미 보유한 프로젝트에 azd 추가하기 | 15분 |
| 5 | [개발 컨테이너 & 코드스페이스](dev-containers.md) | 개발 컨테이너로 재현 가능한 azd 환경 만들기 | 15분 |

---

## ✅ 시작하기: 설정 검증

시작하기 전에 로컬 머신이 1장 템플릿 준비가 되었는지 확인하세요:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

스크립트에서 누락된 도구가 보고되면 먼저 해결한 후 장을 계속 진행하세요.

---

## 🚀 빠른 시작

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ 성공 기준

이 장을 완료하면 다음을 수행할 수 있어야 합니다:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 탐색

| 방향 | 장 |
|-----------|---------|
| <strong>다음</strong> | [2장: AI 우선 개발](../chapter-02-ai-development/README.md) |
| <strong>건너뛰기</strong> | [3장: 구성](../chapter-03-configuration/README.md) |

---

## 📖 관련 자료

- [명령어 요약](../../resources/cheat-sheet.md)
- [자주 묻는 질문](../../resources/faq.md)
- [용어집](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Chapter 1: 기초 및 빠른 시작

**📚 과정**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 30-45 분 | **⭐ 난이도**: 초급

---

## 개요

이 장에서는 Azure Developer CLI(azd)의 기본 사항을 소개합니다. 핵심 개념을 배우고, 도구를 설치하며, 첫 번째 애플리케이션을 Azure에 배포하는 방법을 익힙니다.

> 2026년 6월에 `azd 1.25.6` 버전으로 검증됨.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI가 무엇이고 Azure CLI와 어떻게 다른지 이해하기
- 플랫폼에 AZD 설치 및 구성하기
- `azd up` 명령어로 첫 번째 애플리케이션을 Azure에 배포하기
- `azd down` 명령어로 리소스를 정리하기

---

## 📚 강의

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [AZD 기본](azd-basics.md) | 핵심 개념, 용어, 프로젝트 구조 | 15 분 |
| 2 | [설치 및 설정](installation.md) | 플랫폼별 설치 가이드 | 10 분 |
| 3 | [첫 번째 프로젝트](first-project.md) | 실습: 웹 앱을 Azure에 배포 | 20 분 |
| 4 | [기존 앱 가져오기](bring-your-own-app.md) | 이미 보유한 프로젝트에 azd 추가 | 15 분 |
| 5 | [개발 컨테이너 및 코드스페이스](dev-containers.md) | 개발 컨테이너로 재현 가능한 azd 환경 구성 | 15 분 |

---

## ✅ 여기서 시작: 환경 확인

시작하기 전에 로컬 머신이 1장 템플릿을 실행할 준비가 되었는지 확인하세요:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

스크립트가 누락된 도구를 보고하면 먼저 해당 도구를 설치한 후 계속 진행하세요.

---

## 🚀 빠른 시작

```bash
# 설치 확인
azd version

# AZD 인증
# 선택 사항: Azure CLI 명령을 직접 실행할 계획이라면 az 로그인
azd auth login

# 첫 번째 앱 배포
azd init --template todo-nodejs-mongo
azd up

# 완료 후 정리
azd down --force --purge
```

---

## ✅ 성공 기준

이 장을 완료한 후 다음을 수행할 수 있어야 합니다:

```bash
azd version              # 설치된 버전을 보여줍니다
azd init --template todo-nodejs-mongo  # 프로젝트를 초기화합니다
azd up                   # Azure에 배포합니다
azd show                 # 실행 중인 앱 URL을 표시합니다
azd down --force --purge # 리소스를 정리합니다
```

---

## 🔗 이동

| 방향 | 장 |
|-----------|---------|
| <strong>다음</strong> | [2장: AI 우선 개발](../chapter-02-ai-development/README.md) |
| **바로 이동** | [3장: 구성](../chapter-03-configuration/README.md) |

---

## 📖 관련 자료

- [명령어 치트 시트](../../resources/cheat-sheet.md)
- [자주 묻는 질문(FAQ)](../../resources/faq.md)
- [용어집](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
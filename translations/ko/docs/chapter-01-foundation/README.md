# Chapter 1: Foundation & Quick Start

**📚 과정**: [AZD For Beginners](../../README.md) | **⏱️ 소요 시간**: 30-45분 | **⭐ 난이도**: 초급

---

## 개요

이 장에서는 Azure Developer CLI (azd)의 기본을 소개합니다. 핵심 개념을 배우고, 도구를 설치하며, Azure에 첫 애플리케이션을 배포합니다.

> `azd 1.23.12`에 대해 2026년 3월에 검증됨.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI가 무엇이며 Azure CLI와 어떻게 다른지 이해합니다
- 사용 중인 플랫폼에 AZD를 설치하고 구성합니다
- `azd up`으로 Azure에 첫 애플리케이션을 배포합니다
- `azd down`으로 리소스를 정리합니다

---

## 📚 수업

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD 기초](azd-basics.md) | 핵심 개념, 용어 및 프로젝트 구조 | 15분 |
| 2 | [설치 및 설정](installation.md) | 플랫폼별 설치 가이드 | 10분 |
| 3 | [첫 번째 프로젝트](first-project.md) | 실습: 웹 앱을 Azure에 배포 | 20분 |

---

## ✅ 시작하기: 환경 확인

시작하기 전에 로컬 머신이 Chapter 1 템플릿에 대해 준비되어 있는지 확인하세요:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

스크립트가 누락된 도구를 보고하면 먼저 해당 도구를 설치한 후 장을 계속 진행하세요.

---

## 🚀 빠른 시작

```bash
# 설치 확인
azd version

# AZD 인증
# 선택 사항: Azure CLI 명령을 직접 실행할 계획이라면 az login을 실행하세요
azd auth login

# 첫 번째 앱 배포
azd init --template todo-nodejs-mongo
azd up

# 완료 후 정리
azd down --force --purge
```

---

## ✅ 성공 기준

이 장을 완료한 후에는 다음을 수행할 수 있어야 합니다:

```bash
azd version              # 설치된 버전을 표시합니다
azd init --template todo-nodejs-mongo  # 프로젝트를 초기화합니다
azd up                   # Azure에 배포합니다
azd show                 # 실행 중인 앱의 URL을 표시합니다
azd down --force --purge # 리소스를 정리합니다
```

---

## 🔗 탐색

| Direction | Chapter |
|-----------|---------|
| **Next** | [챕터 2: AI 우선 개발](../chapter-02-ai-development/README.md) |
| **Skip to** | [챕터 3: 구성](../chapter-03-configuration/README.md) |

---

## 📖 관련 자료

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossary](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만 자동 번역에는 오류나 부정확성이 있을 수 있음을 유의해 주시기 바랍니다. 원래 언어로 된 원문 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 어떠한 오해나 잘못된 해석에 대해서도 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
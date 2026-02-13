# 1장: 기초 및 빠른 시작

**📚 Course**: [초보자를 위한 AZD](../../README.md) | **⏱️ Duration**: 30-45분 | **⭐ Complexity**: 초급

---

## 개요

이 장에서는 Azure Developer CLI (azd)의 기본을 소개합니다. 핵심 개념을 배우고, 도구를 설치하며, 첫 애플리케이션을 Azure에 배포하는 방법을 익힙니다.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI가 무엇인지와 Azure CLI와의 차이점을 이해합니다
- 사용 중인 플랫폼에 AZD를 설치하고 구성합니다
- `azd up`으로 첫 애플리케이션을 Azure에 배포합니다
- `azd down`을 사용해 리소스를 정리합니다

---

## 📚 레슨

| # | 레슨 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [AZD 기초](azd-basics.md) | 핵심 개념, 용어 및 프로젝트 구조 | 15분 |
| 2 | [설치 및 설정](installation.md) | 플랫폼별 설치 가이드 | 10분 |
| 3 | [첫 프로젝트](first-project.md) | 실습: 웹 앱을 Azure에 배포 | 20분 |

---

## 🚀 빠른 시작

```bash
# 설치 확인
azd version

# Azure에 로그인
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
| **다음** | [챕터 2: AI 우선 개발](../chapter-02-ai-development/README.md) |
| **건너뛰기** | [챕터 3: 구성](../chapter-03-configuration/README.md) |

---

## 📖 관련 리소스

- [명령 치트 시트](../../resources/cheat-sheet.md)
- [자주 묻는 질문](../../resources/faq.md)
- [용어집](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원문(원어) 문서를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 당사가 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
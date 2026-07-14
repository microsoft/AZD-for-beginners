# 4장: 코드로서의 인프라 및 배포

**📚 코스**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 1-1.5 시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 Bicep 템플릿을 활용한 코드로서의 인프라(IaC) 패턴, 리소스 프로비저닝, Azure Developer CLI를 활용한 배포 전략을 다룹니다.

> 2026년 7월 `azd 1.27.1` 버전에서 검증됨.

## 학습 목표

이 장을 완료하면 다음을 할 수 있게 됩니다:
- Bicep 템플릿의 구조와 구문 이해
- `azd provision`으로 Azure 리소스 프로비저닝
- `azd deploy`를 통한 애플리케이션 배포
- 블루-그린 및 롤링 배포 전략 구현

---

## 📚 강의

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [리소스 프로비저닝](provisioning.md) | AZD를 이용한 Azure 리소스 관리 | 45분 |
| 2 | [배포 가이드](deployment-guide.md) | 애플리케이션 배포 전략 | 45분 |
| 3 | [자신만의 템플릿 작성](custom-templates.md) | 재사용 가능한 azd 템플릿 빌드 및 배포 | 30분 |

---

## 🚀 빠른 시작

```bash
# 템플릿에서 초기화
azd init --template azure-functions-python-v2-http

# 생성될 내용을 미리보기
azd provision --preview

# 인프라만 프로비저닝
azd provision

# 코드만 배포
azd deploy

# 또는 둘 다 함께
azd up
```

---

## 📁 AZD 프로젝트 구조

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 필수 명령어

| 명령어 | 설명 |
|---------|-------------|
| `azd init` | 프로젝트 초기화 |
| `azd provision` | Azure 리소스 생성 |
| `azd deploy` | 애플리케이션 코드 배포 |
| `azd up` | 프로비저닝 + 배포 |
| `azd down` | 모든 리소스 삭제 |

---

## 🔗 내비게이션

| 방향 | 장 |
|-----------|---------|
| <strong>이전</strong> | [3장: 구성](../chapter-03-configuration/README.md) |
| <strong>다음</strong> | [5장: 다중 에이전트 솔루션](../chapter-05-multi-agent/README.md) |

---

## 📖 관련 자료

- [배포 전 점검](../chapter-06-pre-deployment/README.md)
- [컨테이너 앱 예제](../../examples/container-app/README.md)
- [데이터베이스 앱 예제](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
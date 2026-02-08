# 7. 마무리 및 다음 단계

!!! tip "주요 요점은 다음과 같습니다"

    - [ ] AZD 템플릿은 AI 애플리케이션 개발을 며칠에서 몇 시간으로 가속화합니다
    - [ ] Discovery → Deployment → Customization 방법론은 체계적인 학습 경로를 제공합니다
    - [ ] MCP 서버와 함께 사용하는 GitHub Copilot은 복잡한 코드베이스를 자연어로 탐색할 수 있게 합니다
    - [ ] Microsoft Foundry는 내장된 가시성, 평가 및 보안 테스트를 제공합니다

---

## 1. 달성한 내용

축하합니다! 이번 워크숍에서 다음을 성공적으로 수행했습니다:

| 모듈 | 성과 |
|:---|:---|
| **모듈 1** | Azure Developer CLI를 발견하고 AI 템플릿을 선택함 |
| **모듈 2** | 완전한 AI 에이전트 솔루션을 배포하고 검증함 |
| **모듈 3** | 템플릿을 분해하여 아키텍처를 이해함 |
| **모듈 4** | `azure.yaml` 구성 및 라이프사이클 훅 탐색 |
| **모듈 5** | 자신의 시나리오에 맞게 템플릿을 맞춤화함 |
| **모듈 6** | 인프라를 안전하게 해체하고 리소스를 관리함 |

---

## 2. 익힌 핵심 개념

### Azure Developer CLI (azd)
- `azd init` - 템플릿에서 프로젝트 초기화
- `azd up` - 한 명령어로 프로비저닝 및 배포
- `azd env` - 환경 변수 관리
- `azd down` - 리소스 안전하게 정리

### AZD 템플릿 구조
- `azure.yaml` - 구성 및 배포 훅
- `infra/` - Bicep 인프라 코드
- `src/` - 애플리케이션 소스 코드
- `scripts/` - 자동화 및 설정 스크립트

### Microsoft Foundry 기능
- 지능형 어시스턴트를 위한 AI 에이전트 서비스
- 지식 검색용 파일 검색 및 Azure AI 검색
- 내장 추적, 모니터링 및 평가
- AI 안전성 검증을 위한 레드 팀 활동

---

## 3. 학습 여정 계속 이어가기

### 권장 다음 단계

| 경로 | 리소스 | 소요 시간 |
|:---|:---|:---|
| **코스 완료하기** | [AZD for Beginners Curriculum](../../README.md) | 8-12시간 |
| **다른 템플릿 시도하기** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2시간 |
| **심층 학습** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | 지속적 |
| **커뮤니티 참여** | [Azure Discord](https://aka.ms/foundry/discord) | 지금 가입하세요! |

### 다음에 시도해볼 추천 템플릿

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - 데이터로 기본 챗봇 만들기
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - 고급 RAG 패턴
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - 엔터프라이즈 소매 시나리오

---

## 4. 워크숍 챌린지

실력을 테스트해 볼 준비가 되셨나요? 다음 챌린지를 시도해보세요:

| 챌린지 | 설명 | 난이도 |
|:---|:---|:---|
| **1. 다중 에이전트 시나리오** | 다른 산업 (예: 의료, 금융)에 맞게 배포 및 커스터마이즈 | ⭐⭐ |
| **2. 맞춤 지식 베이스** | 자신만의 데이터 파일 추가 및 맞춤 검색 인덱스 생성 | ⭐⭐⭐ |
| **3. 프로덕션 배포** | `azd pipeline config`를 사용해 GitHub Actions로 CI/CD 설정 | ⭐⭐⭐⭐ |

---

## 5. 피드백 공유

여러분의 피드백은 이 워크숍 개선에 큰 도움이 됩니다!

- **GitHub 이슈**: [피드백 게시](https://github.com/microsoft/azd-for-beginners/issues) - `Workshop` 태그 사용
- **Discord**: [Microsoft Foundry Discord](https://aka.ms/foundry/discord) 가입 후 `#get-help` 채널에 글 남기기
- **기여하기**: 풀 리퀘스트로 워크숍 개선에 참여하세요!

---

## 감사합니다! 🎉

AZD for AI Developers 워크숍을 완료해 주셔서 감사합니다. 이 경험이 Azure에서 AI 애플리케이션을 구축하고 배포하는 데 필요한 기술과 자신감을 제공했기를 바랍니다.

**계속해서 구축하고, 계속해서 학습하며, Azure AI 개발자 커뮤니티에 오신 것을 환영합니다!**

---

| | |
|:---|:---|
| **📚 코스 홈** | [AZD For Beginners](../../README.md) |
| **📖 문서** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI 템플릿** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 커뮤니티** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원문은 해당 언어의 원본 문서를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
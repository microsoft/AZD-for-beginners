# 변경 로그 - AZD 초보자를 위한

## 소개

이 변경 로그는 AZD 초보자를 위한 저장소의 모든 중요한 변경 사항, 업데이트 및 개선 사항을 문서화합니다. 우리는 의미적 버전 관리 원칙을 따르며 사용자가 버전 간 변경 사항을 이해할 수 있도록 이 로그를 유지합니다.

## 학습 목표

이 변경 로그를 검토함으로써, 여러분은:
- 새로운 기능 및 콘텐츠 추가 사항에 대해 정보를 유지할 수 있습니다
- 기존 문서의 개선 사항을 이해할 수 있습니다
- 버그 수정 및 정확성 보정을 추적할 수 있습니다
- 학습 자료의 진화를 시간에 따라 따라갈 수 있습니다

## 학습 성과

변경 로그 항목을 검토한 후, 여러분은 다음을 할 수 있습니다:
- 학습 가능한 새로운 콘텐츠와 리소스를 식별할 수 있습니다
- 어떤 섹션이 업데이트되었거나 개선되었는지 이해할 수 있습니다
- 최신 자료를 기반으로 학습 경로를 계획할 수 있습니다
- 향후 개선을 위한 피드백 및 제안을 제공할 수 있습니다

## 버전 기록

### [v3.22.0] - 2026-06-16

#### 초보자 간격 메우기 #2: 템플릿 저작, 개발 컨테이너, Pulumi, Azure DevOps, 서비스 프린시플 등
**이번 버전은 azd-coverage 분석에서 나타난 나머지 중급 간격을 해소합니다: 자체 템플릿을 작성하고 게시하는 방법, 재현 가능한 개발 컨테이너/Codespaces 환경, Pulumi 인프라 제공자, Azure DevOps CI/CD 워크스루, 서비스 프린시플 인증, 호스트 선택 가이드(AKS/Spring Apps), `azd restore`/`azd package` 설명, 훅 오류 처리, 팀/공유 환경 실습 등입니다.**

#### 추가됨
- **🧱 새로운 4장 강의** `docs/chapter-04-infrastructure/custom-templates.md` — 자체 azd 템플릿 작성법: 필수 구조(`azure.yaml`, `infra/`, `src/`), `metadata.template` 필드, `uniqueString()` 리소스 토큰과 `azd-env-name` 태그를 통한 인프라 매개변수화, `azd init --template <local-path>` 로 로컬 테스트, GitHub에 게시, Awesome AZD 갤러리에 제출
- **📦 새로운 1장 강의** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers와 GitHub Codespaces를 활용한 재현 가능한 azd 환경: 공식 `ghcr.io/azure/azure-dev/azd` 기능을 사용하는 최소 `.devcontainer/devcontainer.json`, 언어별 기능, 컨테이너 호스트용 `docker-in-docker`, 원격 로그인용 `azd auth login --use-device-code`
- **🧩 Pulumi with azd** 섹션 `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi 폴더 구조, 스택과 azd 환경 매핑, 필수 출력/태깅, 동일한 `azd up` / `azd down` 워크플로우
- **🎯 호스트 선택 가이드라인** `docs/chapter-04-infrastructure/provisioning.md` — 초보자 친화적 비교: `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, `springapp`, AKS 또는 Azure Spring Apps 선택 시기 안내
- **🛠️ Azure DevOps CI/CD 워크스루** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, 작업 부하 아이덴티티 페더레이션(OIDC)을 이용한 서비스 연결, 생성된 `azure-dev.yml`, 변수 그룹 설정
- **🔑 서비스 프린시플(패턴 4)** `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, 클라이언트 비밀과 페더레이티드/OIDC 자격증명 기반 비대화형 `azd auth login` 사용법, 사용 시기 및 안전한 자격증명 저장 방법
- **🪝 훅 오류 처리** `docs/chapter-04-infrastructure/deployment-guide.md`의 하위 섹션 — 종료 코드, `set -e`, `continueOnError`, `azd hooks run`으로 훅 단독 테스트, OS별 쉘, `--debug`
- **👥 팀/공유 환경** `docs/chapter-03-configuration/configuration.md` — `.azure/` 내 저장 항목, Git 무시 설정, 개발자별 환경, `azd env list`/`select`, CI/CD에서 환경 값 제공
- **🧰 `azd restore` 및 확장된 `azd package`** 설명 `resources/cheat-sheet.md` — 의존성 복원 및 배포 가능 아티팩트 빌드(배포 미포함)

#### 변경됨
- <strong>🧭 4장 강의 표</strong>에 새로운 "자체 템플릿 작성" 강의(강의 3) 추가
- <strong>🧭 1장 강의 표</strong>에 새로운 "Dev Containers & Codespaces" 강의(강의 5) 추가; `bring-your-own-app.md`와 `dev-containers.md` 간 내비게이션 푸터 연결

### [v3.21.0] - 2026-06-16

#### 초보자 간격 메우기: 실습 다중 에이전트 강의, "Bring Your Own App", Terraform, CI/CD 워크스루
**이번 버전은 두 개의 실습 강의(배포 가능한 다중 에이전트 워크스루와 기존 앱에 azd 추가), 초보자용 훅 소개, Terraform with azd 섹션, 단계별 GitHub Actions 파이프라인 워크스루, 새 미리보기 확장에 대한 설명, 명시적 배포 검증 체크리스트를 추가하여 완전한 초보자 안내서의 가장 큰 간격을 해소합니다.**

#### 추가됨
- **🤝 새로운 5장 강의** `docs/chapter-05-multi-agent/multi-agent-basics.md` — 실제 템플릿(`contoso-creative-writer`)을 사용한 완전 실습형 두 에이전트 워크스루(오케스트레이터 + 전문가), 다중 에이전트 사용 시기, `azd up` 워크플로우, 배포된 리소스 이해, 에이전트 간 추적, 사용자 정의, 정리
- **📦 새로운 1장 강의** `docs/chapter-01-foundation/bring-your-own-app.md` — 기존 프로젝트에 `azd init` ("현재 디렉터리 코드 사용")로 azd 추가하기, `azure.yaml`과 `infra/` 이해, `azd infra generate`, 호스트 감지, `azd up`으로 배포
- **🌐 Terraform with azd** 섹션 `docs/chapter-04-infrastructure/provisioning.md` 추가 — `infra.provider: terraform` 구성, `.tf` 폴더 구조, 필요한 `AZURE_*` 출력 및 `azd-env-name` 태그, 동일한 `azd up` / `azd down` 워크플로우(Terraform 지원이 명시됐지만 Bicep만 소개되던 간격 해결)
- **⚙️ 단계별 GitHub Actions 워크스루** `docs/chapter-08-production/production-ai-practices.md` — GitHub 저장소부터 자동 배포까지: `azd pipeline config`, OIDC 페더레이티드 자격증명(비밀 저장 없음), 생성된 `azure-dev.yml`, 비밀과 변수 안내
- **🪝 초보자용 "훅이 처음이라면?" 소개** `docs/chapter-04-infrastructure/deployment-guide.md` — 훅 정의, 훅 단계 표, 최소 훅 예제, `azd hooks run`으로 수동 실행
- **✅ "배포 확인" 체크리스트** `docs/chapter-01-foundation/first-project.md` 단계 5에 추가 — 스모크 테스트, 헬스 엔드포인트 확인, 명시적 성공 기준
- **🧩 새 미리보기 확장 설명** `azure.ai.skills` 및 `azure.ai.connections`(역할 및 사용 시기) `docs/chapter-08-production/production-ai-practices.md`

#### 변경됨
- **🧭 5장 강의 표 수정**: `multi-agent-basics.md`는 이제 1강(유일한 완전 실습 강의), 2강은 6장, Retail 시나리오는 아키텍처 설계도이며 단일 명령 템플릿 아님
- <strong>🧭 1장 강의 표</strong>에 새로운 "Bring Your Own App" 강의(4강) 포함
- **🔗 내비게이션 푸터** 업데이트: `first-project.md`에서 앞으로 `bring-your-own-app.md`로 링크 연결

#### 수정됨
- **🧱 "명시됐지만 누락된" Terraform 간격 해소** — 이전에 Terraform 지원을 언급만 하고 보여주지 않음
- **🔀 오해 소지가 있던 5장 교차 링크 수정** — 전체 다중 에이전트 구현 대신 아키텍처 설계도로 오해될 소지 제거

#### 업데이트된 파일
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(새 파일)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(새 파일)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 업데이트, 전체 에이전트 수명 주기 명령 및 Aspire 리브랜딩
**이 버전은 `azd` `1.25.6`(2026년 6월)과 `azure.ai.agents` `0.1.40-preview` 확장에 대해 강의를 재검증하며, "에이전트 스캐폴딩"에서 전체 에이전트 수명 주기(테스트 → 평가 → 최적화 → 점검 → 삭제)로 AI 지침을 확장하고, 새 `azure.ai.skills`와 `azure.ai.connections` 미리보기 확장을 표면화하며, “.NET Aspire”에서 “Aspire”로 제품명을 리브랜딩한 것을 알립니다.**

#### 추가됨
- **🔁 초보자 및 AI 엔지니어를 위한 전체 에이전트 수명 주기 적용**:
  - `docs/chapter-01-foundation/azd-basics.md` — 확장 및 AI 명령 섹션에 수명 주기 표 추가(스캐폴딩 → 테스트 → 측정 → 개선 → 점검 → 정리)
  - `docs/chapter-08-production/production-ai-practices.md` — 새로운 "에이전트 수명 주기 관리" 섹션(명령: `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, `delete --force`)
  - `resources/cheat-sheet.md` — 확장된 AI 에이전트 명령 목록(위 명령들 포함)
- **🧩 새 미리보기 확장 문서화**: `azure.ai.skills`(재사용 가능한 에이전트 능력), `azure.ai.connections`(Foundry 연결) 확장 표 및 치트 시트에 추가
- **⏱️ 응답 시간 안내** — `azd ai agent invoke` 명령 예시가 총 지연 시간과 첫 바이트 시간 표시를 포함
- **📌 버전 배너** — 루트 README에 `azd version`과 `azd upgrade` 안내 배너 추가

#### 변경됨
- **✅ 검증 기준선 업데이트**: 모든 장별 README 및 워크숍 문서에서 `azd 1.23.12`(2026년 3월)에서 `azd 1.25.6`(2026년 6월)으로 갱신
- **🤖 2장 확장 노트 업데이트**: `azure.ai.agents` `0.1.18-preview` 에서 `0.1.40-preview`로 변경
- **🧪 워크숍 검증 예시**(`azd version` 출력) `1.25.6`로 업데이트
- **🧭 README "오늘의 azd 업데이트"** — 전체 에이전트 수명 주기, 새 AI 확장, 최근 편의성 개선사항 강조(`azd init` 멱등성, `azd auth login` 오래된 토큰 삭제, `azd tool` 첫 실행 프롬프트)
- **📖 2장 agents.md(옵션 4)** — 배포 후 수명 주기 명령 안내로 업데이트, `azd up`에서 중단 안 함

#### 수정됨
- **🏷️ 제품명 변경 알림** — Aspire 리브랜딩 주석 추가(".NET Aspire"에서 단순히 "Aspire"로; azd의 Aspire 지원은 변동 없음)
- **🔎 실제 릴리스 검증 완료** — Azure Developer CLI 릴리스 피드 기준: 안정 CLI `1.25.6`(2026-06-12), `azure.ai.agents` `0.1.40-preview`(2026-06-15)

#### 업데이트된 파일
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### 초보자 온보딩 명확화, 설정 검증 및 최종 AZD 명령 정리
**이 버전은 AZD 1.23 검증 작업을 이어 초보자 중심 문서 작업을 진행했습니다: AZD 우선 인증 가이드를 명확히 하고, 로컬 설정 검증 스크립트를 추가하며, 주요 명령을 라이브 AZD CLI와 비교 검증하고, 변경 로그 외부에 남아 있던 구식 영어 명령 참조를 제거했습니다.**

#### 추가됨
- **🧪 초보자 설정 검증 스크립트** `validate-setup.ps1` 및 `validate-setup.sh`로, 학습자가 1장 시작 전에 필수 도구를 확인할 수 있도록 함
- **✅ 기본 설정 검증 단계** 루트 README 및 1장 README에 추가되어 `azd up` 전에 누락된 필수 조건을 잡아냄

#### 변경됨
- **🔐 초보자 인증 가이드** 이제 AZD 워크플로우에서 `azd auth login`을 기본 경로로 일관되게 안내하며, Azure CLI 명령 직접 사용 시에만 선택적으로 `az login`을 언급
- **📚 1장 온보딩 흐름** 설치, 인증 및 첫 배포 단계 전에 학습자가 로컬 설정을 검증하도록 유도
- **🛠️ 검증기 메시지** AZD 전용 초보자 경로에서 차단 요구사항과 선택적 Azure CLI 경고를 명확히 구분하도록 개선
- **📖 설정, 문제 해결 및 예제 문서** 필수 AZD 인증과 선택적 Azure CLI 로그인 구분을 명확히 하여 이전에 맥락 없이 함께 제시된 부분 수정

#### 수정됨
- **📋 남아 있던 영어 소스 명령 참조** 치트 시트의 `azd config show` 및 Azure Portal 개요 안내가 필요한 `azd monitor --overview` 등 최신 AZD 형식으로 수정
- **🧭 1장 초보자 주장** 모든 템플릿과 Azure 리소스에서 보장된 무오류 또는 롤백 동작을 과도하게 약속하지 않도록 완화
- **🔎 라이브 CLI 검증** 현재 `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, `azd down --force --purge` 지원 사항 확인

#### 업데이트된 파일
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 검증, 워크숍 환경 확장 및 AI 모델 갱신
**이 버전은 `azd` `1.23.12`에 대한 문서 검증 작업을 수행하고, 구식 AZD 명령 예제를 업데이트하며, AI 모델 가이드를 최신 기본값으로 갱신하고, 워크숍 설명서를 GitHub Codespaces 외에 개발 컨테이너 및 로컬 클론까지 지원하도록 확장했습니다.**

#### 추가됨
- **✅ 핵심 장과 워크숍 문서 전반에 검증 노트** 추가하여 학습자가 최신 또는 구버전 CLI 빌드를 사용할 때 테스트된 AZD 기준을 명확히 알 수 있도록 함
- **⏱️ AI 앱 장기 배포용 타임아웃 가이드** `azd deploy --timeout 1800` 활용 설명
- **🔎 확장 프로그램 검사 단계** AI 워크플로우 문서에 `azd extension show azure.ai.agents` 포함
- **🌐 확장된 워크숍 환경 안내** GitHub Codespaces, 개발 컨테이너, 로컬 클론 전반에서 MkDocs 문서 지원

#### 변경됨
- **📚 장별 소개 README** 이제 기반, 설정, 인프라, 다중 에이전트, 사전 배포, 문제 해결, 프로덕션 섹션에서 일관되게 `azd 1.23.12` 검증 여부 명시
- **🛠️ AZD 명령 참조** 문서 전반에서 다음과 같이 최신 형태로 업데이트:
  - `azd config list` → `azd config show`
  - `azd env show` → 상황에 따라 `azd env list` 또는 `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights 개요 의도 시 `azd monitor --overview`
- **🧪 프로비저닝 미리보기 예제** 현재 지원되는 `azd provision --preview` 및 `azd provision --preview -e production` 등으로 간소화
- **🧭 워크숍 흐름** 학습자가 Codespaces, 개발 컨테이너 또는 로컬 클론에서 실습을 완료할 수 있도록 업데이트
- **🔐 인증 가이드** AZD 워크플로우에 `azd auth login` 선호, Azure CLI 직접 명령 사용 시에만 `az login` 선택적 위치로 변경

#### 수정됨
- **🪟 Windows 설치 명령** 설치 가이드에서 현재 `winget` 패키지명 대소문자 표준화
- **🐧 Linux 설치 가이드** 지원하지 않는 배포판별 `azd` 패키지 관리자 지침 제거 및 적절한 릴리스 자산 안내로 수정
- **📦 AI 모델 예제** `gpt-35-turbo`, `text-embedding-ada-002` 등 기존 기본값을 `gpt-4.1-mini`, `gpt-4.1`, `text-embedding-3-large` 등 최신 예제로 교체
- **📋 배포 및 진단 스니펫** 로그, 스크립트, 문제 해결 단계에서 현재 환경 및 상태 명령어 사용으로 수정
- **⚙️ GitHub Actions 가이드** `Azure/setup-azd@v1.0.0`에서 `Azure/setup-azd@v2`로 업데이트
- **🤖 MCP/Copilot 동의 가이드** `azd mcp consent`에서 `azd copilot consent list`로 변경

#### 향상됨
- **🧠 AI 장 가이드** 미리보기 민감 `azd ai` 동작, 테넌트별 로그인, 최신 확장 프로그램 사용법, 모델 배포 권장사항을 더 명확히 설명
- **🧪 워크숍 지침** 실제 버전 예제와 명확한 환경 설정 언어로 핸즈온 실습 개선
- **📈 프로덕션 및 문제 해결 문서** 현재 모니터링, 대체 모델, 비용 티어 예제에 더 잘 부합하도록 정렬

#### 업데이트된 파일
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI 명령, 콘텐츠 검증 및 템플릿 확장
**이 버전은 `azd ai`, `azd extension`, `azd mcp` 명령을 AI 관련 모든 장에 추가하고, agents.md 내 손상된 링크와 사용 중단 코드를 수정했으며, 치트 시트를 갱신하고, 검증된 설명과 새 Azure AI AZD 템플릿으로 예제 템플릿 섹션을 개편했습니다.**

#### 추가됨
- **🤖 AZD AI CLI 범위** 7개 파일에 확대 적용 (이전에는 8장에만 있었음):
  - `docs/chapter-01-foundation/azd-basics.md` — 새 "Extensions and AI Commands" 섹션에 `azd extension`, `azd ai agent init`, `azd mcp` 소개
  - `docs/chapter-02-ai-development/agents.md` — 옵션 4: `azd ai agent init` 및 템플릿과 매니페스트 접근법 비교표 포함
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry"와 "Agent-First Deployment" 소제목 추가
  - `docs/chapter-05-multi-agent/README.md` — 빠른 시작에 템플릿 및 매니페스트 기반 배포 경로 모두 표기
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — 배포 부분에 `azd ai agent init` 옵션 포함
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" 소제목 추가
  - `resources/cheat-sheet.md` — "AI & Extensions Commands" 섹션 추가, `azd extension`, `azd ai agent init`, `azd mcp`, `azd infra generate` 포함
- **📦 새 AZD AI 예제 템플릿** `microsoft-foundry-integration.md` 내:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, 음성 채팅 지원 .NET RAG 챗
  - **azure-search-openai-demo-java** — Langchain4J 기반 Java RAG 챗, ACA/AKS 배포 옵션 포함
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, Prompty 사용 다중 에이전트 창작 앱
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB 기반 서버리스 RAG, Ollama 로컬 개발 지원
  - **chat-with-your-data-solution-accelerator** — 관리자 포털, Teams 통합, PostgreSQL/Cosmos DB 옵션 포함 엔터프라이즈 RAG 가속기
  - **azure-ai-travel-agents** — .NET, Python, Java, TypeScript 서버가 포함된 다중 에이전트 MCP 오케스트레이션 참조 앱
  - **azd-ai-starter** — 최소 Azure AI 인프라 Bicep 시작 템플릿
  - **🔗 Awesome AZD AI 갤러리 링크** — [awesome-azd AI 갤러리](https://azure.github.io/awesome-azd/?tags=ai) (80개 이상 템플릿) 참조

#### 수정됨
- **🔗 agents.md 내비게이션**: 이전/다음 링크가 2장 README 수업 순서(마이크로소프트 파운드리 통합 → 에이전트 → AI 모델 배포)에 맞게 조정
- **🔗 agents.md 링크 손상**: `production-ai-practices.md`를 `../chapter-08-production/production-ai-practices.md`로 수정(3곳)
- **📦 agents.md 사용 중단 코드**: `opencensus`에서 `azure-monitor-opentelemetry` + OpenTelemetry SDK로 교체
- **🐛 agents.md 잘못된 API 사용**: `max_tokens`를 `create_agent()`에서 `create_run()`으로 `max_completion_tokens`로 이동
- **🔢 agents.md 토큰 계산**: 대략적인 `len//4` 추정을 `tiktoken.encoding_for_model()`로 대체
- **azure-search-openai-demo**: 서비스 설명을 "Cognitive Search + App Service"에서 "Azure AI Search + Azure Container Apps"로 수정 (2024년 10월 기본 호스트 변경)
- **contoso-chat**: 설명을 실제 저장소 제목과 기술 스택에 맞게 Azure AI Foundry + Prompty 참고로 수정

#### 제거됨
- **ai-document-processing**: 동작하지 않는 템플릿 참조 제거 (저장소가 AZD 템플릿으로 공개 접근 불가)

#### 향상됨
- **📝 agents.md 연습문제**: 연습 1에 예상 출력 및 `azd monitor` 단계 추가; 연습 2에 전체 `FunctionTool` 등록 코드 포함; 연습 3에 애매한 안내를 구체적인 `prepdocs.py` 명령어로 대체
- **📚 agents.md 자료**: 문서 링크를 최신 Azure AI Agent Service 문서 및 빠른 시작으로 업데이트
- **📋 agents.md 다음 단계 표**: 전체 장 커버를 위한 AI 워크숍 랩 링크 추가

#### 업데이트된 파일
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### 강의 탐색 향상
**이 버전은 향상된 표 형식으로 README.md 장 탐색을 개선합니다.**

#### 변경 사항
- **강의 지도 표**: 직접 수업 링크, 예상 소요 시간 및 복잡도 등급 추가로 향상됨
- **폴더 정리**: 중복된 오래된 폴더 제거 (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **링크 검증**: 강의 지도 표의 21개 이상의 내부 링크 모두 확인됨

### [v3.16.0] - 2026-02-05

#### 제품명 업데이트
**이 버전은 현재 Microsoft 브랜드에 맞게 제품 참조를 업데이트합니다.**

#### 변경 사항
- **Microsoft Foundry → Microsoft Foundry**: 비번역 파일 전반에 걸쳐 모든 참조가 업데이트됨
- **Azure AI Agent Service → Foundry Agents**: 현재 브랜드에 맞게 서비스 이름이 업데이트됨

#### 업데이트된 파일
- `README.md` - 메인 강의 랜딩 페이지
- `changelog.md` - 버전 히스토리
- `course-outline.md` - 강의 구조
- `docs/chapter-02-ai-development/agents.md` - AI 에이전트 가이드
- `examples/README.md` - 예제 문서
- `workshop/README.md` - 워크숍 랜딩 페이지
- `workshop/docs/index.md` - 워크숍 인덱스
- `workshop/docs/instructions/*.md` - 모든 워크숍 지침 파일

---

### [v3.15.0] - 2026-02-05

#### 주요 저장소 재구성: 챕터 기반 폴더 이름
**이 버전은 문서를 명확한 탐색을 위해 전용 챕터 폴더로 재구성합니다.**

#### 폴더 이름 변경
기존 폴더들이 챕터 번호가 붙은 폴더로 대체됨:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- 새로 추가됨: `docs/chapter-05-multi-agent/`

#### 파일 이동
| 파일 | 이동 전 | 이동 후 |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| 모든 pre-deployment 파일 | pre-deployment/ | chapter-06-pre-deployment/ |
| 모든 troubleshooting 파일 | troubleshooting/ | chapter-07-troubleshooting/ |

#### 추가됨
- **📚 챕터별 README 파일**: 각 챕터 폴더에 다음을 포함한 README.md 생성:
  - 학습 목표 및 소요 시간
  - 설명이 포함된 수업 표
  - 빠른 시작 명령어
  - 다른 챕터로의 탐색

#### 변경 사항
- **🔗 모든 내부 링크 업데이트**: 78개 이상의 경로가 모든 문서 파일에 걸쳐 업데이트됨
- **🗺️ 메인 README.md**: 새 챕터 구조로 강의 지도 업데이트
- **📝 examples/README.md**: 챕터 폴더에 대한 교차 참조 업데이트

#### 제거됨
- 기존 폴더 구조 (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### 저장소 재구성: 챕터 탐색
**이 버전은 챕터 탐색 README 파일이 추가됨(v3.15.0에서 대체됨).**

---

### [v3.13.0] - 2026-02-05

#### 새로운 AI 에이전트 가이드
**이 버전은 Azure Developer CLI를 사용한 AI 에이전트 배포에 대한 포괄적인 가이드를 추가합니다.**

#### 추가됨
- **🤖 docs/microsoft-foundry/agents.md**: 다음 내용을 포함한 완전한 가이드:
  - AI 에이전트란 무엇이며 챗봇과 어떻게 다른지
  - 세 가지 빠른 시작 에이전트 템플릿 (Foundry Agents, Prompty, RAG)
  - 에이전트 아키텍처 패턴 (단일 에이전트, RAG, 다중 에이전트)
  - 도구 구성 및 사용자 정의
  - 모니터링 및 메트릭 추적
  - 비용 고려 및 최적화
  - 일반적인 문제 해결 시나리오
  - 세 가지 실습 연습과 성공 기준

#### 콘텐츠 구조
- <strong>소개</strong>: 초보자를 위한 에이전트 개념
- **빠른 시작**: `azd init --template get-started-with-ai-agents`로 에이전트 배포
- **아키텍처 패턴**: 에이전트 패턴 시각적 다이어그램
- <strong>구성</strong>: 도구 설정 및 환경 변수
- <strong>모니터링</strong>: Application Insights 통합
- <strong>연습</strong>: 단계별 실습 학습 (각 20~45분)

---

### [v3.12.0] - 2026-02-05

#### 개발 컨테이너 환경 업데이트
**이 버전은 최신 도구와 더 나은 기본값으로 AZD 학습 경험을 위한 개발 컨테이너 구성을 업데이트합니다.**

#### 변경 사항
- **🐳 베이스 이미지**: `python:3.12-bullseye`에서 최신 Debian 안정판 `python:3.12-bookworm`으로 업데이트
- **📛 컨테이너 이름**: 명확성을 위해 "Python 3"에서 "AZD for Beginners"로 변경

#### 추가됨
- **🔧 새로운 개발 컨테이너 기능**:
  - Bicep 지원 활성화된 `azure-cli`
  - AZD 템플릿용 LTS 버전 `node:20`
  - 템플릿 관리를 위한 `github-cli`
  - 컨테이너 앱 배포용 `docker-in-docker`

- **🔌 포트 포워딩**: 일반 개발에 대한 사전 구성된 포트
  - 8000 (MkDocs 미리보기)
  - 3000 (웹 앱)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 새로운 VS Code 확장**:
  - `ms-python.vscode-pylance` - 향상된 Python 인텔리센스
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions 지원
  - `ms-azuretools.vscode-docker` - Docker 지원
  - `ms-azuretools.vscode-bicep` - Bicep 언어 지원
  - `ms-azure-devtools.azure-resource-groups` - Azure 자원 관리
  - `yzhang.markdown-all-in-one` - Markdown 편집
  - `DavidAnson.vscode-markdownlint` - Markdown 린팅
  - `bierner.markdown-mermaid` - Mermaid 다이어그램 지원
  - `redhat.vscode-yaml` - YAML 지원 (azure.yaml용)
  - `eamodio.gitlens` - Git 시각화
  - `mhutchie.git-graph` - Git 히스토리

- **⚙️ VS Code 설정**: Python 인터프리터, 저장 시 포맷, 공백 제거 기본 설정 추가

- **📦 requirements-dev.txt 업데이트**:
  - MkDocs minify 플러그인 추가
  - 코드 품질용 pre-commit 추가
  - Azure SDK 패키지 (azure-identity, azure-mgmt-resource) 추가

#### 수정됨
- **포스트 생성 명령어**: 컨테이너 시작 시 AZD 및 Azure CLI 설치 확인으로 수정됨

---

### [v3.11.0] - 2026-02-05

#### 초보자 친화적 README 개편
**이 버전은 README.md를 초보자가 더 쉽게 사용할 수 있도록 크게 개선하고 AI 개발자를 위한 필수 리소스를 추가합니다.**

#### 추가됨
- **🆚 Azure CLI와 AZD 비교**: 각 도구 사용 시기와 실용적 예제 명확 설명
- **🌟 멋진 AZD 링크**: 커뮤니티 템플릿 갤러리 및 컨트리뷰션 리소스 직접 링크:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200개 이상의 즉시 배포 가능한 템플릿
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - 커뮤니티 기여
- **🎯 빠른 시작 가이드**: 간단한 3단계 시작 섹션 (설치 → 로그인 → 배포)
- **📊 경험 기반 탐색 표**: 개발자 경험에 따른 시작 위치 명확 안내

#### 변경 사항
- **README 구조**: 단계적 공개를 위해 재구성 - 핵심 정보 우선
- **소개 섹션**: 완전 초보자를 위한 “azd up의 마법” 설명 재작성
- **중복 콘텐츠 제거**: 중복된 문제 해결 섹션 삭제
- **문제 해결 명령어**: 유효한 `azd monitor --logs`로 `azd logs` 참조 수정

#### 수정됨
- **🔐 인증 명령어**: `azd auth login` 및 `azd auth logout`을 cheat-sheet.md에 추가
- **잘못된 명령어 참조 제거**: README 문제 해결 섹션에서 남아 있던 `azd logs` 삭제

#### 참고
- <strong>범위</strong>: 메인 README.md 및 resources/cheat-sheet.md에 적용
- **대상 독자**: AZD 초보 개발자를 위해 특별히 개선

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI 명령어 정확도 업데이트
**이 버전은 문서 전반에 존재하지 않는 AZD 명령어를 수정하여 모든 코드 예제가 유효한 Azure Developer CLI 구문을 사용하도록 보장합니다.**

#### 수정됨
- **🔧 존재하지 않는 AZD 명령어 제거**: 무효한 명령어에 대한 포괄적 검사 및 수정:
  - `azd logs` (존재하지 않음) → `azd monitor --logs` 또는 Azure CLI 대체 사용
  - `azd service` 하위 명령어 (존재하지 않음) → `azd show` 및 Azure CLI로 대체
  - `azd infra import/export/validate` (존재하지 않음) → 제거 또는 유효한 대체로 변경
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` 옵션 (없음) → 제거
  - `azd provision --what-if/--rollback` 옵션 (없음) → `--preview`로 변경
  - `azd config validate` (없음) → `azd config list`로 대체
  - `azd info`, `azd history`, `azd metrics` (없음) → 제거

- **📚 명령어 수정과 함께 업데이트된 파일들**:
  - `resources/cheat-sheet.md`: 명령어 참조 대대적 개정
  - `docs/deployment/deployment-guide.md`: 롤백 및 배포 전략 수정
  - `docs/troubleshooting/debugging.md`: 로그 분석 섹션 수정
  - `docs/troubleshooting/common-issues.md`: 문제 해결 명령어 업데이트
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD 디버깅 섹션 수정
  - `docs/getting-started/azd-basics.md`: 모니터링 명령어 수정
  - `docs/getting-started/first-project.md`: 모니터링 및 디버깅 예제 업데이트
  - `docs/getting-started/installation.md`: 도움말 및 버전 예제 수정
  - `docs/pre-deployment/application-insights.md`: 로그 조회 명령어 수정
  - `docs/pre-deployment/coordination-patterns.md`: 에이전트 디버깅 명령어 수정

- **📝 버전 참조 업데이트**:
  - `docs/getting-started/installation.md`: 하드코딩된 `1.5.0` 버전을 일반화된 `1.x.x`로 변경하고 릴리스 링크 추가

#### 변경 사항
- **롤백 전략**: AZD가 네이티브 롤백을 지원하지 않으므로 Git 기반 롤백으로 문서 업데이트
- **로그 보기**: `azd logs` 참조를 `azd monitor --logs`, `azd monitor --live`, Azure CLI 명령어로 대체
- **성능 섹션**: 존재하지 않는 병렬/점진적 배포 옵션 제거 및 유효한 대안 제공

#### 기술 세부사항
- **유효한 AZD 명령어**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **유효한 azd monitor 옵션**: `--live`, `--logs`, `--overview`
- **제거된 기능**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### 참고
- <strong>검증</strong>: 명령어는 Azure Developer CLI v1.23.x에 대해 확인됨

---

### [v3.9.0] - 2026-02-05

#### 워크숍 완료 및 문서 품질 업데이트
**이 버전은 대화형 워크숍 모듈을 완성하고, 모든 깨진 문서 링크를 수정하며, Microsoft AZD를 사용하는 AI 개발자를 위한 전체적인 콘텐츠 품질을 향상합니다.**

#### 추가됨
- **📝 CONTRIBUTING.md**: 새로운 기여 가이드 문서로:
  - 문제 보고 및 변경 제안에 대한 명확한 지침
  - 신규 콘텐츠에 대한 문서화 기준
  - 코드 예제 지침 및 커밋 메시지 규칙
  - 커뮤니티 참여 정보

#### 완료됨
- **🎯 워크숍 모듈 7 (마무리)**: 다음과 함께 완전 완료된 마무리 모듈:
  - 워크숍 성과에 대한 포괄적인 요약
  - AZD, 템플릿 및 Microsoft Foundry를 다루는 주요 개념 섹션
  - 학습 여정 연속성 추천
  - 난이도 평가가 포함된 워크숍 챌린지 연습 문제
  - 커뮤니티 피드백 및 지원 링크

- **📚 워크숍 모듈 3 (분해)**: 다음을 포함한 학습 목표 업데이트:
  - MCP 서버 활성화와 함께 GitHub Copilot 안내
  - AZD 템플릿 폴더 구조 이해
  - 인프라 코드화(Bicep) 구성 패턴
  - 실습 랩 지침

- **🔧 워크숍 모듈 6 (해체)**: 다음과 함께 완료:
  - 리소스 정리 및 비용 관리 목표
  - 안전한 인프라 해체를 위한 `azd down` 사용법
  - 소프트 삭제된 인지 서비스 복구 안내
  - GitHub Copilot 및 Azure Portal 탐색 보너스

#### 수정됨
- **🔗 끊어진 링크 수정**: 15개 이상의 내부 문서 링크 해결:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md 경로 수정
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md 및 production-ai-practices.md 경로 수정
  - `docs/getting-started/first-project.md`: 존재하지 않는 cicd-integration.md를 deployment-guide.md로 교체
  - `examples/retail-scenario.md`: FAQ 및 문제 해결 가이드 경로 수정
  - `examples/container-app/microservices/README.md`: 코스 홈 및 배포 가이드 경로 수정
  - `resources/faq.md` 및 `resources/glossary.md`: AI 장 참조 업데이트
  - `course-outline.md`: 강사 가이드 및 AI 워크숍 랩 참조 수정

- **📅 워크숍 상태 배너**: "공사 중"에서 2026년 2월 날짜의 활성 워크숍 상태로 업데이트

- **🔗 워크숍 네비게이션**: README.md 내 워크숍 네비게이션 중 존재하지 않는 lab-1-azd-basics 폴더로 향하는 깨진 링크 수정

#### 변경됨
- **워크숍 발표**: "공사 중" 경고 제거, 워크숍 완전 완료 및 사용 준비 완료
- **네비게이션 일관성**: 모든 워크숍 모듈 간 올바른 상호 모듈 네비게이션 보장
- **학습 경로 참조**: 올바른 microsoft-foundry 경로를 사용하도록 장 교차 참조 업데이트

#### 검증됨
- ✅ 모든 영어 마크다운 파일의 내부 링크 유효성 확인
- ✅ 워크숍 모듈 0-7 학습 목표 완성
- ✅ 장 및 모듈 간 네비게이션 정상 작동
- ✅ Microsoft AZD를 사용하는 AI 개발자에 적합한 콘텐츠
- ✅ 초보자 친화적 언어 및 구조 유지
- ✅ CONTRIBUTING.md는 커뮤니티 참여자에 대한 명확한 지침 제공

#### 기술 구현
- **링크 유효성 검사**: PowerShell 자동 스크립트로 모든 .md 내부 링크 검증
- **콘텐츠 감사**: 워크숍 완성도 및 초보 적합성 수동 검토
- **네비게이션 시스템**: 일관된 장 및 모듈 네비게이션 패턴 적용

#### 참고
- <strong>범위</strong>: 영문 문서에만 변경 사항 적용
- <strong>번역</strong>: 이번 버전에서는 번역 폴더 미업데이트(자동 번역은 추후 동기화 예정)
- **워크숍 기간**: 완전한 워크숍으로 3-4시간의 실습 학습 제공

---

### [v3.8.0] - 2025-11-19

#### 고급 문서: 모니터링, 보안 및 다중 에이전트 패턴
**이번 버전은 Application Insights 통합, 인증 패턴 및 운영 배포용 다중 에이전트 조정에 관한 포괄적이고 A급 강의를 추가합니다.**

#### 추가됨
- **📊 Application Insights 통합 강의**: `docs/pre-deployment/application-insights.md`에서:
  - AZD 중심 배포 및 자동 프로비저닝
  - Application Insights + Log Analytics 전체 Bicep 템플릿
  - 맞춤 텔레메트리가 적용된 작동 중인 Python 앱 (1,200+ 줄)
  - AI/LLM 모니터링 패턴 (Microsoft Foundry 모델 토큰/비용 추적)
  - 6개 Mermaid 다이어그램 (아키텍처, 분산 추적, 텔레메트리 흐름)
  - 3가지 실습 연습 (알림, 대시보드, AI 모니터링)
  - Kusto 쿼리 예제 및 비용 최적화 전략
  - 실시간 메트릭 스트리밍과 실시간 디버깅
  - 40~50분 학습 시간과 프로덕션 준비된 패턴

- **🔐 인증 및 보안 패턴 강의**: `docs/getting-started/authsecurity.md`에서:
  - 3가지 인증 패턴 (연결 문자열, 키 볼트, 관리 ID)
  - 보안 배포를 위한 완전한 Bicep 인프라 템플릿
  - Azure SDK 통합을 포함한 Node.js 애플리케이션 코드
  - 3가지 완전한 연습 (관리 ID 활성화, 사용자 할당 ID, 키 볼트 회전)
  - 보안 모범 사례 및 RBAC 구성
  - 문제 해결 가이드 및 비용 분석
  - 운영 준비된 비밀번호 없는 인증 패턴

- **🤖 다중 에이전트 조정 패턴 강의**: `docs/pre-deployment/coordination-patterns.md`에서:
  - 5가지 조정 패턴 (순차, 병렬, 계층적, 이벤트 중심, 합의)
  - 완전한 오케스트레이터 서비스 구현 (Python/Flask, 1,500+ 줄)
  - 3가지 전문 에이전트 구현 (연구, 작성자, 편집자)
  - 메시지 큐를 위한 서비스 버스 통합
  - 분산 시스템 상태 관리를 위한 Cosmos DB
  - 6개 Mermaid 다이어그램 에이전트 상호작용 표시
  - 3가지 고급 연습 (타임아웃 처리, 재시도 로직, 회로 차단기)
  - 비용 분석($240-565/월) 및 최적화 전략
  - 모니터링을 위한 Application Insights 통합

#### 향상됨
- **사전 배포 챕터**: 포괄적인 모니터링 및 조정 패턴 포함
- **시작 챕터**: 전문 인증 패턴으로 향상
- **운영 준비**: 보안부터 관측 가능성까지 완전한 다룸
- **강의 개요**: 3장과 6장의 새로운 강의 참조 업데이트

#### 변경됨
- **학습 진행**: 보안 및 모니터링을 과정 전반에 더 잘 통합
- **문서 품질**: 새로운 강의에서 일관된 A급 기준(95-97%) 적용
- **운영 패턴**: 엔터프라이즈 배포를 위한 완전한 엔드투엔드 커버리지

#### 개선됨
- **개발자 경험**: 개발에서 운영 모니터링까지 명확한 경로 제공
- **보안 표준**: 인증 및 비밀 관리에 대한 전문 패턴
- **관측 가능성**: AZD에서 완전한 Application Insights 통합
- **AI 워크로드**: Microsoft Foundry 모델과 다중 에이전트 시스템을 위한 전문 모니터링

#### 검증됨
- ✅ 모든 강의에 완전한 작동 코드 포함(스니펫 아님)
- ✅ 시각 학습을 위한 Mermaid 다이어그램 총 19개 (3개 강의)
- ✅ 검증 단계가 포함된 실습 연습 9개
- ✅ `azd up`으로 배포 가능한 운영 준비된 Bicep 템플릿
- ✅ 비용 분석 및 최적화 전략 포함
- ✅ 문제 해결 가이드 및 모범 사례
- ✅ 검증 명령어를 포함한 지식 점검

#### 문서 평가 결과
- **docs/pre-deployment/application-insights.md**: - 포괄적 모니터링 가이드
- **docs/getting-started/authsecurity.md**: - 전문 보안 패턴
- **docs/pre-deployment/coordination-patterns.md**: - 고급 다중 에이전트 아키텍처
- **전체 신규 콘텐츠**: - 일관된 고품질 기준

#### 기술 구현
- **Application Insights**: Log Analytics + 맞춤 텔레메트리 + 분산 추적
- <strong>인증</strong>: 관리 ID + 키 볼트 + RBAC 패턴
- **다중 에이전트**: 서비스 버스 + Cosmos DB + 컨테이너 앱 + 오케스트레이션
- <strong>모니터링</strong>: 실시간 메트릭 + Kusto 쿼리 + 알림 + 대시보드
- **비용 관리**: 샘플링 전략, 보존 정책, 예산 제어

### [v3.7.0] - 2025-11-19

#### 문서 품질 향상 및 새로운 Microsoft Foundry 모델 예제
**이번 버전은 저장소 전반의 문서 품질을 높이고 gpt-4.1 채팅 인터페이스가 포함된 완전한 Microsoft Foundry 모델 배포 예제를 추가합니다.**

#### 추가됨
- **🤖 Microsoft Foundry 모델 채팅 예제**: `examples/azure-openai-chat/`에서 작동하는 gpt-4.1 완전 배포 구현:
  - 완전한 Microsoft Foundry 모델 인프라(gpt-4.1 모델 배포)
  - 대화 기록이 포함된 Python 명령줄 채팅 인터페이스
  - 보안 API 키 저장용 키 볼트 통합
  - 토큰 사용 추적 및 비용 산정
  - 속도 제한 및 오류 처리
  - 35-45분 배포 가이드를 포함한 상세 README
  - 11개의 운영 준비 파일 (Bicep 템플릿, Python 앱, 구성 포함)
- **📚 문서 연습 문제**: 구성 가이드에 실습 연습 추가:
  - 연습 1: 다중 환경 구성 (15분)
  - 연습 2: 비밀 관리 실습 (10분)
  - 명확한 성공 기준 및 검증 단계
- **✅ 배포 검증**: 배포 가이드에 검증 섹션 추가:
  - 상태 점검 절차
  - 성공 기준 체크리스트
  - 모든 배포 명령 출력 예상
  - 문제 해결 빠른 참조

#### 향상됨
- **examples/README.md**: A급 품질(93%)로 업데이트:
  - 모든 관련 섹션에 azure-openai-chat 추가
  - 로컬 예제 수 3개에서 4개로 업데이트
  - AI 애플리케이션 예제 표에 추가
  - 중급 사용자 빠른 시작에 통합
  - Microsoft Foundry 템플릿 섹션에 추가
  - 비교 행렬 및 기술 탐색 섹션 업데이트
- **문서 품질**: docs 폴더 내 B+ (87%) → A- (92%) 개선:
  - 주요 명령어 예제에 예상 출력 추가
  - 구성 변경에 대한 검증 단계 포함
  - 실습 학습 강화

#### 변경됨
- **학습 진행**: 중급 학습자를 위한 AI 예제 통합 강화
- **문서 구조**: 명확한 결과가 있는 실천 가능 연습 강화
- **검증 과정**: 주요 워크플로우에 명확한 성공 기준 추가

#### 개선됨
- **개발자 경험**: Microsoft Foundry 모델 배포가 35-45분 소요 (기존 복잡한 대안 대비)
- **비용 투명성**: Microsoft Foundry 모델 예제의 명확한 비용 추정 ($50-200/월)
- **학습 경로**: AI 개발자에게 azure-openai-chat을 통한 명확한 입문점 제공
- **문서 표준**: 일관된 예상 출력 및 검증 단계

#### 검증됨
- ✅ `azd up`으로 완전 작동하는 Microsoft Foundry 모델 예제
- ✅ 모든 11개 구현 파일 구문상 올바름
- ✅ README 지침과 실제 배포 경험 일치
- ✅ 8개 이상 장소에서 문서 링크 업데이트 완료
- ✅ 예제 색인은 4개 로컬 예제를 정확히 반영
- ✅ 중복된 외부 링크 없음
- ✅ 모든 네비게이션 참조 올바름

#### 기술 구현
- **Microsoft Foundry 모델 아키텍처**: gpt-4.1 + 키 볼트 + 컨테이너 앱 패턴
- <strong>보안</strong>: 관리 ID 준비, 키 볼트 내 비밀
- <strong>모니터링</strong>: Application Insights 통합
- **비용 관리**: 토큰 추적 및 사용 최적화
- <strong>배포</strong>: 단일 `azd up` 명령으로 완전한 설정

### [v3.6.0] - 2025-11-19

#### 주요 업데이트: 컨테이너 앱 배포 예제
**이번 버전에서는 Azure Developer CLI(AZD)를 사용한 포괄적이고 운영 준비된 컨테이너 앱 배포 예제를 소개하며, 완전한 문서화 및 학습 경로에 통합했습니다.**

#### 추가됨
- **🚀 컨테이너 앱 예제**: `examples/container-app/` 내 신규 로컬 예제:
  - [마스터 가이드](examples/container-app/README.md): 컨테이너화 배포, 빠른 시작, 운영 및 고급 패턴 완전 개요
  - [간단한 Flask API](../../examples/container-app/simple-flask-api): 스케일 투 제로, 헬스 프로브, 모니터링, 문제 해결이 포함된 초보자 친화 REST API
  - [마이크로서비스 아키텍처](../../examples/container-app/microservices): 프로덕션 준비 다중 서비스 배포(API 게이트웨이, 제품, 주문, 사용자, 알림), 비동기 메시징, 서비스 버스, Cosmos DB, Azure SQL, 분산 추적, 블루그린/카나리아 배포
- **모범 사례**: 컨테이너화 작업 부하용 보안, 모니터링, 비용 최적화 및 CI/CD 지침
- **코드 샘플**: 완전한 `azure.yaml`, Bicep 템플릿, 다중 언어 서비스 구현(Python, Node.js, C#, Go)
- **테스트 및 문제 해결**: 엔드투엔드 테스트 시나리오, 모니터링 명령, 문제 해결 가이드

#### 변경됨
- **README.md**: "로컬 예제 - 컨테이너 애플리케이션" 아래 새로운 컨테이너 앱 예제를 특징 및 링크로 업데이트
- **examples/README.md**: 컨테이너 앱 예제 하이라이트, 비교 매트릭스 항목 추가, 기술/아키텍처 참조 업데이트
- **코스 개요 및 학습 가이드**: 관련 장에서 새로운 컨테이너 앱 예제 및 배포 패턴 참조 업데이트

#### 검증됨
- ✅ 모든 신규 예제가 `azd up`으로 배포 가능하며 모범 사례 준수
- ✅ 문서 교차 링크 및 네비게이션 업데이트 완료
- ✅ 예제가 초보자부터 고급 시나리오(운영 마이크로서비스) 포함

#### 참고
- <strong>범위</strong>: 영어 문서 및 예제만 해당
- **향후 계획**: 향후 릴리스에서 추가 고급 컨테이너 패턴 및 CI/CD 자동화 확대 예정

### [v3.5.0] - 2025-11-19

#### 제품 리브랜딩: Microsoft Foundry
**이번 버전은 모든 영어 문서에서 "Microsoft Foundry"로 제품명을 포괄적으로 변경하며, Microsoft의 공식 리브랜딩을 반영합니다.**

#### 변경됨
- **🔄 제품명 업데이트**: "Microsoft Foundry"로 완전 리브랜딩
  - `docs/` 폴더 내 영어 문서 전반의 모든 참조 업데이트
  - 폴더명 변경: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - 파일명 변경: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 총: 7개 문서 파일에서 23개 콘텐츠 참조 업데이트 완료

- **📁 폴더 구조 변경**:
  - `docs/ai-foundry/`가 `docs/microsoft-foundry/`로 이름 변경됨
  - 모든 교차 참조가 새 폴더 구조를 반영하도록 업데이트됨
  - 문서 전체의 내비게이션 링크가 검증됨

- **📄 파일 이름 변경**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - 모든 내부 링크가 새 파일명을 참조하도록 업데이트됨

#### 업데이트된 파일들
- **장별 문서** (7개 파일):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 내비게이션 링크 3개 업데이트
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 제품명 참조 4개 업데이트
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - 이전 업데이트로 이미 Microsoft Foundry 사용 중
  - `docs/microsoft-foundry/production-ai-practices.md` - 3개의 참조 업데이트 (개요, 커뮤니티 피드백, 문서)
  - `docs/getting-started/azd-basics.md` - 교차 참조 링크 4개 업데이트
  - `docs/getting-started/first-project.md` - 장 내비게이션 링크 2개 업데이트
  - `docs/getting-started/installation.md` - 다음 장 링크 2개 업데이트
  - `docs/troubleshooting/ai-troubleshooting.md` - 참조 3개 업데이트 (내비게이션, Discord 커뮤니티)
  - `docs/troubleshooting/common-issues.md` - 내비게이션 링크 1개 업데이트
  - `docs/troubleshooting/debugging.md` - 내비게이션 링크 1개 업데이트

- **강의 구조 파일** (2개 파일):
  - `README.md` - 참조 17개 업데이트 (강의 개요, 장 제목, 템플릿 섹션, 커뮤니티 인사이트)
  - `course-outline.md` - 참조 14개 업데이트 (개요, 학습 목표, 장별 자료)

#### 검증 완료
- ✅ 영어 문서 내 "ai-foundry" 폴더 경로 참조 모두 제거됨
- ✅ 영어 문서 내 "Microsoft Foundry" 제품명 참조 모두 제거됨
- ✅ 모든 내비게이션 링크가 새 폴더 구조에서 정상 작동함
- ✅ 파일 및 폴더 이름 변경 성공적으로 완료
- ✅ 장별 교차 참조 모두 정상 확인됨

#### 참고 사항
- <strong>범위</strong>: 변경 사항은 `docs/` 폴더 내 영어 문서에만 적용됨
- <strong>번역본</strong>: 이번 버전에는 번역 폴더(`translations/`)는 업데이트되지 않음
- <strong>워크숍</strong>: 워크숍 자료(`workshop/`)는 이번 버전에서 변경되지 않음
- <strong>예제</strong>: 예제 파일은 아직 이전 명칭이 포함될 수 있음 (차후 업데이트 예정)
- **외부 링크**: 외부 URL 및 GitHub 레포지토리 참조는 변경 없음

#### 기여자용 마이그레이션 가이드
기존 구조를 참조하는 로컬 브랜치나 문서가 있는 경우:
1. 폴더 참조 업데이트: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. 파일 참조 업데이트: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. 제품명 변경: "Microsoft Foundry" → "Microsoft Foundry"
4. 모든 내부 문서 링크가 정상 작동하는지 검증

---

### [v3.4.0] - 2025-10-24

#### 인프라 미리보기 및 검증 기능 향상
**이번 버전에서는 새 Azure Developer CLI 미리보기 기능에 대한 포괄적인 지원과 워크숍 사용자 경험 향상을 도입했습니다.**

#### 추가됨
- **🧪 azd provision --preview 기능 문서**: 새로운 인프라 미리보기 기능에 대한 포괄적 설명
  - 명령 참조 및 사용 예제 포함한 치트 시트
  - 사례 및 이점과 함께 프로비저닝 가이드에 상세 통합
  - 안전한 배포 검증을 위한 사전 검사 통합
  - 안전 우선 배포 관행을 위한 시작 가이드 업데이트
- **🚧 워크숍 상태 배너**: 워크숍 개발 상태를 알리는 전문 HTML 배너
  - 명확한 사용자 소통을 위한 그라디언트 디자인 및 공사 표시
  - 마지막 업데이트 시간 표시로 투명성 제공
  - 모든 기기 유형에 최적화된 모바일 반응형 디자인

#### 향상됨
- **인프라 안전성**: 배포 문서 전반에 미리보기 기능 통합
- **사전 배포 검증**: 자동화 스크립트에 인프라 미리보기 테스트 포함
- **개발자 워크플로우**: 미리보기를 포함하여 베스트 프랙티스로 명령 시퀀스 업데이트
- **워크숍 경험**: 콘텐츠 개발 상태에 대한 명확한 사용자 기대 설정

#### 변경됨
- **배포 최적 관행**: 미리보기 우선 워크플로우가 권장 방식으로 변경
- **문서 흐름**: 학습 과정 초기에 인프라 검증 추가
- **워크숍 발표**: 개발 일정에 대한 명확한 상태 커뮤니케이션

#### 개선됨
- **안전 우선 접근법**: 배포 전 인프라 변경 사항 검증 가능
- **팀 협업**: 미리보기 결과를 공유하여 검토 및 승인 가능
- **비용 인식**: 프로비저닝 전 자원 비용 명확히 이해
- **위험 완화**: 사전 검증으로 배포 실패 감소

#### 기술적 구현
- **복수 문서 통합**: 4개 주요 문서에 미리보기 기능 문서화
- **명령 패턴**: 문서 전반에 걸쳐 일관된 구문과 예시 제공
- **베스트 프랙티스 통합**: 검증 워크플로우 및 스크립트에 미리보기 포함
- **시각적 표시**: 신규 기능 명확한 표시로 가독성 향상

#### 워크숍 인프라
- **상태 커뮤니케이션**: 그라디언트 스타일의 전문 HTML 배너
- **사용자 경험**: 개발 상태 명확히 표시하여 혼란 방지
- **전문적 발표**: 저장소 신뢰도 유지 및 기대치 설정
- **일정 투명성**: 2025년 10월 마지막 업데이트 시간 표시

### [v3.3.0] - 2025-09-24

#### 향상된 워크숍 자료 및 인터랙티브 학습 경험
**이번 버전에서는 브라우저 기반의 인터랙티브 가이드와 구조화된 학습 경로를 포함한 포괄적 워크숍 자료를 도입했습니다.**

#### 추가됨
- **🎥 인터랙티브 워크숍 가이드**: MkDocs 미리보기 기능을 갖춘 브라우저 기반 워크숍 경험
- **📝 구조화된 워크숍 지침**: 탐색부터 맞춤화까지 7단계 가이드 학습 경로
  - 0-소개: 워크숍 개요와 설정
  - 1-AI-템플릿 선택: 템플릿 탐색 및 선택 과정
  - 2-AI-템플릿 검증: 배포 및 검증 절차
  - 3-AI-템플릿 분석: 템플릿 아키텍처 이해
  - 4-AI-템플릿 구성: 설정 및 맞춤화
  - 5-AI-템플릿 맞춤화: 고급 수정 및 반복
  - 6-인프라 해체: 정리 및 자원 관리
  - 7-마무리: 요약 및 다음 단계
- **🛠️ 워크숍 도구**: Material 테마가 적용된 MkDocs 구성으로 학습 경험 향상
- **🎯 실습 학습 경로**: 3단계 방법론 (탐색 → 배포 → 맞춤화)
- **📱 GitHub Codespaces 통합**: 원활한 개발 환경 설정 지원

#### 향상됨
- **AI 워크숍 랩**: 2~3시간의 구조화된 포괄적 학습 경험으로 확장
- **워크숍 문서**: 내비게이션 및 시각 자료와 함께 전문적으로 제공
- **학습 진행**: 템플릿 선택부터 운영 배포까지 단계별 명확한 안내
- **개발자 경험**: 통합된 도구로 효율적인 개발 워크플로우 지원

#### 개선됨
- <strong>접근성</strong>: 검색, 복사 기능, 테마 전환 지원하는 브라우저 기반 인터페이스
- **자가 속도 학습**: 다양한 학습 속도에 맞춘 유연한 워크숍 구조
- <strong>실용성</strong>: 실제 AI 템플릿 배포 상황 적용
- **커뮤니티 통합**: Discord 연동으로 워크숍 지원 및 협업 가능

#### 워크숍 기능
- **내장 검색**: 빠른 키워드 및 강의 검색 가능
- **코드 블록 복사**: 마우스 오버 시 코드 복사 기능 제공
- **테마 전환**: 다크/라이트 모드 지원
- **시각 자료**: 이해를 돕는 스크린샷과 다이어그램 제공
- **도움말 통합**: 커뮤니티 지원을 위한 직접 Discord 접속 가능

### [v3.2.0] - 2025-09-17

#### 대규모 내비게이션 개편 및 장 기반 학습 시스템 도입
**이번 버전에서는 저장소 전반에 걸쳐 향상된 내비게이션과 8개 장으로 구성된 포괄적인 장별 학습 구조를 도입했습니다.**

#### 추가됨
- **📚 장 기반 학습 시스템**: 전체 코스를 8단계 점진적 학습 장으로 재구성
  - 1장: 기초 및 빠른 시작 (⭐ - 30~45분)
  - 2장: AI-퍼스트 개발 (⭐⭐ - 1~2시간)
  - 3장: 구성 및 인증 (⭐⭐ - 45~60분)
  - 4장: 코드로서의 인프라 및 배포 (⭐⭐⭐ - 1~1.5시간)
  - 5장: 다중 에이전트 AI 솔루션 (⭐⭐⭐⭐ - 2~3시간)
  - 6장: 사전 배포 검증 및 계획 (⭐⭐ - 1시간)
  - 7장: 문제 해결 및 디버깅 (⭐⭐ - 1~1.5시간)
  - 8장: 운영 및 엔터프라이즈 패턴 (⭐⭐⭐⭐ - 2~3시간)
- **📚 종합 내비게이션 시스템**: 모든 문서에 일관된 내비게이션 헤더와 푸터 적용
- **🎯 진행 추적**: 코스 완료 체크리스트 및 학습 검증 시스템
- **🗺️ 학습 경로 가이드**: 다양한 경험 수준과 목표별 진입점 설정
- **🔗 교차 참조 내비게이션**: 관련 장 및 선수 지식 명확하게 연결

#### 향상됨
- **README 구조**: 장 기반 조직을 갖춘 구조화된 학습 플랫폼으로 변환
- **문서 내비게이션**: 모든 페이지에 장별 맥락과 진행 안내 포함
- **템플릿 구성**: 예제 및 템플릿을 적절한 학습 장에 매핑
- **자료 통합**: 치트 시트, FAQ, 학습 가이드 등 관련 장에 연결
- **워크숍 통합**: 실습 랩을 여러 장별 학습 목표에 매핑

#### 변경됨
- **학습 진행**: 선형 문서에서 유연한 장 기반 학습으로 전환
- **구성 위치**: 구성 안내를 학습 흐름 개선을 위해 3장으로 재배치
- **AI 콘텐츠 통합**: AI 특화 내용을 학습 여정 전반에 통합 강화
- **운영 콘텐츠**: 고급 패턴을 엔터프라이즈 학습자 위한 8장에 통합

#### 개선됨
- **사용자 경험**: 명확한 내비게이션 빵 부스러기와 진도 표시 제공
- <strong>접근성</strong>: 일관된 내비게이션 패턴으로 코스 순회 용이
- **전문적 발표**: 학문적 및 기업 교육에 적합한 대학 스타일 코스 구조
- **학습 효율성**: 향상된 조직으로 관련 콘텐츠 탐색 시간 단축

#### 기술적 구현
- **내비게이션 헤더**: 40개 이상의 문서 파일에 표준 장 내비게이션 적용
- **푸터 내비게이션**: 일관된 진행 안내와 장별 완료 표시 포함
- <strong>교차링크</strong>: 관련 개념 간 포괄적 내부 연결 시스템 구성
- **장 매핑**: 템플릿과 예제를 학습 목표별 명확히 연계

#### 학습 가이드 향상
- **📚 종합 학습 목표**: 8장 체계에 맞게 재구성된 학습 가이드
- **🎯 장별 평가**: 각 장에 특정 학습 목표 및 실습 포함
- **📋 진도 추적**: 주간 학습 일정과 측정 가능한 결과 및 완료 체크리스트
- **❓ 평가 질문**: 전문적 결과를 위한 각 장별 지식 검증 문제
- **🛠️ 실습 과제**: 실제 배포 시나리오와 문제 해결 활동
- **📊 기술 개발**: 기본 개념부터 엔터프라이즈 패턴까지 경력 개발 중심 진도
- **🎓 인증 체계**: 전문 개발 성과 및 커뮤니티 인정 시스템
- **⏱️ 일정 관리**: 마일스톤 검증 포함 10주 구조화 학습 계획

### [v3.1.0] - 2025-09-17

#### 향상된 다중 에이전트 AI 솔루션
**이번 버전에서는 소매 다중 에이전트 솔루션에서 에이전트 명명 개선과 문서 강화가 이루어졌습니다.**

#### 변경됨
- **다중 에이전트 용어**: 소매 다중 에이전트 솔루션 전반에 "Cora agent" 대신 "Customer agent"로 변경해 명확성 향상
- **에이전트 아키텍처**: 모든 문서, ARM 템플릿, 코드 예제에 일관된 "Customer agent" 명명 적용
- **구성 예제**: 업데이트된 명명 규칙으로 최신 에이전트 구성 패턴 적용
- **문서 일관성**: 모든 참조에 전문적이고 서술적인 에이전트 명칭 사용 보장

#### 향상됨
- **ARM 템플릿 패키지**: retail-multiagent-arm-template를 Customer agent 참조로 업데이트
- **아키텍처 다이어그램**: Mermaid 다이어그램에서 에이전트 명칭 갱신
- **코드 예제**: Python 클래스와 구현 예제에서 CustomerAgent 명칭 사용
- **환경 변수**: 배포 스크립트 내 모든 환경 변수를 CUSTOMER_AGENT_NAME 규칙으로 갱신

#### 개선됨
- **개발자 경험**: 문서 내 에이전트 역할과 책임 명확화
- **운영 준비도**: 기업 명명 규칙과의 정합성 향상
- **학습 자료**: 교육 목적에 맞춘 더 직관적 에이전트 명칭
- **템플릿 활용도**: 에이전트 기능과 배포 패턴 이해 용이성 증대

#### 기술 세부사항
- Mermaid 아키텍처 다이어그램에 CustomerAgent 참조 업데이트
- Python 예제에서 CoraAgent 클래스명을 CustomerAgent로 대체
- ARM 템플릿 JSON 구성에서 "customer" 에이전트 유형 사용으로 수정
- 환경 변수명을 CORA_AGENT_*에서 CUSTOMER_AGENT_* 패턴으로 변경
- 모든 배포 명령과 컨테이너 구성 업데이트 반영

### [v3.0.0] - 2025-09-12

#### 주요 변경사항 - AI 개발자 초점 및 Microsoft Foundry 통합
**이번 버전은 저장소를 AI 개발자 중심의 포괄적 학습 자료로 전환하고 Microsoft Foundry 통합을 도입합니다.**

#### 추가됨
- **🤖 AI-퍼스트 학습 경로**: AI 개발자와 엔지니어를 우선시하는 완전한 구조 개편
- **Microsoft Foundry 통합 가이드**: AZD와 Microsoft Foundry 서비스 연결에 관한 포괄적 문서
- **AI 모델 배포 패턴**: 모델 선택, 구성 및 운영 배포 전략에 관한 상세 가이드 제공
- **AI 워크숍 랩**: AI 애플리케이션을 AZD 배포 가능한 솔루션으로 변환하기 위한 2-3시간 실습 워크숍  
- **프로덕션 AI 모범 사례**: AI 작업 부하 확장, 모니터링 및 보안을 위한 엔터프라이즈 준비 패턴  
- **AI 전용 문제 해결 가이드**: Microsoft Foundry 모델, Cognitive Services 및 AI 배포 문제에 대한 종합 문제 해결  
- **AI 템플릿 갤러리**: 복잡도 등급이 부여된 Microsoft Foundry 템플릿 특별 컬렉션  
- **워크숍 자료**: 실습 랩과 참고 자료를 포함한 완전한 워크숍 구조  

#### 향상된 기능  
- **README 구조**: Microsoft Foundry Discord의 45% 커뮤니티 관심 데이터를 반영한 AI 개발자 중심  
- **학습 경로**: 학생 및 DevOps 엔지니어용 기존 경로와 병행된 전용 AI 개발자 여정  
- **템플릿 추천**: azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart 등 주요 AI 템플릿  
- **커뮤니티 통합**: AI 전용 채널과 토론을 통한 강화된 Discord 커뮤니티 지원  

#### 보안 및 프로덕션 집중  
- **관리되는 ID 패턴**: AI 전용 인증 및 보안 구성  
- **비용 최적화**: AI 작업 부하의 토큰 사용 추적 및 예산 관리  
- **다중 지역 배포**: 글로벌 AI 애플리케이션 배포 전략  
- **성능 모니터링**: AI 전용 메트릭 및 Application Insights 통합  

#### 문서 품질  
- **선형 코스 구조**: 초보자에서 고급 AI 배포 패턴으로 논리적 진행  
- **검증된 URL**: 외부 저장소 링크 모두 검증 및 접근 가능  
- **완전한 참고 자료**: 모든 내부 문서 링크가 검증되고 정상 작동  
- **프로덕션 준비 완료**: 실 사례가 포함된 엔터프라이즈 배포 패턴  

### [v2.0.0] - 2025-09-09

#### 주요 변경사항 - 저장소 구조 조정 및 전문성 향상  
**이 버전은 저장소 구조와 콘텐츠 표현의 대대적인 개편을 나타냅니다.**

#### 추가됨  
- **구조화된 학습 프레임워크**: 모든 문서 페이지에 소개, 학습 목표, 학습 성과 섹션 추가  
- **네비게이션 시스템**: 모든 문서에 이전/다음 강의 링크 추가로 학습 진행 안내  
- **학습 가이드**: 학습 목표, 연습 문제 및 평가 자료를 포함한 comprehensive study-guide.md  
- **전문적 표현**: 접근성과 전문성 향상을 위해 모든 이모티콘 제거  
- **향상된 콘텐츠 구조**: 학습 자료의 조직 및 흐름 개선  

#### 변경됨  
- **문서 형식**: 모든 문서에 일관된 학습 중심 구조 적용  
- **네비게이션 흐름**: 모든 학습 자료에 논리적 진행 구현  
- **콘텐츠 표현**: 명확하고 전문적인 형식을 위해 장식적 요소 제거  
- **링크 구조**: 새로운 네비게이션 시스템을 지원하도록 내부 링크 업데이트  

#### 개선됨  
- <strong>접근성</strong>: 스크린 리더 호환성을 위한 이모티콘 의존 제거  
- <strong>전문성</strong>: 엔터프라이즈 학습에 적합한 깔끔하고 학문적인 표현  
- **학습 경험**: 각 강의에 명확한 목표와 성과를 제시하는 구조적 접근  
- **콘텐츠 조직**: 관련 주제 간 더 나은 논리적 흐름 및 연결  

### [v1.0.0] - 2025-09-09

#### 초기 릴리스 - 포괄적인 AZD 학습 저장소  

#### 추가됨  
- **핵심 문서 구조**  
  - 완전한 시작 가이드 시리즈  
  - 전면적인 배포 및 프로비저닝 문서  
  - 상세 문제 해결 자원 및 디버깅 가이드  
  - 사전 배포 검증 도구 및 절차  

- **시작하기 모듈**  
  - AZD 기본 사항: 핵심 개념 및 용어  
  - 설치 가이드: 플랫폼별 설정 지침  
  - 구성 가이드: 환경 설정 및 인증  
  - 첫 프로젝트 튜토리얼: 단계별 실습  

- **배포 및 프로비저닝 모듈**  
  - 배포 가이드: 전체 워크플로우 문서  
  - 프로비저닝 가이드: Bicep을 사용한 인프라 코드  
  - 프로덕션 배포 모범 사례  
  - 다중 서비스 아키텍처 패턴  

- **사전 배포 검증 모듈**  
  - 용량 계획: Azure 리소스 가용성 검증  
  - SKU 선택: 서비스 등급 관련 종합 지침  
  - 사전 점검: 자동화된 검증 스크립트 (PowerShell 및 Bash)  
  - 비용 추정 및 예산 계획 도구  

- **문제 해결 모듈**  
  - 일반 문제: 자주 발생하는 문제 및 해결책  
  - 디버깅 가이드: 체계적 문제 해결 방법론  
  - 고급 진단 기법 및 도구  
  - 성능 모니터링 및 최적화  

- **자원 및 참고 문서**  
  - 명령어 치트 시트: 핵심 명령어 빠른 참조  
  - 용어집: 종합 용어 및 약어 정의  
  - FAQ: 자주 묻는 질문에 대한 상세 답변  
  - 외부 리소스 링크 및 커뮤니티 연결  

- **예제 및 템플릿**  
  - 간단한 웹 애플리케이션 예제  
  - 정적 웹사이트 배포 템플릿  
  - 컨테이너 애플리케이션 구성  
  - 데이터베이스 통합 패턴  
  - 마이크로서비스 아키텍처 예시  
  - 서버리스 함수 구현  

#### 특징  
- **다중 플랫폼 지원**: Windows, macOS, Linux 설치 및 구성 가이드  
- **다양한 숙련도**: 학생부터 전문가 개발자까지 대상  
- **실습 중심**: 실습 예제 및 실제 시나리오  
- **포괄적 커버리지**: 기본 개념부터 고급 엔터프라이즈 패턴까지  
- **보안 우선 접근**: 전반에 통합된 보안 모범 사례  
- **비용 최적화**: 비용 효율적 배포 및 리소스 관리 가이드  

#### 문서 품질  
- **상세 코드 예제**: 실습용 검증된 코드 샘플  
- **단계별 지침**: 명확하고 실행 가능한 안내  
- **포괄적 오류 처리**: 일반 문제에 대한 문제 해결 지원  
- **모범 사례 통합**: 산업 표준 및 권장 사항  
- **버전 호환성**: 최신 Azure 서비스 및 azd 기능 반영  

## 계획된 향후 개선 사항

### 버전 3.1.0 (계획)  
#### AI 플랫폼 확장  
- **다중 모델 지원**: Hugging Face, Azure Machine Learning, 맞춤형 모델 통합 패턴  
- **AI 에이전트 프레임워크**: LangChain, Semantic Kernel, AutoGen 배포 템플릿  
- **고급 RAG 패턴**: Azure AI Search 외 벡터 데이터베이스 옵션 (Pinecone, Weaviate 등)  
- **AI 관측성**: 모델 성능, 토큰 사용, 응답 품질 모니터링 강화  

#### 개발자 경험  
- **VS Code 확장 기능**: AZD + Microsoft Foundry 통합 개발 경험  
- **GitHub Copilot 통합**: AI 지원 AZD 템플릿 생성  
- **인터랙티브 튜토리얼**: AI 시나리오를 위한 실습 코딩 및 자동 검증  
- **비디오 콘텐츠**: AI 배포 중심 시각 학습자 대상 보조 영상 튜토리얼  

### 버전 4.0.0 (계획)  
#### 엔터프라이즈 AI 패턴  
- **거버넌스 프레임워크**: AI 모델 거버넌스, 준수 및 감사 추적  
- **멀티테넌트 AI**: 고객 분리 AI 서비스 제공 패턴  
- **에지 AI 배포**: Azure IoT Edge 및 컨테이너 인스턴스 통합  
- **하이브리드 클라우드 AI**: 멀티 클라우드 및 하이브리드 AI 작업 부하 배포 패턴  

#### 고급 기능  
- **AI 파이프라인 자동화**: Azure Machine Learning 파이프라인과의 MLOps 통합  
- **고급 보안**: 제로 트러스트 패턴, 프라이빗 엔드포인트, 고급 위협 보호  
- **성능 최적화**: 대용량 AI 애플리케이션 튜닝 및 확장 전략  
- **글로벌 배포**: AI 애플리케이션용 콘텐츠 전송 및 에지 캐싱 패턴  

### 버전 3.0.0 (계획) - 현재 릴리스로 대체됨  
#### 제안된 추가사항 - v3.0.0에 구현됨  
- ✅ **AI 중심 콘텐츠**: 종합 Microsoft Foundry 통합 (완료)  
- ✅ **인터랙티브 튜토리얼**: 실습 AI 워크숍 랩 (완료)  
- ✅ **고급 보안 모듈**: AI 전용 보안 패턴 (완료)  
- ✅ **성능 최적화**: AI 작업 부하 튜닝 전략 (완료)  

### 버전 2.1.0 (계획) - v3.0.0 일부 구현됨  
#### 소규모 개선 - 일부 현 릴리스에서 완료됨  
- ✅ **추가 예제**: AI 중심 배포 시나리오 (완료)  
- ✅ **확장된 FAQ**: AI 전용 질문 및 문제 해결 (완료)  
- **도구 통합**: 향상된 IDE 및 편집기 통합 가이드  
- ✅ **모니터링 확장**: AI 전용 모니터링 및 알림 패턴 (완료)  

#### 향후 릴리스 예정  
- **모바일 친화적 문서**: 모바일 학습을 위한 반응형 디자인  
- **오프라인 접근**: 다운로드 가능한 문서 패키지  
- **향상된 IDE 통합**: AZD + AI 워크플로를 위한 VS Code 확장  
- **커뮤니티 대시보드**: 실시간 커뮤니티 메트릭 및 기여 추적  

## 변경 로그에 기여하기

### 변경사항 보고  
저장소에 기여할 때, 변경 로그 항목에는 다음이 포함되어야 합니다:

1. **버전 번호**: 의미 기반 버전 관리 (주요.부.수) 준수  
2. <strong>날짜</strong>: YYYY-MM-DD 형식의 릴리스 또는 업데이트 일자  
3. <strong>카테고리</strong>: 추가, 변경, 폐기, 제거, 수정, 보안  
4. **명확한 설명**: 변경 내용의 간결한 설명  
5. **영향 평가**: 변경이 기존 사용자에 미치는 영향  

### 변경 카테고리

#### 추가됨  
- 신규 기능, 문서 섹션, 기능  
- 신규 예제, 템플릿, 학습 자료  
- 추가 도구, 스크립트, 유틸리티  

#### 변경됨  
- 기존 기능 또는 문서 수정  
- 명확성 또는 정확도 향상을 위한 업데이트  
- 콘텐츠 또는 조직 구조 재편  

#### 폐기됨  
- 단계적으로 중단되는 기능 또는 방법  
- 제거 예정 문서 섹션  
- 더 나은 대안이 있는 방법  

#### 제거됨  
- 더 이상 관련이 없는 기능, 문서, 예제  
- 오래된 정보 또는 사용 중단된 방법  
- 중복되었거나 통합된 콘텐츠  

#### 수정됨  
- 문서 또는 코드 내 오류 수정  
- 보고된 문제 해결  
- 정확성 또는 기능성 향상  

#### 보안  
- 보안 관련 개선 또는 수정  
- 보안 모범 사례 업데이트  
- 보안 취약점 해결  

### 의미 기반 버전 관리 지침

#### 주요 버전 (X.0.0)  
- 사용자 조치가 필요한 중대한 변경  
- 콘텐츠 또는 조직의 대대적 구조 변경  
- 근본적 접근법 또는 방법론 변경  

#### 부 버전 (X.Y.0)  
- 신규 기능 또는 콘텐츠 추가  
- 하위 호환성을 유지하는 개선  
- 추가 예제, 도구, 자료  

#### 수정 버전 (X.Y.Z)  
- 버그 수정 및 오류 정정  
- 기존 콘텐츠의 소규모 개선  
- 명확화 및 작은 향상  

## 커뮤니티 피드백 및 제안

이 학습 리소스 개선을 위해 커뮤니티 피드백을 적극 수렴합니다:

### 피드백 제공 방법  
- **GitHub 이슈**: 문제 보고 또는 개선 제안 (AI 관련 문제 환영)  
- **Discord 토론**: 아이디어 공유 및 Microsoft Foundry 커뮤니티 참여  
- **풀 리퀘스트**: AI 템플릿 및 가이드 등 콘텐츠 직접 기여  
- **Microsoft Foundry Discord**: #Azure 채널 참여로 AZD + AI 토론  
- **커뮤니티 포럼**: 넓은 Azure 개발자 토론 참여  

### 피드백 카테고리  
- **AI 콘텐츠 정확성**: AI 서비스 통합 및 배포 정보 수정  
- **학습 경험**: 향상된 AI 개발자 학습 흐름 제안  
- **누락된 AI 콘텐츠**: 추가 AI 템플릿, 패턴, 예제 요청  
- <strong>접근성</strong>: 다양한 학습자 요구 반영한 개선  
- **AI 도구 통합**: 더욱 나은 AI 개발 워크플로우 통합 제안  
- **프로덕션 AI 패턴**: 엔터프라이즈 AI 배포 패턴 요청  

### 대응 약속  
- **문제 응답**: 보고 후 48시간 이내  
- **기능 요청**: 일주일 내 평가  
- **커뮤니티 기여**: 일주일 내 검토  
- **보안 이슈**: 즉각 우선 처리 및 신속 대응  

## 유지 관리 일정

### 정기 업데이트  
- **월간 검토**: 콘텐츠 정확성 및 링크 검증  
- **분기별 업데이트**: 주요 콘텐츠 추가 및 개선  
- **반기별 검토**: 포괄적 구조 조정 및 향상  
- **연간 릴리스**: 대규모 버전 업그레이드 및 주요 개선 사항  

### 모니터링 및 품질 보증  
- **자동화 테스트**: 코드 예제 및 링크 정기 검증  
- **커뮤니티 피드백 통합**: 사용자 제안 정기 반영  
- **기술 업데이트**: 최신 Azure 서비스 및 azd 릴리스와 동기화  
- **접근성 감사**: 포괄적 설계 원칙 정기 검토  

## 버전 지원 정책

### 현재 버전 지원  
- **최신 주요 버전**: 완전 지원 및 정기 업데이트  
- **이전 주요 버전**: 12개월간 보안 업데이트 및 중요 수정  
- **레거시 버전**: 커뮤니티 지원만, 공식 업데이트 없음  

### 마이그레이션 안내  
주요 버전 출시 시 다음 제공:  
- **마이그레이션 가이드**: 단계별 전환 지침  
- **호환성 참고**: 중단점 및 변경 사항 상세  
- **도구 지원**: 마이그레이션용 스크립트 및 유틸리티  
- **커뮤니티 지원**: 전환 관련 질문 전용 포럼  

---

**이전 강의**: [Study Guide](resources/study-guide.md)  
**다음 강의**: [Main README](README.md)로 돌아가기  

**최신 정보 유지**: 이 저장소를 구독하여 학습 자료의 새 릴리스 및 중요 업데이트 알림 받기.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
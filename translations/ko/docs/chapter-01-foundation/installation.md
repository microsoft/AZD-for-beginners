# 설치 및 설정 가이드

**챕터 탐색:**
- **📚 강의 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 1 - 기초 및 빠른 시작
- **⬅️ 이전**: [AZD 기초](azd-basics.md)
- **➡️ 다음**: [첫 번째 프로젝트](first-project.md)
- **🚀 다음 챕터**: [챕터 2: AI-우선 개발](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 소개

이 종합 가이드는 시스템에 Azure Developer CLI (azd)를 설치하고 구성하는 과정을 안내합니다. 다양한 운영 체제별 설치 방법, 인증 설정 및 초기 구성을 학습하여 Azure 배포를 위한 개발 환경을 준비할 수 있습니다.

## 학습 목표

이 수업을 마치면 다음을 할 수 있습니다:
- 운영 체제에 맞게 Azure Developer CLI를 성공적으로 설치
- 여러 방법으로 Azure 인증 구성
- 필요한 전제 조건으로 개발 환경 설정
- 다양한 설치 옵션과 각 경우에 사용할 시점 이해
- 일반적인 설치 및 설정 문제 해결

## 학습 성과

이 수업을 완료한 후, 다음을 수행할 수 있습니다:
- 플랫폼에 적합한 방법으로 azd 설치
- `azd auth login`으로 Azure에 인증
- 설치를 확인하고 기본 azd 명령을 테스트
- 최적의 azd 사용을 위한 개발 환경 구성
- 일반적인 설치 문제를 독립적으로 해결

이 가이드는 운영 체제나 개발 환경에 관계없이 시스템에 Azure Developer CLI를 설치하고 구성하는 데 도움이 됩니다.

## 사전 요구 사항

azd를 설치하기 전에 다음을 확인하세요:
- **Azure 구독** - [무료 계정 만들기](https://azure.microsoft.com/free/)
- **Azure CLI** - 인증 및 리소스 관리를 위해 필요
- **Git** - 템플릿 클론 및 버전 관리를 위해 필요
- **Docker** (선택 사항) - 컨테이너화된 애플리케이션용

## 설치 방법

### Windows

#### 옵션 1: Windows 패키지 관리자 (권장)
```cmd
winget install microsoft.azd
```

#### 옵션 2: PowerShell 설치 스크립트
```powershell
# winget을 사용할 수 없을 때 유용함
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 옵션 3: Chocolatey
```cmd
choco install azd
```

#### 옵션 4: 수동 설치
1. 최신 릴리스를 [GitHub](https://github.com/Azure/azure-dev/releases)에서 다운로드하세요
2. `C:\Program Files\azd\`에 압축 해제
3. PATH 환경 변수에 추가

### macOS

#### 옵션 1: Homebrew (권장)
```bash
brew tap azure/azd
brew install azd
```

#### 옵션 2: 설치 스크립트
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 옵션 3: 수동 설치
```bash
# 다운로드 및 설치
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### 옵션 1: 설치 스크립트 (권장)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### 옵션 2: 패키지 관리자

**릴리스 자산에서 수동 설치:**
```bash
# Linux 아키텍처에 맞는 최신 아카이브를 다음에서 다운로드하세요:
# https://github.com/Azure/azure-dev/releases
# 그런 다음 압축을 풀고 azd 바이너리를 PATH에 추가하세요.
```

### GitHub Codespaces

일부 Codespaces 및 개발 컨테이너 환경에는 이미 `azd`가 포함되어 있지만, 가정하지 말고 확인해야 합니다:

```bash
azd version
```

If `azd` is missing, install it with the standard script for the environment.

### Docker

```bash
# 컨테이너에서 azd 실행
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 더 쉽게 사용하도록 별칭 생성
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 설치 확인

설치 후, azd가 제대로 작동하는지 확인하세요:

```bash
# 버전 확인
azd version

# 도움말 보기
azd --help

# 사용 가능한 템플릿 목록
azd template list
```

예상 출력:
```
azd version 1.x.x (commit xxxxxx)
```

<strong>참고</strong>: 실제 버전 번호는 다를 수 있습니다. 최신 버전은 [Azure Developer CLI 릴리스](https://github.com/Azure/azure-dev/releases)를 확인하세요.

**✅ 설치 성공 체크리스트:**
- [ ] `azd version`이 오류 없이 버전 번호를 표시함
- [ ] `azd --help`가 명령 문서를 표시함
- [ ] `azd template list`가 사용 가능한 템플릿을 표시함
- [ ] 테스트 디렉터리를 만들고 `azd init`을 성공적으로 실행할 수 있음

**모든 확인이 통과하면, [첫 번째 프로젝트](first-project.md)로 진행할 준비가 된 것입니다!**

## 인증 설정

### 권장 초보자 설정

AZD 우선 워크플로우의 경우 `azd auth login`으로 로그인하세요.

```bash
# azd up과 같은 AZD 명령에 필요합니다
azd auth login

# AZD 인증 상태 확인
azd auth login --check-status
```

코스 중에 직접 `az` 명령을 실행할 계획이 있는 경우에만 Azure CLI 로그인(az login)을 사용하세요.

### Azure CLI 인증 (선택 사항)
```bash
# 이미 설치되어 있지 않다면 Azure CLI를 설치하세요
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: 배포판에 대한 Azure CLI 설치 문서를 참조하세요

# Azure에 로그인하세요
az login

# 인증을 확인하세요
az account show
```

### 어떤 로그인 흐름을 사용해야 하나요?

- AZD 초보자 경로를 따르고 주로 `azd` 명령을 실행하는 경우 `azd auth login`을 사용하세요.
- `az account show`와 같이 Azure CLI 명령을 실행하거나 리소스를 직접 검사하려는 경우 `az login`도 사용하세요.
- 연습 문제에 `azd`와 `az` 명령이 모두 포함된 경우 시작 시 두 로그인 명령을 한 번씩 실행하세요.

### 디바이스 코드 인증
헤드리스 시스템을 사용 중이거나 브라우저 문제가 있는 경우:
```bash
azd auth login --use-device-code
```

### 서비스 프린시펄 (CI/CD)
자동화 환경의 경우:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### 전체 설정 검증

챕터 1을 시작하기 전에 빠른 준비 상태 확인을 원하면:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## 구성

### 전역 구성
```bash
# 기본 구독 설정
azd config set defaults.subscription <subscription-id>

# 기본 위치 설정
azd config set defaults.location eastus2

# 모든 구성 보기
azd config show
```

### 환경 변수
쉘 프로필(`.bashrc`, `.zshrc`, `.profile`)에 추가하세요:
```bash
# Azure 구성
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd 구성
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # 디버그 로깅 활성화
```

## IDE 통합

### Visual Studio Code
Azure Developer CLI 확장(extension)을 설치하세요:
1. VS Code 열기
2. 확장(Extensions)으로 이동 (Ctrl+Shift+X)
3. "Azure Developer CLI" 검색
4. 확장 설치

기능:
- azure.yaml에 대한 IntelliSense
- 통합 터미널 명령
- 템플릿 탐색
- 배포 모니터링

### GitHub Codespaces
`.devcontainer/devcontainer.json` 파일을 만드세요:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Azure 플러그인 설치
2. Azure 자격 증명 구성
3. 통합 터미널에서 azd 명령 사용

## 🐛 설치 문제 해결

### 일반적인 문제

#### 권한 거부 (Windows)
```powershell
# PowerShell을 관리자 권한으로 실행하세요
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH 문제
수동으로 azd를 PATH에 추가하세요:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### 네트워크/프록시 문제
```bash
# 프록시 구성
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL 검증을 건너뛰기 (운영 환경에서는 권장되지 않음)
azd config set http.insecure true
```

#### 버전 충돌
```bash
# 이전 설치 제거
# Windows: 'winget uninstall microsoft.azd' 실행
# macOS: 'brew uninstall azd' 실행
# Linux: 재설치하기 전에 이전 azd 바이너리 또는 심볼릭 링크를 제거

# 구성 정리
rm -rf ~/.azd
```

### 추가 도움 받기
```bash
# 디버그 로깅 활성화
export AZD_DEBUG=true
azd <command> --debug

# 현재 구성 보기
azd config show

# 현재 배포 상태 보기
azd show
```

## azd 업데이트

### 업데이트 확인
azd는 새 릴리스가 있을 때 경고하며, 현재 빌드를 다음으로 확인할 수 있습니다:
```bash
azd version
```

### 수동 업데이트

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 자주 묻는 질문

<details>
<summary><strong>azd와 az CLI의 차이점은 무엇인가요?</strong></summary>

**Azure CLI (az)**: 개별 Azure 리소스를 관리하는 저수준 도구
- `az webapp create`, `az storage account create`
- 한 번에 하나의 리소스
- 인프라 관리 중심

**Azure Developer CLI (azd)**: 전체 애플리케이션 배포를 위한 고수준 도구
- `azd up`는 모든 리소스로 전체 앱을 배포
- 템플릿 기반 워크플로우
- 개발자 생산성 중심

**두 도구 모두 필요합니다**: azd는 인증을 위해 az CLI를 사용합니다
</details>

<details>
<summary><strong>기존 Azure 리소스와 azd를 함께 사용할 수 있나요?</strong></summary>

예! 다음을 할 수 있습니다:
1. 기존 리소스를 azd 환경으로 가져오기
2. Bicep 템플릿에서 기존 리소스 참조
3. 기존 인프라와 함께 azd로 새 배포 수행

자세한 내용은 [구성 가이드](configuration.md)를 참조하세요.
</details>

<details>
<summary><strong>azd가 Azure Government 또는 Azure China와 작동하나요?</strong></summary>

예, 클라우드를 구성하세요:
```bash
# Azure 정부
az cloud set --name AzureUSGovernment
az login

# Azure 중국
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>CI/CD 파이프라인에서 azd를 사용할 수 있나요?</strong></summary>

물론입니다! azd는 자동화를 위해 설계되었습니다:
- GitHub Actions 통합
- Azure DevOps 지원
- 서비스 프린시펄 인증
- 비대화형 모드

CI/CD 패턴은 [배포 가이드](../chapter-04-infrastructure/deployment-guide.md)를 참조하세요.
</details>

<details>
<summary><strong>azd 사용 비용은 얼마인가요?</strong></summary>

azd 자체는 <strong>완전히 무료</strong>이며 오픈 소스입니다. 비용은 다음에 대해서만 발생합니다:
- 배포하는 Azure 리소스
- Azure 사용량 비용(컴퓨트, 스토리지 등)

배포 전에 비용을 추정하려면 `azd provision --preview`를 사용하세요.
</details>

## 다음 단계

1. **인증 완료**: Azure 구독에 접근할 수 있는지 확인하세요
2. **첫 배포 시도**: [첫 번째 프로젝트 가이드](first-project.md)를 따르세요
3. **템플릿 탐색**: `azd template list`로 사용 가능한 템플릿을 찾아보세요
4. **IDE 구성**: 개발 환경을 설정하세요

## 지원

문제가 발생하면:
- [공식 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [문제 보고](https://github.com/Azure/azure-dev/issues)
- [커뮤니티 토론](https://github.com/Azure/azure-dev/discussions)
- [Azure 지원](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure`로 에디터에서 직접 Azure 명령 안내를 받으세요

---

**챕터 탐색:**
- **📚 강의 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 1 - 기초 및 빠른 시작
- **⬅️ 이전**: [AZD 기초](azd-basics.md) 
- **➡️ 다음**: [첫 번째 프로젝트](first-project.md)
- **🚀 다음 챕터**: [챕터 2: AI-우선 개발](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ 설치 완료!** [첫 번째 프로젝트](first-project.md)로 계속 진행하여 azd로 빌드를 시작하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있지만 자동 번역은 오류나 부정확성을 포함할 수 있음을 유의하시기 바랍니다. 원본 문서(원어 문서)를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 어떠한 오해나 오역에 대해서도 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
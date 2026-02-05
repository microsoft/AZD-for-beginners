# 설치 및 설정 가이드

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 1 - 기초 및 빠른 시작
- **⬅️ 이전**: [AZD 기본](azd-basics.md)
- **➡️ 다음**: [첫 번째 프로젝트](first-project.md)
- **🚀 다음 챕터**: [챕터 2: AI-우선 개발](../microsoft-foundry/microsoft-foundry-integration.md)

## 소개

이 포괄적인 가이드는 Azure Developer CLI(azd)를 시스템에 설치하고 구성하는 방법을 안내합니다. 다양한 운영 체제에 대한 여러 설치 방법, 인증 설정, 초기 구성 방법을 배우고 Azure 배포를 위한 개발 환경을 준비할 수 있습니다.

## 학습 목표

이 레슨을 마치면 다음을 할 수 있습니다:
- 운영 체제에 Azure Developer CLI를 성공적으로 설치
- 여러 방법을 사용하여 Azure 인증 구성
- 필요한 사전 요구 사항으로 개발 환경 설정
- 다양한 설치 옵션과 각 옵션을 사용하는 시기 이해
- 일반적인 설치 및 설정 문제 해결

## 학습 결과

이 레슨을 완료한 후, 다음을 수행할 수 있습니다:
- 플랫폼에 적합한 방법으로 azd 설치
- `azd auth login`을 사용하여 Azure 인증
- 설치를 확인하고 기본 azd 명령 테스트
- azd 사용을 최적화하기 위한 개발 환경 구성
- 일반적인 설치 문제를 독립적으로 해결

이 가이드는 운영 체제나 개발 환경에 관계없이 시스템에 Azure Developer CLI를 설치하고 구성하는 데 도움을 줍니다.

## 사전 요구 사항

azd를 설치하기 전에 다음을 확인하세요:
- **Azure 구독** - [무료 계정 생성](https://azure.microsoft.com/free/)
- **Azure CLI** - 인증 및 리소스 관리용
- **Git** - 템플릿 복제 및 버전 관리용
- **Docker** (선택 사항) - 컨테이너화된 애플리케이션용

## 설치 방법

### Windows

#### 옵션 1: PowerShell (권장)
```powershell
# 관리자 권한으로 실행하거나 권한 상승으로 실행하세요
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### 옵션 2: Windows 패키지 관리자 (winget)
```cmd
winget install Microsoft.Azd
```

#### 옵션 3: Chocolatey
```cmd
choco install azd
```

#### 옵션 4: 수동 설치
1. [GitHub](https://github.com/Azure/azure-dev/releases)에서 최신 릴리스를 다운로드합니다.
2. `C:\Program Files\azd\`에 압축을 풉니다.
3. PATH 환경 변수에 추가합니다.

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

**Ubuntu/Debian:**
```bash
# Microsoft 패키지 저장소 추가
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd 설치
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft 패키지 저장소 추가
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd는 GitHub Codespaces에 사전 설치되어 있습니다. Codespace를 생성하고 즉시 azd를 사용할 수 있습니다.

### Docker

```bash
# 컨테이너에서 azd 실행
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# 더 쉽게 사용하기 위한 별칭 생성
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 설치 확인

설치 후 azd가 올바르게 작동하는지 확인하세요:

```bash
# 버전 확인
azd version

# 도움말 보기
azd --help

# 사용 가능한 템플릿 나열
azd template list
```

예상 출력:
```
azd version 1.5.0 (commit abc123)
```

**✅ 설치 성공 체크리스트:**
- [ ] `azd version`이 오류 없이 버전 번호를 표시
- [ ] `azd --help`가 명령 문서를 표시
- [ ] `azd template list`가 사용 가능한 템플릿을 표시
- [ ] `az account show`가 Azure 구독을 표시
- [ ] 테스트 디렉터리를 생성하고 `azd init`을 성공적으로 실행

**모든 체크가 완료되면 [첫 번째 프로젝트](first-project.md)로 진행할 준비가 된 것입니다!**

## 인증 설정

### Azure CLI 인증 (권장)
```bash
# Azure CLI가 이미 설치되어 있지 않으면 설치하세요
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure에 로그인하세요
az login

# 인증을 확인하세요
az account show
```

### 디바이스 코드 인증
헤드리스 시스템을 사용하거나 브라우저 문제가 있는 경우:
```bash
az login --use-device-code
```

### 서비스 주체 (CI/CD)
자동화된 환경용:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 구성

### 글로벌 구성
```bash
# 기본 구독 설정
azd config set defaults.subscription <subscription-id>

# 기본 위치 설정
azd config set defaults.location eastus2

# 모든 구성 보기
azd config list
```

### 환경 변수
쉘 프로파일(`.bashrc`, `.zshrc`, `.profile`)에 추가:
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
Azure Developer CLI 확장 설치:
1. VS Code 열기
2. 확장으로 이동 (Ctrl+Shift+X)
3. "Azure Developer CLI" 검색
4. 확장 설치

기능:
- azure.yaml에 대한 IntelliSense
- 통합 터미널 명령
- 템플릿 탐색
- 배포 모니터링

### GitHub Codespaces
`.devcontainer/devcontainer.json` 생성:
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
azd를 PATH에 수동으로 추가:

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

# SSL 검증 건너뛰기 (프로덕션 환경에서는 권장하지 않음)
azd config set http.insecure true
```

#### 버전 충돌
```bash
# 오래된 설치 제거
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# 구성 정리
rm -rf ~/.azd
```

### 추가 도움 받기
```bash
# 디버그 로깅 활성화
export AZD_DEBUG=true
azd <command> --debug

# 자세한 로그 보기
azd logs

# 시스템 정보 확인
azd info
```

## azd 업데이트

### 자동 업데이트
azd는 업데이트가 가능할 때 알림을 제공합니다:
```bash
azd version --check-for-updates
```

### 수동 업데이트

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
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
- `azd up`은 모든 리소스를 포함한 전체 앱을 배포
- 템플릿 기반 워크플로
- 개발자 생산성 중심

**둘 다 필요합니다**: azd는 인증을 위해 az CLI를 사용합니다.
</details>

<details>
<summary><strong>기존 Azure 리소스와 azd를 함께 사용할 수 있나요?</strong></summary>

네! 다음을 수행할 수 있습니다:
1. 기존 리소스를 azd 환경에 가져오기
2. Bicep 템플릿에서 기존 리소스를 참조
3. 기존 인프라와 함께 새로운 배포를 위해 azd 사용

자세한 내용은 [구성 가이드](configuration.md)를 참조하세요.
</details>

<details>
<summary><strong>azd는 Azure Government 또는 Azure China와 작동하나요?</strong></summary>

네, 클라우드를 구성하세요:
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
<summary><strong>azd를 CI/CD 파이프라인에서 사용할 수 있나요?</strong></summary>

물론입니다! azd는 자동화를 위해 설계되었습니다:
- GitHub Actions 통합
- Azure DevOps 지원
- 서비스 주체 인증
- 비대화형 모드

CI/CD 패턴에 대한 자세한 내용은 [배포 가이드](../deployment/deployment-guide.md)를 참조하세요.
</details>

<details>
<summary><strong>azd를 사용하는 비용은 얼마인가요?</strong></summary>

azd 자체는 **완전히 무료**이며 오픈 소스입니다. 비용은 다음에만 발생합니다:
- 배포한 Azure 리소스
- Azure 소비 비용(컴퓨팅, 스토리지 등)

배포 전에 비용을 추정하려면 `azd provision --preview`를 사용하세요.
</details>

## 다음 단계

1. **인증 완료**: Azure 구독에 액세스할 수 있는지 확인
2. **첫 번째 배포 시도**: [첫 번째 프로젝트 가이드](first-project.md)를 따르세요
3. **템플릿 탐색**: `azd template list`로 사용 가능한 템플릿 탐색
4. **IDE 구성**: 개발 환경 설정

## 지원

문제가 발생하면:
- [공식 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [문제 보고](https://github.com/Azure/azure-dev/issues)
- [커뮤니티 토론](https://github.com/Azure/azure-dev/discussions)
- [Azure 지원](https://azure.microsoft.com/support/)

---

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 1 - 기초 및 빠른 시작
- **⬅️ 이전**: [AZD 기본](azd-basics.md) 
- **➡️ 다음**: [첫 번째 프로젝트](first-project.md)
- **🚀 다음 챕터**: [챕터 2: AI-우선 개발](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ 설치 완료!** [첫 번째 프로젝트](first-project.md)로 계속 진행하여 azd로 빌드를 시작하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
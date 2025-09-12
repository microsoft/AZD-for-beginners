<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T16:58:36+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "ko"
}
-->
# 설치 및 설정 가이드

**이전:** [메인 문서](../../README.md) | **다음:** [AZD 기본 사항](azd-basics.md)

## 소개

이 포괄적인 가이드는 Azure Developer CLI(azd)를 시스템에 설치하고 구성하는 방법을 안내합니다. 다양한 운영 체제에서의 설치 방법, 인증 설정, 초기 구성 방법을 배워 Azure 배포를 위한 개발 환경을 준비할 수 있습니다.

## 학습 목표

이 레슨을 완료하면 다음을 할 수 있습니다:
- 운영 체제에 Azure Developer CLI를 성공적으로 설치
- 다양한 방법으로 Azure 인증을 설정
- 필요한 사전 요구 사항을 갖춘 개발 환경 설정
- 다양한 설치 옵션과 각 옵션을 사용하는 상황 이해
- 일반적인 설치 및 설정 문제 해결

## 학습 결과

이 레슨을 완료한 후, 다음을 수행할 수 있습니다:
- 플랫폼에 적합한 방법으로 azd를 설치
- `azd auth login`을 사용하여 Azure에 인증
- 설치를 확인하고 기본 azd 명령을 테스트
- azd를 최적화하여 사용할 수 있도록 개발 환경 구성
- 일반적인 설치 문제를 독립적으로 해결

이 가이드는 운영 체제나 개발 환경에 관계없이 Azure Developer CLI를 설치하고 구성하는 데 도움을 줍니다.

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
# Run as Administrator or with elevated privileges
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
1. [GitHub](https://github.com/Azure/azure-dev/releases)에서 최신 릴리스를 다운로드
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
# Download and install
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
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd는 GitHub Codespaces에 사전 설치되어 있습니다. Codespace를 생성하고 바로 azd를 사용할 수 있습니다.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ 설치 확인

설치 후, azd가 올바르게 작동하는지 확인하세요:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

예상 출력:
```
azd version 1.5.0 (commit abc123)
```

## 인증 설정

### Azure CLI 인증 (권장)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
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
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### 환경 변수
쉘 프로필(`.bashrc`, `.zshrc`, `.profile`)에 추가:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE 통합

### Visual Studio Code
Azure Developer CLI 확장을 설치하세요:
1. VS Code 열기
2. 확장 메뉴로 이동 (Ctrl+Shift+X)
3. "Azure Developer CLI" 검색
4. 확장 설치

기능:
- `azure.yaml`에 대한 IntelliSense
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
# Run PowerShell as Administrator
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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### 버전 충돌
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### 추가 도움 받기
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
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

## 다음 단계

1. **인증 완료**: Azure 구독에 액세스할 수 있는지 확인
2. **첫 배포 시도**: [첫 프로젝트 가이드](first-project.md)를 따라 진행
3. **템플릿 탐색**: `azd template list` 명령으로 사용 가능한 템플릿 탐색
4. **IDE 구성**: 개발 환경 설정

## 지원

문제가 발생하면:
- [공식 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [문제 보고](https://github.com/Azure/azure-dev/issues)
- [커뮤니티 토론](https://github.com/Azure/azure-dev/discussions)
- [Azure 지원](https://azure.microsoft.com/support/)

---

**이전:** [메인 문서](../../README.md) | **다음:** [AZD 기본 사항](azd-basics.md)

**설치 완료!** [첫 프로젝트](first-project.md)로 이동하여 azd를 사용해 빌드를 시작하세요.

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.
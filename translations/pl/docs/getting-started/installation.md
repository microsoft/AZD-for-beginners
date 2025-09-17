<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T17:15:33+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "pl"
}
-->
# Przewodnik instalacji i konfiguracji

**Poprzedni:** [Główna dokumentacja](../../README.md) | **Następny:** [Podstawy AZD](azd-basics.md)

## Wprowadzenie

Ten kompleksowy przewodnik przeprowadzi Cię przez proces instalacji i konfiguracji Azure Developer CLI (azd) na Twoim systemie. Dowiesz się o różnych metodach instalacji dla różnych systemów operacyjnych, konfiguracji uwierzytelniania oraz wstępnej konfiguracji, aby przygotować środowisko deweloperskie do wdrożeń w Azure.

## Cele nauki

Po zakończeniu tej lekcji będziesz:
- Pomyślnie instalować Azure Developer CLI na swoim systemie operacyjnym
- Konfigurować uwierzytelnianie z Azure za pomocą różnych metod
- Przygotowywać swoje środowisko deweloperskie z niezbędnymi wymaganiami
- Rozumieć różne opcje instalacji i wiedzieć, kiedy je stosować
- Rozwiązywać typowe problemy związane z instalacją i konfiguracją

## Efekty nauki

Po ukończeniu tej lekcji będziesz w stanie:
- Zainstalować azd za pomocą odpowiedniej metody dla swojej platformy
- Uwierzytelnić się w Azure za pomocą `azd auth login`
- Zweryfikować instalację i przetestować podstawowe polecenia azd
- Skonfigurować swoje środowisko deweloperskie dla optymalnego korzystania z azd
- Samodzielnie rozwiązywać typowe problemy związane z instalacją

Ten przewodnik pomoże Ci zainstalować i skonfigurować Azure Developer CLI na Twoim systemie, niezależnie od systemu operacyjnego czy środowiska deweloperskiego.

## Wymagania wstępne

Przed instalacją azd upewnij się, że masz:
- **Subskrypcję Azure** - [Utwórz darmowe konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Do uwierzytelniania i zarządzania zasobami
- **Git** - Do klonowania szablonów i kontroli wersji
- **Docker** (opcjonalnie) - Do aplikacji kontenerowych

## Metody instalacji

### Windows

#### Opcja 1: PowerShell (zalecane)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opcja 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opcja 3: Chocolatey
```cmd
choco install azd
```

#### Opcja 4: Instalacja ręczna
1. Pobierz najnowszą wersję z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Wypakuj do `C:\Program Files\azd\`
3. Dodaj do zmiennej środowiskowej PATH

### macOS

#### Opcja 1: Homebrew (zalecane)
```bash
brew tap azure/azd
brew install azd
```

#### Opcja 2: Skrypt instalacyjny
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcja 3: Instalacja ręczna
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opcja 1: Skrypt instalacyjny (zalecane)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcja 2: Menedżery pakietów

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

azd jest wstępnie zainstalowany w GitHub Codespaces. Wystarczy utworzyć przestrzeń roboczą i od razu zacząć korzystać z azd.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Weryfikacja instalacji

Po instalacji zweryfikuj, czy azd działa poprawnie:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Oczekiwany wynik:
```
azd version 1.5.0 (commit abc123)
```

## Konfiguracja uwierzytelniania

### Uwierzytelnianie za pomocą Azure CLI (zalecane)
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

### Uwierzytelnianie za pomocą kodu urządzenia
Jeśli korzystasz z systemu bez interfejsu graficznego lub masz problemy z przeglądarką:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Dla środowisk zautomatyzowanych:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguracja

### Konfiguracja globalna
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Zmienne środowiskowe
Dodaj do swojego profilu powłoki (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Integracja z IDE

### Visual Studio Code
Zainstaluj rozszerzenie Azure Developer CLI:
1. Otwórz VS Code
2. Przejdź do rozszerzeń (Ctrl+Shift+X)
3. Wyszukaj "Azure Developer CLI"
4. Zainstaluj rozszerzenie

Funkcje:
- IntelliSense dla azure.yaml
- Zintegrowane polecenia terminalowe
- Przeglądanie szablonów
- Monitorowanie wdrożeń

### GitHub Codespaces
Utwórz plik `.devcontainer/devcontainer.json`:
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
1. Zainstaluj wtyczkę Azure
2. Skonfiguruj poświadczenia Azure
3. Korzystaj z zintegrowanego terminala do poleceń azd

## 🐛 Rozwiązywanie problemów z instalacją

### Typowe problemy

#### Odmowa dostępu (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemy z PATH
Ręcznie dodaj azd do PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemy z siecią/proxy
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Konflikty wersji
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Uzyskiwanie dodatkowej pomocy
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Aktualizacja azd

### Automatyczne aktualizacje
azd powiadomi Cię, gdy dostępne będą aktualizacje:
```bash
azd version --check-for-updates
```

### Ręczne aktualizacje

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

## Kolejne kroki

1. **Zakończ uwierzytelnianie**: Upewnij się, że masz dostęp do swojej subskrypcji Azure
2. **Wypróbuj pierwsze wdrożenie**: Skorzystaj z [Przewodnika pierwszego projektu](first-project.md)
3. **Przeglądaj szablony**: Przeglądaj dostępne szablony za pomocą `azd template list`
4. **Skonfiguruj swoje IDE**: Przygotuj swoje środowisko deweloperskie

## Wsparcie

Jeśli napotkasz problemy:
- [Oficjalna dokumentacja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Zgłaszanie problemów](https://github.com/Azure/azure-dev/issues)
- [Dyskusje społeczności](https://github.com/Azure/azure-dev/discussions)
- [Wsparcie Azure](https://azure.microsoft.com/support/)

---

**Poprzedni:** [Główna dokumentacja](../../README.md) | **Następny:** [Podstawy AZD](azd-basics.md)

**Instalacja zakończona!** Przejdź do [Twojego pierwszego projektu](first-project.md), aby rozpocząć pracę z azd.

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby zapewnić poprawność tłumaczenia, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za źródło autorytatywne. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
# Instalacja i przewodnik konfiguracji

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD For Beginners](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [AZD Basics](azd-basics.md)
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

Ten kompleksowy przewodnik przeprowadzi Cię przez instalację i konfigurację Azure Developer CLI (azd) na Twoim systemie. Nauczysz się wielu metod instalacji dla różnych systemów operacyjnych, konfiguracji uwierzytelniania oraz wstępnej konfiguracji, aby przygotować środowisko deweloperskie do wdrożeń w Azure.

## Cele lekcji

Po zakończeniu tej lekcji będziesz:
- Pomyślnie zainstalować Azure Developer CLI na swoim systemie operacyjnym
- Skonfigurować uwierzytelnianie z Azure przy użyciu różnych metod
- Skonfigurować środowisko deweloperskie z niezbędnymi wymaganiami wstępnymi
- Zrozumieć różne opcje instalacji i kiedy używać każdej z nich
- Rozwiązywać typowe problemy z instalacją i konfiguracją

## Rezultaty nauki

Po ukończeniu tej lekcji będziesz w stanie:
- Zainstalować azd używając odpowiedniej metody dla swojej platformy
- Uwierzytelnić się w Azure używając azd auth login
- Zweryfikować instalację i przetestować podstawowe polecenia azd
- Skonfigurować środowisko deweloperskie dla optymalnego użycia azd
- Samodzielnie rozwiązywać typowe problemy z instalacją

Ten przewodnik pomoże Ci zainstalować i skonfigurować Azure Developer CLI na Twoim systemie, niezależnie od systemu operacyjnego lub środowiska deweloperskiego.

## Wymagania wstępne

Zanim zainstalujesz azd, upewnij się, że masz:
- **Subskrypcję Azure** - [Utwórz bezpłatne konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Do uwierzytelniania i zarządzania zasobami
- **Git** - Do klonowania szablonów i kontroli wersji
- **Docker** (opcjonalnie) - Do aplikacji kontenerowych

## Metody instalacji

### Windows

#### Opcja 1: PowerShell (zalecane)
```powershell
# Uruchom jako administrator lub z podwyższonymi uprawnieniami
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

#### Opcja 4: Ręczna instalacja
1. Pobierz najnowsze wydanie z [GitHub](https://github.com/Azure/azure-dev/releases)
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

#### Opcja 3: Ręczna instalacja
```bash
# Pobierz i zainstaluj
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
# Dodaj repozytorium pakietów Microsoftu
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Zainstaluj azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Dodaj repozytorium pakietów Microsoftu
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd jest wstępnie zainstalowany w GitHub Codespaces. Po prostu utwórz codespace i zacznij od razu korzystać z azd.

### Docker

```bash
# Uruchom azd w kontenerze
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Utwórz alias, aby ułatwić korzystanie
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Weryfikacja instalacji

Po instalacji zweryfikuj, czy azd działa poprawnie:

```bash
# Sprawdź wersję
azd version

# Wyświetl pomoc
azd --help

# Wyświetl listę dostępnych szablonów
azd template list
```

Oczekiwany wynik:
```
azd version 1.x.x (commit xxxxxx)
```

**Uwaga**: rzeczywisty numer wersji może się różnić. Sprawdź [wydania Azure Developer CLI](https://github.com/Azure/azure-dev/releases) w poszukiwaniu najnowszej wersji.

**✅ Lista kontrolna pomyślnej instalacji:**
- [ ] `azd version` pokazuje numer wersji bez błędów
- [ ] `azd --help` wyświetla dokumentację poleceń
- [ ] `azd template list` pokazuje dostępne szablony
- [ ] `az account show` wyświetla Twoją subskrypcję Azure
- [ ] Możesz utworzyć katalog testowy i uruchomić `azd init` pomyślnie

**Jeśli wszystkie kontrole przejdą pomyślnie, możesz przejść do [Twojego pierwszego projektu](first-project.md)!**

## Ustawienia uwierzytelniania

### Uwierzytelnianie przez Azure CLI (zalecane)
```bash
# Zainstaluj Azure CLI, jeśli nie jest jeszcze zainstalowany
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Zaloguj się do Azure
az login

# Zweryfikuj uwierzytelnienie
az account show
```

### Uwierzytelnianie kodem urządzenia
Jeśli jesteś na systemie bez interfejsu graficznego lub masz problemy z przeglądarką:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Dla środowisk automatyzowanych:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfiguracja

### Konfiguracja globalna
```bash
# Ustaw domyślną subskrypcję
azd config set defaults.subscription <subscription-id>

# Ustaw domyślną lokalizację
azd config set defaults.location eastus2

# Wyświetl całą konfigurację
azd config list
```

### Zmienne środowiskowe
Dodaj do profilu powłoki (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfiguracja Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfiguracja azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Włącz logowanie debugowe
```

## Integracja z IDE

### Visual Studio Code
Zainstaluj rozszerzenie Azure Developer CLI:
1. Otwórz VS Code
2. Przejdź do Rozszerzeń (Ctrl+Shift+X)
3. Wyszukaj "Azure Developer CLI"
4. Zainstaluj rozszerzenie

Funkcje:
- IntelliSense dla azure.yaml
- Zintegrowane polecenia terminala
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
3. Używaj zintegrowanego terminala do poleceń azd

## 🐛 Rozwiązywanie problemów z instalacją

### Typowe problemy

#### Odmowa dostępu (Windows)
```powershell
# Uruchom PowerShell jako administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemy z PATH
Ręcznie dodaj azd do zmiennej PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemy sieciowe/proxy
```bash
# Skonfiguruj serwer proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Pomiń weryfikację SSL (niezalecane w środowisku produkcyjnym)
azd config set http.insecure true
```

#### Konflikty wersji
```bash
# Usuń stare instalacje
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Wyczyść konfigurację
rm -rf ~/.azd
```

### Uzyskanie dodatkowej pomocy
```bash
# Włącz logowanie debugowe
export AZD_DEBUG=true
azd <command> --debug

# Wyświetl bieżącą konfigurację
azd config list

# Wyświetl bieżący stan wdrożenia
azd show
```

## Aktualizacja azd

### Aktualizacje automatyczne
azd powiadomi Cię, gdy będą dostępne aktualizacje:
```bash
azd version --check-for-updates
```

### Aktualizacje ręczne

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

## 💡 Często zadawane pytania

<details>
<summary><strong>Jaka jest różnica między azd a az CLI?</strong></summary>

**Azure CLI (az)**: Narzędzie niskopoziomowe do zarządzania pojedynczymi zasobami Azure
- `az webapp create`, `az storage account create`
- Jeden zasób naraz
- Skoncentrowane na zarządzaniu infrastrukturą

**Azure Developer CLI (azd)**: Narzędzie wysokiego poziomu do kompleksowych wdrożeń aplikacji
- `azd up` wdraża całą aplikację ze wszystkimi zasobami
- Przepływy pracy oparte na szablonach
- Skoncentrowane na produktywności dewelopera

**Potrzebujesz obu**: azd używa az CLI do uwierzytelniania
</details>

<details>
<summary><strong>Czy mogę używać azd z istniejącymi zasobami Azure?</strong></summary>

Tak! Możesz:
1. Importować istniejące zasoby do środowisk azd
2. Odnosić się do istniejących zasobów w swoich szablonach Bicep
3. Używać azd do nowych wdrożeń obok istniejącej infrastruktury

Zobacz [Przewodnik konfiguracyjny](configuration.md) po szczegóły.
</details>

<details>
<summary><strong>Czy azd działa z Azure Government lub Azure China?</strong></summary>

Tak, skonfiguruj chmurę:
```bash
# Azure dla rządu
az cloud set --name AzureUSGovernment
az login

# Azure w Chinach
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Czy mogę używać azd w potokach CI/CD?</strong></summary>

Zdecydowanie! azd jest zaprojektowany do automatyzacji:
- Integracja z GitHub Actions
- Obsługa Azure DevOps
- Uwierzytelnianie za pomocą service principal
- Tryb bez interakcji

Zobacz [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) po wzorce CI/CD.
</details>

<details>
<summary><strong>Jaki jest koszt korzystania z azd?</strong></summary>

Samo azd jest **całkowicie darmowe** i open-source. Płacisz tylko za:
- Zasoby Azure, które wdrażasz
- Koszty zużycia Azure (obliczenia, przechowywanie itp.)

Użyj `azd provision --preview`, aby oszacować koszty przed wdrożeniem.
</details>

## Następne kroki

1. **Ukończ uwierzytelnianie**: Upewnij się, że masz dostęp do swojej subskrypcji Azure
2. **Wypróbuj pierwsze wdrożenie**: Postępuj zgodnie z [Przewodnikiem pierwszego projektu](first-project.md)
3. **Przeglądaj szablony**: Przeglądaj dostępne szablony poleceniem `azd template list`
4. **Skonfiguruj swoje IDE**: Skonfiguruj środowisko deweloperskie

## Wsparcie

Jeśli napotkasz problemy:
- [Oficjalna dokumentacja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Zgłoś problemy](https://github.com/Azure/azure-dev/issues)
- [Dyskusje społeczności](https://github.com/Azure/azure-dev/discussions)
- [Wsparcie Azure](https://azure.microsoft.com/support/)

---

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD For Beginners](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [AZD Basics](azd-basics.md) 
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalacja zakończona!** Przejdź do [Twojego pierwszego projektu](first-project.md), aby zacząć budować z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony z użyciem usługi tłumaczeń opartych na sztucznej inteligencji [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako wersję wiążącą. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z usług profesjonalnego tłumacza. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
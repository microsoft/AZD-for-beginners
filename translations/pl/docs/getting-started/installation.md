# Przewodnik instalacji i konfiguracji

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md)
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój z AI na pierwszym miejscu](../microsoft-foundry/microsoft-foundry-integration.md)

## Wprowadzenie

Ten kompleksowy przewodnik przeprowadzi Cię przez proces instalacji i konfiguracji Azure Developer CLI (azd) na Twoim systemie. Nauczysz się różnych metod instalacji dla różnych systemów operacyjnych, konfiguracji uwierzytelniania oraz wstępnej konfiguracji, aby przygotować środowisko deweloperskie do wdrożeń w Azure.

## Cele nauki

Po zakończeniu tej lekcji będziesz w stanie:
- Pomyślnie zainstalować Azure Developer CLI na swoim systemie operacyjnym
- Skonfigurować uwierzytelnianie z Azure za pomocą różnych metod
- Przygotować swoje środowisko deweloperskie z niezbędnymi wymaganiami wstępnymi
- Zrozumieć różne opcje instalacji i kiedy je stosować
- Rozwiązywać typowe problemy z instalacją i konfiguracją

## Rezultaty nauki

Po ukończeniu tej lekcji będziesz w stanie:
- Zainstalować azd za pomocą odpowiedniej metody dla swojej platformy
- Uwierzytelnić się w Azure za pomocą `azd auth login`
- Zweryfikować instalację i przetestować podstawowe polecenia azd
- Skonfigurować swoje środowisko deweloperskie do optymalnego korzystania z azd
- Samodzielnie rozwiązywać typowe problemy z instalacją

Ten przewodnik pomoże Ci zainstalować i skonfigurować Azure Developer CLI na Twoim systemie, niezależnie od systemu operacyjnego czy środowiska deweloperskiego.

## Wymagania wstępne

Przed instalacją azd upewnij się, że masz:
- **Subskrypcję Azure** - [Utwórz darmowe konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Do uwierzytelniania i zarządzania zasobami
- **Git** - Do klonowania szablonów i kontroli wersji
- **Docker** (opcjonalnie) - Do aplikacji kontenerowych

## Metody instalacji

### Windows

#### Opcja 1: PowerShell (zalecana)
```powershell
# Uruchom jako Administrator lub z podwyższonymi uprawnieniami
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opcja 2: Menedżer pakietów Windows (winget)
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

#### Opcja 1: Homebrew (zalecana)
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
# Pobierz i zainstaluj
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opcja 1: Skrypt instalacyjny (zalecany)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcja 2: Menedżery pakietów

**Ubuntu/Debian:**
```bash
# Dodaj repozytorium pakietów Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Zainstaluj azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Dodaj repozytorium pakietów Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd jest wstępnie zainstalowany w GitHub Codespaces. Po prostu utwórz przestrzeń kodu i od razu zacznij korzystać z azd.

### Docker

```bash
# Uruchom azd w kontenerze
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Utwórz alias dla łatwiejszego użycia
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Weryfikacja instalacji

Po instalacji zweryfikuj, czy azd działa poprawnie:

```bash
# Sprawdź wersję
azd version

# Wyświetl pomoc
azd --help

# Wyświetl dostępne szablony
azd template list
```

Oczekiwany wynik:
```
azd version 1.5.0 (commit abc123)
```

**✅ Lista kontrolna sukcesu instalacji:**
- [ ] `azd version` wyświetla numer wersji bez błędów
- [ ] `azd --help` wyświetla dokumentację poleceń
- [ ] `azd template list` pokazuje dostępne szablony
- [ ] `az account show` wyświetla Twoją subskrypcję Azure
- [ ] Możesz utworzyć katalog testowy i pomyślnie uruchomić `azd init`

**Jeśli wszystkie kontrole przejdą pomyślnie, możesz przejść do [Twojego pierwszego projektu](first-project.md)!**

## Konfiguracja uwierzytelniania

### Uwierzytelnianie za pomocą Azure CLI (zalecane)
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

### Uwierzytelnianie za pomocą kodu urządzenia
Jeśli korzystasz z systemu bez interfejsu graficznego lub masz problemy z przeglądarką:
```bash
az login --use-device-code
```

### Principal usługi (CI/CD)
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
# Ustaw domyślną subskrypcję
azd config set defaults.subscription <subscription-id>

# Ustaw domyślną lokalizację
azd config set defaults.location eastus2

# Wyświetl całą konfigurację
azd config list
```

### Zmienne środowiskowe
Dodaj do swojego profilu powłoki (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfiguracja Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfiguracja azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Włącz debugowanie logów
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
# Uruchom PowerShell jako Administrator
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
# Skonfiguruj proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Pomiń weryfikację SSL (niezalecane w środowisku produkcyjnym)
azd config set http.insecure true
```

#### Konflikty wersji
```bash
# Usuń stare instalacje
# Windows: winget odinstaluj Microsoft.Azd
# macOS: brew odinstaluj azd
# Linux: sudo apt usuń azd

# Wyczyść konfigurację
rm -rf ~/.azd
```

### Uzyskiwanie dodatkowej pomocy
```bash
# Włącz rejestrowanie debugowania
export AZD_DEBUG=true
azd <command> --debug

# Wyświetl szczegółowe logi
azd logs

# Sprawdź informacje o systemie
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

## 💡 Najczęściej zadawane pytania

<details>
<summary><strong>Jaka jest różnica między azd a az CLI?</strong></summary>

**Azure CLI (az)**: Narzędzie niskopoziomowe do zarządzania pojedynczymi zasobami Azure
- `az webapp create`, `az storage account create`
- Jeden zasób na raz
- Skupienie na zarządzaniu infrastrukturą

**Azure Developer CLI (azd)**: Narzędzie wysokopoziomowe do pełnych wdrożeń aplikacji
- `azd up` wdraża całą aplikację z wszystkimi zasobami
- Przepływy pracy oparte na szablonach
- Skupienie na produktywności dewelopera

**Potrzebujesz obu**: azd używa az CLI do uwierzytelniania
</details>

<details>
<summary><strong>Czy mogę używać azd z istniejącymi zasobami Azure?</strong></summary>

Tak! Możesz:
1. Importować istniejące zasoby do środowisk azd
2. Odnosić się do istniejących zasobów w swoich szablonach Bicep
3. Używać azd do nowych wdrożeń obok istniejącej infrastruktury

Zobacz [Przewodnik konfiguracji](configuration.md) po szczegóły.
</details>

<details>
<summary><strong>Czy azd działa z Azure Government lub Azure China?</strong></summary>

Tak, skonfiguruj chmurę:
```bash
# Azure Rządowy
az cloud set --name AzureUSGovernment
az login

# Azure Chiny
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Czy mogę używać azd w pipeline'ach CI/CD?</strong></summary>

Oczywiście! azd jest zaprojektowany do automatyzacji:
- Integracja z GitHub Actions
- Wsparcie dla Azure DevOps
- Uwierzytelnianie za pomocą principal usługi
- Tryb bez interakcji

Zobacz [Przewodnik wdrożeniowy](../deployment/deployment-guide.md) dla wzorców CI/CD.
</details>

<details>
<summary><strong>Jaki jest koszt korzystania z azd?</strong></summary>

azd sam w sobie jest **całkowicie darmowy** i open-source. Płacisz jedynie za:
- Zasoby Azure, które wdrażasz
- Koszty zużycia Azure (obliczenia, przechowywanie itp.)

Użyj `azd provision --preview`, aby oszacować koszty przed wdrożeniem.
</details>

## Kolejne kroki

1. **Ukończ uwierzytelnianie**: Upewnij się, że masz dostęp do swojej subskrypcji Azure
2. **Spróbuj swojego pierwszego wdrożenia**: Postępuj zgodnie z [Przewodnikiem pierwszego projektu](first-project.md)
3. **Eksploruj szablony**: Przeglądaj dostępne szablony za pomocą `azd template list`
4. **Skonfiguruj swoje IDE**: Przygotuj swoje środowisko deweloperskie

## Wsparcie

Jeśli napotkasz problemy:
- [Oficjalna dokumentacja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Zgłaszanie problemów](https://github.com/Azure/azure-dev/issues)
- [Dyskusje społeczności](https://github.com/Azure/azure-dev/discussions)
- [Wsparcie Azure](https://azure.microsoft.com/support/)

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md) 
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój z AI na pierwszym miejscu](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Instalacja zakończona!** Przejdź do [Twojego pierwszego projektu](first-project.md), aby rozpocząć pracę z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
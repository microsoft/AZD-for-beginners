# Przewodnik instalacji i konfiguracji

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md)
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój oparty na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

Ten kompleksowy przewodnik przeprowadzi Cię przez instalację i konfigurację Azure Developer CLI (azd) na Twoim systemie. Nauczysz się różnych metod instalacji dla różnych systemów operacyjnych, konfiguracji uwierzytelniania oraz początkowej konfiguracji, aby przygotować środowisko deweloperskie do wdrożeń w Azure.

## Cele nauki

Po zakończeniu tej lekcji będziesz w stanie:
- Pomyślnie zainstalować Azure Developer CLI na swoim systemie operacyjnym
- Skonfigurować uwierzytelnianie z Azure za pomocą różnych metod
- Przygotować środowisko deweloperskie z niezbędnymi wymaganiami wstępnymi
- Zrozumieć różne opcje instalacji i wiedzieć, kiedy która jest odpowiednia
- Rozwiązywać typowe problemy z instalacją i konfiguracją

## Wyniki nauki

Po ukończeniu tej lekcji będziesz mógł:
- Zainstalować azd za pomocą odpowiedniej metody dla Twojej platformy
- Uwierzytelnić się w Azure za pomocą polecenia azd auth login
- Zweryfikować instalację i przetestować podstawowe polecenia azd
- Skonfigurować środowisko deweloperskie dla optymalnego korzystania z azd
- Samodzielnie rozwiązać typowe problemy z instalacją

Ten przewodnik pomoże Ci zainstalować i skonfigurować Azure Developer CLI na Twoim systemie, niezależnie od systemu operacyjnego czy środowiska programistycznego.

## Wymagania wstępne

Przed instalacją azd upewnij się, że masz:
- **Subskrypcję Azure** - [Utwórz darmowe konto](https://azure.microsoft.com/free/)
- **Azure CLI** (opcjonalnie) - Do przykładów, które jawnie uruchamiają `az`; azd uwierzytelnia się niezależnie
- **Git** - Do klonowania szablonów i kontroli wersji
- **Docker** (opcjonalnie) - Do aplikacji konteneryzowanych

**Ścieżka GA Foundry w rozdziale 2:** Używaj AZD **1.37.0 lub nowszej**, instaluj pakiet z `azd ext install microsoft.foundry`, oraz używaj Pythona **3.13+** i aktualnego **uv** dla próbki hostowanego agenta. Tryb wdrażania kodu buduje zdalnie, więc nie wymaga lokalnej kompilacji Dockera. Nadal wymagane są uprawnienia Foundry, regionalna dostępność modeli i limity; zobacz [konfigurację hostowanego agenta](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Metody instalacji

### Windows

#### Opcja 1: Windows Package Manager (zalecane)
```cmd
winget install microsoft.azd
```

#### Opcja 2: Skrypt instalacyjny PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opcja 3: Chocolatey
```cmd
choco install azd
```

#### Opcja 4: Instalacja ręczna
1. Pobierz najnowszą wersję z [GitHub](https://github.com/Azure/azure-dev/releases)
2. Rozpakuj do `C:\Program Files\azd\`
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
Pobierz archiwum dla swojej architektury macOS z [assetów wydania](https://github.com/Azure/azure-dev/releases), rozpakuj je i dodaj binarkę `azd` do swojego `PATH`.

### Linux

#### Opcja 1: Skrypt instalacyjny (zalecane)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcja 2: Menedżery pakietów

**Ręczna instalacja z assetów wydania:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Niektóre środowiska Codespaces i kontenery deweloperskie już zawierają `azd`, ale należy to sprawdzić, a nie zakładać:

```bash
azd version
```

Jeśli `azd` brakuje, zainstaluj go standardowym skryptem dla środowiska.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Ten ulotny kontener nie zachowuje stanu logowania między uruchomieniami. Do wielokrotnych wdrożeń użyj [konfiguracji kontenera deweloperskiego](dev-containers.md); budowy kontenerów wymagają także dostępnego demona Dockera wewnątrz kontenera.

## ✅ Weryfikacja instalacji

Po instalacji sprawdź, czy azd działa poprawnie:

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
azd version 1.x.x (commit xxxxxx)
```

**Uwaga**: Rzeczywista wersja może się różnić. Sprawdź [wydania Azure Developer CLI](https://github.com/Azure/azure-dev/releases) dla najnowszej wersji.

**✅ Lista kontrolna udanej instalacji:**
- [ ] `azd version` pokazuje numer wersji bez błędów
- [ ] `azd --help` wyświetla dokumentację poleceń
- [ ] `azd template list` pokazuje dostępne szablony
- [ ] Możesz utworzyć testowy katalog i pomyślnie uruchomić `azd init`

**Jeśli wszystkie testy przejdą pomyślnie, możesz przejść do [Twojego pierwszego projektu](first-project.md)!**

## Konfiguracja uwierzytelniania

### Zalecana konfiguracja dla początkujących

Dla przepływów AZD-first zaloguj się za pomocą `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Używaj logowania Azure CLI tylko jeśli planujesz samodzielnie uruchamiać polecenia `az` podczas kursu.

### Uwierzytelnianie Azure CLI (opcjonalnie)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Którego przepływu logowania powinieneś użyć?

- Używaj `azd auth login` jeśli podążasz za ścieżką początkującą AZD i głównie uruchamiasz polecenia `azd`.
- Używaj także `az login`, gdy chcesz uruchamiać polecenia Azure CLI, takie jak `az account show` lub bezpośrednio przeglądać zasoby.
- Jeśli ćwiczenie obejmuje zarówno polecenia `azd`, jak i `az`, wykonaj oba polecenia logowania na początku.

### Uwierzytelnianie przez kod urządzenia
Jeśli pracujesz na systemie bez interfejsu graficznego lub masz problemy z przeglądarką:
```bash
azd auth login --use-device-code
```

### Konta usługi (CI/CD)
Dla środowisk zautomatyzowanych:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Sprawdź swoją kompletną konfigurację

Jeśli chcesz szybko sprawdzić gotowość przed rozpoczęciem Rozdziału 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfiguracja

### Konfiguracja globalna
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Zmienne środowiskowe
Dodaj do profilu powłoki (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
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
Utwórz `.devcontainer/devcontainer.json`:
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

#### Brak uprawnień (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemy ze zmienną PATH
Ręcznie dodaj azd do swojej zmiennej PATH:

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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Konflikty wersji
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Gdzie uzyskać więcej pomocy
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Aktualizacja azd

### Sprawdzenie aktualizacji
azd ostrzega, kiedy dostępne jest nowsze wydanie, a aktualną wersję możesz sprawdzić poleceniem:
```bash
azd version
```

### Aktualizacje ręczne

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

## 💡 Najczęściej zadawane pytania

<details>
<summary><strong>Jaka jest różnica między azd a az CLI?</strong></summary>

**Azure CLI (az)**: Narzędzie niskiego poziomu do zarządzania pojedynczymi zasobami Azure
- `az webapp create`, `az storage account create`
- Jeden zasób naraz
- Skupienie na zarządzaniu infrastrukturą

**Azure Developer CLI (azd)**: Narzędzie wysokiego poziomu do kompleksowych wdrożeń aplikacji
- `azd up` wdraża całą aplikację z wszystkimi zasobami
- Przepływy pracy oparte na szablonach
- Skupienie na produktywności dewelopera

**Są niezależne**: azd domyślnie używa własnego uwierzytelniania. Instaluj i loguj się do Azure CLI tylko do poleceń `az` lub wyraźnie decyduj się na `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Czy mogę używać azd z istniejącymi zasobami Azure?</strong></summary>

Tak! Możesz:
1. Importować istniejące zasoby do środowisk azd
2. Odwoływać się do istniejących zasobów w szablonach Bicep
3. Używać azd do nowych wdrożeń obok istniejącej infrastruktury

Szczegóły znajdziesz w [Przewodniku konfiguracji](../chapter-03-configuration/configuration.md).
</details>

<details>
<summary><strong>Czy azd działa z Azure Government lub Azure China?</strong></summary>

Tak, skonfiguruj chmurę:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Jeśli używasz również Azure CLI, skonfiguruj `az cloud set --name ...` osobno. Usługi i dostępność modeli w szablonach różnią się w zależności od chmury.
</details>

<details>
<summary><strong>Czy mogę używać azd w pipeline’ach CI/CD?</strong></summary>

Oczywiście! azd jest zaprojektowany do automatyzacji:
- Integracja z GitHub Actions
- Wsparcie Azure DevOps
- Uwierzytelnianie za pomocą konta usługi
- Tryb bez interakcji

Zobacz [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) dla wzorców CI/CD.
</details>

<details>
<summary><strong>Ile kosztuje korzystanie z azd?</strong></summary>

Sam azd jest **całkowicie darmowy** i open-source. Płacisz tylko za:
- Zasoby Azure, które wdrażasz
- Koszty zużycia Azure (obliczenia, magazyn itd.)

Użyj `azd provision --preview` do analizy proponowanych zasobów, a następnie oszacuj ich koszty za pomocą [Kalkulatora cen Azure](https://azure.microsoft.com/pricing/calculator/). Podgląd nie oblicza cen.
</details>

## Kolejne kroki

1. **Ukończ uwierzytelnianie**: upewnij się, że masz dostęp do swojej subskrypcji Azure
2. **Spróbuj pierwszego wdrożenia**: postępuj zgodnie z [Przewodnikiem pierwszego projektu](first-project.md)
3. **Przeglądaj szablony**: Przeglądaj dostępne szablony za pomocą `azd template list`
4. **Skonfiguruj swoje IDE**: przygotuj środowisko deweloperskie

## Wsparcie

Jeśli napotkasz problemy:
- [Oficjalna dokumentacja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Zgłoś problem](https://github.com/Azure/azure-dev/issues)
- [Dyskusje społeczności](https://github.com/Azure/azure-dev/discussions)
- [Wsparcie Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Uzyskaj wskazówki dotyczące poleceń Azure bezpośrednio w edytorze dzięki `npx skills add microsoft/github-copilot-for-azure`

---

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md) 
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój oparty na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalacja zakończona!** Kontynuuj do [Twojego pierwszego projektu](first-project.md), aby rozpocząć budowanie z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
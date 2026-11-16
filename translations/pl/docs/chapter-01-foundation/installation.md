# Przewodnik instalacji i konfiguracji

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md)
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój zorientowany na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

Ten kompleksowy przewodnik przeprowadzi Cię przez proces instalacji i konfiguracji Azure Developer CLI (azd) na Twoim systemie. Poznasz różne metody instalacji dla różnych systemów operacyjnych, konfigurację uwierzytelniania oraz wstępną konfigurację, aby przygotować środowisko programistyczne do wdrożeń w Azure.

## Cele nauki

Po zakończeniu tej lekcji będziesz w stanie:
- Pomyślnie zainstalować Azure Developer CLI w swoim systemie operacyjnym
- Skonfigurować uwierzytelnianie w Azure za pomocą różnych metod
- Przygotować środowisko programistyczne z niezbędnymi wymaganiami wstępnymi
- Zrozumieć różne opcje instalacji i wiedzieć, kiedy ich używać
- Rozwiązywać typowe problemy z instalacją i konfiguracją

## Rezultaty nauki

Po ukończeniu tej lekcji będziesz mógł:
- Zainstalować azd używając odpowiedniej dla Twojej platformy metody
- Uwierzytelnić się w Azure za pomocą polecenia azd auth login
- Zweryfikować instalację i przetestować podstawowe polecenia azd
- Skonfigurować środowisko programistyczne dla optymalnego użycia azd
- Samodzielnie rozwiązywać typowe problemy instalacyjne

Ten przewodnik pomoże Ci zainstalować i skonfigurować Azure Developer CLI na Twoim systemie, niezależnie od systemu operacyjnego czy środowiska programistycznego.

## Wymagania wstępne

Przed instalacją azd upewnij się, że masz:
- **Subskrypcję Azure** - [Utwórz darmowe konto](https://azure.microsoft.com/free/)
- **Azure CLI** (opcjonalnie) - Do przykładów, które wyraźnie uruchamiają `az`; azd uwierzytelnia się niezależnie
- **Git** - Do klonowania szablonów i kontroli wersji
- **Docker** (opcjonalnie) - Do konteneryzowanych aplikacji

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
Pobierz archiwum dla architektury macOS z [zasobów wydania](https://github.com/Azure/azure-dev/releases), wypakuj je i dodaj binarkę `azd` do swojego `PATH`.

### Linux

#### Opcja 1: Skrypt instalacyjny (zalecane)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opcja 2: Menedżery pakietów

**Instalacja ręczna z zasobów wydania:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Niektóre środowiska Codespaces i kontenery deweloperskie mają już zainstalowany `azd`, ale powinieneś to zweryfikować, a nie zakładać:

```bash
azd version
```

Jeśli `azd` brakuje, zainstaluj go standardowym skryptem dla danego środowiska.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Ten tymczasowy kontener nie zachowuje stanu logowania między uruchomieniami. Do powtarzających się wdrożeń używaj [konfiguracji dev container](dev-containers.md); budowanie kontenerów wymaga także dostępu do demona Dockera wewnątrz kontenera.

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

Oczekiwany rezultat:
```
azd version 1.x.x (commit xxxxxx)
```

**Uwaga**: Rzeczywista wersja może się różnić. Sprawdź [wydań Azure Developer CLI](https://github.com/Azure/azure-dev/releases) po najnowszą wersję.

**✅ Lista kontrolna poprawnej instalacji:**
- [ ] `azd version` wyświetla numer wersji bez błędów
- [ ] `azd --help` wyświetla dokumentację poleceń
- [ ] `azd template list` pokazuje dostępne szablony
- [ ] Możesz utworzyć testowy katalog i pomyślnie uruchomić `azd init`

**Jeśli wszystkie kontrole się powiodły, możesz przejść do [Twojego pierwszego projektu](first-project.md)!**

## Konfiguracja uwierzytelniania

### Zalecana konfiguracja dla początkujących

Dla przepływów pracy nastawionych na AZD zaloguj się za pomocą `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Używaj logowania Azure CLI tylko wtedy, gdy planujesz samodzielnie uruchamiać polecenia `az` podczas kursu.

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

### Którego procesu logowania powinieneś używać?

- Używaj `azd auth login`, jeśli podążasz ścieżką początkującego AZD i głównie uruchamiasz polecenia `azd`.
- Używaj także `az login`, gdy chcesz uruchamiać polecenia Azure CLI takie jak `az account show` lub bezpośrednio przeglądać zasoby.
- Jeśli ćwiczenie zawiera zarówno polecenia `azd`, jak i `az`, uruchom oba polecenia logowania na początku.

### Uwierzytelnianie kodem urządzenia
Jeśli korzystasz z systemu bez interfejsu graficznego lub masz problemy z przeglądarką:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Dla środowisk zautomatyzowanych:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Walidacja kompletnej konfiguracji

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
3. Korzystaj ze zintegrowanego terminala do poleceń azd

## 🐛 Rozwiązywanie problemów z instalacją

### Typowe problemy

#### Brak uprawnień (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problemy ze zmienną PATH
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

### Uzyskanie dodatkowej pomocy
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Aktualizacja azd

### Sprawdzanie aktualizacji
azd informuje, gdy dostępna jest nowsza wersja, a swoją aktualną wersję możesz sprawdzić poleceniem:
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
- Jeden zasób na raz
- Skupienie na zarządzaniu infrastrukturą

**Azure Developer CLI (azd)**: Narzędzie wysokiego poziomu do kompleksowych wdrożeń aplikacji
- `azd up` wdraża całą aplikację ze wszystkimi zasobami
- Przepływy pracy oparte na szablonach
- Skupione na produktywności dewelopera

**Są niezależne**: azd domyślnie używa własnego uwierzytelniania. Instaluj i loguj się do Azure CLI tylko do poleceń `az` lub świadomie zdecyduj się na `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Czy mogę używać azd z istniejącymi zasobami Azure?</strong></summary>

Tak! Możesz:
1. Importować istniejące zasoby do środowisk azd
2. Odwoływać się do istniejących zasobów w szablonach Bicep
3. Używać azd do nowych wdrożeń obok istniejącej infrastruktury

Zobacz [Przewodnik konfiguracji](../chapter-03-configuration/configuration.md) po szczegóły.
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

Jeśli korzystasz także z Azure CLI, skonfiguruj `az cloud set --name ...` osobno. Usługi szablonów i dostępność modeli różnią się w zależności od chmury.
</details>

<details>
<summary><strong>Czy mogę używać azd w pipeline'ach CI/CD?</strong></summary>

Oczywiście! azd jest zaprojektowany pod automatyzację:
- Integracja z GitHub Actions
- Wsparcie Azure DevOps
- Uwierzytelnianie service principal
- Tryb bezinteraktywny

Zobacz [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) dla wzorców CI/CD.
</details>

<details>
<summary><strong>Ile kosztuje korzystanie z azd?</strong></summary>

Sam azd jest **całkowicie darmowy** i open-source. Płacisz tylko za:
- Zasoby Azure, które wdrażasz
- Koszty zużycia Azure (obliczenia, magazyn itp.)

Używaj `azd provision --preview` do przeglądu proponowanych zasobów, a następnie szacuj ich koszty za pomocą [Kalkulatora cen Azure](https://azure.microsoft.com/pricing/calculator/). Podgląd nie oblicza cen.
</details>

## Kolejne kroki

1. **Zakończ uwierzytelnianie**: Upewnij się, że masz dostęp do subskrypcji Azure
2. **Spróbuj pierwszego wdrożenia**: Postępuj według [Przewodnika pierwszego projektu](first-project.md)
3. **Przeglądaj szablony**: Przeglądaj dostępne szablony za pomocą `azd template list`
4. **Skonfiguruj swoje IDE**: Przygotuj środowisko programistyczne

## Wsparcie

Jeśli napotkasz problemy:
- [Oficjalna dokumentacja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Zgłaszanie problemów](https://github.com/Azure/azure-dev/issues)
- [Dyskusje społeczności](https://github.com/Azure/azure-dev/discussions)
- [Wsparcie Azure](https://azure.microsoft.com/support/)
- [**Umiejętności agenta Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Uzyskaj wskazówki dotyczące poleceń Azure bezpośrednio w edytorze za pomocą `npx skills add microsoft/github-copilot-for-azure`

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md) 
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój zorientowany na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalacja zakończona!** Kontynuuj do [Twojego pierwszego projektu](first-project.md), aby rozpocząć pracę z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
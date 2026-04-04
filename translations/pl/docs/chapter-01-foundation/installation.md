# Przewodnik instalacji i konfiguracji

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md)
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: Programowanie z AI jako pierwszym](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Wprowadzenie

Ten kompleksowy przewodnik przeprowadzi Cię przez instalację i konfigurację Azure Developer CLI (azd) na Twoim systemie. Nauczysz się różnych metod instalacji dla różnych systemów operacyjnych, ustawiania uwierzytelniania oraz początkowej konfiguracji, aby przygotować swoje środowisko programistyczne do wdrażania w Azure.

## Cele nauki

Po zakończeniu tej lekcji:
- Pomyślnie zainstalujesz Azure Developer CLI w swoim systemie operacyjnym
- Skonfigurujesz uwierzytelnianie z Azure różnymi metodami
- Przygotujesz środowisko programistyczne z niezbędnymi wymaganiami wstępnymi
- Zrozumiesz różne opcje instalacji i kiedy je stosować
- Poradzisz sobie z typowymi problemami podczas instalacji i konfiguracji

## Rezultaty nauki

Po ukończeniu lekcji będziesz umiał:
- Zainstalować azd używając odpowiedniej metody dla swojej platformy
- Zalogować się do Azure za pomocą azd auth login
- Zweryfikować instalację i przetestować podstawowe polecenia azd
- Skonfigurować środowisko programistyczne do optymalnego użycia azd
- Samodzielnie rozwiązywać typowe problemy z instalacją

Ten przewodnik pomoże Ci zainstalować i skonfigurować Azure Developer CLI na Twoim systemie, niezależnie od systemu operacyjnego czy środowiska programistycznego.

## Wymagania wstępne

Przed instalacją azd upewnij się, że masz:
- **Subskrypcję Azure** - [Utwórz darmowe konto](https://azure.microsoft.com/free/)
- **Azure CLI** - Do uwierzytelniania i zarządzania zasobami
- **Git** - Do klonowania szablonów i kontroli wersji
- **Docker** (opcjonalnie) - Do aplikacji kontenerowych

## Metody instalacji

### Windows

#### Opcja 1: Windows Package Manager (zalecane)
```cmd
winget install microsoft.azd
```

#### Opcja 2: Skrypt instalacyjny PowerShell
```powershell
# Przydatne, gdy winget jest niedostępny
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

**Ręczna instalacja z plików wydania:**
```bash
# Pobierz najnowsze archiwum dla swojej architektury Linux z:
# https://github.com/Azure/azure-dev/releases
# Następnie rozpakuj je i dodaj plik binarny azd do swojej ścieżki PATH.
```

### GitHub Codespaces

Niektóre środowiska Codespaces i kontenery deweloperskie już zawierają `azd`, ale powinieneś to zweryfikować zamiast zakładać:

```bash
azd version
```

Jeśli `azd` jest nieobecny, zainstaluj go standardowym skryptem dla środowiska.

### Docker

```bash
# Uruchom azd w kontenerze
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Utwórz alias dla łatwiejszego użycia
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Weryfikacja instalacji

Po instalacji sprawdź, czy azd działa poprawnie:

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
azd version 1.x.x (commit xxxxxx)
```

**Uwaga**: Rzeczywista wersja może się różnić. Sprawdź [wydania Azure Developer CLI](https://github.com/Azure/azure-dev/releases) po najnowszą wersję.

**✅ Lista kontrolna pomyślnej instalacji:**
- [ ] `azd version` pokazuje numer wersji bez błędów
- [ ] `azd --help` wyświetla dokumentację poleceń
- [ ] `azd template list` pokazuje dostępne szablony
- [ ] Możesz utworzyć testowy katalog i pomyślnie uruchomić `azd init`

**Jeśli wszystkie testy są pozytywne, możesz przejść do [Twojego pierwszego projektu](first-project.md)!**

## Konfiguracja uwierzytelniania

### Zalecana konfiguracja dla początkujących

Dla przepływów pracy skoncentrowanych na AZD zaloguj się poleceniem `azd auth login`.

```bash
# Wymagane dla poleceń AZD, takich jak azd up
azd auth login

# Sprawdź status uwierzytelnienia AZD
azd auth login --check-status
```

Używaj logowania Azure CLI tylko jeśli planujesz samodzielnie wykonywać polecenia `az` podczas kursu.

### Uwierzytelnianie Azure CLI (opcjonalne)
```bash
# Zainstaluj Azure CLI, jeśli nie jest jeszcze zainstalowany
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: zapoznaj się z dokumentacją instalacji Azure CLI dla swojej dystrybucji

# Zaloguj się do Azure
az login

# Zweryfikuj uwierzytelnienie
az account show
```

### Który sposób logowania wybrać?

- Używaj `azd auth login`, jeśli korzystasz z początkującej ścieżki AZD i głównie wykonujesz polecenia `azd`.
- Użyj także `az login`, gdy chcesz wykonywać polecenia Azure CLI, np. `az account show` lub bezpośrednio przeglądać zasoby.
- Jeśli ćwiczenie obejmuje polecenia `azd` i `az`, wykonaj oba logowania na początku.

### Uwierzytelnianie kodem urządzenia
Jeśli pracujesz na systemie bez GUI lub masz problemy z przeglądarką:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
Dla środowisk zautomatyzowanych:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Sprawdź kompletną konfigurację

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
# Ustaw domyślną subskrypcję
azd config set defaults.subscription <subscription-id>

# Ustaw domyślną lokalizację
azd config set defaults.location eastus2

# Wyświetl całą konfigurację
azd config show
```

### Zmienne środowiskowe
Dodaj do profilu powłoki (`.bashrc`, `.zshrc`, `.profile`):
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
- Zintegrowana konsola terminala
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

#### Problemy ze zmienną PATH
Dodaj azd ręcznie do PATH:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problemy sieciowe / Proxy
```bash
# Konfiguruj proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Pomijaj weryfikację SSL (niezalecane w środowisku produkcyjnym)
azd config set http.insecure true
```

#### Konflikty wersji
```bash
# Usuń stare instalacje
# Windows: winget odinstaluj microsoft.azd
# macOS: brew odinstaluj azd
# Linux: usuń poprzedni plik binarny azd lub dowiązanie symboliczne przed ponowną instalacją

# Wyczyść konfigurację
rm -rf ~/.azd
```

### Uzyskiwanie dodatkowej pomocy
```bash
# Włącz logowanie debugowania
export AZD_DEBUG=true
azd <command> --debug

# Wyświetl bieżącą konfigurację
azd config show

# Wyświetl bieżący status wdrożenia
azd show
```

## Aktualizacja azd

### Sprawdzenie aktualizacji
azd ostrzega, gdy dostępne jest nowsze wydanie. Sprawdź swoją wersję poleceniem:
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

**Azure CLI (az)**: Niskopoziomowe narzędzie do zarządzania pojedynczymi zasobami Azure
- `az webapp create`, `az storage account create`
- Jeden zasób na raz
- Skupienie na zarządzaniu infrastrukturą

**Azure Developer CLI (azd)**: Narzędzie wysokiego poziomu do pełnych wdrożeń aplikacji
- `azd up` wdraża całą aplikację z wszystkimi zasobami
- Przepływy pracy oparte na szablonach
- Skupienie na produktywności programisty

**Potrzebujesz obu**: azd używa az CLI do uwierzytelniania
</details>

<details>
<summary><strong>Czy mogę używać azd z istniejącymi zasobami Azure?</strong></summary>

Tak! Możesz:
1. Importować istniejące zasoby do środowisk azd
2. Odnosić się do istniejących zasobów w szablonach Bicep
3. Używać azd do nowych wdrożeń obok istniejącej infrastruktury

Zobacz [Przewodnik konfiguracji](configuration.md) dla szczegółów.
</details>

<details>
<summary><strong>Czy azd działa z Azure Government lub Azure China?</strong></summary>

Tak, skonfiguruj chmurę:
```bash
# Azure Government
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Czy mogę używać azd w pipeline CI/CD?</strong></summary>

Oczywiście! azd jest zaprojektowany do automatyzacji:
- Integracja z GitHub Actions
- Wsparcie Azure DevOps
- Uwierzytelnianie za pomocą service principal
- Tryb bez interakcji

Zobacz [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) dla wzorców CI/CD.
</details>

<details>
<summary><strong>Jaki jest koszt korzystania z azd?</strong></summary>

Samo narzędzie azd jest **całkowicie darmowe** i open-source. Opłaty dotyczą tylko:
- Zasobów Azure, które wdrażasz
- Kosztów konsumowanych zasobów Azure (obliczenia, przechowywanie itp.)

Użyj `azd provision --preview` aby oszacować koszty przed wdrożeniem.
</details>

## Kolejne kroki

1. **Ukończ uwierzytelnianie**: Upewnij się, że masz dostęp do subskrypcji Azure
2. **Spróbuj pierwszego wdrożenia**: Postępuj zgodnie z [Przewodnikiem Pierwszego Projektu](first-project.md)
3. **Przeglądaj szablony**: Przeglądaj dostępne szablony za pomocą `azd template list`
4. **Skonfiguruj swoje IDE**: Przygotuj środowisko programistyczne

## Wsparcie

Jeśli napotkasz problemy:
- [Oficjalna dokumentacja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Zgłaszanie problemów](https://github.com/Azure/azure-dev/issues)
- [Dyskusje społeczności](https://github.com/Azure/azure-dev/discussions)
- [Wsparcie Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Uzyskaj wskazówki dotyczące poleceń Azure bezpośrednio w edytorze za pomocą `npx skills add microsoft/github-copilot-for-azure`

---

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md) 
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)
- **🚀 Następny rozdział**: [Rozdział 2: Programowanie z AI jako pierwszym](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalacja zakończona!** Przejdź do [Twojego pierwszego projektu](first-project.md), aby zacząć korzystać z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku macierzystym powinien być uważany za źródło autorytatywne. W przypadku istotnych informacji zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
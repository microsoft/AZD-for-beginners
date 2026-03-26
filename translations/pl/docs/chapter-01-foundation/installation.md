# Przewodnik instalacji i konfiguracji

**Nawigacja po rozdziale:**  
- **📚 Strona kursu**: [AZD Dla początkujących](../../README.md)  
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start  
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md)  
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)  
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój z dominacją AI](../chapter-02-ai-development/microsoft-foundry-integration.md)  

## Wprowadzenie

Ten kompleksowy przewodnik przeprowadzi Cię przez instalację i konfigurację Azure Developer CLI (azd) na Twoim systemie. Poznasz różne metody instalacji dla różnych systemów operacyjnych, konfigurację uwierzytelniania oraz wstępną konfigurację, aby przygotować środowisko programistyczne do wdrożeń w Azure.

## Cele nauki

Po zakończeniu tej lekcji będziesz potrafił:
- Pomyślnie zainstalować Azure Developer CLI na swoim systemie operacyjnym
- Skonfigurować uwierzytelnianie z Azure za pomocą różnych metod
- Ustawić środowisko programistyczne wraz z niezbędnymi wymaganiami wstępnymi
- Zrozumieć różne opcje instalacji i wiedzieć, kiedy ich używać
- Rozwiązywać powszechne problemy z instalacją i konfiguracją

## Efekty nauki

Po ukończeniu tej lekcji będziesz umiał:
- Zainstalować azd przy użyciu odpowiedniej metody dla swojej platformy
- Uwierzytelnić się w Azure za pomocą azd auth login
- Zweryfikować instalację i przetestować podstawowe polecenia azd
- Skonfigurować środowisko programistyczne dla optymalnego korzystania z azd
- Samodzielnie rozwiązywać typowe problemy z instalacją

Ten przewodnik pomoże Ci zainstalować oraz skonfigurować Azure Developer CLI na Twoim systemie, niezależnie od używanego systemu operacyjnego czy środowiska programistycznego.

## Wymagania wstępne

Przed instalacją azd upewnij się, że masz:
- **Subskrypcję Azure** - [Utwórz darmowe konto](https://azure.microsoft.com/free/)
- **Azure CLI** - do uwierzytelniania i zarządzania zasobami
- **Git** - do klonowania szablonów i kontroli wersji
- **Docker** (opcjonalnie) - dla aplikacji konteneryzowanych

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

azd jest preinstalowany w GitHub Codespaces. Po prostu utwórz codespace i zacznij korzystać z azd od razu.

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

# Lista dostępnych szablonów
azd template list
```
  
Oczekiwany wynik:  
```
azd version 1.x.x (commit xxxxxx)
```
  
**Uwaga**: Rzeczywista wersja może się różnić. Sprawdź [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) po najnowszą wersję.

**✅ Lista kontrolna pomyślnej instalacji:**  
- [ ] `azd version` wyświetla numer wersji bez błędów  
- [ ] `azd --help` pokazuje dokumentację poleceń  
- [ ] `azd template list` wyświetla dostępne szablony  
- [ ] `az account show` pokazuje Twoją subskrypcję Azure  
- [ ] Możesz utworzyć katalog testowy i pomyślnie uruchomić `azd init`  

**Jeśli wszystkie testy przejdą, możesz przejść do [Twojego pierwszego projektu](first-project.md)!**

## Konfiguracja uwierzytelniania

### Uwierzytelnianie Azure CLI (zalecane)  
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
  
### Service Principal (CI/CD)  
Dla środowisk automatycznych:  
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
export AZD_DEBUG=true  # Włącz logowanie debugowania
```
  

## Integracja z IDE

### Visual Studio Code  
Zainstaluj rozszerzenie Azure Developer CLI:  
1. Otwórz VS Code  
2. Przejdź do Rozszerzeń (Ctrl+Shift+X)  
3. Wyszukaj „Azure Developer CLI”  
4. Zainstaluj rozszerzenie  

Funkcje:  
- IntelliSense dla azure.yaml  
- Zintegrowany terminal z poleceniami  
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
2. Skonfiguruj dane uwierzytelniające Azure  
3. Używaj zintegrowanego terminala do poleceń azd  

## 🐛 Rozwiązywanie problemów z instalacją

### Najczęstsze problemy

#### Brak uprawnień (Windows)  
```powershell
# Uruchom PowerShell jako administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
  
#### Problemy z PATH  
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
  
#### Problemy sieciowe/proxy  
```bash
# Konfiguruj proxy
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
  

### Gdzie szukać pomocy  
```bash
# Włącz rejestrowanie debugowania
export AZD_DEBUG=true
azd <command> --debug

# Wyświetl aktualną konfigurację
azd config list

# Wyświetl aktualny status wdrożenia
azd show
```
  

## Aktualizacja azd

### Aktualizacje automatyczne  
azd powiadomi Cię, gdy dostępne będą aktualizacje:  
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
  

## 💡 Najczęściej zadawane pytania

<details>
<summary><strong>Jaka jest różnica między azd a az CLI?</strong></summary>

**Azure CLI (az)**: Narzędzie niskiego poziomu do zarządzania pojedynczymi zasobami Azure  
- `az webapp create`, `az storage account create`  
- Jeden zasób naraz  
- Skupienie na zarządzaniu infrastrukturą  

**Azure Developer CLI (azd)**: Narzędzie wysokiego poziomu do pełnych wdrożeń aplikacji  
- `azd up` wdraża całą aplikację ze wszystkimi zasobami  
- Przepływy oparte na szablonach  
- Skupienie na produktywności dewelopera  

**Potrzebujesz obu**: azd korzysta z az CLI do uwierzytelniania  
</details>

<details>
<summary><strong>Czy mogę używać azd z istniejącymi zasobami Azure?</strong></summary>

Tak! Możesz:  
1. Importować istniejące zasoby do środowisk azd  
2. Odwoływać się do istniejących zasobów w szablonach Bicep  
3. Korzystać z azd przy nowych wdrożeniach obok istniejącej infrastruktury  

Szczegóły znajdziesz w [Przewodniku konfiguracji](configuration.md).  
</details>

<details>
<summary><strong>Czy azd działa z Azure Government lub Azure China?</strong></summary>

Tak, skonfiguruj odpowiednią chmurę:  
```bash
# Rząd Azure
az cloud set --name AzureUSGovernment
az login

# Azure Chiny
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Czy mogę używać azd w potokach CI/CD?</strong></summary>

Oczywiście! azd jest zaprojektowany do automatyzacji:  
- Integracja z GitHub Actions  
- Wsparcie Azure DevOps  
- Uwierzytelnianie service principal  
- Tryb bez interakcji  

Zobacz [Przewodnik wdrożeń](../chapter-04-infrastructure/deployment-guide.md) dla wzorców CI/CD.  
</details>

<details>
<summary><strong>Ile kosztuje używanie azd?</strong></summary>

azd jest **całkowicie darmowy** i open-source. Płacisz jedynie za:  
- Zasoby Azure, które wdrażasz  
- Koszty zużycia Azure (obliczenia, storage itp.)  

Użyj `azd provision --preview`, aby oszacować koszty przed wdrożeniem.  
</details>

## Kolejne kroki

1. **Ukończ uwierzytelnianie**: upewnij się, że masz dostęp do swojej subskrypcji Azure  
2. **Spróbuj pierwszego wdrożenia**: postępuj zgodnie z [Przewodnikiem pierwszego projektu](first-project.md)  
3. **Przeglądaj szablony**: zobacz dostępne szablony za pomocą `azd template list`  
4. **Skonfiguruj swoje IDE**: przygotuj środowisko programistyczne  

## Wsparcie

Jeśli napotkasz problemy:  
- [Oficjalna dokumentacja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Zgłoś problem](https://github.com/Azure/azure-dev/issues)  
- [Dyskusje społeczności](https://github.com/Azure/azure-dev/discussions)  
- [Wsparcie Azure](https://azure.microsoft.com/support/)  
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - uzyskaj wskazówki do poleceń Azure bezpośrednio w edytorze przy pomocy `npx skills add microsoft/github-copilot-for-azure`  

---

**Nawigacja po rozdziale:**  
- **📚 Strona kursu**: [AZD Dla początkujących](../../README.md)  
- **📖 Bieżący rozdział**: Rozdział 1 - Podstawy i szybki start  
- **⬅️ Poprzedni**: [Podstawy AZD](azd-basics.md)  
- **➡️ Następny**: [Twój pierwszy projekt](first-project.md)  
- **🚀 Następny rozdział**: [Rozdział 2: Rozwój z dominacją AI](../chapter-02-ai-development/microsoft-foundry-integration.md)  

**✅ Instalacja zakończona!** Kontynuuj w [Twoim pierwszym projekcie](first-project.md), aby zacząć budować z azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako źródło o charakterze autorytatywnym. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
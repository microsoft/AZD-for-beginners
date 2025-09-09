<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T16:28:57+00:00",
  "source_file": "README.md",
  "language_code": "pl"
}
-->
# AZD dla Początkujących

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.pl.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

Postępuj zgodnie z poniższymi krokami, aby rozpocząć korzystanie z tych zasobów:  
1. **Sforkuj repozytorium**: Kliknij [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Sklonuj repozytorium**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Dołącz do społeczności Azure Discord i poznaj ekspertów oraz innych programistów**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 Obsługa wielu języków

#### Obsługiwane przez GitHub Action (Automatyczne i zawsze aktualne)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](./README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**Jeśli chcesz, aby obsługiwane były dodatkowe języki, lista dostępnych znajduje się [tutaj](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Wprowadzenie

Witamy w kompleksowym przewodniku po Azure Developer CLI (azd). To repozytorium zostało zaprojektowane, aby pomóc programistom na każdym poziomie, od studentów po profesjonalistów, nauczyć się i opanować Azure Developer CLI w celu efektywnego wdrażania w chmurze. Ten uporządkowany zasób edukacyjny oferuje praktyczne doświadczenie w zakresie wdrożeń w chmurze Azure, rozwiązywania typowych problemów oraz wdrażania najlepszych praktyk w celu pomyślnego użycia szablonów AZD.

## Cele nauki

Pracując z tym repozytorium, nauczysz się:
- Podstaw i kluczowych koncepcji Azure Developer CLI
- Wdrażania i zarządzania zasobami Azure za pomocą Infrastructure as Code
- Rozwiązywania typowych problemów związanych z wdrożeniami AZD
- Walidacji przed wdrożeniem i planowania pojemności
- Wdrażania najlepszych praktyk w zakresie bezpieczeństwa i optymalizacji kosztów
- Zyskania pewności w wdrażaniu aplikacji gotowych do produkcji na Azure

## Rezultaty nauki

Po ukończeniu tego kursu będziesz w stanie:
- Zainstalować, skonfigurować i używać Azure Developer CLI
- Tworzyć i wdrażać aplikacje za pomocą szablonów AZD
- Rozwiązywać problemy związane z uwierzytelnianiem, infrastrukturą i wdrożeniami
- Przeprowadzać kontrole przed wdrożeniem, w tym planowanie pojemności i wybór SKU
- Wdrażać najlepsze praktyki w zakresie monitorowania, bezpieczeństwa i zarządzania kosztami
- Zintegrować przepływy pracy AZD z pipeline'ami CI/CD

## Spis treści

- [Czym jest Azure Developer CLI?](../..)  
- [Szybki Start](../..)  
- [Dokumentacja](../..)  
- [Przykłady i Szablony](../..)  
- [Zasoby](../..)  
- [Wkład w rozwój](../..)  

## Czym jest Azure Developer CLI?

Azure Developer CLI (azd) to interfejs wiersza poleceń skoncentrowany na programistach, który przyspiesza proces tworzenia i wdrażania aplikacji na Azure. Oferuje:  

- **Wdrożenia oparte na szablonach** - Korzystaj z gotowych szablonów dla typowych wzorców aplikacji  
- **Infrastructure as Code** - Zarządzaj zasobami Azure za pomocą Bicep lub Terraform  
- **Zintegrowane przepływy pracy** - Bezproblemowe provisionowanie, wdrażanie i monitorowanie aplikacji  
- **Przyjazny dla programistów** - Optymalizowany pod kątem produktywności i doświadczenia programistów  

## Szybki Start

### Wymagania wstępne
- Subskrypcja Azure  
- Zainstalowany Azure CLI  
- Git (do klonowania szablonów)  

### Instalacja
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### Twoje pierwsze wdrożenie
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

## Dokumentacja

### Pierwsze kroki
- [**Podstawy AZD**](docs/getting-started/azd-basics.md) - Kluczowe koncepcje i terminologia  
- [**Instalacja i konfiguracja**](docs/getting-started/installation.md) - Przewodniki instalacji dla różnych platform  
- [**Konfiguracja**](docs/getting-started/configuration.md) - Ustawienia środowiska i uwierzytelnianie  
- [**Twój pierwszy projekt**](docs/getting-started/first-project.md) - Samouczek krok po kroku  

### Wdrożenie i provisionowanie
- [**Przewodnik wdrożeniowy**](docs/deployment/deployment-guide.md) - Kompleksowe przepływy wdrożeniowe  
- [**Provisionowanie zasobów**](docs/deployment/provisioning.md) - Zarządzanie zasobami Azure  

### Kontrole przed wdrożeniem
- [**Planowanie pojemności**](docs/pre-deployment/capacity-planning.md) - Walidacja pojemności zasobów Azure  
- [**Wybór SKU**](docs/pre-deployment/sku-selection.md) - Wybór odpowiednich SKU Azure  
- [**Kontrole przed wdrożeniem**](docs/pre-deployment/preflight-checks.md) - Zautomatyzowane skrypty walidacyjne  

### Rozwiązywanie problemów
- [**Typowe problemy**](docs/troubleshooting/common-issues.md) - Najczęściej spotykane problemy i ich rozwiązania  
- [**Przewodnik debugowania**](docs/troubleshooting/debugging.md) - Strategie debugowania krok po kroku  

## Przykłady i Szablony

### Szablony startowe
- [**Prosta aplikacja webowa**](../../examples/simple-web-app) - Podstawowe wdrożenie aplikacji Node.js  
- [**Strona statyczna**](../../examples/static-website) - Hosting strony statycznej na Azure Storage  
- [**Aplikacja kontenerowa**](../../examples/container-app) - Wdrożenie aplikacji kontenerowej  
- [**Aplikacja bazodanowa**](../../examples/database-app) - Aplikacja webowa z integracją bazy danych  

### Zaawansowane scenariusze
- [**Mikrousługi**](../../examples/microservices) - Architektura aplikacji wielousługowej  
- [**Funkcje serverless**](../../examples/serverless-function) - Wdrożenie Azure Functions  
- [**Przykłady konfiguracji**](../../examples/configurations) - Wzorce konfiguracji do ponownego użycia  

## Zasoby

### Szybkie odniesienia
- [**Podręczna lista poleceń**](resources/cheat-sheet.md) - Kluczowe polecenia azd  
- [**Słowniczek**](resources/glossary.md) - Terminologia Azure i azd  
- [**FAQ**](resources/faq.md) - Najczęściej zadawane pytania  
- [**Przewodnik nauki**](resources/study-guide.md) - Kompleksowe cele nauki i ćwiczenia praktyczne  

### Zasoby zewnętrzne
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centrum Architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Status Azure](https://status.azure.com/)  

## Ścieżka nauki

### Dla studentów i początkujących
1. Zacznij od [Podstaw AZD](docs/getting-started/azd-basics.md)  
2. Przejdź przez [Przewodnik instalacji](docs/getting-started/installation.md)  
3. Ukończ [Twój pierwszy projekt](docs/getting-started/first-project.md)  
4. Ćwicz z [Przykładem prostej aplikacji webowej](../../examples/simple-web-app)  

### Dla programistów
1. Przejrzyj [Przewodnik konfiguracji](docs/getting-started/configuration.md)  
2. Przestudiuj [Przewodnik wdrożeniowy](docs/deployment/deployment-guide.md)  
3. Pracuj z [Przykładem aplikacji bazodanowej](../../examples/database-app)  
4. Eksploruj [Przykład aplikacji kontenerowej](../../examples/container-app)  

### Dla inżynierów DevOps
1. Opanuj [Provisionowanie zasobów](docs/deployment/provisioning.md)  
2. Wdrażaj [Kontrole przed wdrożeniem](docs/pre-deployment/preflight-checks.md)  
3. Ćwicz [Planowanie pojemności](docs/pre-deployment/capacity-planning.md)  
4. Zaawansowany [Przykład mikrousług](../../examples/microservices)  

## Wkład w rozwój

Zapraszamy do współpracy! Przeczytaj nasz [Przewodnik współpracy](CONTRIBUTING.md), aby dowiedzieć się:  
- Jak zgłaszać problemy i prośby o funkcje  
- Wytyczne dotyczące wkładu w kod  
- Poprawa dokumentacji  
- Standardy społeczności  

## Wsparcie

- **Problemy**: [Zgłaszaj błędy i prośby o funkcje](https://github.com/microsoft/azd-for-beginners/issues)  
- **Dyskusje**: [Społeczność Microsoft Azure Discord - pytania i dyskusje](https://discord.gg/microsoft-azure)  
- **E-mail**: W przypadku prywatnych zapytań  
- **Microsoft Learn**: [Oficjalna dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## Licencja

Ten projekt jest licencjonowany na podstawie licencji MIT - zobacz plik [LICENSE](../../LICENSE) dla szczegółów.  

## 🎒 Inne kursy

Nasza ekipa tworzy inne kursy! Sprawdź:  

- [**NOWOŚĆ** Model Context Protocol (MCP) dla Początkujących](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents dla Początkujących](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI dla Początkujących z użyciem .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI dla Początkujących](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI dla Początkujących z użyciem Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML dla Początkujących](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science dla Początkujących](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI dla Początkujących](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cybersecurity dla Początkujących](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Web Dev dla Początkujących](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT dla Początkujących](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Rozwój XR dla Początkujących](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Opanowanie GitHub Copilot dla Programowania w Parze z AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Opanowanie GitHub Copilot dla Programistów C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Wybierz Swoją Własną Przygodę z Copilotem](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Nawigacja**
- **Następna Lekcja**: [Podstawy AZD](docs/getting-started/azd-basics.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby zapewnić poprawność tłumaczenia, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
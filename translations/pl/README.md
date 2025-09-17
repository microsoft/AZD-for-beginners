<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T15:09:52+00:00",
  "source_file": "README.md",
  "language_code": "pl"
}
-->
# AZD dla Początkujących

![AZD-dla-początkujących](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.pl.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

Postępuj zgodnie z poniższymi krokami, aby rozpocząć korzystanie z tych zasobów:
1. **Sforkuj repozytorium**: Kliknij [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Sklonuj repozytorium**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Dołącz do społeczności Azure Discord i poznaj ekspertów oraz innych programistów**](https://discord.com/invite/ByRwuEEgH4)

### Obsługa wielu języków

#### Obsługiwane przez GitHub Action (Automatyczne i zawsze aktualne)

[Francuski](../fr/README.md) | [Hiszpański](../es/README.md) | [Niemiecki](../de/README.md) | [Rosyjski](../ru/README.md) | [Arabski](../ar/README.md) | [Perski (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chiński (uproszczony)](../zh/README.md) | [Chiński (tradycyjny, Makau)](../mo/README.md) | [Chiński (tradycyjny, Hongkong)](../hk/README.md) | [Chiński (tradycyjny, Tajwan)](../tw/README.md) | [Japoński](../ja/README.md) | [Koreański](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalski](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Pendżabski (Gurmukhi)](../pa/README.md) | [Portugalski (Portugalia)](../pt/README.md) | [Portugalski (Brazylia)](../br/README.md) | [Włoski](../it/README.md) | [Polski](./README.md) | [Turecki](../tr/README.md) | [Grecki](../el/README.md) | [Tajski](../th/README.md) | [Szwedzki](../sv/README.md) | [Duński](../da/README.md) | [Norweski](../no/README.md) | [Fiński](../fi/README.md) | [Holenderski](../nl/README.md) | [Hebrajski](../he/README.md) | [Wietnamski](../vi/README.md) | [Indonezyjski](../id/README.md) | [Malajski](../ms/README.md) | [Tagalog (Filipiński)](../tl/README.md) | [Suahili](../sw/README.md) | [Węgierski](../hu/README.md) | [Czeski](../cs/README.md) | [Słowacki](../sk/README.md) | [Rumuński](../ro/README.md) | [Bułgarski](../bg/README.md) | [Serbski (cyrylica)](../sr/README.md) | [Chorwacki](../hr/README.md) | [Słoweński](../sl/README.md) | [Ukraiński](../uk/README.md) | [Birmański (Myanmar)](../my/README.md)

**Jeśli chcesz, aby obsługiwane były dodatkowe języki, lista dostępnych znajduje się [tutaj](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Wprowadzenie

Witamy w kompleksowym przewodniku po Azure Developer CLI (azd). To repozytorium zostało zaprojektowane, aby pomóc programistom na każdym poziomie, od studentów po profesjonalistów, nauczyć się i opanować Azure Developer CLI w celu efektywnego wdrażania w chmurze, **ze szczególnym naciskiem na wdrażanie aplikacji AI przy użyciu Azure AI Foundry**. Ten uporządkowany zasób edukacyjny oferuje praktyczne doświadczenie w zakresie wdrożeń w chmurze Azure, rozwiązywania typowych problemów oraz wdrażania najlepszych praktyk dla skutecznych wdrożeń szablonów AZD.

### **Dlaczego ten przewodnik jest ważny dla programistów AI**
Na podstawie naszej ostatniej ankiety w społeczności Azure AI Foundry Discord, **45% programistów jest zainteresowanych korzystaniem z AZD dla obciążeń AI**, ale napotyka trudności związane z:
- Złożonymi architekturami AI obejmującymi wiele usług
- Najlepszymi praktykami wdrażania AI w środowisku produkcyjnym
- Integracją i konfiguracją usług Azure AI
- Optymalizacją kosztów dla obciążeń AI
- Rozwiązywaniem problemów specyficznych dla wdrożeń AI

## Cele nauki

Pracując z tym repozytorium, nauczysz się:
- Opanować podstawy i kluczowe koncepcje Azure Developer CLI
- Wdrażać i udostępniać zasoby Azure za pomocą Infrastructure as Code
- Rozwijać umiejętności rozwiązywania typowych problemów z wdrożeniami AZD
- Zrozumieć walidację przed wdrożeniem i planowanie pojemności
- Wdrażać najlepsze praktyki w zakresie bezpieczeństwa i optymalizacji kosztów
- Zyskać pewność w wdrażaniu aplikacji gotowych do produkcji w Azure

## Rezultaty nauki

Po ukończeniu tego kursu będziesz w stanie:
- Skutecznie zainstalować, skonfigurować i używać Azure Developer CLI
- Tworzyć i wdrażać aplikacje za pomocą szablonów AZD
- Rozwiązywać problemy z uwierzytelnianiem, infrastrukturą i wdrożeniami
- Przeprowadzać kontrole przed wdrożeniem, w tym planowanie pojemności i wybór SKU
- Wdrażać najlepsze praktyki w zakresie monitorowania, bezpieczeństwa i zarządzania kosztami
- Integracja przepływów pracy AZD z pipeline'ami CI/CD

## Spis treści

- [Czym jest Azure Developer CLI?](../..)
- [Szybki Start](../..)
- [Ścieżka Nauki](../..)
  - [Dla Programistów AI (Zalecane Zacznij Tutaj!)](../..)
  - [Dla Studentów i Początkujących](../..)
  - [Dla Programistów](../..)
  - [Dla Inżynierów DevOps](../..)
- [Dokumentacja](../..)
  - [Pierwsze Kroki](../..)
  - [Wdrażanie i Udostępnianie](../..)
  - [Kontrole Przed Wdrożeniem](../..)
  - [AI i Azure AI Foundry](../..)
  - [Rozwiązywanie Problemów](../..)
- [Przykłady i Szablony](../..)
  - [Polecane: Szablony Azure AI Foundry](../..)
  - [Polecane: Scenariusze E2E Azure AI Foundry](../..)
  - [Dodatkowe Szablony AZD](../..)
  - [Laboratoria Praktyczne i Warsztaty](../..)
- [Zasoby](../..)
- [Wkład](../..)
- [Wsparcie](../..)
- [Społeczność](../..)

## Czym jest Azure Developer CLI?

Azure Developer CLI (azd) to narzędzie wiersza poleceń skoncentrowane na programistach, które przyspiesza proces tworzenia i wdrażania aplikacji w Azure. Oferuje:

- **Wdrażanie oparte na szablonach** - Korzystaj z gotowych szablonów dla typowych wzorców aplikacji
- **Infrastructure as Code** - Zarządzaj zasobami Azure za pomocą Bicep lub Terraform
- **Zintegrowane przepływy pracy** - Bezproblemowe udostępnianie, wdrażanie i monitorowanie aplikacji
- **Przyjazne dla programistów** - Optymalizowane pod kątem produktywności i doświadczenia programistów

### **AZD + Azure AI Foundry: Idealne dla wdrożeń AI**

**Dlaczego AZD dla rozwiązań AI?** AZD rozwiązuje najważniejsze wyzwania, z którymi mierzą się programiści AI:

- **Szablony gotowe na AI** - Wstępnie skonfigurowane szablony dla Azure OpenAI, Cognitive Services i obciążeń ML
- **Bezpieczne wdrożenia AI** - Wbudowane wzorce bezpieczeństwa dla usług AI, kluczy API i punktów końcowych modeli
- **Wzorce produkcyjne AI** - Najlepsze praktyki dla skalowalnych, opłacalnych wdrożeń aplikacji AI
- **Kompleksowe przepływy pracy AI** - Od tworzenia modeli po wdrożenie produkcyjne z odpowiednim monitorowaniem
- **Optymalizacja kosztów** - Inteligentne strategie alokacji zasobów i skalowania dla obciążeń AI
- **Integracja z Azure AI Foundry** - Bezproblemowe połączenie z katalogiem modeli i punktami końcowymi AI Foundry

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

### Twoje pierwsze wdrożenie AI
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## Ścieżka Nauki

### Dla Programistów AI (Zalecane Zacznij Tutaj!)
1. **Szybki Start**: Wypróbuj szablon [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)
2. **Poznaj Podstawy**: [Podstawy AZD](docs/getting-started/azd-basics.md) + [Integracja z Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **Praktyka**: Ukończ [Laboratorium Warsztatowe AI](docs/ai-foundry/ai-workshop-lab.md)
4. **Gotowość Produkcyjna**: Przejrzyj [Najlepsze Praktyki AI w Produkcji](docs/ai-foundry/production-ai-practices.md)
5. **Zaawansowane**: Wdróż szablon [contoso-chat](https://github.com/Azure-Samples/contoso-chat) dla przedsiębiorstw

### Dla Studentów i Początkujących
1. Zacznij od [Podstaw AZD](docs/getting-started/azd-basics.md)
2. Postępuj zgodnie z [Przewodnikiem Instalacji](docs/getting-started/installation.md)
3. Ukończ [Twój Pierwszy Projekt](docs/getting-started/first-project.md)
4. Praktykuj z [Przykładem Prostej Aplikacji Webowej](../../examples/simple-web-app)

### Dla Programistów
1. Przejrzyj [Przewodnik Konfiguracji](docs/getting-started/configuration.md)
2. Przestudiuj [Przewodnik Wdrażania](docs/deployment/deployment-guide.md)
3. Pracuj z [Przykładem Aplikacji Bazodanowej](../../examples/database-app)
4. Eksploruj [Przykład Aplikacji Kontenerowej](../../examples/container-app)

### Dla Inżynierów DevOps
1. Opanuj [Udostępnianie Zasobów](docs/deployment/provisioning.md)
2. Wdróż [Kontrole Przed Wdrożeniem](docs/pre-deployment/preflight-checks.md)
3. Praktykuj [Planowanie Pojemności](docs/pre-deployment/capacity-planning.md)
4. Zaawansowane [Przykłady Mikroserwisów](../../examples/microservices)

## Dokumentacja

### Pierwsze Kroki
- [**Podstawy AZD**](docs/getting-started/azd-basics.md) - Kluczowe koncepcje i terminologia
- [**Instalacja i Konfiguracja**](docs/getting-started/installation.md) - Przewodniki instalacji dla różnych platform
- [**Konfiguracja**](docs/getting-started/configuration.md) - Ustawienia środowiska i uwierzytelnianie
- [**Twój Pierwszy Projekt**](docs/getting-started/first-project.md) - Samouczek krok po kroku

### Wdrażanie i Udostępnianie
- [**Przewodnik Wdrażania**](docs/deployment/deployment-guide.md) - Kompleksowe przepływy pracy wdrożeniowe
- [**Udostępnianie Zasobów**](docs/deployment/provisioning.md) - Zarządzanie zasobami Azure

### Kontrole Przed Wdrożeniem
- [**Planowanie Pojemności**](docs/pre-deployment/capacity-planning.md) - Walidacja pojemności zasobów Azure
- [**Wybór SKU**](docs/pre-deployment/sku-selection.md) - Wybór odpowiednich SKU Azure
- [**Kontrole Przed Wdrożeniem**](docs/pre-deployment/preflight-checks.md) - Zautomatyzowane skrypty walidacyjne

### AI i Azure AI Foundry
- [**Integracja z Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - Połączenie AZD z usługami Azure AI Foundry
- [**Wzorce Wdrażania Modeli AI**](docs/ai-foundry/ai-model-deployment.md) - Wdrażanie i zarządzanie modelami AI za pomocą AZD
- [**Laboratorium Warsztatowe AI**](docs/ai-foundry/ai-workshop-lab.md) - Laboratorium praktyczne: Przygotowanie rozwiązań AI do AZD
- [**Najlepsze Praktyki AI w Produkcji**](docs/ai-foundry/production-ai-practices.md) - Bezpieczeństwo, skalowanie i monitorowanie obciążeń AI

### Rozwiązywanie Problemów
- [**Typowe Problemy**](docs/troubleshooting/common-issues.md) - Najczęściej spotykane problemy i ich rozwiązania
- [**Przewodnik debugowania**](docs/troubleshooting/debugging.md) - Strategia debugowania krok po kroku  
- [**Rozwiązywanie problemów specyficznych dla AI**](docs/troubleshooting/ai-troubleshooting.md) - Problemy z usługami AI i wdrażaniem modeli  

## Przykłady i szablony  

### [Polecane: Szablony Azure AI Foundry](https://ai.azure.com/resource/build/templates)  
**Rozpocznij tutaj, jeśli wdrażasz aplikacje AI!**  

| Szablon | Opis | Złożoność | Usługi |  
|----------|-------------|------------|----------|  
| [**Rozpocznij pracę z AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Utwórz i wdrażaj podstawową aplikację czatu zintegrowaną z danymi i wglądem w telemetrię za pomocą Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Rozpocznij pracę z agentami AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Utwórz i wdrażaj podstawową aplikację agenta z akcjami i wglądem w telemetrię za pomocą Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**Automatyzacja przepływu pracy z wieloma agentami**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Ulepsz planowanie zadań i automatyzację, orkiestrując i zarządzając grupą agentów AI.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Generowanie dokumentów z danych**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Przyspiesz generowanie dokumentów, takich jak umowy, faktury i propozycje inwestycyjne, znajdując i podsumowując istotne informacje z danych. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**Ulepsz spotkania z klientami za pomocą agentów**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Migruj kod legacy do nowoczesnych języków, korzystając z zespołu agentów. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Modernizacja kodu za pomocą agentów**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Utwórz i wdrażaj podstawową aplikację czatu zintegrowaną z danymi i wglądem w telemetrię za pomocą Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Budowa agenta konwersacyjnego**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Wykorzystaj zaawansowane rozumienie konwersacji, aby tworzyć i ulepszać chatboty oraz agentów z deterministycznymi i kontrolowanymi przez człowieka przepływami pracy. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**Odkrywanie wglądów z danych konwersacyjnych**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Popraw efektywność centrum kontaktowego, odkrywając wglądy z dużych zestawów danych audio i tekstowych za pomocą zaawansowanych możliwości rozumienia treści. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**Przetwarzanie treści wielomodalnych**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Szybko i dokładnie przetwarzaj roszczenia, faktury, umowy i inne dokumenty, wyodrębniając informacje z nieustrukturyzowanej treści i mapując je na ustrukturyzowany format. Ten szablon obsługuje tekst, obrazy, tabele i wykresy. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### Polecane: Scenariusze Azure AI Foundry E2E  
**Rozpocznij tutaj, jeśli wdrażasz aplikacje AI!**  

| Szablon | Opis | Złożoność | Usługi |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Prosty interfejs czatu z Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Aplikacja czatu z funkcją RAG z Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Analiza dokumentów za pomocą usług AI | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Framework agenta AI z wywoływaniem funkcji | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Czatu korporacyjny z orkiestracją AI | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### Dodatkowe szablony AZD  
- [**Katalog przykładów**](examples/README.md) - Praktyczne przykłady, szablony i scenariusze z życia wzięte  
- [**Szablony AZD od Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - Oficjalne szablony Microsoftu  
- [**Galeria Awesome AZD**](https://azure.github.io/awesome-azd/) - Szablony stworzone przez społeczność  

### Warsztaty i laboratoria praktyczne  
- [**Laboratorium warsztatowe AI**](docs/ai-foundry/ai-workshop-lab.md) - **NOWE**: Spraw, aby Twoje rozwiązania AI były wdrażalne za pomocą AZD  
- [**Warsztat AZD dla początkujących**](workshop/README.md) - Skup się na wdrażaniu szablonów agentów AI za pomocą AZD  

## Zasoby  

### Szybkie odniesienia  
- [**Arkusz poleceń**](resources/cheat-sheet.md) - Kluczowe polecenia azd  
- [**Słowniczek**](resources/glossary.md) - Terminologia Azure i azd  
- [**FAQ**](resources/faq.md) - Najczęściej zadawane pytania  
- [**Przewodnik do nauki**](resources/study-guide.md) - Kompleksowe cele nauki i ćwiczenia praktyczne  

### Zasoby zewnętrzne  
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Status Azure](https://status.azure.com/)  

## Wkład  

Zapraszamy do współtworzenia! Przeczytaj nasz [Przewodnik współtworzenia](CONTRIBUTING.md), aby dowiedzieć się:  
- Jak zgłaszać problemy i prośby o funkcje  
- Wytyczne dotyczące wkładu w kod  
- Poprawa dokumentacji  
- Standardy społeczności  

## Wsparcie  

- **Problemy**: [Zgłaszaj błędy i prośby o funkcje](https://github.com/microsoft/azd-for-beginners/issues)  
- **Dyskusje**: [Społeczność Discord Microsoft Azure - pytania i dyskusje](https://discord.gg/microsoft-azure)  
- **Wsparcie specyficzne dla AI**: Dołącz do [kanału #Azure](https://discord.gg/microsoft-azure) w celu dyskusji o AZD + AI Foundry  
- **E-mail**: W przypadku prywatnych zapytań  
- **Microsoft Learn**: [Oficjalna dokumentacja Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Wgląd społeczności z Discord Azure AI Foundry  

**Wyniki ankiety z kanału #Azure:**  
- **45%** deweloperów chce używać AZD do obciążeń AI  
- **Największe wyzwania**: Wdrażanie wielu usług, zarządzanie poświadczeniami, gotowość produkcyjna  
- **Najbardziej pożądane**: Szablony specyficzne dla AI, przewodniki rozwiązywania problemów, najlepsze praktyki  

**Dołącz do naszej społeczności, aby:**  
- Podzielić się swoimi doświadczeniami z AZD + AI i uzyskać pomoc  
- Uzyskać wczesny dostęp do nowych szablonów AI  
- Współtworzyć najlepsze praktyki wdrażania AI  
- Wpływać na przyszły rozwój funkcji AI + AZD  

## Licencja  

Ten projekt jest licencjonowany na podstawie licencji MIT - zobacz plik [LICENSE](../../LICENSE) dla szczegółów.  

## Inne kursy  

Nasz zespół tworzy inne kursy! Sprawdź:  

- [**NOWE** Protokół kontekstu modelu (MCP) dla początkujących](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Agenci AI dla początkujących](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generatywna AI dla początkujących z użyciem .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generatywna AI dla początkujących](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generatywna AI dla początkujących z użyciem Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML dla początkujących](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science dla początkujących](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI dla początkujących](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cyberbezpieczeństwo dla początkujących](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Web Dev dla początkujących](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT dla początkujących](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [Rozwój XR dla początkujących](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Opanowanie GitHub Copilot dla programowania w parach z AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Opanowanie GitHub Copilot dla programistów C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Wybierz swoją własną przygodę z Copilotem](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Nawigacja**  
- **Następna lekcja**: [Podstawy AZD](docs/getting-started/azd-basics.md)  

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
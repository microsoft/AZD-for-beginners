<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T16:45:37+00:00",
  "source_file": "workshop/README.md",
  "language_code": "pl"
}
-->
# Warsztaty AZD dla Twórców AI

**Nawigacja po warsztatach**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Powiązane rozdziały**: Obejmuje [Rozdział 1](../README.md#-chapter-1-foundation--quick-start), [Rozdział 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers) oraz [Rozdział 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ Laboratorium praktyczne**: [Laboratorium warsztatowe AI](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 Kolejne kroki**: [Moduły laboratorium warsztatowego](../../../workshop)

Witamy na warsztatach praktycznych dotyczących nauki Azure Developer CLI (AZD) z naciskiem na wdrażanie aplikacji AI. Warsztaty te mają na celu przeprowadzenie Cię od podstaw AZD do wdrażania gotowych do produkcji rozwiązań AI.

## Przegląd warsztatów

**Czas trwania:** 2-3 godziny  
**Poziom:** Początkujący do średniozaawansowany  
**Wymagania wstępne:** Podstawowa znajomość Azure, narzędzi wiersza poleceń i koncepcji AI

### Czego się nauczysz

- **Podstawy AZD**: Zrozumienie infrastruktury jako kodu z AZD
- 🤖 **Integracja usług AI**: Wdrażanie Azure OpenAI, AI Search i innych usług AI
- **Wdrażanie kontenerów**: Korzystanie z Azure Container Apps dla aplikacji AI
- **Najlepsze praktyki bezpieczeństwa**: Implementacja Managed Identity i bezpiecznych konfiguracji
- **Monitorowanie i obserwowalność**: Konfiguracja Application Insights dla obciążeń AI
- **Wzorce produkcyjne**: Strategie wdrażania na poziomie przedsiębiorstwa

## Struktura warsztatów

### Moduł 1: Podstawy AZD (30 minut)
- Instalacja i konfiguracja AZD
- Zrozumienie struktury projektu AZD
- Twoje pierwsze wdrożenie AZD
- **Laboratorium**: Wdrażanie prostej aplikacji internetowej

### Moduł 2: Integracja Azure OpenAI (45 minut)
- Konfiguracja zasobów Azure OpenAI
- Strategie wdrażania modeli
- Konfiguracja dostępu do API i uwierzytelniania
- **Laboratorium**: Wdrażanie aplikacji czatu z GPT-4

### Moduł 3: Aplikacje RAG (45 minut)
- Integracja Azure AI Search
- Przetwarzanie dokumentów z Azure Document Intelligence
- Wektoryzacja i wyszukiwanie semantyczne
- **Laboratorium**: Budowa systemu Q&A dla dokumentów

### Moduł 4: Wdrożenie produkcyjne (30 minut)
- Konfiguracja aplikacji kontenerowych
- Skalowanie i optymalizacja wydajności
- Monitorowanie i logowanie
- **Laboratorium**: Wdrażanie do produkcji z obserwowalnością

### Moduł 5: Zaawansowane wzorce (15 minut)
- Wdrożenia w wielu środowiskach
- Integracja CI/CD
- Strategie optymalizacji kosztów
- **Podsumowanie**: Lista kontrolna gotowości produkcyjnej

## Wymagania wstępne

### Wymagane narzędzia

Proszę zainstalować te narzędzia przed warsztatami:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Konfiguracja konta Azure

1. **Subskrypcja Azure**: [Zarejestruj się za darmo](https://azure.microsoft.com/free/)
2. **Dostęp do Azure OpenAI**: [Poproś o dostęp](https://aka.ms/oai/access)
3. **Wymagane uprawnienia**:
   - Rola Contributor na subskrypcji lub grupie zasobów
   - User Access Administrator (dla przypisań RBAC)

### Weryfikacja wymagań wstępnych

Uruchom ten skrypt, aby zweryfikować konfigurację:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Materiały warsztatowe

### Ćwiczenia laboratoryjne

Każdy moduł zawiera laboratoria praktyczne z kodem startowym i instrukcjami krok po kroku:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Twoje pierwsze wdrożenie AZD
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Aplikacja czatu z Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - Aplikacja RAG z AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Wzorce wdrożenia produkcyjnego
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Scenariusze zaawansowanego wdrożenia

### Materiały referencyjne

- **[Przewodnik integracji AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Kompleksowe wzorce integracji
- **[Przewodnik wdrażania modeli AI](../docs/ai-foundry/ai-model-deployment.md)** - Najlepsze praktyki wdrażania modeli
- **[Praktyki AI w produkcji](../docs/ai-foundry/production-ai-practices.md)** - Wzorce wdrożenia na poziomie przedsiębiorstwa
- **[Przewodnik rozwiązywania problemów AI](../docs/troubleshooting/ai-troubleshooting.md)** - Typowe problemy i rozwiązania

### Przykładowe szablony

Szablony szybkiego startu dla typowych scenariuszy AI:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Rozpoczęcie pracy

### Opcja 1: GitHub Codespaces (zalecane)

Najszybszy sposób na rozpoczęcie warsztatów:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Opcja 2: Rozwój lokalny

1. **Sklonuj repozytorium warsztatowe:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Zaloguj się do Azure:**
```bash
az login
azd auth login
```

3. **Rozpocznij od Laboratorium 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Opcja 3: Warsztaty prowadzone przez instruktora

Jeśli uczestniczysz w sesji prowadzonej przez instruktora:

- 🎥 **Nagranie warsztatów**: [Dostępne na żądanie](https://aka.ms/azd-ai-workshop)
- 💬 **Społeczność Discord**: [Dołącz, aby uzyskać wsparcie na żywo](https://aka.ms/foundry/discord)
- **Opinie o warsztatach**: [Podziel się swoimi doświadczeniami](https://aka.ms/azd-workshop-feedback)

## Harmonogram warsztatów

### Nauka we własnym tempie (3 godziny)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Sesja prowadzona przez instruktora (2,5 godziny)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Kryteria sukcesu

Na koniec warsztatów będziesz w stanie:

✅ **Wdrażać aplikacje AI** za pomocą szablonów AZD  
✅ **Konfigurować usługi Azure OpenAI** z odpowiednim zabezpieczeniem  
✅ **Budować aplikacje RAG** z integracją Azure AI Search  
✅ **Implementować wzorce produkcyjne** dla obciążeń AI na poziomie przedsiębiorstwa  
✅ **Monitorować i rozwiązywać problemy** związane z wdrażaniem aplikacji AI  
✅ **Stosować strategie optymalizacji kosztów** dla obciążeń AI  

## Społeczność i wsparcie

### Podczas warsztatów

- 🙋 **Pytania**: Korzystaj z czatu warsztatowego lub podnieś rękę
- 🐛 **Problemy**: Sprawdź [przewodnik rozwiązywania problemów](../docs/troubleshooting/ai-troubleshooting.md)
- **Wskazówki**: Dziel się odkryciami z innymi uczestnikami

### Po warsztatach

- 💬 **Discord**: [Społeczność Azure AI Foundry](https://aka.ms/foundry/discord)
- **Problemy GitHub**: [Zgłoś problemy z szablonami](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Opinie**: [Formularz oceny warsztatów](https://aka.ms/azd-workshop-feedback)

## Kolejne kroki

### Kontynuuj naukę

1. **Zaawansowane scenariusze**: Eksploruj [wdrożenia w wielu regionach](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **Integracja CI/CD**: Skonfiguruj [przepływy pracy GitHub Actions](../docs/deployment/github-actions.md)
3. **Własne szablony**: Twórz własne [szablony AZD](../docs/getting-started/custom-templates.md)

### Zastosuj w swoich projektach

1. **Ocena**: Skorzystaj z naszej [listy kontrolnej gotowości](./production-readiness-checklist.md)
2. **Szablony**: Rozpocznij od naszych [szablonów specyficznych dla AI](../../../workshop/templates)
3. **Wsparcie**: Dołącz do [Discord Azure AI Foundry](https://aka.ms/foundry/discord)

### Podziel się sukcesem

- ⭐ **Oceń repozytorium**, jeśli warsztaty były pomocne
- 🐦 **Podziel się w mediach społecznościowych** używając #AzureDeveloperCLI #AzureAI
- 📝 **Napisz post na blogu** o swojej podróży wdrażania AI

---

## Opinie o warsztatach

Twoje opinie pomagają nam ulepszać warsztaty:

| Aspekt | Ocena (1-5) | Komentarze |
|--------|--------------|----------|
| Jakość treści | ⭐⭐⭐⭐⭐ | |
| Laboratoria praktyczne | ⭐⭐⭐⭐⭐ | |
| Dokumentacja | ⭐⭐⭐⭐⭐ | |
| Poziom trudności | ⭐⭐⭐⭐⭐ | |
| Ogólne wrażenia | ⭐⭐⭐⭐⭐ | |

**Prześlij opinie**: [Formularz oceny warsztatów](https://aka.ms/azd-workshop-feedback)

---

**Poprzednie:** [Przewodnik rozwiązywania problemów AI](../docs/troubleshooting/ai-troubleshooting.md) | **Następne:** Rozpocznij od [Laboratorium 1: Podstawy AZD](../../../workshop/lab-1-azd-basics)

**Gotowy do rozpoczęcia budowy aplikacji AI z AZD?**

[Rozpocznij Laboratorium 1: Podstawy AZD →](./lab-1-azd-basics/README.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za źródło autorytatywne. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
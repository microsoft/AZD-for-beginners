# Rozdział 2: Rozwój z AI jako pierwszym krokiem

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 4-5 godzin łącznie z warsztatami | **⭐ Trudność**: Średniozaawansowany

---

## Przegląd

Ten rozdział koncentruje się na wdrażaniu aplikacji zasilanych AI za pomocą Azure Developer CLI i usług Microsoft Foundry. Od prostych aplikacji czatu AI po inteligentnych agentów z narzędziami.

> **Aktualizacja Foundry GA (2026-11-09):** Pakiet `microsoft.foundry` 1.0 jest [dostępny ogólnie](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Używaj `azd >= 1.37.0`; oceny pozostają oddzielną instalacją. [Przewodnik po hostowanym agencie](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) obejmuje testowanie Agenta Inspektora lokalnie i wdrażanie kodu zdalnie. To przegląd dokumentacji, a nie walidacja wdrożenia na żywo; opcjonalne funkcje podglądu zachowują swój status.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Wdrażać aplikacje AI korzystając z gotowych szablonów AZD
- Zrozumieć integrację Microsoft Foundry z AZD
- Zainstalować pakiet GA i przetestować hostowanego agenta lokalnie przed wdrożeniem jego źródła do Foundry
- Przejrzeć `azure.yaml`, zasoby oceny oraz czyszczenie nowych i używanych projektów
- Konfigurować i dostosowywać agentów AI z narzędziami
- Wdrażać aplikacje RAG (generowanie wspomagane wyszukiwaniem)

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Integracja Microsoft Foundry](microsoft-foundry-integration.md) | Pakiet GA, lokalno-chmurowy workflow hostowanego agenta i oceny | 60 min |
| 2 | [Przewodnik po agentach AI](agents.md) | Wdrażanie inteligentnych agentów z narzędziami | 45 min |
| 3 | [Wdrażanie modeli AI](ai-model-deployment.md) | Wdrażanie i konfiguracja modeli AI | 30 min |
| 4 | [Warsztat AI](ai-workshop-lab.md) | Praktyczne: poznaj szablon i zaplanuj konwersję | 2-3 godziny |

---

## 🚀 Szybki start

Wybierz jedną opcję w nowym pustym katalogu. Końcowy `.` inicjuje bieżący katalog; w przeciwnym razie AZD może utworzyć podkatalog bez zmiany katalogu roboczego shell.

Dla **ścieżki wdrażania kodu hostowanego agenta GA** rozpocznij od [przewodnika krok po kroku](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Wymaga AZD 1.37.0+, aktualnego uv, Pythona 3.13+, uprawnień Foundry i limitu modelu. Kompleksowe szablony aplikacji poniżej to alternatywy, a nie wymagania dla tego przewodnika.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Polecane szablony AI

| Szablon | Opis | Usługi |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Czat RAG z cytatami | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent AI z narzędziami | Usługa agenta AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Podstawowy czat AI | OpenAI + Container Apps |

---

## 💰 Świadomość kosztów

Są to orientacyjne zakresy, nie oferty ani limity; ruch modelu, SKU wyszukiwania/obliczeń, region i opcjonalne funkcje mogą je przekroczyć. Sprawdź aktualne wytyczne cenowe wybranego przykładu przed uruchomieniem.

| Środowisko | Szacowany miesięczny koszt |
|-------------|----------------------|
| Rozwój | 80-150 USD |
| Testowanie | 150-300 USD |
| Produkcja | 300-3 500+ USD |

**Czyszczenie:** Przejrzyj `azd down` przed potwierdzeniem: dla nowo utworzonego projektu Foundry usuwa grupę zasobów i wszystko w niej. Dla ponownie używanego projektu Foundry pozostawia zasoby projektu i agenta; stosuj się do [wytycznych dotyczących czyszczenia przewodnika](microsoft-foundry-integration.md#7-clean-up-deliberately), aby oddzielnie usunąć niechciane zasoby.

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 1: Fundamenty](../chapter-01-foundation/README.md) |
| **Następny** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |
| **Pomiń do** | [Rozdział 8: Wzorce produkcyjne](../chapter-08-production/README.md) |

---

## 📖 Powiązane zasoby

- [Rozwiązywanie problemów z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Praktyki produkcyjne AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Rozdział 2: Rozwój z AI na pierwszym miejscu

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 4-5 godzin wraz z warsztatami | **⭐ Poziom**: Średniozaawansowany

---

## Przegląd

Ten rozdział koncentruje się na wdrażaniu aplikacji zasilanych AI przy użyciu Azure Developer CLI i usług Microsoft Foundry. Od prostych aplikacji czatu AI po inteligentne agentury z narzędziami.

> **Przegląd wydania (2026-11-04):** Wytyczne dotyczące AI CLI zostały sprawdzone w odniesieniu do opublikowanej dokumentacji/źródła `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` oraz `azure.ai.evaluations` `1.0.0-beta.2`. Użyj `azd >= 1.37.0` dla połączonego przepływu pracy. Oceny teraz korzystają z osobnej przestrzeni nazw `azd ai eval`; zobacz [zmiany w wydaniu i wskazówki dotyczące migracji](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). To nie jest walidacja wdrożenia na żywo.

## Cele nauki

Po ukończeniu tego rozdziału będziesz umiał:
- Wdrażać aplikacje AI przy użyciu gotowych szablonów AZD
- Rozumieć integrację Microsoft Foundry z AZD
- Konfigurować i dostosowywać agentów AI z narzędziami
- Wdrażać aplikacje RAG (Retrieval-Augmented Generation)

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Integracja Microsoft Foundry](microsoft-foundry-integration.md) | Połączenie AZD z usługami Foundry | 30 min |
| 2 | [Przewodnik po agentach AI](agents.md) | Wdrażanie inteligentnych agentów z narzędziami | 45 min |
| 3 | [Wdrożenie modelu AI](ai-model-deployment.md) | Wdrażanie i konfigurowanie modeli AI | 30 min |
| 4 | [Laboratorium warsztatowe AI](ai-workshop-lab.md) | Praktycznie: Eksploracja szablonu i planowanie konwersji | 2-3 godziny |

---

## 🚀 Szybki start

Wybierz jedną opcję w nowym pustym katalogu. Wymieniony `.` inicjuje bieżący katalog; w przeciwnym razie AZD może utworzyć podkatalog bez zmiany katalogu roboczego twojej powłoki.

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
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent AI z narzędziami | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Podstawowy czat AI | OpenAI + Container Apps |

---

## 💰 Świadomość kosztów

Są to zakresy orientacyjne, nie oferty ani limity; ruch modelu, SKU wyszukiwania/obliczeń, region i opcjonalne funkcje mogą je przekroczyć. Przejrzyj aktualne wskazówki cenowe wybranego przykładu przed uruchomieniem.

| Środowisko | Szacowany miesięczny koszt |
|-------------|----------------------|
| Rozwój | 80-150 USD |
| Testowanie | 150-300 USD |
| Produkcja | 300-3500+ USD |

**Wskazówka:** Uruchom `azd down` po testach, aby uniknąć opłat.

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 1: Podstawy](../chapter-01-foundation/README.md) |
| **Następny** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |
| **Przejdź do** | [Rozdział 8: Wzorce produkcyjne](../chapter-08-production/README.md) |

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
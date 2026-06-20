# Rozdział 5: Rozwiązania AI z wieloma agentami

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 2-3 godziny | **⭐ Skomplikowanie**: Zaawansowany

---

## Przegląd

Ten rozdział obejmuje zaawansowane wzorce architektury z wieloma agentami, orkiestrację agentów oraz wdrożenia AI gotowe do produkcji dla złożonych scenariuszy.

> Walidowane w wersji `azd 1.25.6` w czerwcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz:
- Rozumieć wzorce architektury z wieloma agentami
- Wdrażać skoordynowane systemy agentów AI
- Implementować komunikację między agentami
- Budować gotowe do produkcji rozwiązania z wieloma agentami

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Podstawy wieloagentowe](multi-agent-basics.md) | Praktycznie: wdrożenie działającej aplikacji z wieloma agentami przy użyciu `azd up` | 45 min |
| 2 | [Wzorce koordynacji](../chapter-06-pre-deployment/coordination-patterns.md) | Strategie orkiestracji agentów (kontynuacja w Rozdziale 6) | 30 min |
| 3 | [Wdrożenie szablonu ARM](../../examples/retail-multiagent-arm-template/README.md) | Przykład wdrożenia jednym kliknięciem | 30 min |

> **Zacznij od Lekcji 1.** To jedyna w pełni praktyczna i wdrażalna lekcja w tym rozdziale. Lekcja 2 znajduje się w Rozdziale 6 (jest dzielona z planowaniem przedwdrożeniowym), a [Rozwiązanie wieloagentowe dla handlu detalicznego](../../examples/retail-scenario.md) to szablon architektury — wzór projektowy, a nie wzór do uruchamiania jednym poleceniem.

---

## 🚀 Szybki start

```bash
# Opcja 1: Wdróż z szablonu
azd init --template agent-openai-python-prompty
azd up

# Opcja 2: Wdróż z manifestu agenta (wymaga rozszerzenia azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Które podejście?** Użyj `azd init --template`, aby zacząć od działającego przykładu. Użyj `azd ai agent init`, gdy masz własny manifest agenta. Zobacz [referencję AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) po pełne szczegóły.

---

## 🤖 Architektura wieloagentowa

```mermaid
graph TD
    Orchestrator[Agent Orkiestratora<br/>Kieruje zapytaniami, zarządza przepływem pracy] --> Customer[Agent Klienta<br/>Zapytania użytkownika, preferencje]
    Orchestrator --> Inventory[Agent Inwentaryzacji<br/>Poziomy zapasów, zamówienia]
```

---

## 🎯 Prezentowane rozwiązanie: Retail Multi-Agent

[Retail Multi-Agent Solution](../../examples/retail-scenario.md) demonstruje:

- **Agent klienta**: Obsługuje interakcje z użytkownikiem i preferencje
- **Agent zapasów**: Zarządza stanem magazynowym i przetwarzaniem zamówień
- **Orkiestrator**: Koordynuje działania między agentami
- **Wspólna pamięć**: Zarządzanie kontekstem między agentami

### Wykorzystane usługi

| Usługa | Przeznaczenie |
|---------|---------|
| Microsoft Foundry Models | Rozumienie języka |
| Azure AI Search | Katalog produktów |
| Cosmos DB | Stan i pamięć agentów |
| Container Apps | Hosting agentów |
| Application Insights | Monitorowanie |

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 4: Infrastruktura](../chapter-04-infrastructure/README.md) |
| **Następny** | [Rozdział 6: Przed wdrożeniem](../chapter-06-pre-deployment/README.md) |

---

## 📖 Powiązane zasoby

- [Przewodnik po agentach AI](../chapter-02-ai-development/agents.md)
- [Praktyki AI w produkcji](../chapter-08-production/production-ai-practices.md)
- [Rozwiązywanie problemów AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
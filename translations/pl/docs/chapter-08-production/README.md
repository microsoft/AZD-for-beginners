# Rozdział 8: Wzorce Produkcyjne i Korporacyjne

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 2-3 godziny | **⭐ Stopień trudności**: Zaawansowany

---

## Przegląd

Ten rozdział obejmuje wzorce wdrożeń gotowych do zastosowań korporacyjnych, zabezpieczenia, monitorowanie i optymalizację kosztów dla produkcyjnych obciążeń AI.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Wdrażać aplikacje odporne wieloregionowo
- Implementować korporacyjne wzorce bezpieczeństwa
- Konfigurować kompleksowe monitorowanie
- Optymalizować koszty na dużą skalę
- Ustawiać rurociągi CI/CD z AZD

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Praktyki produkcji AI](production-ai-practices.md) | Wzorce wdrożeń korporacyjnych | 90 min |

---

## 🚀 Lista kontrolna produkcji

- [ ] Wdrożenie wieloregionowe dla odporności
- [ ] Zarządzana tożsamość dla uwierzytelniania (bez kluczy)
- [ ] Application Insights do monitorowania
- [ ] Skonfigurowane budżety kosztów i alerty
- [ ] Włączone skanowanie bezpieczeństwa
- [ ] Integracja z rurociągiem CI/CD
- [ ] Plan odzyskiwania po awarii

---

## 🏗️ Wzorce architektury

### Wzorzec 1: Microservices AI

```mermaid
graph LR
    Gateway[Brama API] --> AI[Usługa AI] --> Models[Modele Microsoft Foundry]
    Gateway --> Auth[Usługa Uwierzytelniania]
    AI --> Data[Magazyn Danych]
```
### Wzorzec 2: AI sterowane zdarzeniami

```mermaid
graph LR
    EventGrid[Siatka zdarzeń] --> Functions[Funkcje] --> Pipeline[Potok AI]
```
---

## 🔐 Najlepsze praktyki bezpieczeństwa

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Optymalizacja kosztów

| Strategia | Oszczędności |
|----------|--------------|
| Skalowanie do zera (Container Apps) | 60-80% |
| Używanie planów konsumpcyjnych na dewelopment | 50-70% |
| Planowane skalowanie | 30-50% |
| Zarezerwowana pojemność | 20-40% |

```bash
# Ustaw alerty budżetowe
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Konfiguracja monitorowania

```bash
# Strumieniuj logi
azd monitor --logs

# Sprawdź Application Insights
azd monitor

# Zobacz metryki
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md) |
| **Koniec kursu** | [Strona główna kursu](../../README.md) |

---

## 📖 Powiązane zasoby

- [Przewodnik po agentach AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Rozwiązania wieloagentowe](../chapter-05-multi-agent/README.md)
- [Przykład mikroserwisów](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Dokument ten został przetłumaczony przy użyciu automatycznej usługi tłumaczeniowej [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dążymy do dokładności, prosimy mieć na uwadze, że tłumaczenia automatyczne mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uważany za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
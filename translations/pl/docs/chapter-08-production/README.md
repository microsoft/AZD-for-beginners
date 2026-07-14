# Rozdział 8: Wzorce produkcyjne i korporacyjne

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 2-3 godziny | **⭐ Poziom trudności**: Zaawansowany

---

## Przegląd

Ten rozdział obejmuje wzorce wdrożeń gotowych do użycia korporacyjnego, zabezpieczanie, monitorowanie oraz optymalizację kosztów dla produkcyjnych obciążeń AI.

> Zatwierdzone na `azd 1.27.1` w lipcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Wdrożyć odporne aplikacje wieloregionowe
- Zaimplementować korporacyjne wzorce bezpieczeństwa
- Skonfigurować kompleksowe monitorowanie
- Optymalizować koszty na dużą skalę
- Ustawić pipeline CI/CD za pomocą AZD

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Praktyki produkcyjnego AI](production-ai-practices.md) | Wzorce wdrożeń korporacyjnych | 90 min |

---

## 🚀 Lista kontrolna produkcji

- [ ] Wdrożenie wieloregionowe dla odporności
- [ ] Zarządzana tożsamość do uwierzytelniania (bez kluczy)
- [ ] Application Insights do monitorowania
- [ ] Ustawione budżety i alerty kosztowe
- [ ] Włączone skanowanie zabezpieczeń
- [ ] Integracja pipeline CI/CD
- [ ] Plan odzyskiwania po awarii

---

## 🏗️ Wzorce architektoniczne

### Wzorzec 1: Mikroserwisy AI

```mermaid
graph LR
    Gateway[Bramą API] --> AI[Usługa AI] --> Models[Modele Microsoft Foundry]
    Gateway --> Auth[Usługa uwierzytelniania]
    AI --> Data[Magazyn danych]
```

### Wzorzec 2: AI sterowane zdarzeniami

```mermaid
graph LR
    EventGrid[Siatka zdarzeń] --> Functions[Funkcje] --> Pipeline[Potok AI]
```

---

## 🔐 Najlepsze praktyki zabezpieczeń

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
|----------|-------------|
| Skalowanie do zera (Container Apps) | 60-80% |
| Użycie warstw konsumpcyjnych na potrzeby dewelopmentu | 50-70% |
| Skalowanie zaplanowane | 30-50% |
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

## 📊 Konfiguracja monitoringu

```bash
# Strumieniuj logi
azd monitor --logs

# Sprawdź Application Insights
azd monitor --overview

# Zobacz metryki
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md) |
| **Kurs ukończony** | [Strona główna kursu](../../README.md) |

---

## 📖 Powiązane zasoby

- [Przewodnik po agentach AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Rozwiązania multi-agentowe](../chapter-05-multi-agent/README.md)
- [Przykład mikroserwisów](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
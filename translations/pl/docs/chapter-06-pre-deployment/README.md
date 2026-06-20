# Rozdział 6: Planowanie i walidacja przed wdrożeniem

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1 godzina | **⭐ Poziom trudności**: Średnio zaawansowany

---

## Przegląd

Ten rozdział obejmuje kluczowe kroki planowania i walidacji przed wdrożeniem aplikacji. Naucz się unikać kosztownych błędów dzięki odpowiedniemu planowaniu pojemności, wyborowi SKU oraz kontroli przed wdrożeniem.

> Zweryfikowano z `azd 1.25.6` w czerwcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Uruchamiać kontrole przed wdrożeniem
- Planować pojemność i szacować wymagania zasobów
- Wybierać odpowiednie SKU dla optymalizacji kosztów
- Konfigurować Application Insights do monitorowania
- Rozumieć wzorce koordynacji zespołu

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Kontrole przed wdrożeniem](preflight-checks.md) | Walidacja konfiguracji przed wdrożeniem | 15 min |
| 2 | [Planowanie pojemności](capacity-planning.md) | Szacowanie wymagań zasobów | 20 min |
| 3 | [Wybór SKU](sku-selection.md) | Wybór odpowiednich poziomów cenowych | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracja monitoringu | 20 min |
| 5 | [Wzorce koordynacji](coordination-patterns.md) | Workflow wdrożeniowe zespołu | 15 min |

---

## 🚀 Szybki start

```bash
# Sprawdź limity subskrypcji
az vm list-usage --location eastus --output table

# Podgląd wdrożenia (bez tworzenia zasobów)
azd provision --preview

# Sprawdź składnię Bicep
az bicep build --file infra/main.bicep

# Sprawdź konfigurację środowiska
azd env get-values
```

---

## ☑️ Lista kontrolna przed wdrożeniem

### Przed `azd provision`

- [ ] Zweryfikowano kwotę dla regionu
- [ ] Odpowiednio wybrane SKU
- [ ] Przejrzana estymacja kosztów
- [ ] Spójna konwencja nazewnictwa
- [ ] Skonfigurowane zabezpieczenia/RBAC

### Przed `azd deploy`

- [ ] Ustawione zmienne środowiskowe
- [ ] Sekrety w Key Vault
- [ ] Zweryfikowane łańcuchy połączeń
- [ ] Skonfigurowane kontrole stanu

---

## 💰 Przewodnik wyboru SKU

| Obciążenie | Środowisko deweloperskie | Produkcja |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Następny** | [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md) |

---

## 📖 Powiązane zasoby

- [Przewodnik konfiguracji](../chapter-03-configuration/configuration.md)
- [Przewodnik wdrożenia](../chapter-04-infrastructure/deployment-guide.md)
- [Typowe problemy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
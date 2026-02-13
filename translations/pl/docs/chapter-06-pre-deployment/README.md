# Rozdział 6: Planowanie i weryfikacja przed wdrożeniem

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1 godzina | **⭐ Poziom**: Średniozaawansowany

---

## Przegląd

Ten rozdział obejmuje niezbędne kroki planowania i weryfikacji przed wdrożeniem aplikacji. Naucz się unikać kosztownych błędów dzięki właściwemu planowaniu pojemności, wyborowi SKU oraz kontrolom wstępnym.

## Cele nauki

Po ukończeniu tego rozdziału będziesz umiał:
- Wykonywać kontrole wstępne przed wdrożeniem
- Planować pojemność i szacować wymagania dotyczące zasobów
- Wybierać odpowiednie SKU w celu optymalizacji kosztów
- Konfigurować Application Insights do monitorowania
- Rozumieć wzorce koordynacji zespołu

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Kontrole wstępne](preflight-checks.md) | Weryfikacja konfiguracji przed wdrożeniem | 15 min |
| 2 | [Planowanie pojemności](capacity-planning.md) | Szacowanie wymagań zasobowych | 20 min |
| 3 | [Wybór SKU](sku-selection.md) | Wybór odpowiednich poziomów cenowych | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracja monitorowania | 20 min |
| 5 | [Wzorce koordynacji](coordination-patterns.md) | Procesy wdrożeniowe zespołu | 15 min |

---

## 🚀 Szybki start

```bash
# Sprawdź limity subskrypcji
az vm list-usage --location eastus --output table

# Podgląd wdrożenia (żadne zasoby nie zostaną utworzone)
azd provision --preview

# Zwaliduj składnię Bicep
az bicep build --file infra/main.bicep

# Sprawdź konfigurację środowiska
azd env get-values
```

---

## ☑️ Lista kontrolna przed wdrożeniem

### Przed `azd provision`

- [ ] Limity zasobów (quota) zweryfikowane dla regionu
- [ ] SKU wybrane odpowiednio
- [ ] Szacunek kosztów zweryfikowany
- [ ] Konwencja nazewnictwa spójna
- [ ] Zabezpieczenia/RBAC skonfigurowane

### Przed `azd deploy`

- [ ] Zmienne środowiskowe ustawione
- [ ] Sekrety w Key Vault
- [ ] Ciągi połączeń zweryfikowane
- [ ] Kontrole stanu (health checks) skonfigurowane

---

## 💰 Przewodnik wyboru SKU

| Obciążenie | Środowisko deweloperskie | Produkcja |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
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
- [Częste problemy](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Zastrzeżenie:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczeń opartych na sztucznej inteligencji Co-op Translator (https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było jak najbardziej poprawne, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy traktować jako dokument wiążący. W przypadku informacji krytycznych zaleca się skorzystanie z tłumaczenia wykonanego przez profesjonalnego tłumacza. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Rozdział 6: Planowanie i weryfikacja przed wdrożeniem

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 2-4 godziny czytania; dodatkowy czas na dostosowane laboratoria | **⭐ Stopień trudności**: Średniozaawansowany–Zaawansowany

---

## Przegląd

Ten rozdział obejmuje kluczowe kroki planowania i weryfikacji przed wdrożeniem aplikacji. Naucz się unikać kosztownych błędów dzięki właściwemu planowaniu pojemności, wyborowi SKU i kontrolom przed wdrożeniem.

> Wskazówki dotyczące poleceń sprawdzane w odniesieniu do wydanego referencyjnego `azd 1.37.2`. Wdrożenia w chmurze nie były wykonywane. Dłuższe lekcje zawierają fragmenty ilustracyjne, a nie kompletne projekty wdrożenia lokalnego.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Przeprowadzać kontrole przed wdrożeniem
- Planować pojemność i szacować wymagania zasobów
- Wybierać odpowiednie SKU dla optymalizacji kosztów
- Konfigurować Application Insights do monitorowania
- Rozumieć wzorce koordynacji multi-agentów oraz ich wymagania wdrożeniowe

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Kontrole przed wdrożeniem](preflight-checks.md) | Weryfikacja konfiguracji przed wdrożeniem | 15 min |
| 2 | [Planowanie pojemności](capacity-planning.md) | Szacowanie wymagań zasobów | 20 min |
| 3 | [Wybór SKU](sku-selection.md) | Dobór odpowiednich poziomów cenowych | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfiguracja monitorowania | 20 min |
| 5 | [Wzorce koordynacji](coordination-patterns.md) | Zaawansowany projekt orkiestracji multi-agentów | 60-75 min |

---

## 🚀 Szybki start

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Lista kontrolna przed wdrożeniem

### Przed `azd provision`

- [ ] Zweryfikowano limit dla regionu
- [ ] Odpowiednio wybrane SKU
- [ ] Przejrzano szacunek kosztów
- [ ] Spójna konwencja nazewnictwa
- [ ] Skonfigurowano zabezpieczenia/RBAC

### Przed `azd deploy`

- [ ] Ustawione zmienne środowiskowe
- [ ] Sekrety w Key Vault
- [ ] Zweryfikowane łańcuchy połączeń
- [ ] Skonfigurowane kontrole stanu

---

## 💰 Przewodnik po wyborze SKU

| Obciążenie | Rozwój | Produkcja |
|----------|-------------|------------|
| Container Apps | Konsumpcja | Konsumpcja lub dedykowany profil obciążenia, w zależności od zmierzonego obciążenia |
| App Service | B1/B2 | P1v3+ |
| Modele Azure OpenAI | Obsługiwany typ wdrożenia pay-as-you-go | Pay-as-you-go lub przepustowość zarezerwowana; zależy od modelu/regionu |
| AI Search | Darmowy/Podstawowy w limitach | Poziom Podstawowy lub Standardowy dostosowany do indeksu, replik i obciążenia zapytań |

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
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Rozdział 7: Rozwiązywanie problemów i debugowanie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1-1.5 godziny | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział pomaga zdiagnozować i rozwiązać typowe problemy podczas pracy z Azure Developer CLI. Od błędów wdrożeniowych po problemy specyficzne dla AI.

> Wskazówki dotyczące poleceń sprawdzone względem wydanego odniesienia `azd 1.37.2`. Nie wykonywano wdrożeń w chmurze. Przed użyciem poleceń zamień przykładowe nazwy zasobów i identyfikatory.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Diagnozować typowe błędy wdrożeń AZD
- Debugować problemy z uwierzytelnianiem i uprawnieniami
- Rozwiązywać problemy z połączeniem usług AI
- Korzystać z Azure Portal i CLI do rozwiązywania problemów

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Typowe problemy](common-issues.md) | Często spotykane problemy | 30 min |
| 2 | [Przewodnik po debugowaniu](debugging.md) | Strategie debugowania krok po kroku | 45 min |
| 3 | [Rozwiązywanie problemów z AI](ai-troubleshooting.md) | Problemy specyficzne dla AI | 30 min |

---

## 🚨 Szybkie naprawy

### Problemy z uwierzytelnianiem
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Błędy podczas provisionsowania
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflikty zasobów
Najpierw sprawdź istniejące zasoby i błędy wdrożenia. Nie usuwaj środowiska współdzielonego ani produkcyjnego, aby rozwiązać konflikt nazw. Dla **nowego środowiska jednorazowego** użyj unikalnej nazwy:

```bash
azd env new different-name
azd up
```

### Przekroczony limit kwoty
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Zmiana `AZURE_LOCATION` nie przenosi istniejących zasobów i może powodować konflikty lokalizacji przy ponownym wdrożeniu.

---

## 📋 Referencja kodów błędów

| Błąd | Przyczyna | Rozwiązanie |
|-------|-------|----------|
| `AuthenticationError` | Brak zalogowania | `azd auth login` |
| `ResourceNotFound` | Brak zasobu | Sprawdź nazwy zasobów |
| `QuotaExceeded` | Limity subskrypcji | Złóż prośbę o zwiększenie kwoty |
| `InvalidTemplate` | Błąd składni Bicep | `az bicep build` |
| `Conflict` | Zasób już istnieje | Użyj nowej nazwy lub usuń |
| `Forbidden` | Niewystarczające uprawnienia | Sprawdź role RBAC |

---

## 🔄 Resetowanie i odzyskiwanie

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Twardy reset usuwa dane i może zmienić punkty końcowe. Najpierw wykonaj kopię zapasową i przejrzyj interaktywne monity usuwania. `--force --purge` jest odpowiedni tylko dla środowisk jednorazowych, gdy zamierzone jest nieodwracalne usunięcie.

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 6: Przygotowanie do wdrożenia](../chapter-06-pre-deployment/README.md) |
| **Następny** | [Rozdział 8: Produkcja](../chapter-08-production/README.md) |

---

## 📖 Powiązane zasoby

- [Kontrole przed wdrożeniem](../chapter-06-pre-deployment/preflight-checks.md)
- [Przewodnik konfiguracji](../chapter-03-configuration/configuration.md)
- [Zgłoszenia AZD na GitHubie](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
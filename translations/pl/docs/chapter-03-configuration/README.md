# Rozdział 3: Konfiguracja i Uwierzytelnianie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 90-150 minut łącznie z praktyką integracji | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział obejmuje konfigurację środowiska, wzorce uwierzytelniania oraz najlepsze praktyki bezpieczeństwa dla wdrożeń Azure Developer CLI.

> Cel przeglądu poleceń i konfiguracji: `azd 1.37.2` (listopad 2026). Podczas przeglądu nie przeprowadzono rzeczywistego uruchomienia provisioning w Azure.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Opanować hierarchię konfiguracji AZD
- Zarządzać wieloma środowiskami (dev, staging, prod)
- Wdrażać bezpieczne uwierzytelnianie za pomocą zarządzanych tożsamości
- Konfigurować ustawienia specyficzne dla środowiska

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Przewodnik konfiguracji](configuration.md) | Ustawienie i zarządzanie środowiskiem | 30 min |
| 2 | [Uwierzytelnianie i bezpieczeństwo](authsecurity.md) | Wzorce zarządzanej tożsamości i RBAC | 30 min |

---

## 🚀 Szybki start

Uruchom z katalogu głównego **już zainicjowanej aplikacji azd**, nie z repozytorium kursu. Użyj nieużywanych nazw środowisk, jeśli te już istnieją.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` służy jako przykład: wpływa na infrastrukturę tylko wtedy, gdy twój szablon wyraźnie go wykorzystuje. Zwykłe wartości `azd env set` są zapisywane lokalnie w postaci zwykłego tekstu; nie są to bezpieczne magazyny sekretów.

---

## 🔧 Hierarchia konfiguracji

Trzy różne powierzchnie konfiguracji utrzymuj oddzielnie: globalne preferencje (`azd config`), struktura projektu (`azure.yaml`) oraz wartości dla konkretnego środowiska (`azd env`). Flagi nadpisują tylko te ustawienia, które faktycznie obsługują; nie istnieje uniwersalna nakładka dowolnych zmiennych środowiskowych na `azure.yaml` lub Bicep.

---

## 🔐 Najlepsze praktyki bezpieczeństwa

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 2: Rozwój AI](../chapter-02-ai-development/README.md) |
| **Następny** | [Rozdział 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Powiązane zasoby

- [Kontrole przed wdrożeniem](../chapter-06-pre-deployment/README.md)
- [Rozwiązywanie problemów](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
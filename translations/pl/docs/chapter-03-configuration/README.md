# Rozdział 3: Konfiguracja i uwierzytelnianie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 45-60 minut | **⭐ Poziom trudności**: Średnio zaawansowany

---

## Przegląd

Ten rozdział obejmuje konfigurację środowiska, wzorce uwierzytelniania oraz najlepsze praktyki bezpieczeństwa dla wdrożeń przy użyciu Azure Developer CLI.

## Cele nauczania

Po ukończeniu tego rozdziału będziesz potrafić:
- Opanować hierarchię konfiguracji AZD
- Zarządzać wieloma środowiskami (dev, staging, prod)
- Wdrażać bezpieczne uwierzytelnianie za pomocą tożsamości zarządzanych
- Konfigurować ustawienia specyficzne dla środowiska

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Przewodnik konfiguracji](configuration.md) | Konfiguracja i zarządzanie środowiskiem | 30 min |
| 2 | [Uwierzytelnianie i bezpieczeństwo](authsecurity.md) | Wzorce tożsamości zarządzanej i RBAC | 30 min |

---

## 🚀 Szybki start

```bash
# Utwórz wiele środowisk
azd env new dev
azd env new staging
azd env new prod

# Przełącz środowiska
azd env select prod

# Ustaw zmienne środowiskowe
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Wyświetl konfigurację
azd env get-values
```

---

## 🔧 Hierarchia konfiguracji

AZD stosuje ustawienia w tej kolejności (późniejsze nadpisują wcześniejsze):

1. **Wartości domyślne** (wbudowane w szablony)
2. **azure.yaml** (konfiguracja projektu)
3. **Zmienne środowiskowe** (`azd env set`)
4. **Flagi wiersza poleceń** (`--location eastus`)

---

## 🔐 Najlepsze praktyki bezpieczeństwa

```bash
# Użyj tożsamości zarządzanej (zalecane)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Sprawdź status uwierzytelniania
azd auth whoami
az account show

# Ponownie uwierzytelnij, jeśli to konieczne
azd auth login
az login
```

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 2: Tworzenie AI](../chapter-02-ai-development/README.md) |
| **Następny** | [Rozdział 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Powiązane zasoby

- [Kontrole przed wdrożeniem](../chapter-06-pre-deployment/README.md)
- [Rozwiązywanie problemów](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Wyłączenie odpowiedzialności**:
Ten dokument został przetłumaczony przy użyciu usługi tłumaczeń AI Co-op Translator (https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było jak najbardziej dokładne, należy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym powinien być uznany za źródło wiążące. W przypadku informacji o krytycznym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
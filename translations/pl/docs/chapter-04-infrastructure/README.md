# Rozdział 4: Infrastruktura jako kod i wdrażanie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1-1,5 godziny | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział obejmuje wzorce Infrastruktur jako Kod (IaC) z szablonami Bicep, udostępnianie zasobów oraz strategie wdrażania przy użyciu Azure Developer CLI.

> Sprawdzone z `azd 1.23.12` w marcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Zrozumieć strukturę i składnię szablonów Bicep
- Udostępniać zasoby Azure za pomocą `azd provision`
- Wdrażać aplikacje za pomocą `azd deploy`
- Wdrażać strategie wdrażania blue-green i rolling

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Udostępnianie zasobów](provisioning.md) | Zarządzanie zasobami Azure za pomocą AZD | 45 min |
| 2 | [Przewodnik po wdrażaniu](deployment-guide.md) | Strategie wdrażania aplikacji | 45 min |

---

## 🚀 Szybki start

```bash
# Inicjalizuj z szablonu
azd init --template azure-functions-python-v2-http

# Podgląd tego, co zostanie utworzone
azd provision --preview

# Wdróż tylko infrastrukturę
azd provision

# Wdróż tylko kod
azd deploy

# Lub obie opcje razem
azd up
```

---

## 📁 Struktura projektu AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Podstawowe polecenia

| Polecenie | Opis |
|---------|-------------|
| `azd init` | Inicjalizacja projektu |
| `azd provision` | Tworzenie zasobów Azure |
| `azd deploy` | Wdrażanie kodu aplikacji |
| `azd up` | provision + deploy |
| `azd down` | Usunięcie wszystkich zasobów |

---

## 🔗 Nawigacja

| Kierunek | Rozdział |
|-----------|---------|
| **Poprzedni** | [Rozdział 3: Konfiguracja](../chapter-03-configuration/README.md) |
| **Następny** | [Rozdział 5: Rozwiązania wieloagentowe](../chapter-05-multi-agent/README.md) |

---

## 📖 Powiązane zasoby

- [Kontrole przed wdrożeniem](../chapter-06-pre-deployment/README.md)
- [Przykłady aplikacji kontenerowych](../../examples/container-app/README.md)
- [Przykład aplikacji bazodanowej](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym należy uznać za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
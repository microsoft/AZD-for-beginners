# Rozdział 4: Infrastruktura jako Kod i Wdrożenie

**📚 Kurs**: [AZD dla Początkujących](../../README.md) | **⏱️ Czas trwania**: 1-1.5 godziny | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział obejmuje wzorce Infrastruktury jako Kod (IaC) z wykorzystaniem szablonów Bicep, provisionowanie zasobów oraz strategie wdrożeń przy użyciu Azure Developer CLI.

> Weryfikowano na `azd 1.25.6` w czerwcu 2026.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Zrozumieć strukturę i składnię szablonów Bicep
- Provisionować zasoby Azure za pomocą `azd provision`
- Wdrażać aplikacje za pomocą `azd deploy`
- Implementować strategie wdrożeń blue-green i rolling

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Provisionowanie zasobów](provisioning.md) | Zarządzanie zasobami Azure z AZD | 45 min |
| 2 | [Przewodnik wdrożeń](deployment-guide.md) | Strategie wdrożeń aplikacji | 45 min |
| 3 | [Tworzenie własnego szablonu](custom-templates.md) | Budowanie i publikowanie wielokrotnego użytku szablonów azd | 30 min |

---

## 🚀 Szybki start

```bash
# Zainicjuj z szablonu
azd init --template azure-functions-python-v2-http

# Podejrzyj, co zostanie utworzone
azd provision --preview

# Wdroż tylko infrastrukturę
azd provision

# Wdroż tylko kod
azd deploy

# Lub oba razem
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
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Rozdział 4: Infrastruktura jako kod i wdrażanie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 2-3 godziny czytania; przewidź dodatkowy czas na ćwiczenia wdrożeniowe | **⭐ Poziom trudności**: Średniozaawansowany

---

## Przegląd

Ten rozdział omawia wzorce Infrastructure as Code (IaC) z szablonami Bicep, provisionowanie zasobów i strategie wdrażania z wykorzystaniem Azure Developer CLI.

> Cel przeglądu poleceń i konfiguracji: `azd 1.37.2` (listopad 2026). Nie wykonano rzeczywistego provisionowania Azure podczas przeglądu.

## Cele nauki

Po ukończeniu tego rozdziału będziesz potrafił:
- Zrozumieć strukturę i składnię szablonów Bicep
- Provisionować zasoby Azure za pomocą `azd provision`
- Wdrażać aplikacje z `azd deploy`
- Wdrażać strategie wdrażania blue-green i rolling

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Provisionowanie zasobów](provisioning.md) | Zarządzanie zasobami Azure za pomocą AZD | 45 min |
| 2 | [Przewodnik wdrażania](deployment-guide.md) | Strategie wdrażania aplikacji | 45 min |
| 3 | [Tworzenie własnego szablonu](custom-templates.md) | Budowanie i publikowanie wielokrotnego użytku szablonów azd | 30 min |

---

## 🚀 Szybki start

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| `azd init` | Inicjuj projekt |
| `azd provision` | Utwórz zasoby Azure |
| `azd deploy` | Wdróż kod aplikacji |
| `azd up` | provision + wdrożenie |
| `azd down` | Usuń wszystkie zasoby |

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
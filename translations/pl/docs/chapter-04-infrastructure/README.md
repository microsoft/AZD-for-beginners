# Rozdział 4: Infrastruktura jako kod i wdrażanie

**📚 Kurs**: [AZD dla początkujących](../../README.md) | **⏱️ Czas trwania**: 1-1.5 godz. | **⭐ Złożoność**: Średniozaawansowany

---

## Przegląd

Ten rozdział omawia wzorce Infrastructure as Code (IaC) ze szablonami Bicep, prowizjonowanie zasobów oraz strategie wdrażania z użyciem Azure Developer CLI.

## Cele nauki

Po ukończeniu tego rozdziału będziesz:
- Zrozumiesz strukturę i składnię szablonów Bicep
- Prowizjonować zasoby Azure za pomocą `azd provision`
- Wdrażać aplikacje za pomocą `azd deploy`
- Wdrażać strategie wdrażania typu blue-green i rolling

---

## 📚 Lekcje

| # | Lekcja | Opis | Czas |
|---|--------|-------------|------|
| 1 | [Prowizjonowanie zasobów](provisioning.md) | Zarządzanie zasobami Azure za pomocą AZD | 45 min |
| 2 | [Przewodnik wdrażania](deployment-guide.md) | Strategie wdrażania aplikacji | 45 min |

---

## 🚀 Szybki start

```bash
# Zainicjalizuj z szablonu
azd init --template azure-functions-python-v2-http

# Podejrzyj, co zostanie utworzone
azd provision --preview

# Tylko przygotuj infrastrukturę
azd provision

# Tylko wdroż kod
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
| `azd init` | Zainicjalizuj projekt |
| `azd provision` | Utwórz zasoby Azure |
| `azd deploy` | Wdróż kod aplikacji |
| `azd up` | provision + deploy |
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
Zastrzeżenie:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia z wykorzystaniem sztucznej inteligencji Co-op Translator (https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby zapewnić poprawność, prosimy pamiętać, że tłumaczenia automatyczne mogą zawierać błędy lub nieścisłości. Wersja oryginalna dokumentu w jego języku źródłowym powinna być traktowana jako dokument wiążący. W przypadku informacji o znaczeniu krytycznym zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez tłumacza. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
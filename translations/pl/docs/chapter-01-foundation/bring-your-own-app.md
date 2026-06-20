# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Zwalidowano z `azd 1.25.6` w czerwcu 2026.

## Introduction

W [Your First Project](first-project.md) wdrożyłeś aplikację, zaczynając od szablonu. Jednak w większości przypadków już masz aplikację — API Node.js, usługę Python Flask, aplikację web .NET — leżącą w folderze na twoim komputerze. Ta lekcja pokazuje, jak dodać azd do istniejącego kodu, aby móc go wdrożyć za pomocą `azd up`, bez konieczności używania szablonu.

## Learning Goals

Po zakończeniu tej lekcji:
- Zrozumiesz trzy sposoby rozpoczęcia projektu azd
- Uruchomisz `azd init` w istniejącej bazie kodu
- Zrozumiesz, co robi `azure.yaml` i folder `infra/` dla twojej aplikacji
- Będziesz wiedzieć, kiedy pozwolić azd wygenerować infrastrukturę, a kiedy napisać ją samodzielnie
- Wdrożysz swoją istniejącą aplikację do Azure przy użyciu `azd up`

## Learning Outcomes

Po ukończeniu tej lekcji będziesz potrafił:
- Zainicjować azd w projekcie, który już posiadasz
- Odczytać i edytować podstawowy plik `azure.yaml`
- Wygenerować początkową infrastrukturę za pomocą `azd infra generate`
- Wybrać odpowiedni host Azure dla swojej aplikacji
- Wdrożyć i usunąć własną aplikację

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopting azd for an existing repository |

Ćwiczyłeś już pierwszą opcję. Ta lekcja obejmuje drugą — najczęstszy scenariusz w praktyce.

---

## Step 1: Run `azd init` in Your Project

Otwórz terminal **wewnątrz istniejącego folderu projektu** i uruchom:

```bash
cd my-existing-app
azd init
```

azd zapyta, jak chcesz zainicjować projekt. Wybierz:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Wybierz **"Use code in the current directory."** azd przeskanuje twój folder, wykryje język i framework oraz zaproponuje hosta.

### What azd detects

azd szuka sygnałów takich jak `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` lub `Dockerfile` i sugeruje pasujący host Azure:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Potwierdź wykryte usług(y), a azd wygeneruje pliki, których potrzebujesz.

---

## Step 2: Understand What azd Created

Po init otrzymasz dwie nowe rzeczy w swoim projekcie:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — the project definition

To jest serce projektu azd. Minimalny plik wygląda tak:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` jest kluczową częścią: każdy wpis mapuje folder z twoim kodem na hosta Azure. Jeśli twoja aplikacja ma zarówno frontend, jak i API, będziesz mieć dwie usługi.

### `infra/` — your Azure resources as code

Folder `infra/` zawiera pliki Bicep definiujące zasoby Azure, których potrzebuje twoja aplikacja (App Service, baza danych itp.). Nie musisz pisać ich ręcznie — azd generuje działający punkt startowy. Możesz je edytować później, aby dodać zasoby lub zaostrzyć zabezpieczenia (omówione w [Chapter 4](../chapter-04-infrastructure/README.md)).

> **Wskazówka:** Chcesz zobaczyć lub dostosować wygenerowaną infrastrukturę przed wdrożeniem? Uruchom `azd infra generate` (dostępne również jako `azd infra synth`), aby zapisać IaC na dysku i móc go przejrzeć oraz wersjonować.

---

## Step 3: Set Required Configuration

Jeśli twoja aplikacja potrzebuje ustawień lub sekretów (connection string, klucz API), nie umieszczaj ich na stałe w kodzie. Używaj wartości środowiskowych:

```bash
# Utwórz środowisko
azd env new dev

# Ustaw wartość niebędącą tajną
azd env set API_VERSION 1.0.0
```

Dla prawdziwych sekretów przechowuj je w Key Vault i odwołuj się do nich z poziomu infrastruktury — patrz [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Teraz użyj tego samego przebiegu, który już znasz:

```bash
# Uwierzytelnij (wymagane dla azd)
azd auth login

# Podejrzyj zasoby, które zostaną utworzone
azd provision --preview

# Skonfiguruj infrastrukturę i wdroż swój kod
azd up
```

Po zakończeniu azd wypisze adres URL twojej aplikacji. Zweryfikuj ją tak samo jak każdą aplikację azd:

```bash
azd show           # pokaż punkty końcowe
azd monitor --logs # sprawdź logi w razie potrzeby
```

---

## Common First-Time Issues

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

Po więcej informacji zobacz [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Use code in the current directory"** dodaje azd do aplikacji, którą już masz.
- `azure.yaml` mapuje foldery z kodem na hosty Azure; `infra/` definiuje zasoby jako Bicep.
- `azd infra generate` pozwala przejrzeć lub dostosować wygenerowaną infrastrukturę.
- Po zainicjowaniu twoja istniejąca aplikacja korzysta z tego samego przebiegu `azd up` / `azd down`, co aplikacja oparta na szablonie.

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Related Resources

- [AZD Basics](azd-basics.md)
- [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
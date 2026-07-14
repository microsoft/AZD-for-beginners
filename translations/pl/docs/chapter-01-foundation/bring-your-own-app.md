# Bring Your Own App - Dodaj azd do istniejącego projektu

**Nawigacja po rozdziale:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Aktualny rozdział**: Rozdział 1 - Fundamenty i szybki start
- **⬅️ Poprzedni**: [Twój pierwszy projekt](first-project.md)
- **➡️ Następny**: [Dev Containers & Codespaces](dev-containers.md)

> Zweryfikowano z `azd 1.27.1` w lipcu 2026.

## Wprowadzenie

W [Twoim pierwszym projekcie](first-project.md) wdrożyłeś aplikację, zaczynając od szablonu. Jednak najczęściej masz już *gotową* aplikację — Node.js API, usługę Python Flask, aplikację .NET webową — znajdującą się w folderze na Twoim komputerze. Ta lekcja pokazuje, jak dodać azd do istniejącego kodu, aby można było ją wdrożyć za pomocą `azd up`, bez konieczności używania szablonu.

## Cele nauki

Po ukończeniu tej lekcji:
- Zrozumiesz trzy sposoby rozpoczęcia projektu azd
- Uruchomisz `azd init` w istniejącym kodzie
- Zrozumiesz, co robi `azure.yaml` i folder `infra/` w twojej aplikacji
- Dowiesz się, kiedy pozwolić azd generować infrastrukturę, a kiedy napisać ją samodzielnie
- Wdrożysz swoją istniejącą aplikację w Azure za pomocą `azd up`

## Efekty nauki

Po ukończeniu lekcji będziesz potrafił:
- Zainicjować azd w posiadanym projekcie
- Odczytać i edytować podstawowy plik `azure.yaml`
- Wygenerować początkową infrastrukturę za pomocą `azd infra generate`
- Wybrać odpowiedniego hosta Azure dla swojej aplikacji
- Wdrożyć i posprzątać własną aplikację

---

## Trzy sposoby rozpoczęcia projektu azd

| Punkt startowy | Komenda | Kiedy używać |
|----------------|---------|-------------|
| **Ze szablonu** | `azd init --template <name>` | Nauka lub rozpoczęcie nowej aplikacji na przykładzie sprawdzonego szablonu |
| **Z istniejącego kodu** | `azd init` (w folderze projektu) | Masz już aplikację i chcesz ją wdrożyć |
| **Z repozytorium Git** | `azd init --from-code` (w sklonowanym repozytorium) | Adaptacja azd do istniejącego repozytorium |

Już ćwiczyłeś pierwszą opcję. Ta lekcja dotyczy drugiej — najczęstszego scenariusza w praktyce.

---

## Krok 1: Uruchom `azd init` w swoim projekcie

Otwórz terminal **w folderze swojego istniejącego projektu** i uruchom:

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

Wybierz **"Use code in the current directory."** azd zeskanuje folder, wykryje Twój język i framework, i zaproponuje hosta.

### Co wykrywa azd

azd szuka sygnałów takich jak `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` lub `Dockerfile` i sugeruje odpowiedniego hosta Azure:

| Twoja aplikacja | Prawdopodobnie wykryty host |
|----------|----------------------|
| Node.js / Python / .NET aplikacja webowa | Azure App Service lub Container Apps |
| Aplikacja w kontenerze (`Dockerfile`) | Azure Container Apps |
| Aplikacja funkcji | Azure Functions |
| Strona statyczna (wynik budowy React/Vue) | Azure Static Web Apps |

Potwierdź wykryte usługi, a azd wygeneruje pliki, których potrzebujesz.

---

## Krok 2: Zrozum, co stworzył azd

Po inicjalizacji w projekcie pojawią się dwa nowe elementy:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definicja projektu

To serce projektu azd. Minimalny plik wygląda tak:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Sekcja `services` jest kluczowa: każda pozycja mapuje folder z kodem na hosta Azure. Jeśli aplikacja ma frontend i API, będą dwie usługi.

### `infra/` — zasoby Azure jako kod

Folder `infra/` zawiera pliki Bicep definiujące zasoby Azure potrzebne aplikacji (App Service, bazę danych itd.). Nie musisz pisać ich ręcznie — azd generuje działający punkt startowy. Możesz je później edytować, aby dodać zasoby lub zwiększyć bezpieczeństwo (omówione w [Rozdziale 4](../chapter-04-infrastructure/README.md)).

> **Wskazówka:** Chcesz zobaczyć lub dostosować wygenerowaną infrastrukturę przed wdrożeniem? Uruchom `azd infra generate` (dostępne także jako `azd infra synth`), aby zapisać IaC na dysku do przeglądu i kontroli wersji.

---

## Krok 3: Ustaw wymagane konfiguracje

Jeśli aplikacja potrzebuje ustawień lub sekretów (łańcuch połączeniowy, klucz API), nie wpisuj ich na stałe. Użyj wartości środowiskowych:

```bash
# Utwórz środowisko
azd env new dev

# Ustaw wartość niebędącą tajną
azd env set API_VERSION 1.0.0
```

Prawdziwe sekrety przechowuj w Key Vault i odwołuj się do nich z infrastruktury — zobacz [Rozdział 3: Konfiguracja i uwierzytelnianie](../chapter-03-configuration/authsecurity.md).

---

## Krok 4: Wdrożenie

Teraz użyj tego samego schematu, który już znasz:

```bash
# Uwierzytelnij się (wymagane dla azd)
azd auth login

# Podgląd zasobów, które zostaną utworzone
azd provision --preview

# Przygotuj infrastrukturę i wdroż swój kod
azd up
```

Po zakończeniu azd wyświetli adres URL twojej aplikacji. Zweryfikuj ją tak samo jak każdą aplikację azd:

```bash
azd show           # pokaż punkty końcowe
azd monitor --logs # sprawdź logi w razie potrzeby
```

---

## Typowe problemy na początku

| Objaw | Prawdopodobna przyczyna | Naprawa |
|---------|--------------|-----|
| azd nie wykryło mojej aplikacji | Brak manifestu (np. `package.json`) | Dodaj manifest lub wybierz hosta ręcznie podczas `azd init` |
| Kompilacja nie powiodła się podczas `azd up` | Aplikacja wymaga procesu budowania | Dodaj `buildCommand`/`outputPath` pod usługą w `azure.yaml` |
| Aplikacja startuje, ale zwraca błędy | Brak konfiguracji/sekrety | Ustaw wartości za pomocą `azd env set` lub skonfiguruj Key Vault |
| Wybrano niewłaściwego hosta | Błędne automatyczne wykrycie | Edytuj `host:` w `azure.yaml` i uruchom ponownie `azd up` |

Więcej informacji znajdziesz w [Rozdziale 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md).

---

## Sprzątanie

```bash
azd down --force --purge
```

---

## Podsumowanie

- `azd init` → **"Use code in the current directory"** dodaje azd do już istniejącej aplikacji.
- `azure.yaml` mapuje foldery z kodem na hosty Azure; `infra/` definiuje zasoby jako Bicep.
- `azd infra generate` pozwala przeglądać lub dostosowywać wygenerowaną infrastrukturę.
- Po inicjalizacji twoja istniejąca aplikacja korzysta z dokładnie takiego samego workflow `azd up` / `azd down` jak aplikacja bazująca na szablonie.

---

## 🔗 Nawigacja

| Kierunek | Lekcja |
|-----------|--------|
| **Poprzednia** | [Twój pierwszy projekt](first-project.md) |
| **Następna** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Pokrewne zasoby

- [Podstawy AZD](azd-basics.md)
- [Rozdział 4: Infrastruktura jako kod](../chapter-04-infrastructure/README.md)
- [Konfiguracja i uwierzytelnianie](../chapter-03-configuration/authsecurity.md)
- [Skrót komend](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
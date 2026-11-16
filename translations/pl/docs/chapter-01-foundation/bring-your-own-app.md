# Przynieś własną aplikację – dodaj azd do istniejącego projektu

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 1 – Podstawy i szybki start
- **⬅️ Poprzedni**: [Twój pierwszy projekt](first-project.md)
- **➡️ Następny**: [Dev Containers i Codespaces](dev-containers.md)

> Cel przeglądu poleceń i konfiguracji: `azd 1.37.2` (listopad 2026). Wygenerowane pliki zależą od wykrytej aplikacji; w tym przeglądzie nie wykonano wdrożenia do Azure.

## Wprowadzenie

W [Twoim pierwszym projekcie](first-project.md) wdrożyłeś aplikację, zaczynając od szablonu. Jednak najczęściej już *masz* aplikację – API Node.js, serwis Python Flask, aplikację webową .NET – która znajduje się w folderze na twoim komputerze. Ta lekcja pokazuje, jak dodać azd do tego istniejącego kodu, abyś mógł ją wdrożyć za pomocą `azd up`, bez potrzeby używania szablonu.

## Cele nauki

Pod koniec tej lekcji będziesz potrafił:
- Zrozumieć trzy sposoby rozpoczęcia projektu azd
- Uruchomić `azd init` w istniejącej bazie kodu
- Zrozumieć rolę `azure.yaml` i folderu `infra/` w twojej aplikacji
- Wiedzieć, kiedy pozwolić azd generować infrastrukturę, a kiedy pisać ją samodzielnie
- Wdrożyć istniejącą aplikację do Azure za pomocą `azd up`

## Rezultaty nauki

Po ukończeniu tej lekcji będziesz potrafił:
- Zainicjalizować azd w projekcie, który już posiadasz
- Odczytać i edytować podstawowy plik `azure.yaml`
- Wygenerować początkową infrastrukturę za pomocą `azd infra generate`
- Wybrać odpowiedni host Azure dla swojej aplikacji
- Wdrożyć i posprzątać swoją aplikację

---

## Trzy sposoby na rozpoczęcie projektu azd

| Punkt startowy | Polecenie | Kiedy używać |
|----------------|---------|-------------|
| **Ze szablonu** | `azd init --template <name> .` (pusty katalog) | Nauka lub zaczynanie nowej aplikacji na podstawie sprawdzonego przykładu |
| **Z istniejącego kodu** | `azd init` (w folderze projektu) | Masz już aplikację i chcesz ją wdrożyć |
| **Z repozytorium Git** | `azd init --from-code` (w sklonowanym repozytorium) | Wdrażanie azd do istniejącego repozytorium |

Już ćwiczyłeś pierwszy wariant. Ta lekcja omawia drugi – najczęstszy scenariusz w praktyce.

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

Wybierz **"Use code in the current directory."** – azd przeskanuje twój folder, wykryje język i framework, a następnie zaproponuje hosta.

### Co azd wykrywa

azd szuka sygnałów wskazujących na aplikację takich jak `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` lub `Dockerfile`. Przepływ z kodu nie jest ogólnym kreatorem wyboru hosta dla każdego obsługiwanego celu wdrożenia:

| Twoja aplikacja | Prawdopodobnie wykryty host |
|----------|----------------------|
| Obsługiwana aplikacja Node.js / Python / .NET web app | Zwykle Azure Container Apps; sprawdź wygenerowaną definicję |
| Aplikacja kontenerowa (`Dockerfile`) | Azure Container Apps |
| Aplikacja Function lub projekt Static Web Apps | Użyj dopasowanego szablonu lub stwórz własny `azure.yaml` i infrastrukturę, jeśli przepływ z kodu nie obsługuje twojej struktury |

Potwierdź wykryte usługi; azd wygeneruje potrzebne pliki.

---

## Krok 2: Zrozum, co azd utworzył

Po inicjalizacji przejrzyj `azure.yaml`. Przepływ generowania infrastruktury może utrzymywać ją w formie niejawnej do momentu uruchomienia `azd infra generate`; nie zakładaj, że `infra/` już istnieje:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definicja projektu

To jest serce projektu azd. Poniższa **ilustracyjna definicja App Service** wymaga dopasowanej infrastruktury App Service; nie jest to powód do zmiany hosta na Container Apps bez modyfikacji infrastruktury:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` to kluczowa część: każda pozycja mapuje folder twojego kodu do hosta Azure. Jeśli twoja aplikacja ma zarówno frontend, jak i API, będziesz miał dwie usługi.

### `infra/` — twoje zasoby Azure jako kod

Folder `infra/` zawiera pliki Bicep definiujące zasoby Azure, których potrzebuje twoja aplikacja (App Service, baza danych itd.). Nie musisz ich pisać ręcznie – azd generuje działający punkt startowy. Możesz je *edytować* później, aby dodać zasoby lub zwiększyć bezpieczeństwo (omówione w [Rozdziale 4](../chapter-04-infrastructure/README.md)).

> **Wskazówka:** Chcesz zobaczyć lub dostosować wygenerowaną infrastrukturę przed wdrożeniem? Uruchom `azd infra generate` (dostępne także jako `azd infra synth`), aby zapisać IaC na dysku i móc ją przejrzeć oraz wersjonować.

---

## Krok 3: Ustaw wymagane konfiguracje

Jeśli twoja aplikacja potrzebuje ustawień lub sekretów (łańcuch połączenia, klucz API), nie wpisuj ich na sztywno. Używaj wartości środowiskowych:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

To przechowuje lokalną wartość jedynie. Aby wpłynąć na aplikację, jawnie wykorzystaj ją w parametrach infrastruktury, obsługiwanym ustawieniu usługi lub hooku; ustawienie dowolnej zmiennej nie konfiguruje wdrożonego środowiska wykonawczego.

Prawdziwe sekrety przechowuj w Key Vault i odwołuj się do nich ze swojej infrastruktury – patrz [Rozdział 3: Konfiguracja i uwierzytelnianie](../chapter-03-configuration/authsecurity.md).

---

## Krok 4: Wdrożenie

Teraz użyj znanego już przepływu pracy:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Po zakończeniu azd wyświetli adres URL twojej aplikacji. Sprawdź ją dokładnie tak samo jak każdą aplikację azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Częste problemy na pierwszy raz

| Objaw | Prawdopodobna przyczyna | Naprawa |
|---------|--------------|-----|
| azd nie wykrył mojej aplikacji | Brak manifestu (np. `package.json`) | Dodaj manifest lub wybierz hosta ręcznie podczas `azd init` |
| Budowanie nie powiodło się podczas `azd up` | Aplikacja potrzebuje kroku budowania | Skonfiguruj skrypty pakietu aplikacji lub hook `prepackage` usługi; używaj `dist` do wyjścia wdrożenia, a nie `buildCommand`/`outputPath` |
| Aplikacja startuje, ale zwraca błędy | Brak konfiguracji/sekrety | Podłącz wartości do ustawień środowiskowych aplikacji lub referencji Key Vault; samo `azd env set` nie wystarczy |
| Wybrano niewłaściwy host | Autodetekcja nie odpowiada twoim potrzebom | Zmień zarówno `host:` jak i odpowiadającą infrastrukturę albo wybierz dopasowany szablon |

Po więcej informacji zobacz [Rozdział 7: Rozwiązywanie problemów](../chapter-07-troubleshooting/README.md).

---

## Sprzątanie

```bash
azd down --force --purge
```

---

## Podsumowanie

- `azd init` → **"Use code in the current directory"** dodaje azd do aplikacji, którą już masz.
- `azure.yaml` mapuje foldery twojego kodu do hostów Azure; `infra/` definiuje zasoby jako Bicep.
- `azd infra generate` pozwala przejrzeć lub dostosować wygenerowaną infrastrukturę.
- Po inicjalizacji twoja istniejąca aplikacja używa dokładnie tego samego przepływu `azd up` / `azd down` co aplikacja oparta na szablonie.

---

## 🔗 Nawigacja

| Kierunek | Lekcja |
|-----------|--------|
| **Poprzedni** | [Twój pierwszy projekt](first-project.md) |
| **Następny** | [Dev Containers i Codespaces](dev-containers.md) |

## 📖 Powiązane zasoby

- [Podstawy AZD](azd-basics.md)
- [Rozdział 4: Infrastruktura jako kod](../chapter-04-infrastructure/README.md)
- [Konfiguracja i uwierzytelnianie](../chapter-03-configuration/authsecurity.md)
- [Skrót poleceń](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
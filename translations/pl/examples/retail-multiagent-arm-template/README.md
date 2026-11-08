# Infrastruktura wieloagentowa dla handlu detalicznego

**Zaawansowany przykład architektury — nie jest to działająca aplikacja wieloagentowa.**

[Strona kursu](../../README.md) ·
[Rozdział 5](../../docs/chapter-05-multi-agent/README.md) ·
[Plan architektury](../retail-scenario.md)

## Co to wdraża

Ten katalog zawiera szablon ARM, parametry oraz skrypt wdrożeniowy w Bash.
Nie ma **kodów źródłowych aplikacji `azure.yaml` ani handlowej**.

| Zasób | Rzeczywisty stan po wdrożeniu |
|---|---|
| Podstawowe konto Azure OpenAI | wdrożenie `gpt-4.1-chat` używające wersji `gpt-4.1` `2025-04-14`, `GlobalStandard` |
| Drugorzędne konto OpenAI (opcjonalne) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` wersja `2025-04-14`, `GlobalStandard` |
| Konto Embeddings (opcjonalne) | `text-embedding-ada-002` wersja `2`, `Standard`; brak pipeline indeksowania |
| Konto Grader OpenAI | `gpt-4.1-grader`, model `gpt-4.1` wersja `2025-04-14`, `GlobalStandard`; brak evaluatora |
| AI Search | Pusta usługa; brak indeksu lub dokumentów |
| Storage | Puste kontenery blobów `documents` i `uploads` |
| Cosmos DB | Konto serverless, baza danych `chathistory`, kontener `conversations` partycjonowany według `/userId`, TTL elementów 30 dni |
| Container Apps | Router i frontend oba działają na `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` na porcie 80 |
| Key Vault (opcjonalnie) | Pusta, włączona na RBAC skrytka; **bez sekretów czy przypisań ról** |
| Application Insights / Log Analytics (opcjonalnie) | Zasoby i zbieranie dzienników środowiska; brak niestandardowej instrumentacji aplikacji, alertów lub pulpitów nawigacyjnych |
| Document Intelligence | Konto S0; brak workflow przetwarzania dokumentów |

Wcześniejsza wersja Bing Search v7 została wycofana 11 sierpnia 2025 i **nie jest udostępniana**.
Nie wdrożono zamiennika integracji z wyszukiwaniem internetowym.

**Nie zawiera:** agentów klienta/inwentaryzacji, API routera `/chat`, interfejsu czatu frontend,
schematu wyszukiwania lub skryptów ingestii, Azure Container Registry, prywatnych punktów końcowych,
zarządzanych tożsamości, przypisań RBAC, automatycznego failover, Front Door, skanera red-team,
CLI oceny, uwierzytelniania ani CI/CD.

Komunikat sukcesu ARM potwierdza jedynie udostępnienie zasobów. Nie potwierdza
funkcjonalności aplikacji, bezpieczeństwa, dostępności czy gotowości do produkcji.

## Wymagania wstępne i koszty

- Bash (Git Bash/WSL na Windows) oraz
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Subskrypcja z uprawnieniami do tworzenia wszystkich wymienionych zasobów.
- Sprawdź dostępność **każdego modelu/wersji/SKU w każdym wybranym regionie** oraz
  limit dla Twojej subskrypcji. Domyślne wartości są przykładami, nie gwarancjami.
  Zapoznaj się z [dostępnością modeli](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Wybierz dedykowaną grupę zasobów, którą możesz usunąć po testach.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Domyślne lokalizacje: podstawowa `eastus2`, drugorzędna `westus2`, embeddings `francecentral`;
grader domyślnie korzysta z regionu podstawowego, chyba że podano `graderLocation`.
`--no-multi-region` pomija konta drugorzędne i embeddings; nie pomija konta grader.


Search obciążany jest opłatą podczas udostępnienia, nawet jeśli jest pusty. Minimalna liczba replik kontenerów,
redundancja storage, żądania/prowizja Cosmos DB, tokeny modelu, wywołania Document Intelligence
oraz ingestia/przechowywanie logów mogą powodować dodatkowe opłaty. Nie ma **stałej lub potwierdzonej
miesięcznej kwoty całkowitej**. Oszacuj dokładne SKU w
[kalkulatorze cen Azure](https://azure.microsoft.com/pricing/calculator/) i
skonfiguruj budżet przed wdrożeniem.

### Tryby wdrożenia

Te ustawienia to rozmiary zasobów, **nie certyfikaty produkcyjne ani SLA**:

| Tryb | Jednostki pojemności chat / mini / embedding / grader | Repliki routera | Repliki frontendu | Poziom Search | Storage |
|---|---|---|---|---|---|
| minimalny | 10 / 10 / 20 / 5 | 0–3 | 1–2 | podstawowy, 1 replika | Standard_LRS |
| standardowy | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standardowy, 1 replika | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 repliki | Standard_GRS |

Jednostki pojemności modelu są specyficzne dla modelu/SKU; nie sumuj ich jako uniwersalnej gwarancji TPM.
Premium nie aktywuje strefowo-redundantnych aplikacji Container Apps: wymaga to
dodatkowego projektowania sieciowego. Podstawowy Search obsługuje wyszukiwanie wektorowe, podlega
limitom usługi; nie jest z natury niezgodny z wektorami.

## 🚀 Szybkie wdrożenie

Najpierw zapoznaj się z `azuredeploy.json` i `azuredeploy.parameters.json`. Poniższe polecenia
**tworzą płatne zasoby Azure**; nie są to sprawdzenia offline.

Z katalogu głównego repozytorium:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skrypt używa ścieżek względnych względem swojego folderu, sprawdza logowanie/narzędzia/argumenty,
tworzy grupę zasobów, jeśli nie istnieje, weryfikuje wdrożenie, udostępnia oraz
pokazuje niezaszyfrowane wyniki. Nie jest wymagane ani wykonywane `jq`, zapełnianie danych, pobieranie sekretów ani
konfiguracja aplikacji po wdrożeniu.

Domyślne wartości wiersza poleceń skryptu nadpisują odpowiadające im wartości w
pliku parametrów. Edytuj plik parametrów dla ustawień takich jak regiony drugorzędne/trzeciorzędne;
użyj bezpośredniego wdrożenia CLI, jeśli potrzebujesz dowolnych nadpisań parametrów:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

Provisioning może trwać 15–45 minut lub dłużej, i może zakończyć się niepowodzeniem ze względu na limity regionalne lub
ograniczenia cyklu życia modelu. Nie próbuj ponownie bezmyślnie: najpierw przeczytaj nieudaną operację.

## Opcje konfiguracji

| Parametr | Domyślny w szablonie | Znaczenie |
|---|---|---|
| `projectName` | Wymagany (`retail` w pliku parametrów) | 3–10 małych liter/cyfr |
| `location` | Lokalizacja grupy zasobów | Region podstawowy (`eastus2` w pliku parametrów) |
| `secondaryLocation` | `westus2` | Region konta modelu Mini |
| `tertiaryLocation` | `francecentral` | Region konta embeddings |
| `graderLocation` | Region podstawowy | Region konta niezależnego oceniania |
| `environmentName` | `dev` | `dev`, `staging` lub `prod`; tylko nazwa, nie przełącznik utwardzania |
| `deploymentMode` | `standard` | Wybór SKU/pojemności |
| `enableMultiRegion` | `true` | Dodaj konto drugorzędne i embeddings |
| `enableMonitoring` | `true` | Dodaj Insights/workspace i zbieranie logów środowiskowych |
| `enableSecurity` | `true` | Utwórz tylko pusty sejf z włączonym RBAC |

Usunięto mylący parametr `openAiApiVersion`: wersja API data-plane
nie kontroluje wersji zasobów ARM ani wersji modeli. Pary nazwa/wersja modelu
znajdują się w `variables.modelDeployments`; sprawdzaj je razem z SKU wdrożenia.

## Weryfikacja provisioning

Użyj nazwy wdrożenia z wyniku skryptu lub `az deployment group list`.
Dla powyższego bezpośredniego wdrożenia:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Oczekiwany stan wdrożenia to `Succeeded`. W przypadku niepowodzenia sprawdź szczegóły błędu operacji.
Sam wynik listy zasobów nie jest wiarygodnym sposobem sprawdzenia stanu provisioning.

Przetestuj symbol zastępczy **root**, nie nieistniejący endpoint agenta:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Oczekiwany: strona hello-world HTTP 200, **nie odpowiedź czatu**. Błąd HTTP
nie jest traktowany jako pomyślna weryfikacja.

Aby przetestować rzeczywiste inferencje modelu podstawowego (płatne):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Oczekiwane: JSON z `choices` i `usage`. Nazwa wdrożenia to
`gpt-4.1-chat`, a nie nazwa modelu bazowego `gpt-4.1`.

## 🔧 Po wdrożeniu: następne kroki

To jest **lista zadań rozwojowych**, a nie gotowe ćwiczenie:

1. Zaimplementuj uwierzytelnionych agentów klienta/inwentarza oraz kontrakt routera.
2. Zaimplementuj frontend i zweryfikuj jego konfigurację.
3. Utwórz i zapełnij indeks wyszukiwania wymiarem/profiliem odpowiadającym twojemu
   modelowi embeddingowemu, i obsłuż błędy oraz aktualizacje dokumentów.
4. Utwórz rejestr i skonfiguruj tożsamość/uprawnienia do pobierania obrazów.
5. Zbuduj i wypchnij prawdziwe obrazy. Zmień porty i sondy ingress Container App, aby
   dopasować je do tych obrazów przed testowaniem; port 80 tutaj należy do symboli zastępczych.
6. Skonfiguruj sekrety lub zarządzane tożsamości i role scoped data-plane. Nie
   odwołuj się do fikcyjnych nazw sekretów: ten szablon nie tworzy sekretów aplikacji.
7. Instrumentuj aplikacje, skonfiguruj alerty, testuj awarie/odzyskiwanie i oceniaj
   wyniki przy użyciu reprezentatywnych danych rzeczywistych i przeglądu ludzkiego.

Zobacz [szkielet architektury](../retail-scenario.md) dla granic projektowych.

## Rozwiązywanie problemów i granice bezpieczeństwa

- **Model niedostępny:** sprawdź model/wersję/SKU, region i limit subskrypcji;
  skrypt nie sprawdza katalogów modeli przed uruchomieniem.
- **Monitorowanie wyłączone:** docelowe miejsce logów środowiskowych to `none`, a nie
  błędna, pusta konfiguracja Log Analytics.
- **Tylko symbole zastępcze:** `/chat`, ocena agenta i wczytywanie plików nie istnieją.
- **Sieć/tożsamość:** publiczne endpointy i lokalne uwierzytelnianie są włączone.
  Samo włączenie RBAC w Key Vault nie tworzy przypisań ról ani tożsamości.
- **Produkcja:** dodaj uwierzytelnianie, scoped identities, zarządzanie sekretami,
  prywatne sieci tam, gdzie to odpowiednie, projekt dostępności i testy operacyjne.
  Konta modeli wieloregionalnych same w sobie nie zapewniają failover.

## Sprzątanie

Tu nie ma projektu AZD; `azd down` nie jest poleceniem do sprzątania.
Po sprawdzeniu, że grupa zawiera tylko twoje zasoby do nauki:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Oczekiwane po zakończeniu usuwania: `false`. Zasoby Key Vault i Cognitive Services
w trybie soft-delete mogą zachować nazwy; oczyszczenie wymaga odpowiednich uprawnień.
Sprawdź Cost Management pod kątem opóźnionych opłat za użycie.

[Zgłoś problem](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
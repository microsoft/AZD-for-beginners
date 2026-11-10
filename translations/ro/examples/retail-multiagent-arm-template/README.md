# Schelet de infrastructură Multi-Agent pentru Retail

**Exemplu avansat de arhitectură — nu o aplicație multi-agent funcțională.**

[Pagina cursului](../../README.md) ·
[Capitolul 5](../../docs/chapter-05-multi-agent/README.md) ·
[Plan de arhitectură](../retail-scenario.md)

## Ce se implementează

Acest director conține un șablon ARM, parametri și un script de implementare Bash.
Nu există **nicio sursă `azure.yaml` sau aplicație retail**.

| Resursă | Starea efectivă după aprovizionare |
|---|---|
| Cont Azure OpenAI principal | `gpt-4.1-chat` implementare folosind `gpt-4.1` versiunea `2025-04-14`, `GlobalStandard` |
| Cont OpenAI secundar (opțional) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` versiunea `2025-04-14`, `GlobalStandard` |
| Cont embeddings (opțional) | `text-embedding-ada-002` versiunea `2`, `Standard`; fără pipeline de indexare |
| Cont OpenAI evaluator | `gpt-4.1-grader`, model `gpt-4.1` versiunea `2025-04-14`, `GlobalStandard`; fără evaluator |
| Căutare AI | Serviciu gol; fără index sau documente |
| Stocare | Containere blob `documents` și `uploads` goale |
| Cosmos DB | Cont serverless, baza de date `chathistory`, containerul `conversations` partitionat după `/userId`, TTL element 30 zile |
| Container Apps | Router și frontend rulează ambele `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` pe portul 80 |
| Key Vault (opțional) | Seif gol cu RBAC activat; **fără secrete sau atribuiri de rol** |
| Application Insights / Log Analytics (opțional) | Colectare loguri resurse și mediu; fără instrumentație personalizată a aplicației, alerte sau tablouri de bord |
| Inteligență Documentară | Cont S0; fără flux de procesare documente |

Bing Search v7 clasic a fost retras pe 11 august 2025 și **nu este disponibil**.
Nu este implementată nicio integrare de fundamentare web de înlocuire.

**Nu sunt incluse:** agenți client/inventar, API-ul routerului `/chat`, interfața de chat frontend,
schema căutării sau scripturi de ingestie, Azure Container Registry, endpoint-uri private,
identități gestionate, atribuiri RBAC, failover automat, Front Door, scanner red-team,
CLI evaluare, autentificare sau CI/CD.

Un mesaj de succes ARM confirmă doar aprovizionarea resurselor. Nu certifică
funcționalitatea aplicației, securitatea, disponibilitatea sau pregătirea pentru producție.

## Cerințe preliminare și costuri

- Bash (Git Bash/WSL pe Windows) și
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Un abonament cu permisiuni pentru crearea tuturor resurselor listate.
- Verificați disponibilitatea **fiecărui model/versiune/SKU în fiecare regiune selectată** și
  cota pentru abonamentul dvs. Valorile implicite sunt exemple, nu garanții.
  Consultați [disponibilitatea modelului](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Alegeți un grup de resurse dedicat pe care îl puteți șterge după testare.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Locații implicite: principal `eastus2`, secundar `westus2`, embeddings `francecentral`;
evaluatorul folosește implicit regiunea principală, decât dacă este furnizat `graderLocation`.
`--no-multi-region` ocolește conturile secundare și embeddings; nu ocolește
contul evaluator.

Căutarea este taxată cât timp este aprovizionată chiar dacă este goală. Replica minimă a containerelor,
redundanța stocării, solicitările/stocarea Cosmos DB, tokenii modelului, apelurile Inteligenței Documentare
și ingestia/stocarea logurilor pot adăuga costuri. Nu există un **total lunar fix sau validat**.
Estimați SKU-urile exacte în
[calculatorul de prețuri Azure](https://azure.microsoft.com/pricing/calculator/) și
configurați un buget înainte de implementare.

### Moduri de implementare

Aceste setări sunt dimensiuni ale resurselor, **nu certificate de producție sau SLA**:

| Mod | Unități capacitate chat / mini / embedding / evaluator | Replici router | Replici frontend | Nivel căutare | Stocare |
|---|---|---|---|---|---|
| minim | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 replică | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replică | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replici | Standard_GRS |

Unitățile de capacitate pentru model sunt specifice modelului/SKU; nu le adunați ca un TPM universal
garantat. Premium nu activează Container Apps cu redundanță zonală: asta necesită
un design de rețea suplimentar. Căutarea Basic suportă căutarea vectorială, sub rezerva
limitelor serviciului; nu este incompatibilă în mod inerent cu vectorii.

## 🚀 Implementare rapidă

Revizuiți mai întâi `azuredeploy.json` și `azuredeploy.parameters.json`. Comenzile
de mai jos **crează resurse Azure taxabile**; nu sunt verificări offline.

Din rădăcina depozitului:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Scriptul folosește căi relative la propriul director, verifică autentificarea/unele instrumente/argumente,
creează grupul de resurse dacă lipseste, validează implementarea, aprovizionează și
afișează ieșiri non-secrete. Nu se solicită sau execută `jq`, popularea datelor, recuperarea secretă sau
configurarea aplicației post-implementare.

Valorile implicite ale liniei de comandă ale scriptului suprascriu valorile corespunzătoare din
fișierul de parametri. Editează fișierul de parametri pentru setări cum ar fi regiunile secundare/terțiare;
folosește implementarea directă CLI dacă ai nevoie de suprascrieri arbitrare ale parametrilor:

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

Provisionarea poate dura 15–45 de minute sau mai mult și poate eșua din cauza cotelor regionale sau
a restricțiilor ciclului de viață al modelului. Nu reîncerca orbeste: citește întâi operația eșuată.

## Opțiuni de configurare

| Parametru | Implicit în șablon | Semnificație |
|---|---|---|
| `projectName` | Necesare (`retail` în fișierul de parametri) | 3–10 litere/cifre micșorate |
| `location` | Locația grupului de resurse | Regiunea primară (`eastus2` în fișierul de parametri) |
| `secondaryLocation` | `westus2` | Regiunea contului mini model |
| `tertiaryLocation` | `francecentral` | Regiunea contului embeddings |
| `graderLocation` | Regiunea primară | Regiunea contului independent grader |
| `environmentName` | `dev` | `dev`, `staging`, sau `prod`; doar nume, nu un comutator de întărire |
| `deploymentMode` | `standard` | Selecție SKU/capacitate |
| `enableMultiRegion` | `true` | Adaugă conturi secundare și embeddings |
| `enableMonitoring` | `true` | Adaugă Insights/workspace și colectare log de mediu |
| `enableSecurity` | `true` | Creează doar un vault gol activat RBAC |

Parametrul înșelător `openAiApiVersion` a fost eliminat: o versiune API de data-plane
nu controlează versiunile resurselor ARM sau versiunile modelului. Perechile nume/versiune ale modelului
sunt în `variables.modelDeployments`; verifică-le împreună cu SKU-ul de implementare.

## Verifică provisionarea

Folosește numele de implementare din ieșirea scriptului sau `az deployment group list`.
Pentru implementarea directă de mai sus:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Se așteaptă: starea implementării `Succeeded`. Pentru o eroare, inspectează detaliile erorii operației.
Ieșirea listei de resurse singură nu este o verificare fiabilă a stării provisionării.

Testează placeholder-ul **root**, nu un endpoint inexisten agent:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Se așteaptă: pagină HTTP 200 hello-world, **nu un răspuns de chat**. O eroare HTTP
nu este considerată o verificare reușită.

Pentru a testa inferența modelului primar real (facturabil):

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

Se așteaptă: JSON cu `choices` și `usage`. Numele implementării este
`gpt-4.1-chat`, nu numele modelului subiacent `gpt-4.1`.

## 🔧 După implementare: Pașii următori

Aceasta este o **listă de sarcini pentru dezvoltare**, nu un exercițiu finalizat:

1. Implementează agenți autentificați pentru clienți/inventar și contractul routerului.
2. Implementează frontend-ul și validează-i configurația.
3. Creează și populează un index de căutare cu o dimensiune/profil care să corespundă
   modelului tău de embedding și gestionează eșecurile și actualizările documentelor.
4. Creează un registru și configurează identitatea/permisiunile pentru pull image.
5. Construiește și împinge imagini reale. Schimbă porturile și probele de acces Container App
   să corespundă acelor imagini înainte de testare; aici portul 80 aparține placeholder-elor.
6. Configurează secrete sau identități gestionate și roluri scoped de data-plane. Nu
   face referire la nume imaginare de secrete: acest șablon nu creează secrete de aplicație.
7. Instrumentează aplicațiile, configurează alertele, testează eșec/recuperare și evaluează
   rezultatele cu ground truth reprezentativ și revizuire umană.

Vezi [planul arhitectural](../retail-scenario.md) pentru limitele proiectării.

## Depanare și limite de securitate

- **Model indisponibil:** verifică modelul/versiunea/SKU, regiunea și cota de abonament;
  scriptul nu face preflight la cataloagele de modele.
- **Monitorizarea dezactivată:** destinația log-urilor de mediu este `none`, nu o
  configurație Log Analytics invalidă și goală.
- **Doar placeholdere:** `/chat`, evaluarea agentului și ingestia fișierelor nu există.
- **Rețea/identitate:** endpoint-urile publice și autentificarea locală sunt activate.
  Activarea simplă a Key Vault RBAC nu creează asignări de roluri sau identități.
- **Producție:** adaugă autentificare, identități scoped, managementul secretelor,
  rețea privată unde este cazul, design pentru disponibilitate și teste operaționale.
  Conturile multi-regiune model singure nu oferă failover.

## Curățare

Nu există niciun proiect AZD aici; `azd down` nu este comanda de curățare.
După ce verifici că grupul conține doar resursele tale de învățare:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Se așteaptă după terminarea ștergerii: `false`. Resursele Key Vault și Cognitive Services
șterse soft pot păstra nume; purjarea necesită permisiuni corespunzătoare.
Verifică Cost Management pentru taxe întârziate de utilizare.

[Raportează o problemă](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Infrastrukturni okvir za maloprodajne višeagentne sustave

**Napredni primjer arhitekture — nije radna višeagentna aplikacija.**

[Početna stranica tečaja](../../README.md) ·
[Poglavlje 5](../../docs/chapter-05-multi-agent/README.md) ·
[Arhitektonski nacrt](../retail-scenario.md)

## Što se ovim implementira

Ova mapa sadrži ARM predložak, parametre i Bash skriptu za implementaciju.
Ne postoji **izvorni kod `azure.yaml` ili maloprodajne aplikacije**.

| Resurs | Stvarno stanje nakon provisioniranja |
|---|---|
| Primarni Azure OpenAI račun | `gpt-4.1-chat` implementacija koristeći verziju `gpt-4.1` `2025-04-14`, `GlobalStandard` |
| Sekundarni OpenAI račun (opcionalno) | `gpt-4.1-mini-inventory`, model `gpt-4.1-mini` verzija `2025-04-14`, `GlobalStandard` |
| Račun za ugrađivanje (opcionalno) | `text-embedding-ada-002` verzija `2`, `Standard`; bez indeksirajućeg toka |
| Grader OpenAI račun | `gpt-4.1-grader`, model `gpt-4.1` verzija `2025-04-14`, `GlobalStandard`; bez evaluatora |
| AI Pretraživanje | Prazna usluga; bez indeksa ili dokumenata |
| Skladište | Prazni `documents` i `uploads` blob spremnici |
| Cosmos DB | Serverless račun, `chathistory` baza podataka, `conversations` spremnik particioniran po `/userId`, stavke imaju 30-dnevni TTL |
| Container aplikacije | Router i frontend rade `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` na portu 80 |
| Key Vault (opcionalno) | Prazni RBAC-om omogućeni vault; **bez tajni ili dodjela uloga** |
| Application Insights / Log Analytics (opcionalno) | Resursi i prikupljanje dnevnika okoline; bez prilagođene aplikacijske instrumentacije, upozorenja ili nadzornih ploča |
| Document Intelligence | S0 račun; bez tijeka rada obrade dokumenata |

Legacy Bing Search v7 je povučen 11. kolovoza 2025. i **nije implementiran**.
Nije implementirana zamjena za web-grounding integraciju.

**Nije uključeno:** agenti za korisnike/inventar, router `/chat` API, frontend chat UI,
shema pretraživanja ili skripte za unos, Azure Container Registry, privatne krajnje točke,
upravljane identitete, RBAC dodjele, automatski failover, Front Door, red-team
skener, evaluacijski CLI, autentikacija ili CI/CD.

ARM poruka o uspjehu samo potvrđuje implementaciju resursa. Ne jamči
funkcionalnost aplikacije, sigurnost, dostupnost ili spremnost za produkciju.

## Preduvjeti i troškovi

- Bash (Git Bash/WSL na Windows-u) i
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Pretplata s dopuštenjima za stvaranje svih navedenih resursa.
- Provjerite dostupnost **svakog modela/verzije/SKU u odabranoj regiji** i
  kvotu za vašu pretplatu. Zadane vrijednosti su primjeri, ne jamstva.
  Konzultirajte [dostupnost modela](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Odaberite posvećenu grupu resursa koju možete izbrisati nakon testiranja.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Zadane lokacije: primarni `eastus2`, sekundarni `westus2`, embeddings `francecentral`;
grader koristi primarnu regiju osim ako nije dostavljen `graderLocation`.
`--no-multi-region` preskače sekundarne i embeddings račune; ne preskače
grader račun.

Pretraživanje se naplaćuje dok je implementirano iako je prazno. Minimalni broj replika kontejnera,
redundancija skladišta, zahtjevi i skladištenje Cosmos DB-a, tokeni modela, pozivi Document Intelligence
i unos/skladištenje dnevnika mogu dodati troškove. Nema **fiksnog ili potvrđenog
mjesečnog ukupnog troška**. Procijenite točne SKU-ove u
[Azure kalkulatoru cijena](https://azure.microsoft.com/pricing/calculator/) i
postavite budžet prije implementacije.

### Načini implementacije

Ove postavke su veličine resursa, **ne certifikati za produkciju ili SLA**:

| Način | Chat / mini / embedding / grader kapacitetni jedinice | Router replike | Frontend replike | Search sloj | Skladište |
|---|---|---|---|---|---|
| minimalno | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 replika | Standard_LRS |
| standardno | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replika | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replike | Standard_GRS |

Kapacitetne jedinice modela specifične su za model/SKU; nemojte ih zbrajati kao univerzalnu TPM
garanciju. Premium ne omogućuje zona-redundantne Container Apps: to zahtijeva
dodatni mrežni dizajn. Basic Search podržava vektorsko pretraživanje, podložno
ograničenjima usluge; nije inherentno nekompatibilan s vektorima.

## 🚀 Brza implementacija

Najprije pregledajte `azuredeploy.json` i `azuredeploy.parameters.json`. Sljedeće naredbe
**stvaraju naplatljive Azure resurse**; nisu offline provjere.

Iz korijena repozitorija:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skripta koristi putanje relativne na svoj direktorij, provjerava prijavu/alate/argumente,
stvara grupu resursa ako ne postoji, validira implementaciju, implementira i
prikazuje izlaze bez tajni. Nije potrebna ni izvršena nijedna `jq`, popunjavanje podataka, dohvat tajni ili
post-implementacijska konfiguracija aplikacije.

Zadane vrijednosti naredbenog retka skripte nadjačavaju odgovarajuće vrijednosti u
datoteci parametara. Uredite datoteku parametara za postavke poput sekundarnih/tercijarnih
regija; koristite izravnu CLI implementaciju ako trebate proizvoljna preklapanja parametara:

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

Implementacija može trajati 15–45 minuta ili duže, i može neuspjeti zbog regionalnih kvota ili
ograničenja životnog ciklusa modela. Nemojte slijepo ponavljati: prvo pročitajte neuspjelu operaciju.

## Opcije konfiguracije

| Parametar | Zadano u predlošku | Značenje |
|---|---|---|
| `projectName` | Obvezno (`retail` u datoteci parametara) | 3–10 malih slova/brojeva |
| `location` | Lokacija grupe resursa | Primarna regija (`eastus2` u datoteci parametara) |
| `secondaryLocation` | `westus2` | Regija računa mini modela |
| `tertiaryLocation` | `francecentral` | Regija računa za embeddings |
| `graderLocation` | Primarna regija | Regija neovisnog računa za grader |
| `environmentName` | `dev` | `dev`, `staging` ili `prod`; samo ime, ne prekidač za sigurnost |
| `deploymentMode` | `standard` | Odabir SKU/kapaciteta |
| `enableMultiRegion` | `true` | Dodaj sekundarne i embeddings račune |
| `enableMonitoring` | `true` | Dodaj Insights/workspace i prikupljanje dnevnika okoline |
| `enableSecurity` | `true` | Stvori samo prazan RBAC-om omogućen vault |

Zavodni `openAiApiVersion` parametar je uklonjen: API verzija ravnine podataka
ne upravlja ARM verzijama resursa ili verzijama modela. Parovi imena/verzije modela
nalaze se u `variables.modelDeployments`; provjerite ih zajedno s implementacijskim SKU-om.

## Provjera implementacije

Koristite ime implementacije iz izlaza skripte ili `az deployment group list`.
Za izravnu implementaciju gore:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Očekivano: stanje implementacije `Succeeded`. Za neuspjeh, pregledajte detalje greške operacije.
Samo izlaz popisa resursa nije pouzdana provjera stanja implementacije.

Testirajte rezervni **root**, a ne nepostojeću krajnju točku agenta:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Očekivano: HTTP 200 hello-world stranica, **ne chat odgovor**. HTTP greška
se ne računa kao uspješna provjera.

Za testiranje stvarnog glavnog modelnog zaključivanja (naplativo):

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

Očekivano: JSON s `choices` i `usage`. Ime implementacije je
`gpt-4.1-chat`, ne ime osnovnog modela `gpt-4.1`.

## 🔧 Nakon implementacije: sljedeći koraci

Ovo je **razvojni zaostatak**, ne završena vježba:

1. Implementirajte autentificirane agente za kupce/inventar i ugovor routera.
2. Implementirajte frontend i validirajte njegovu konfiguraciju.
3. Kreirajte i napunite indeks pretraživanja dimenzijom/profilom koji odgovara vašem
   embedding modelu, i upravljajte neuspjesima i ažuriranjima dokumenata.
4. Kreirajte registar i konfigurirajte identitet/dopuštenja za prikaz slika.
5. Izgradite i gurnite stvarne slike. Promijenite ulazne portove i sonde Container App-a da
   odgovaraju tim slikama prije testiranja; port 80 ovdje pripada rezervnim mjestima.
6. Konfigurirajte tajne ili upravljane identitete i uloge na razini ravnine podataka. Ne
   referirajte zamišljena imena tajni: ovaj predložak ne stvara aplikacijske tajne.
7. Instrumentirajte aplikacije, konfigurirajte upozorenja, testirajte neuspjehe/oporavak i procijenite
   rezultate s reprezentativnom stvarnom istinom i ljudskom recenzijom.

Pogledajte [dijagram arhitekture](../retail-scenario.md) za granice dizajna.

## Rješavanje problema i sigurnosne granice

- **Model nedostupan:** provjerite model/verziju/SKU, regiju i kvotu pretplate;
  skripta ne provjerava unaprijed kataloge modela.
- **Praćenje onemogućeno:** odredište dnevnoga zapisa okoline je `none`, ne
  nevažeća prazna Log Analytics konfiguracija.
- **Samo rezervna mjesta:** `/chat`, evaluacija agenta i unos datoteka ne postoje.
- **Mreža/identitet:** javne krajnje točke i lokalna autentikacija su omogućeni.
  Samo omogućavanje Key Vault RBAC-a ne stvara dodjele uloga ili identitete.
- **Produkcija:** dodajte autentikaciju, ograničene identitete, upravljanje tajnama,
  privatnu mrežu gdje je prikladno, dizajn dostupnosti i operativne testove.
  Samo računi modela preko regija ne pružaju failover.

## Čišćenje

Ovdje nema AZD projekta; `azd down` nije naredba za čišćenje.
Nakon provjere da grupa sadrži samo vaše resurse za učenje:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Očekivano nakon završetka brisanja: `false`. Soft-obrisani resursi Key Vault-a i Cognitive Services
mogu zadržati imena; čišćenje zahtijeva odgovarajuća dopuštenja.
Provjerite Cost Management za odgođene troškove korištenja.

[Prijavite problem](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
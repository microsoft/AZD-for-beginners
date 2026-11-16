# 4. Konfigurirajte predlogo

!!! tip "NA KONCU TEGA MODULA BOSTE ZMOGLI"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Začnite s pravo predlogo

Odprite [`azure.yaml` v Uvod v AI agenti](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) v repozitoriju, ki ste ga inicializirali. Izvirna predloga se lahko spremeni neodvisno od delavnice. Naslednji **izsek** je bil preverjen 4. novembra 2026; ni nadomestilo za celotno datoteko:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` določa AZD projekt; `metadata.template` beleži različico predloge.
- `requiredVersions.azd` je minimum predloge, ne priporočilo za uporabo starega CLI. Uporabite trenutno podprto izdajo AZD.
- `services` določa cilje za nameščanje aplikacij. Ta predloga namešča svoj Python API in frontend kot eno storitev Container Apps.
- `project` je relativno glede na `azure.yaml`.
- `remoteBuild` zahteva oddaljeno gradnjo kontejnerja. Vaša identiteta še vedno potrebuje zahtevana dovoljenja za Azure.

Bicep datoteke predloge pod `infra/`, ne samo seznam `services`, deklarirajo vire, kot so Microsoft Foundry, nameščanja modelov, shranjevanje in izbirno AI Search.

## 2. Razumite cikle življenjske dobe

Preglejte razdelek `hooks` in njegove navedene skripte pred zagonom predloge. Preverjena različica vsebuje:

| Kavelj | Namen | Pomembno vedenje |
|------|---------|--------------------|
| `preup` | Preverjanje vhodov okolja predloge pred delovnim tokom `up` | Platformno specifične skripte v lupini lahko ustavijo delovni tok ob napaki |
| `postdeploy` | Zaženi specifično nastavitev predloge po nameščanju aplikacije | Preglejte `continueOnError` in izhod skripte; uspešna namestitev ne dokazuje, da je vsaka naloga nastavitev uspela |

Ta različica **ne** vsebuje starejšega `postprovision` / `write_env` hooka prikazanega v zgodnejšem delavnem gradivu. Ne kopirajte referenc na hooke v skripte, ki ne obstajajo več.

Ključi hookov izbirajo življenjske dogodke; `posix` in `windows` izbirata implementacije platforme. `shell`, `run`, `interactive` in `continueOnError` nadzorujejo izvajanje. To so izvršljive skripte z vašimi dovoljenji, zato jih preglejte tako, kot bi kodo aplikacije.

Oglejte si [dokumentacijo o AZD hookih](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) za celoten življenjski cikel.

## 3. Sledenje vhodnim okoljskim spremenljivkam v infrastrukturo

Zaženite te ukaze iz inicializiranega vzorčnega repozitorija:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Preverite `infra/main.parameters.json`, da vidite katere okoljske spremenljivke predloga dejansko uporablja. Nastavitev poljubnega imena z `azd env set` ne spremeni samodejno Azure vira.

Pregledane privzete vrednosti vključujejo:

| Vhod | Privzeto / namen |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; enote kvote so odvisne od modela in vrste uvajanja |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; pustite onemogočeno, razen če je bilo obravnavano rokovanje s podatki |

To so vhodne spremenljivke, specifične za vzorec, ne globalne nastavitve AZD. Pred izbiro modela, SKU, zmogljivosti ali lokacije preverite [dokumentacijo za podporo modelu in regiji](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) in kvoto vašega naročniškega paketa. Ne interpretirajte vsake enote zmogljivosti kot 1000 tokenov na minuto.

Za izbiro drugega klepetalnega modela posodobite njegovo združljivo **ime, različico, format, SKU in zmogljivost skupaj**, sledite [navodilu za prilagoditev vzorca](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Sprememba zgolj imena lahko pusti neskladno različico ali vrsto nameščanja.

## 4. Laboratorij: omogočite neobvezno iskanje in sledenje

!!! warning "Te nastavitve lahko dodajo zaračunljive vire"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Spremembe infrastrukture zahtevajo pripravo; samo `azd deploy` namešča aplikacijske storitve. Za indeksiranje iskanja in podprte možnosti pridobivanja sledite [vodniku za AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Za nadzor sledite [vodniku za opazovanje](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Ne omogočajte zajema vsebine pozivov/odgovorov na pravih podatkih strank brez ustreznega soglasja, nadzorov dostopa, pravilnika hrambe in rdečenja.

## 5. Obstoječi viri in CI/CD

Za ponovno uporabo projekta Foundry sledite [navodilom za obstoječe vire](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) vzorca. Nastavitev `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` spremeni pot nameščanja; v tem primeru predloga ne ustvari Application Insights ali AI Search za vas. Izrecno preverite odvisnosti, dodelitve vlog in nameščanja modelov.

Odsek `pipeline.variables` nadzoruje vrednosti, posredovane v ustvarjeni cevovod; ni shramba skrivnosti in ne ustvarja Azure virov. Raje uporabite upravljano identiteto v aplikaciji in OIDC za CI/CD. AZD okoljski dokumenti so v odprti obliki in jih ne bi smeli shranjevati v repozitorije.

AZD podpira uvoz zaupanja vredne, lokalno pripravljene dotenv datoteke:

```bash
azd env set --file .env
```

Pred uvozom preglejte to datoteko in ne tiskajte datotek okolja, ki vsebujejo skrivnosti, v deljenih terminalih ali dnevnikih CI.

## 6. Preverite svoje razumevanje

- Katera `azure.yaml` storitev namešča aplikacijo?
- Kateri infrastrukturni parameter uporablja vsako vrednost, ki ste jo spremenili?
- Kateri spremembi zahtevata pripravo in ne le nameščanje?
- Ali sta izbrana regija in naročniški paket podprla model in kvoto?
- Ali so vsi namestitveni hooki uspeli in ali lahko preverite delovanje nameščene aplikacije?

Nadaljujte na [Prilagajanje predloge](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
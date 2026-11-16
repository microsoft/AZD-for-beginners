# 4. Configurează un Șablon

!!! tip "LA FINALUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Pornește de la șablonul efectiv

Deschide [`azure.yaml` din Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) în depozitul pe care l-ai inițializat. Șablonul de bază poate suferi modificări independent de acest atelier. Următorul **extras** a fost verificat pe 4 noiembrie 2026; nu înlocuiește fișierul complet:

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

- `name` identifică proiectul AZD; `metadata.template` înregistrează versiunea șablonului.
- `requiredVersions.azd` este minimul șablonului, nu o recomandare să rămâi pe un CLI vechi. Folosește o versiune AZD suportată și actuală.
- `services` definește țintele de implementare ale aplicației. Acest șablon își implementează API-ul Python și frontend-ul ca un singur serviciu Container Apps.
- `project` este relativ la `azure.yaml`.
- `remoteBuild` solicită o construire de container la distanță. Identitatea ta trebuie să aibă totuși permisiunile necesare în Azure.

Fișierele Bicep ale șablonului sub `infra/`, nu doar lista `services`, declară resurse precum Microsoft Foundry, implementări de modele, stocare și AI Search opțional.

## 2. Înțelegeți cârligele ciclului de viață

Inspectează secțiunea `hooks` și scripturile referențiate înainte de a rula șablonul. Versiunea revizuită conține:

| Cârlig | Scop | Comportament important |
|------|---------|--------------------|
| `preup` | Validează intrările mediului șablon înainte de fluxul de lucru `up` | Scripturile shell specifice platformei pot opri fluxul de lucru la eșec |
| `postdeploy` | Rulează configurarea specifică șablonului după implementarea aplicației | Inspectează `continueOnError` și ieșirea scriptului; o implementare cu succes nu garantează că toate sarcinile de configurare au reușit |

Această versiune **nu** conține cârligul mai vechi `postprovision` / `write_env` prezentat în materialele anterioare ale atelierului. Nu copia referințe către scripturi care nu mai există.

Cheile cârligelor selectează evenimentele ciclului de viață; `posix` și `windows` selectează implementările pentru platformă. `shell`, `run`, `interactive` și `continueOnError` controlează execuția. Acestea sunt scripturi executabile cu permisiunile tale, așadar revizuiește-le ca și cum ar fi codul aplicației.

Vezi [documentația cârligelor AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) pentru ciclul complet de viață.

## 3. Urmărește intrările mediului în infrastructură

Rulează aceste comenzi din depozitul de exemplu inițializat:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Inspectează `infra/main.parameters.json` pentru a vedea ce variabile de mediu consumă efectiv șablonul. Setarea unui nume arbitrar cu `azd env set` nu schimbă automat o resursă Azure.

Valorile implicite revizuite includ:

| Intrare | Implicit / scop |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; unitățile de cotă depind de model și tipul de implementare |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; lasă dezactivat dacă manipularea datelor nu a fost revizuită |

Acestea sunt intrări specifice exemplului, nu setări globale AZD. Verifică [documentația despre suportul modelului și regiunea](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) și cota abonamentului înainte de a alege un model, SKU, capacitate sau locație. Nu interpreta fiecare unitate de capacitate ca 1.000 de tokeni pe minut.

Pentru a selecta un model de chat diferit, actualizează împreună **numele compatibil, versiunea, formatul, SKU și capacitatea**, urmând [ghidul de personalizare al exemplului](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Schimbarea doar a numelui poate lăsa o versiune incompatibilă sau tip de implementare necorespunzător.

## 4. Laborator: activează căutarea și trasarea opțională

!!! warning "Aceste setări pot adăuga resurse care vor fi facturate"

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

Schimbările de infrastructură necesită provizionare; `azd deploy` singur implementează doar serviciile aplicației. Pentru indexarea căutării și opțiunile de recuperare suportate, urmează [ghidul AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Pentru monitorizare, urmează [ghidul de observabilitate](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Nu activa captarea conținutului prompt/răspuns pe date reale ale clienților fără consimțământul necesar, controale de acces, politica de retenție și redactare.

## 5. Resurse existente și CI/CD

Pentru a reutiliza un proiect Foundry, urmează instrucțiunile [resurselor existente ale exemplului](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Setarea `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` schimbă calea de implementare; în acel scenariu, șablonul nu creează Application Insights sau AI Search pentru tine. Verifică explicit dependențele, atribuțiile de rol și implementările modelului.

Secțiunea `pipeline.variables` controlează valorile transmise într-un pipeline generat; nu este un magazin de secrete și nu creează resurse Azure. Preferă identitatea gestionată în aplicație și OIDC pentru CI/CD. Fișierele de mediu AZD sunt în text simplu și nu trebuie comise.

AZD suportă importul unui fișier dotenv pregătit local și de încredere:

```bash
azd env set --file .env
```

Revizuiește acel fișier înainte de import și nu afișa fișiere de mediu care conțin secrete în terminale partajate sau în jurnalele CI.

## 6. Verifică-ți înțelegerea

- Care serviciu `azure.yaml` implementează aplicația?
- Ce parametru de infrastructură consumă fiecare valoare pe care ai schimbat-o?
- Ce schimbări necesită provizionare, nu doar implementare?
- A sprijinit regiunea și abonamentul selectat modelul și cota?
- Au reușit toate cârligele de configurare și poți verifica comportamentul aplicației implementate?

Continuă cu [Personalizează un șablon](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
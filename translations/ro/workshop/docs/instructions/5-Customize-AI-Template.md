# 5. Personalizarea unui Șablon

!!! tip "LA SFÂRȘITUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stabilește o bază de referință

Folosește depozitul inițializat [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) din modulele anterioare. Înregistrează revizia șablonului, versiunea AZD, mediul selectat, implementarea modelului și întrebările de probă funcționale înainte de a schimba ceva.

Exemplul implementează o aplicație de chat susținută de un agent. Nu devine **automat** un sistem cu doi agenți pentru retail doar prin setarea variabilelor de mediu sau salvarea fișierelor suplimentare de instrucțiuni. Agenții suplimentari, gestionarii de instrumente, rutarea, autorizarea și accesul la date necesită cod aplicației.

Inspectează instrucțiunile și uneltele agentului implementat în Foundry. Testează o întrebare factuală, o întrebare de recuperare și o întrebare la care datele de probă nu pot răspunde. Verifică citările față de documentele sursă reale în loc să presupui că un răspuns fluent este corect.

## 5.2 Personalizează recuperarea cunoștințelor

Șablonul suportă recuperarea pe bază de fișiere și integrarea opțională Azure AI Search. Urmează [ghidul curent AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) pentru indexare și configurarea uneltelor.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Activarea serviciului este doar o parte din procesul de recuperare. Înainte de a încărca propriile tale date:

1. Confirmă că ai permisiunea să folosești documentele și elimină informațiile sensibile.
2. Selectează un model de încorporare (embedding) suportat în regiunea ta și setează versiunea compatibilă, tipul de implementare și dimensiunile vectorilor.
3. Creează/populează indexul folosind procesul documentat al exemplului.
4. Configurează unealta de recuperare a agentului să utilizeze acel index.
5. Testează recuperarea, citările, autorizarea și comportamentul când nu există un document relevant.

Nu trece de la `text-embedding-3-small` la un alt model de încorporare fără să verifici dimensiunile și să reclădești/reindexezi vectorii după cum e necesar. Un nume precum `retail-products` nu este un catalog implementat sau o politică de control al accesului.

## 5.3 Trasabilitate și monitorizare

Urmează [ghidul de observabilitate al exemplului](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Asigură-te că resursa necesară Application Insights și conexiunea există deja; dacă modifici setările de infrastructură, folosește `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Trimite o cerere de test, apoi inspectează jurnalele aplicației Container App și vizualizarea traseelor agentului în Foundry. Verifică latența, apelurile la unelte, erorile și corelația între cerere și traseu. Nu presupune că telemetria este conectată doar pentru că implementarea a reușit.

Lasă `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` dezactivat decât dacă ai revizuit în mod explicit consimțământul, redactarea, păstrarea și controalele de acces. Traseele pot conține argumente sensibile ale uneltelor sau conținut al documentelor chiar dacă jurnalele obișnuite ale aplicației par inofensive.

## 5.4 Evaluarea agentului

Punctul de intrare pentru evaluarea exemplului este acum [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nu un director `evals/`. Din rădăcina exemplului, folosește un mediu Python care îndeplinește cerințele documentate:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Înainte de rulare, finalizează [cerințele prealabile pentru evaluare](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testele încarcă configurația din `.azure/<environment>/.env` selectat; confirmă că este ales mediul dorit. Intrările importante includ:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, folosind formatul cerut de exemplul curent (versiunea revizuită folosește `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, folosit ca implementare a modelului judecător

Inspectează testele pentru a înțelege alegerea evaluatorului, pragurile, rolurile necesare și costurile modelelor. O execuție completă nu garantează automat trecerea porții de calitate; analizează scorurile, cazurile eșuate/eroare, și rezultatele Foundry legate.

### Extensie separată pentru evaluări AZD

Testul Python de mai sus este un **flux de lucru specific exemplului**. Extensia opțională `azure.ai.evaluations` este un flux de lucru diferit, cu propria sa configurație `evals/azure.eval.yaml`. Este instalată separat, nu este inclusă în pachetul general disponibil `microsoft.foundry` 1.0:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pentru o configurare completă a extensiei, vezi [fluxurile de lucru de evaluare și migrarea](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Din beta.22 a extensiei agenților, nu folosi comenzile eliminate `azd ai agent eval`. Instalarea extensiei evaluărilor nu convertește testele Python ale exemplului sau nu creează automat o configurație de evaluare.

Pentru un **exercițiu separat GA găzduit pentru agenți**, folosește un folder gol în afara acestui exemplu din workshop și urmează [turul Foundry local către cloud](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Folosește AZD 1.37.0+, pachetul `microsoft.foundry`, Python 3.13+ și uv curent. Vei inspecta `azure.yaml`, testa local cu Agent Inspector, implementa sursa pentru o construcție Foundry la distanță, și genera/revizui un set de date și rubrică înainte de configurarea `azd ai eval init --name quality`. Nu înlocui testele acestui exemplu și nu presupune că instalarea pachetului îi schimbă modelul de găzduire.

## 5.5 Red teaming AI și evaluare continuă

Exemplul actual oferă [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Completează cerințele prealabile și revizuiește ținta și costurile vizate înainte de rulare:

```bash
pytest tests/test_red_teaming.py -s
```

Folosește o implementare de test autorizată și date sintetice. Revizuiește atacurile și rezultatele generate; această scanare nu stabilește că o aplicație este sigură sau conformă.

Ghidul de [observabilitate](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) descrie, de asemenea, evaluarea continuă configurată la pornirea containerului. Aceasta evaluează interacțiunile reale ale utilizatorilor, nu traficul generat de teste, iar suportul evaluatorului variază în funcție de regiune. Lipsa interacțiunilor înseamnă că nu există intrări de evaluare. Verificați versiunea mostrei instalate și configurația evaluatorului în loc să presupuneți că fiecare implementare are aceleași setări implicite.

Autentificarea este separată de evaluare. Urmați configurația de identitate/acces documentată în mostră. Nu există o „fallback basic auth” documentată pe care să vă bazați pentru protejarea unui punct final public.

## 5.6 Exercițiu de proiectare: personalizare retail

!!! warning "Exercițiu de proiectare, nu o implementare completă"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Scrieți un plan scurt care să abordeze:

| Domeniu | Decizie și dovezi de colectat |
|------|----------------------------------|
| Responsabilități agent | Porniți de la un singur agent sau justificați agenți separați Shopper și Loyalty și logica de rutare |
| Date | Definiți un set sintetic de date pentru catalog/recompense și proprietatea actualizărilor |
| Instrumente | Implementați mai întâi handleri doar în citire; specificați autorizare și validare pentru orice scriere |
| Modele | Alegeți combinațiile disponibile de model/versiune/SKU și verificați cota; evitați aprovizionarea cu modele nefolosite |
| Recuperare | Definiți indexarea, dimensiunile embedding-urilor, citările și controalele de acces la nivel de document |
| Evaluare | Adăugați cazuri cu răspuns așteptat, întrebări nesuportate, utilizare a instrumentului și siguranță cu praguri explicite |
| Operațiuni | Definiți telemetria, bugetele de latență/erori, limitele de cost și proprietatea curățării |

Salvarea `custom-agents/shopper-agent-instructions.md` nu face ca mostra să îl încarce. Găsiți codul aplicației care creează/actualizează agentul, conectați instrucțiunile revizuite acolo și verificați versiunea agentului rezultată înainte de testare. Instrucțiunile nu pot acorda acces la date sau instrumente pe care nu le-ați implementat.

Aplicați o singură modificare odată, redeployați componentele afectate și rulați din nou întrebările și evaluările de bază. Păstrați o revizie funcțională pentru comparație. Pentru inspirație arhitecturală, vedeți [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), care nu este nici ea o aplicație retail completă.

!!! quote "LA SFÂRȘITUL ACESTUI LAB AR TREBUI SĂ AVEȚI"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continuați către [Dezinstalarea infrastructurii](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
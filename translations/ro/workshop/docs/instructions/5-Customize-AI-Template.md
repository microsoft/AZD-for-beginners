# 5. Personalizează un șablon

!!! tip "LA FINALUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stabilește o bază de referință

Folosește depozitul [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) inițializat din modulele anterioare. Înregistrează revizia șablonului, versiunea AZD, mediul selectat, implementarea modelului și întrebările exemplu funcționale înainte de a face modificări.

Exemplul implementează o aplicație de chat susținută de un agent. Nu devine **automat** un sistem cu doi agenți pentru retail doar prin setarea variabilelor de mediu sau salvarea unor fișiere suplimentare cu instrucțiuni. Agenții suplimentari, gestionarea instrumentelor, rutarea, autorizarea și accesul la date necesită cod de aplicație.

Examinează instrucțiunile și instrumentele agentului implementat în Foundry. Testează o întrebare factuala, o întrebare de recuperare și o întrebare la care datele exemplu nu pot răspunde. Verifică citările față de documentele sursă reale în loc să presupui că un răspuns fluent este corect.

## 5.2 Personalizează recuperarea cunoștințelor

Șablonul suportă recuperarea bazată pe fișiere și integrarea opțională cu Azure AI Search. Urmează [ghidul curent AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) pentru indexare și configurarea instrumentului.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Activarea serviciului este doar o parte a recuperării. Înainte de a încărca propriile date:

1. Confirmă că ai permisiunea de a folosi documentele și elimină informațiile sensibile.
2. Selectează un model de embedding sprijinit în regiunea ta și setează versiunea compatibilă, tipul de implementare și dimensiunile vectorilor.
3. Creează/populează indexul folosind procesul documentat al exemplului.
4. Configurează instrumentul de recuperare al agentului să folosească acel index.
5. Testează recuperarea, citările, autorizarea și comportamentul când nu există un document relevant.

Nu schimba de la `text-embedding-3-small` la un alt model de embedding fără a verifica dimensiunile și eventual a reconstrui/reindexa vectorii. Un nume precum `retail-products` nu este un catalog implementat sau o politică de control al accesului.

## 5.3 Urmărire și monitorizare

Urmează [ghidul de observabilitate al exemplului](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Asigură-te că resursa necesară Application Insights și conexiunea există deja; în cazul schimbărilor în setările infrastructurii, folosește `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Trimite o cerere de test, apoi inspectează jurnalele aplicației Container App și vizualizarea urmăririi agentului în Foundry. Verifică latența, apelurile la instrumente, erorile și corelația dintre cerere și urmă. Nu presupune că telemetria este conectată doar pentru că implementarea a reușit.

Lasă `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` dezactivat dacă nu ai revizuit explicit consimțământul, redactarea, păstrarea și controalele de acces. Urmăririle pot conține argumente sensibile ale instrumentelor sau conținut al documentelor, chiar și atunci când jurnalele obișnuite ale aplicației par inofensive.

## 5.4 Evaluarea agentului

Punctul de intrare pentru evaluarea exemplului este acum [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nu un director `evals/`. Din rădăcina exemplului, folosește un mediu Python care îndeplinește cerințele documentate:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Înainte de rulare, finalizează [prerechizitele evaluării](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testele încarcă configurația din `.azure/<environment>/.env` selectat; confirmă că mediul intenționat este selectat. Intrările importante includ:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, folosind formatul cerut de exemplul curent (versiunea revizuită folosește `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, folosită ca implementare pentru modelul judecător

Examinează testele pentru a înțelege alegerea evaluatorului, pragurile, rolurile necesare și costurile modelului. O rulare completă nu este automat o poartă de calitate trecută; inspectează scorurile, cazurile eșuate/eroare și rezultatele legate în Foundry.

### Extensia separată pentru evaluările AZD

Testul Python de mai sus este un **flux de lucru specific exemplului**. Extensia opțională `azure.ai.evaluations` este un flux de lucru diferit, cu propria configurație `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pentru o configurare completă a extensiei, vezi [fluxuri de lucru de evaluare și migrare](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Din beta.22 a extensiei agenților, nu folosi comenzile eliminate `azd ai agent eval`. Instalarea extensiei de evaluări nu convertește testele Python ale exemplului și nu creează automat o configurație de evaluare.

## 5.5 Testarea echipei roșii AI și evaluare continuă

Exemplul curent oferă [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Finalizează prerechizitele și revizuiește ținta și costurile înainte de rulare:

```bash
pytest tests/test_red_teaming.py -s
```

Folosește o implementare de test autorizată și date sintetice. Revizuiește atacurile și rezultatele generate; această scanare nu stabilește că o aplicație este sigură sau conformă.

Ghidul de [observabilitate](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) descrie, de asemenea, evaluarea continuă configurată la pornirea containerului. Ea evaluează interacțiunile reale ale utilizatorilor, nu traficul de test generat, iar suportul evaluatorului variază în funcție de regiune. Lipsa interacțiunilor înseamnă lipsa intrărilor de evaluare. Verifică versiunea instalată a eșantionului și configurația evaluatorului în loc să presupui că fiecare implementare are aceleași setări implicite.

Autentificarea este separată de evaluare. Urmează configurarea de identitate/acces documentată a eșantionului. Nu există o „cădere” documentată cu autentificare de bază pe care să te bazezi pentru protejarea unui punct final public.

## 5.6 Exercițiu de proiectare: personalizare retail

!!! warning "Exercițiu de proiectare, nu o implementare completă"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Scrie un plan scurt care abordează:

| Zonă | Decizie și dovezi de colectat |
|------|----------------------------------|
| Responsabilități agent | Pornește cu un singur agent sau justifică agenți separați pentru Cumpărător și Loialitate și logica de rutare |
| Date | Definește un set de date sintetic pentru catalog/recompense și responsabilitatea actualizărilor |
| Unelte | Implementează mai întâi handleri doar pentru citire; specifică autorizarea și validarea pentru orice scriere |
| Modele | Alege combinațiile disponibile model/versiune/SKU și verifică cota; evită alocarea modelelor neutilizate |
| Recuperare | Definește indexarea, dimensiunile embedding, citările și controalele de acces la nivel de document |
| Evaluare | Adaugă cazuri cu răspuns așteptat, întrebări nesuportate, utilizare unelte și siguranță cu praguri explicite |
| Operațiuni | Definește telemetria, bugetele de latență/eroare, limitele de cost și responsabilitatea curățeniei |

Salvarea `custom-agents/shopper-agent-instructions.md` nu determină eșantionul să îl încarce. Găsește codul aplicației care creează/actualizează agentul, conectează instrucțiunile revizuite acolo și verifică versiunea agentului rezultat înainte de testare. Instrucțiunile nu pot acorda acces la date sau unelte pe care nu le-ai implementat.

Aplică câte o modificare odată, reimplementează componentele afectate și reexecută întrebările și evaluările de bază. Păstrează o versiune funcțională pentru comparație. Pentru inspirație de arhitectură, vezi [scheletul pentru retail](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), care nici el nu este o aplicație retail completă.

!!! quote "LA FINALUL ACESTUI LAB AR TREBUI SĂ AI"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continuă la [Demontarea infrastructurii](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
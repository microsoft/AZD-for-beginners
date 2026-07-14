# మార్చబడిన చేంజ్ - AZD ప్రారంభికుల కోసం

## పరిచయం

ఈ మార్చబడిన చేంజ్ AZD ప్రారంభికులు రిపోజిటరీకి సంబంధించిన అన్ని ముఖ్యమైన మార్పులు, నవీకరణలు మరియు మెరుగుదలలను నమోదు చేస్తుంది. మేము సెమెంటిక్ వెర్షనింగ్ ప్రిన్సిపుల్స్ ను అనుసరిస్తాము మరియు వర్షన్ల మధ్య మార్పుల గురించి ఉపయోగకారులకు సహాయం చేయడానికి ఈ లాగ్ ని నిర్వహించుకుంటాము.

## నేర్చుకునే లక్ష్యాలు

ఈ మార్చబడిన చేంజ్ ను సమీక్షించడం ద్వారా మీరు:
- కొత్త ఫీచర్లు మరియు కంటెంట్ చేర్పుల గురించి సమాచారం పొందగలరు
- అందుబాటులో ఉన్న డాక్యుమెంటేషన్ మెరుగుదలలను అర్థం చేసుకోవచ్చు
- సరిచేయబడిన బగ్స్ మరియు సవరణలను ట్రాక్ చేయవచ్చు
- నేర్చుకునే పదార్థాల ప్రగతి ఎలా ఉందో అనుసరిస్తారు

## నేర్చుకున్న ఫలితాలు

మార్చబడిన చేంజ్ ఎంట్రీలను సమీక్షించిన తరువాత, మీరు ఈ క్రింది విషయాలు చేయగలుగుతారు:
- కొత్త కంటెంట్ మరియు విద్యా వనరులను గుర్తించండి
- ఎలాంటి భాగాలు నవీకరించబడ్డాయో లేదా మెరుగుపరచబడ్డాయో అర్థం చేసుకోండి
- తాజా పదార్థాల ఆధారంగా మీ నేర్చుకునే మార్గాన్ని ప్లాన్ చేయండి
- భవిష్యత్తు మెరుగుదలల కోసం ఫీడ్బ్యాక్ మరియు సూచనలు ఇవ్వండి

## వెర్షన్ చరిత్ర

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 రిఫ్రెష్: వెర్షన్ కరెన్సీ నవీకరణ
**ఈ వెర్షన్ `azd` `1.27.1` (జూలై 2026, తాజా స్థిరమైన విడుదల) మరియు ప్రస్తుత ప్రివ్యూ AI ఏజెంట్ ఎక్స్‌టెన్షన్ `azure.ai.agents` `1.0.0-beta.5` తో కోర్సును తిరిగి ధృవీకరిస్తుంది, 1.26.0, 1.27.0, మరియు 1.27.1 విడుదలల తరువాత “ధృవీకరించబడిన” బ్యానర్లను తాజా స్థితిలోకి తీసుకురావడం.**

#### మార్చబడినవి
- **✅ ధృవీకరణ బేస్‌లైన్ నవీకరించబడింది** `azd 1.25.6` (జూన్ 2026) నుండి `azd 1.27.1` (జులై 2026) వరకు రూట్ README, అన్ని అధ్యాయం READMEs, అధ్యాయం 1 డెవ్-కంటెయినర్ పాఠం (పిన్డ్ వెర్షన్ ఉదాహరణలతో సహా), అధ్యాయం 4 కస్టమ్-టెంప్లేట్స్ పాఠం, అధ్యాయం 5 మల్టీ-ఏజెంట్ పాఠం మరియు వర్క్షాప్ డాక్స్ లో
- **🤖 అధ్యాయం 2 బేస్‌లైన్ రిఫ్రెష్ చేయబడింది** `azd 1.23.12` (మార్చి 2026) నుండి `azd 1.27.1` వరకు `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, మరియు `microsoft-foundry-integration.md` ఫైళ్లలో; ధృవీకరణ-గమనిక తేదీలు 2026-07-13 కు నవీకరించబడ్డాయి
- **🧩 AI ఏజెంట్ ఎక్స్‌టెన్షన్ నవీకరించబడింది** `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` నుండి ప్రస్తుత `1.0.0-beta.5` విడుదల వరకు అధ్యాయం 2 README మరియు `agents.md` లో
- **🧪 వర్క్షాప్ ధృవీకరణ ఉదాహరణ** (`azd version` అవుట్పుట్) `1.27.1` కు నవీకరించబడింది

#### సంబంధిత azd విడుదలలపై గమనికలు (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Azure Functions కోసం Flex Consumption పై Go మద్దతు, `azd config sub-filter` పర్-టెనెంట్ సబ్‌స్క్రిప్షన్ ఫిల్టర్లు, స్వయంక్త విస్తరణ బండిల్స్ (`azd x pack --bundle`), మరియు `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** `azure.yaml` లో నేరుగా Azure AI Foundry ప్రాజెక్ట్స్/ఏజెంట్లు మోడల్ చేయడం (Bicep లేకుండా / Terraform లేకుండా ప్రారంభం), App Service కోసం కంటెయినర్ డిప్లాయ్ మద్దతు (`host: appservice` + `language: docker`), `azd extension` క‌మాండ్లకు నేరుగా `-s/--source`, మరియు `azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install` కు `--no-dependencies` ఫ్లాగ్, తీసివేయబడిన మోడల్స్ కేటలాగ్/క్వోట ప్రాంప్ట్ల నుండి ముందుగా తొలగింపు, మరియు అనేక బగ్ ఫిక్సెస్

#### నవీకరించిన ఫైళ్లు
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### ప్రారంభికుల గ్యాప్-ఫిల్ #2: టెంప్లేట్ రచన, డెవ్ కంటెయినర్లు, పులూమి, Azure DevOps, సర్వీస్ ప్రిన్సిపల్స్, మరియు మరిన్ని
**ఈ వెర్షన్ azd-coverage విశ్లేషణ ద్వారా గుర్తించిన మిగిలిన మధ్యంతర గ్యాప్‌లను ముగుస్తుంది: మీ స్వంత టెంప్లేట్ రచించడం మరియు ప్రచురించడం, పునరుత్పాదక డెవ్-కంటెయినర్/Codespaces పరిసరాలు, పులూమి ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవైడర్, Azure DevOps CI/CD నడిపే మార్గదర్శక, సర్వీస్-ప్రిన్సిపల్ ధృవీకరణ, హోస్ట్-ఎంపిక మార్గదర్శకాలు (AKS/Spring Apps), `azd restore`/`azd package` వివరణలు, హుక్ లోపాలు నిర్వహణ, మరియు టీమ్/షేర్ చేసిన పరిసరాలు భవిష్యత్తు పద్ధతులు.**

#### జోడించబడింది
- **🧱 కొత్త అధ్యాయం 4 పాఠం** `docs/chapter-04-infrastructure/custom-templates.md` — మీ స్వంత azd టెంప్లేట్ రచన: అవసరమైన నిర్మాణం (`azure.yaml`, `infra/`, `src/`), `metadata.template` ఫీల్డ్, `uniqueString()` వనరుల టోకెన్ మరియు `azd-env-name` ట్యాగ్ తో ఇన్‌ఫ్రాస్ట్రక్చర్ పరిమాణం, స్థానికంగా `azd init --template <local-path>` ఉపయోగించి పరీక్షించడం, GitHub లో ప్రచురించడం, మరియు Awesome AZD గ్యాలరీకు సమర్పించడం
- **📦 కొత్త అధ్యాయం 1 పాఠం** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers మరియు GitHub Codespaces తో పునరుత్పాదక azd పరిసరాలు: అధికారిక `ghcr.io/azure/azure-dev/azd` ఫీచర్ ఉపయోగించిన కనిష్ట `.devcontainer/devcontainer.json`, భాషకు ప్రత్యేక ఫీచర్లు, కంటెయినర్ హోస్ట్స్ కోసం `docker-in-docker`, మరియు దూర సైన్-ఇన్ కోసం `azd auth login --use-device-code`
- **🧩 azd తో పులూమి** సెక్షన్ `docs/chapter-04-infrastructure/provisioning.md` లో — `infra.provider: pulumi`, పులూమి ఫోల్డర్ లేఅవుట్, azd పరిసరాలకు మ్యాప్ చేసిన స్టాక్స్, అవసరమైన అవుట్‌పుట్స్/ట్యాగింగ్, మరియు `azd up` / `azd down` పద్ధతి
- **🎯 హోస్ట్ ఎంచుకునే మార్గదర్శకం** `docs/chapter-04-infrastructure/provisioning.md` లో — మొదటి వార్షికులకు అనుకూలంగా `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, మరియు `springapp` యొక్క సరిపోలిక, మరియు AKS లేదా Azure Spring Apps ఎప్పుడు ఎంచుకోవాలో సూచనలు
- **🛠️ Azure DevOps CI/CD గైడ్** `docs/chapter-08-production/production-ai-practices.md` లో — `azd pipeline config --provider azdo`, వర్క్లోడ్ ఐడెంటిటీ ఫెడరేషన్ (OIDC)తో సర్వీస్ కనెక్షన్, ఉత్పత్తి చేసిన `azure-dev.yml`, మరియు వేరియబుల్-గ్రూప్ సెటప్
- **🔑 సర్వీస్ ప్రిన్సిపల్స్ (ప్యాటర్న్ 4)** `docs/chapter-03-configuration/authsecurity.md` లో జతచేయబడింది — `az ad sp create-for-rbac`, కస్టమర్ సీక్రెట్ తో నాన్-ఇంటరాక్టివ్ `azd auth login` vs. ఫెడరేటెడ్/OIDC క్రెడెన్షియల్స్, ఎప్పుడు ఉపయోగించాలి, మరియు సురక్షిత క్రెడెంటియల్ నిల్వ
- **🪝 హుక్ లోపాలు నిర్వహణ** ఉపవిభాగం `docs/chapter-04-infrastructure/deployment-guide.md` లో — ఎగ్జిట్ కోడ్లు మరియు `set -e`, `continueOnError`, ఒంటరిగా హుక్స్ ను పరీక్షించడం `azd hooks run` తో, OS-ప్రత్యేక షెల్స్, మరియు `--debug`
- **👥 టీమ్ / పంచుకున్న పరిసరాలు** సెక్షన్ `docs/chapter-03-configuration/configuration.md` లో — `.azure/` లో ఏముంది, gitignore ఏమిటి, ప్రతి డెవలపర్ పరిసరాలు, `azd env list`/`select`, మరియు CI/CD లో పరిసర విలువలు అందించడం
- **🧰 `azd restore` మరియు విస్తృతమైన `azd package`** వివరణలు `resources/cheat-sheet.md` లో — ఆధారాలు తిరిగి పొందడం మరియు చేర్పకుండా అమర్చదగిన ఆర్టిఫాక్ట్ నిర్మించడం

#### మార్పులు
- **🧭 అధ్యాయం 4 పాఠాల పట్టిక** కొత్త "మీ స్వంత టెంప్లేట్ రచన" పాఠం (పాఠం 3) చేర్చబడింది
- **🧭 అధ్యాయం 1 పాఠాల పట్టిక** కొత్త "Dev Containers & Codespaces" పాఠం (పాఠం 5) చేర్చబడింది; `bring-your-own-app.md` మరియు `dev-containers.md` మధ్య నావిగేషన్ ఫుటర్లు అమర్చబడ్డాయి

### [v3.21.0] - 2026-06-16

#### ప్రారంభికుల గ్యాప్-ఫిల్: హ్యాండ్స్-ఆన్ మల్టీ-ఏజెంట్ పాఠం, "మీ స్వంత యాప్ తీసుకు రండి," Terraform, మరియు CI/CD మార్గదర్శక
**ఈ వెర్షన్ పూర్తి ప్రారంభికుల గైడ్ కోసం పెద్ద గ్యాప్‌లను మూసేస్తుంది: రెండు కొత్త హ్యాండ్స్-ఆన్ పాఠాలు (డిప్లయబుల్ మల్టీ-ఏజెంట్ గైడ్ మరియు azd ని ఉన్న ప్రాజెక్ట్‌లో జోడించడం), సులభమైన హుక్స్ పరిచయం, azd తో Terraform సెక్షన్, GitHub Actions పై దశలవారీ పర్యవేక్షణ, కొత్త ప్రివ్యూ ఎక్స్‌టెన్షన్‌ల వివరణ, మరియు స్పష్టం చేసిన డిప్లాయ్‌మెంట్ ధృవీకరణ చెక్‌లిస్ట్.**

#### జోడించబడింది
- **🤝 కొత్త అధ్యాయం 5 పాఠం** `docs/chapter-05-multi-agent/multi-agent-basics.md` — పూర్తిగా హ్యాండ్స్-ఆన్, డిప్లయబుల్ రెండు ఏజెంట్ వాక్‌త్రూ (ఆర్చిస్ట్రేటర్ + స్పెషలిస్ట్స్) నిజమైన టెంప్లేట్ (`contoso-creative-writer`) ఉపయోగించి, ఎప్పుడు మల్టీ-ఏజెంట్ ఉపయోగించాలో, `azd up` వర్క్‌ఫ్లో, డిప్లయ్ అయిన వనరుల అర్థం, క్రాస్-ఏజెంట్ ట్రేసింగ్, కస్టమైజేషన్, మరియు శుభ్రపరిచే ప్రక్రియ
- **📦 కొత్త అధ్యాయం 1 పాఠం** `docs/chapter-01-foundation/bring-your-own-app.md` — ఉన్న ప్రాజెక్ట్‌లో azd ఎలా జోడించాలో `azd init` ("ప్రస్తుత డైరెక్టరీలో కోడ్ వాడండి"), `azure.yaml` మరియు `infra/` అర్థం చేసుకోవడం, `azd infra generate`, హోస్ట్ గుర్తింపు, మరియు `azd up` తో డిప్లాయ్ చేయడం
- **🌐 azd తో Terraform** సెక్షన్ `docs/chapter-04-infrastructure/provisioning.md` లో చేర్చబడింది — `infra.provider: terraform` కాన్ఫిగరేషన్, `.tf` ఫోల్డర్ లేఅవుట్, అవసరమైన `AZURE_*` అవుట్‌పుట్స్ మరియు `azd-env-name` ట్యాగింగ్, మరియు `azd up` / `azd down` సమాన వర్క్‌ఫ్లో (Terraform మద్దతును పేర్కొన్నా Bicep మాత్రమే చూపించిన గ్యాప్‌ను మూసివేసింది)
- **⚙️ GitHub Actions యొక్క దశల వారీ మార్గదర్శకం** `docs/chapter-08-production/production-ai-practices.md` లో — GitHub రిపో నుండి ఆటోమేటెడ్ డిప్లాయ్‌ల వరకు: `azd pipeline config`, OIDC ఫెడరేట్ చేసిన క్రెడెన్షియల్స్ (స్టోర్ చెయ్యబడని గోప్యత), ఉత్పత్తి అయిన `azure-dev.yml`, మరియు సీక్రెట్-వర్సెస్-వేరియబుల్స్ మార్గదర్శనం
- **🪝 ప్రారంభికుల "హుక్స్ అంటే నూతనం?" పరిచయం** `docs/chapter-04-infrastructure/deployment-guide.md` లో — హుక్ అంటే ఏమిటి, హుక్-దశ పట్టిక, కనిష్ట మొదటి హుక్, మరియు చేతితో హుక్స్ నడపడం `azd hooks run` తో
- **✅ "మీ డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి" చెక్‌లిస్ట్** `docs/chapter-01-foundation/first-project.md` స్టెప్ 5 లో జోడించబడింది — స్మోక్ టెస్ట్, ఆరోగ్య ఎండ్‌పాయింట్ చెక్, మరియు స్పష్టమైన విజయ ప్రమాణాలు
- **🧩 కొత్త ప్రివ్యూ ఎక్స్‌టెన్షన్‌ల వివరణ** `azure.ai.skills` మరియు `azure.ai.connections` (వృత్తాంతం మరియు ఉపయోగించే సమయాలు) `docs/chapter-08-production/production-ai-practices.md` లో

#### మార్చబడినవి
- **🧭 అధ్యాయం 5 పాఠాల పట్టిక** సరి చేయబడింది: `multi-agent-basics.md` ఇప్పుడు పాఠం 1 (మొత్తం హ్యాండ్స్-ఆన్ పాఠం మాత్రమే), నిజాయితీగా పాఠం 2 అధ్యాయం 6 లో ఉండటం, మరియు రీటెయిల్ సన్నివేశం ఒక్క కమాండ్ టెంప్లేట్ కాకుండా معماری బ్లూప్రింట్
- **🧭 అధ్యాయం 1 పాఠాల పట్టిక** ఇప్పుడు కొత్త "మీ స్వంత యాప్ తీసుకు రండి" పాఠం (పాఠం 4) కలిగి ఉంది
- **🔗 నావిగేషన్ ఫుటర్లు** నవీకరించబడ్డాయి: `first-project.md` ఇప్పుడు ముందుకు లింక్ చేస్తుంది `bring-your-own-app.md`

#### సరిదిద్దబడినవి
- **🧱Terraform గ్యాప్ మూసివేయబడింది** — కోర్సు ముందు Terraform మద్దతును సూచించింది కానీ దాన్ని చూపలేదు
- **🔀 తప్పుదారి చూపించిన అధ్యాయం 5 క్రాస్-లింక్లు సరిచేయబడినవి** పూర్తి మల్టీ-ఏజెంట్ అమలు ఉందని సూచించినప్పటికీ అది معماری బ్లూప్రింట్ మాత్రమే

#### నవీకరించిన ఫైళ్ళు
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(కొత్త)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(కొత్త)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 రిఫ్రెష్, పూర్తి ఏజెంట్ లైఫ్‌సైకిల్ క‌మాండ్లు & Aspire రీబ్రాండ్

**ఈ వెర్షన్ `azd` `1.25.6` (జూన్ 2026) మరియు `azure.ai.agents` `0.1.40-preview` ఎక్స్టెన్షన్ పట్ల కోర్సును తిరిగి ధృవీకరిస్తుంది, AI మార్గనిర్దేశకాన్ని "ఏజెంట్‌ను స్కాఫోల్డ్ చేయడం" నుండి పూర్తి ఏజెంట్ జీవన చక్రం (పరీక్ష → మూల్యాంకనం → ఆప్టిమైజ్ → పరిశీలన → తొలగింపు) వరకు విస్తరిస్తుంది, కొత్త `azure.ai.skills` మరియు `azure.ai.connections` ప్రివ్యూ ఎక్స్టెన్షన్లను ప్రదర్శిస్తుంది, మరియు ".NET Aspire" → "Aspire" ఉత్పత్తి పేరు మార్పును గమనిస్తుంది.**

#### జోడించబడింది
- **🔁 మొదటిమని మరియు AI ఇంజనీర్ల కోసం పూర్తి ఏజెంట్ జీవన చక్రం కవరేజ్** డాక్స్‌లో:
  - `docs/chapter-01-foundation/azd-basics.md` — ఎక్స్టెన్షన్స్ మరియు AI కమాండ్ల విభాగంలో జీవన చక్ర పట్టిక (స్కాఫోల్డ్ → పరీక్ష → కొలవడం → మెరుగులు → పరిశీలన → శుభ్రత) జోడించబడింది
  - `docs/chapter-08-production/production-ai-practices.md` — కొత్త "ఏజెంట్ జీవన చక్ర నిర్వహణ" విభాగం, ఇందులో `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, మరియు `delete --force` ఉన్నాయి
  - `resources/cheat-sheet.md` — AI ఏజెంట్ కమాండ్లను విస్తరించి `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, మరియు `delete --force` తో చేర్చబడింది
- **🧩 కొత్త ప్రివ్యూ ఎక్స్టెన్షన్స్** ప్రాసంగీకరించబడ్డవి: `azure.ai.skills` (పునర్వినియోగయోగ్య ఏజెంట్ నైపుణ్యాలు) మరియు `azure.ai.connections` (Foundry కనెక్షన్లు) ఎక్స్టెన్షన్స్ పట్టిక మరియు చీట్ షీట్‌లో జోడించబడ్డాయి
- **⏱️ స్పందన సమయ మార్గనిర్దేశం** — ఇప్పుడు `azd ai agent invoke` ఉదాహరణలు మొత్తం లాటెన్సీ మరియు మొదటి బైట్‌కు సమయం ముద్రిస్తాయని గమనిస్తాయి
- **📌 వెర్షన్ బానర్** మూల README లో నేర్చుకునే వారిని `azd version` మరియు `azd upgrade` వైపు సూచిస్తుంది

#### మార్చబడింది
- **✅ ధృవీకరణ బేస్‌లైన్ నవీకరణ** మొత్తం అధ్యాయం README లు మరియు వర్క్‌షాప్ డాక్స్‌లో `azd 1.23.12` (మార్టి 2026) నుండి `azd 1.25.6` (జూన్ 2026)కి
- **🤖 అధ్యాయం 2 ఎక్స్టెన్షన్ గమనిక** `azure.ai.agents` `0.1.18-preview` నుండి `0.1.40-preview`కి నవీకరించబడింది
- **🧪 వర్క్‌షాప్ ధృవీకరణ ఉదాహరణ** (`azd version` అవుట్పుట్) `1.25.6`కి నవీకరించబడింది
- **🧭 README "azd లో ఈరోజు ఏమి కొత్తది"** తుడిచబడింది, ఇది ఆఖరి-देखि-ఆఖరి ఏజెంట్ జీవన చక్రం, కొత్త AI ఎక్స్టెన్షన్లు మరియు తాజా నాణ్యత-జీవితం సవరణలను హైలైట్ చేస్తుంది (`azd init` ఐడెంపోటెన్సీ, `azd auth login` పాత టోకెన్ తొలగింపు, `azd tool` మొదటి-రన్ ప్రాంప్ట్)
- **📖 అధ్యాయం 2 agents.md (ఎంపిక 4)** ఇప్పుడు `azd up` వద్ద ఆపు పెట్టకుండా పోస్ట్-డిప్లాయ్ జీవన చక్ర కమాండ్లకు నేర్చుకునే వారిని సూచిస్తుంది

#### పరిగణించబడింది
- **🏷️ ఉత్పత్తి పేరు** — Aspire పేరు మార్చడం గమనిక జోడించబడింది (".NET Aspire" ఇప్పుడు కేవలం "Aspire"); azd యొక్క Aspire మద్దతు మారలేదు
- **🔎 ప్రత్యక్ష విడుదల ధృవీకరణ** Azure Developer CLI విడుదల ఫీడ్ వ్యతిరేకంగా నిర్ధారించబడింది: స్థిర CLI `1.25.6` (2026-06-12) మరియు `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### నవీకరించిన ఫైళ్ళు
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### ప్రారంభి ఒన్బోర్డింగ్ క్లారిఫికేషన్, సెటప్ ధృవీకరణ & తుది AZD కమాండ్ శుభ్రపరిచుట
**ఈ వెర్షన్ AZD 1.23 ధృవీకరణను అందుబాటులో పెట్టి, ప్రారంభి దృష్టికోణంతో డాక్యుమెంటేషన్ పాస్ చేస్తుంది: ఇది AZD-ఫస్ట్ ఆథెంటికేషన్ మార్గనిర్ధేశకాన్ని స్పష్టత చేస్తుంది, స్థానిక సెటప్ ధృవీకరణ స్క్రిప్టులను జోడిస్తుంది, కీలక కమాండ్లను ప్రత్యక్ష AZD CLI పట్ల ధృవీకరిస్తుంది, మరియు చేంజ్‌లాగ్ బయట చివరి అవినీతులైన ఇంగ్లీష్-మూల కమాండ్ సూచనలను తొలగిస్తుంది.**

#### జోడించబడింది
- **🧪 ప్రారంభి సెటప్ ధృవీకరణ స్క్రిప్టులు** `validate-setup.ps1` మరియు `validate-setup.sh` తో, అధ్యాయం 1 ప్రారంభించేముందు అవసరమైన పరికరాలను నిర్ధారించుకోవడానికి
- **✅ ముందస్తు సెటప్ ధృవీకరణ దశలు** మూల README మరియు అధ్యాయం 1 README లో, డిప్లాయ్ ముందు అవశ్యకములు పట్టించుకోబడటానికి

#### మార్చబడింది
- **🔐 ప్రారంభి ఆథెంటికేషన్ మార్గనిర్దేశకం** ఇప్పుడు ఎల్లప్పుడూ `azd auth login` ను AZD వర్క్‌ఫ్లోల ప్రధానం గా పరిగణిస్తుంది, `az login`ను Azure CLI కమాండ్లు నేరుగా వాడినప్పుడు తప్పనిసరి కాకుండా ఆప్షనల్ గా చూపిస్తుంది
- **📚 అధ్యాయం 1 ఒన్బోర్డింగ్ ప్రవాహం** ఇప్పుడు నేర్చుకునే వారిని తమ స్థానిక సెటప్ ను ఇన్‌స్టాలేషన్, ఆథెంటికేషన్ మరియు మొదటి డిప్లాయ్ దశలకు ముందుగా ధృవీకరించమని తెలిపే విధంగా మారింది
- **🛠️ ధృవీకరణ సందేశం** ఇప్పుడు AZD మాత్రమే ఉపయోగించే ప్రారంభి మార్గంలో అడ్డంకి అవసరాలనూ మరియు Azure CLI హెచ్చరికల మధ్య స్పష్టత చూపుతుంది
- **📖 కాన్ఫిగరేషన్, సమస్య పరిష్కారం, మరియు ఉదాహరణ డాక్స్** ఇప్పుడు అవసరమైన AZD ఆథెంటికేషన్ మరియు ఆప్షనల్ Azure CLI సైన్-ఇన్ మధ్య వ్యత్యాసం చూపుతాయి, ఇందులో ఇంతక ముందు context లేకుండా మిళితం చేయబడినవి

#### పరిగణించబడింది
- **📋 మిగిలిన ఇంగ్లీష్ మూల కమాండ్ సూచనలు** ప్రస్తుత AZD రూపాల్లోకి నవీకరించబడ్డాయి, చీట్ షీట్ లో `azd config show` మరియు Azure పోర్టల్ అవలోకన మార్గదర్శకం ఉద్దేశించిన చోట `azd monitor --overview` సహా
- **🧭 ప్రారంభి క్లైమ్స్ అధ్యాయం 1 లో** అన్ని టెంప్లేట్లు మరియు Azure వనరులపై గ్యారంటీ చేసిన లోపమో లేక రోల్బ్యాక్ ప్రవర్తన కాదు అని మృదువుగా పేర్కొనబడింది
- **🔎 ప్రత్యక్ష CLI ధృవీకరణ** ప్రస్తుత మద్దతు ఆదేశాల తో నిర్ధారించబడింది: `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, మరియు `azd down --force --purge`

#### నవీకరించిన ఫైళ్ళు
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 ధృవీకరణ, వర్క్‌షాప్ వాతావరణ విస్తరణ & AI మోడల్ రిఫ్రెష్
**ఈ వెర్షన్ `azd` `1.23.12` పట్ల డాక్యుమెంటేషన్ ధృవీకరణ, పాత AZD కమాండ్ ఉదాహరణల నవీకరణ, AI మోడల్ మార్గనిర్దేశకం తాజా డిఫాల్ట్‌లకు అనుగుణంగా సవరించడం, మరియు వర్క్‌షాప్ సూచనలను GitHub Codespaces మినహా dev కంటైనర్లు మరియు స్థానిక క్లోన్లు కూడా మద్దతు ఇవ్వడానికి విస్తరించింది.**

#### జోడించబడింది
- **✅ కీలక అధ్యాయాలు మరియు వర్క్‌షాప్ డాక్స్‌లో ధృవీకరణ గమనికలు** కొత్త లేదా పాత CLI బిల్డులను ఉపయోగించే నేర్చుకునే వారికి పరీక్షించిన AZD బేస్‌లైన్ స్పష్టం చేయడానికి
- **⏱️ పెద్ద వ్యవధి AI యాప్ మోపడం గైడ్‌లైన్** `azd deploy --timeout 1800` వాడకంతో
- **🔎 ఎక్స్టెన్షన్ పరిశీలనా దశలు** AI వర్క్‌ఫ్లో డాక్స్‌లో `azd extension show azure.ai.agents`తో
- **🌐 విస్తృత వర్క్‌షాప్ వాతావరణ మార్గనిర్దేశం** MkDocs తో GitHub Codespaces, dev కంటైనర్లు, మరియు స్థానిక క్లోన్లను కవర్ చేస్తుంది

#### మార్చబడింది
- **📚 అధ్యాయాల పరిచయ README లు** ఇప్పుడు ఫౌండేషన్, కాన్ఫిగరేషన్, ఇన్ఫ్రాస్ట్రక్చర్, మల్టీ-ఏజెంట్, ప్రీ-డిప్లాయ్‌మెంట్, ట్రబుల్షూటింగ్, మరియు ప్రొడక్షన్ విభాగాల్లో `azd 1.23.12` విలువ చెలామణీని స్పష్టంగా గుర్తు చేస్తాయి
- **🛠️ AZD కమాండ్ సూచనలు** డాక్స్‌లో ప్రస్తుత రూపాలకు నవీకరణ:
  - `azd config list` → `azd config show`
  - `azd env show` → సందర్భానుసారం `azd env list` లేదా `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → అప్లికేషన్ ఇన్సైట్స్ అవలోకనం ఉద్దేశిస్తే `azd monitor --overview`
- **🧪 ప్రివ్యూ ఉదాహరణలు సరళీకృతం** ప్రస్తుత మద్దతిచ్చే వాడుకలకు సరిపడా, ఉదాహరణకు `azd provision --preview` మరియు `azd provision --preview -e production`
- **🧭 వర్క్‌షాప్ ప్రవాహం** ఇప్పుడు నేర్చుకునే వారు Codespaces, dev కంటైనర్, లేదా స్థానిక క్లోన్‌లో ప్రయోగాల్ని పూర్తి చేయగలుగుతారు, Codespaces మాత్రమే అనుకుంటే కాదు
- **🔐 ఆథెంటికేషన్ మార్గనిర్దేశకము** ఇప్పుడు AZD వర్క్‌ఫ్లోల కోసం `azd auth login` ప్రాధాన్యతనిస్తుంది, Azure CLI కమాండ్లు నేరుగా వాడినప్పుడు `az login` ఆప్షనల్ గా చూపిస్తుంది

#### పరిగణించబడింది
- **🪟 విండోస్ ఇన్‌స్టాల్ కమాండ్లు** ఇన్‌స్టాలేషన్ గైడ్‌లో ప్రస్తుత `winget` ప్యాకేజీ కేసింగ్‌కి అనుగుణంగా సార్మిళితమయ్యాయి
- **🐧 లినక్స్ ఇన్‌స్టాల్ మార్గనిర్దేశకం** విభిన్న పంపిణీ-ప్రత్యేక `azd` ప్యాకేజి మేనేజర్ సూచనలు తప్పించి, సరైన రీలీజ్ ఆస్తుల వైపు సూచిస్తుంది
- **📦 AI మోడల్ ఉదాహరణలు** పాత డిఫాల్ట్‌ల నుంచి `gpt-35-turbo` మరియు `text-embedding-ada-002` నుండి ప్రస్తుత ఉదాహరణలైన `gpt-4.1-mini`, `gpt-4.1`, మరియు `text-embedding-3-large` వరకు నవీకరించబడ్డాయి
- **📋 డిప్లోయ్‌మెంట్ మరియు డయాగ్నొస్టిక్స్ స్నిపెట్లు** ప్రస్తుత వాతావరణ మరియు స్థితి కమాండ్లను ఉపయోగించి సవరించబడ్డాయి
- **⚙️ GitHub Actions మార్గనిర్దేశం** `Azure/setup-azd@v1.0.0` నుంచి `Azure/setup-azd@v2`కి నవీకరించబడింది
- **🤖 MCP/Copilot కంసెంట్ మార్గనిర్దేశం** `azd mcp consent` నుండి `azd copilot consent list`కి నవీకరించబడింది

#### మెరుగుపర్చబడింది
- **🧠 AI అధ్యాయం మార్గనిర్దేశకం** ఇప్పుడు ప్రివ్యూ-సున్నితమైన `azd ai` ప్రవర్తన, టెనెంట్-విశేష లాగిన్, ప్రస్తుత ఎక్స్టెన్షన్ వాడకం, మరియు నవీకరించిన మోడల్ డిప్లోయ్‌మెంట్ సిఫారసులు మెరుగ్గా వివరిస్తుంది
- **🧪 వర్క్‌షాప్ సూచనలు** ప్రస్తుతం వాస్తవిక వెర్షన్ ఉదాహరణలు మరియు స్పష్టమైన వాతావరణ సెటప్ భాషను ఉపయోగిస్తున్నాయి
- **📈 ఉత్పత్తి మరియు సమస్య పరిష్కారం డాక్స్** ప్రస్తుత మానిటరింగ్, ఫాల్‌బ్యాక్ మోడల్, మరియు ఖర్చు-తరగతి ఉదాహరణలతో మెరుగ్గా సరిపోతున్నాయి

#### నవీకరించిన ఫైళ్ళు
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI కమాండ్లు, కంటెంట్ ధృవీకరణ & టెంప్లేట్ విస్తరణ
**ఈ వెర్షన్ అన్ని AI సంబంధిత అధ్యాయాలలో `azd ai`, `azd extension`, మరియు `azd mcp` కమాండ్ లను జోడిస్తుంది, agents.md లో బ్రోక్ లింక్‌లు మరియు పాత కోడ్‌ను సవరించి, చీట్ షీట్ తాజా చేస్తుంది, మరియు ఉదాహరణ టెంప్లేట్స్ విభాగాన్ని ధృవీకరించిన వివరణలతో మరియు కొత్త Azure AI AZD టెంప్లేట్‌లతో అప్గ్రేడ్ చేస్తుంది.**

#### జోడించబడినవి
- **🤖 AZD AI CLI కవరేజీ** 7 ఫైళ్ళలో (ముందుగా కేవలం అధ్యాయం 8లో మాత్రమే):
  - `docs/chapter-01-foundation/azd-basics.md` — కొత్త "ఎక్స్టెన్షన్స్ మరియు AI కమాండ్లు" విభాగం, `azd extension`, `azd ai agent init`, మరియు `azd mcp` పరిచయం చేస్తుంది
  - `docs/chapter-02-ai-development/agents.md` — ఎంపిక 4: `azd ai agent init` తో సరిపోలింపు పట్టిక (టెంప్లేట్ వర్సెస్ మానిఫెస్ట్ దృష్టికోణం)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry కోసం AZD ఎక్స్టెన్షన్స్" మరియు "ఏజెంట్-ఫస్ట్ డిప్లాయ్‌మెంట్" ఉపవిభాగాలు

  - `docs/chapter-05-multi-agent/README.md` — క్విక్ స్టార్ట్ ఇప్పుడు టెంప్లేట్ మరియు మానిఫెస్ట్ ఆధారిత డిప్లోయ్‌మెంట్ మార్గాలను చూపిస్తుంది
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — డిప్లోయ్ సెక్షన్ ఇప్పుడు `azd ai agent init` ఎంపికను కలిగి ఉంది
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "డయాగ్నోస్టిక్స్ కొరకు AZD AI ఎక్స్టెన్షన్ కమాండ్లు" ఉపవిభాగం
  - `resources/cheat-sheet.md` — కొత్త "AI & ఎక్స్టెన్షన్ కమాండ్లు" సెక్షన్ లో `azd extension`, `azd ai agent init`, `azd mcp`, మరియు `azd infra generate`
- **📦 కొత్త AZD AI ఉదాహరణ టెంప్లేట్లు** `microsoft-foundry-integration.md` లో:
  - **azure-search-openai-demo-csharp** — .NET RAG చాట్ Blazor WebAssembly, Semantic Kernel మరియు వైస్ చాట్ సపోర్ట్ తో
  - **azure-search-openai-demo-java** — Langchain4J ఉపయోగించి జావా RAG చాట్ ACA/AKS డిప్లోయ్‌మెంట్ ఎంపికలతో
  - **contoso-creative-writer** — Azure AI ఏజెంట్ సర్వీస్, Bing గ్రౌండింగ్ మరియు Prompty ఉపయోగించే బహుళ ఏజెంట్ సృజనాత్మక రచనా యాప్
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB ఉపయోగించే సర్వర్‌లెస్ RAG Ollama లోకల్ డెవ్ సపోర్ట్ తో
  - **chat-with-your-data-solution-accelerator** — అడ్మిన్ పోర్టల్, Teams ఇంటిగ్రేషన్ మరియు PostgreSQL/Cosmos DB ఎంపికలతో ఎంటర్ప్రైజ్ RAG యాక్సిలరేటర్
  - **azure-ai-travel-agents** — .NET, Python, Java మరియు TypeScript సర్వర్లతో బహుళ ఏజెంట్ MCP ఆర్కెస్ట్రేషన్ రిఫరెన్స్ యాప్
  - **azd-ai-starter** — కనిష్ట Azure AI ఇన్‌ఫ్రాస్ట్రక్చర్ Bicep స్టార్టర్ టెంప్లేట్
  - **🔗 అద్భుతమైన AZD AI గ్యాలరీ లింక్** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) కు రిఫరెన్స్ (80+ టెంప్లేట్లు)

#### సరిచేశాయి
- **🔗 agents.md నావిగేషన్**: మునుపటి/తరుచు లింకులు ఇప్పుడు చాప్టర్ 2 README పాఠం క్రమాన్ని అనుసరిస్తున్నాయి (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md బ్రోకెన్ లింకులు**: `production-ai-practices.md` సరిచేసి `../chapter-08-production/production-ai-practices.md` కు మార్చింది (3 ప్రాసారాలు)
- **📦 agents.md పాత కోడ్**: `opencensus` ను `azure-monitor-opentelemetry` + OpenTelemetry SDK తో మార్చింది
- **🐛 agents.md చెల్లని API**: `max_tokens` ను `create_agent()` నుండి `create_run()` కి `max_completion_tokens`గా మార్చింది
- **🔢 agents.md టోకెన్ లెక్కింపు**: అప్రమేయ `len//4` అంచనాను `tiktoken.encoding_for_model()` తో మార్చింది
- **azure-search-openai-demo**: సర్వీసులను "Cognitive Search + App Service" నుండి "Azure AI Search + Azure Container Apps" కు సరిచేసింది (డిఫాల్ట్ హోస్ట్ అక్టోబర్ 2024 న మారింది)
- **contoso-chat**: వివరణను Azure AI Foundry + Prompty కు రిఫరెన్స్ గా నవీకరించింది, రిపో యొక్క అసలు శీర్షిక మరియు టెక్ స్టాక్ కు సరిపోయేలా మార్చింది

#### తీసివేశారు
- **ai-document-processing**: పనిచేయని టెంప్లేట్ రిఫరెన్స్ తొలగించింది (రిపో AZD టెంప్లేట్ గా ప్రజలకు అందుబాటులో లేదు)

#### మెరుగుపరచారు
- **📝 agents.md వ్యాయామాలు**: వ్యాయామం 1 ఇప్పుడు ఆశించిన అవుట్పుట్ మరియు `azd monitor` దశను చూపిస్తుంది; వ్యాయామం 2 పూర్తి `FunctionTool` నమోదు కోడ్ కలిగి ఉంది; వ్యాయామం 3 అనుమానాస్పద మార్గదర్శకాలను స్పష్టమైన `prepdocs.py` కమాండ్లతో మార్చింది
- **📚 agents.md వనరులు**: డాక్యుమెంటేషన్ లింకులను ప్రస్తుత Azure AI Agent Service డోక్యుమెంటేషన్ మరియు క్విక్ స్టార్ట్ కు నవీకరించింది
- **📋 agents.md తదుపరి దశల పట్టిక**: పూర్తి అధ్యాయ కవరేజీ కోసం AI వర్క్‌షాప్ ల్యాబ్ లింక్ చేర్చింది

#### ఫైళ్ళను నవీకరించారు
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### కోర్సు నావిగేషన్ మెరుగుదల
**ఈ వెర్షన్ README.md అధ్యాయ నావిగేషన్ ను మెరుగైన పట్టిక ఫార్మాట్ తో పెంపొందించింది.**

#### మార్చబడింది
- **కోర్సు మ్యాప్ పట్టిక**: ప్రత్యక్ష పాఠం లింకులు, వ్యవధి అంచనాలు, మరియు క్లిష్టత రేటింగులతో మెరుగుపరచబడింది
- **ఫోల్డర్ శుభ్రపరిచింది**: పునరావృతమైన పాత ఫోల్డర్స్ (deployment/, getting-started/, pre-deployment/, troubleshooting/) తొలగించబడ్డాయి
- **లింక్ ప్రమాణికరణ**: కోర్సు మ్యాప్ పట్టికలోని 21+ అంతర్గత లింకులు తనిఖీ చేయబడ్డాయి

### [v3.16.0] - 2026-02-05

#### ఉత్పత్తి పేర్ల నవీకరణలు
**ఈ వెర్షన్ ప్రస్తుత Microsoft బ్రాండింగ్ కు ఉత్పత్తి సూచనలను నవీకరిస్తుంది.**

#### మార్చబడింది
- **Microsoft Foundry → Microsoft Foundry**: అన్ని సంబందిత సూచనలు అనువాదేతర ఫైళ్లలో నవీకరించబడ్డాయి
- **Azure AI Agent Service → Foundry Agents**: సేవ పేరును ప్రస్తుత బ్రాండింగ్ కి అనుగుణంగా నవీకరించబడింది

#### ఫైళ్ళు నవీకరించబడ్డాయి
- `README.md` - ప్రధాన కోర్సు లాండింగ్ పేజీ
- `changelog.md` - వర్షన్ చరిత్ర
- `course-outline.md` - కోర్సు నిర్మాణం
- `docs/chapter-02-ai-development/agents.md` - AI ఏజెంట్ల గైడ్
- `examples/README.md` - ఉదాహరణల డాక్యుమెంటేషన్
- `workshop/README.md` - వర్క్‌షాప్ లాండింగ్ పేజీ
- `workshop/docs/index.md` - వర్క్‌షాప్ సూచిక
- `workshop/docs/instructions/*.md` - పూర్తి వర్క్‌షాప్ సూచన ఫైళ్లు

---

### [v3.15.0] - 2026-02-05

#### ప్రధాన రిపోజిటరీ పునఃరూపకం: అధ్యాయ ఆధారిత ఫోల్‌డర్ పేర్లు
**ఈ వెర్షన్ డాక్యుమెంటేషన్‌ను స్పష్టం చేసిన నావిగేషన్ కొరకు ప్రత్యేకమైన అధ్యాయ ఫోల్డర్లుగా పునఃరూపిస్తోంది.**

#### ఫోల్డర్ పేరు మార్చికలు
పాత ఫోల్డర్లను అధ్యాయ-సంఖ్య ఫోల్డర్లతో మార్చివేయబడింది:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- కొత్తది చేర్చబడింది: `docs/chapter-05-multi-agent/`

#### ఫైల్ మార్పిడులు
| ఫైల్ | నుండి | కు |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |

| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### జోడించబడింది
- **📚 అధ్యాయం README ఫైల్స్**: ప్రతి అధ్యాయ ఫోల్డర్‌లో README.md సృష్టించబడింది:
  - పాఠ్య లక్ష్యాలు మరియు వ్యవధి
  - వివరణలతో పాఠ్య పట్టిక
  - త్వరిత ప్రారంభ కమాండ్లు
  - ఇతర అధ్యాయాలకు నావిగేషన్

#### మార్చబడింది
- **🔗 అన్ని అంతర్గత లింకులను అప్డేట్ చేయివారు**: డాక్యుమెంటేషన్ ఫైళ్లలో 78+ మార్గాలు అప్డేట్ చేయబడ్డాయి
- **🗺️ ప్రధాన README.md**: కొత్త అధ్యాయ నిర్మాణంతో కోర్స్ మ్యాప్ అప్డేట్ చేయబడింది
- **📝 examples/README.md**: అధ్యాయ ఫోల్డర్లకు క్రాస్రిఫరెన్సులు అప్డేట్ చేయబడ్డాయి

#### తీసివేయబడింది
- పాత ఫోల్డర్ నిర్మాణం (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### రిపాజిటరీ పునర్నిర్మాణం: అధ్యాయ నావిగేషన్
**ఈ సంచిక అధ్యాయ నావిగేషన్ README ఫైల్స్ జోడించింది (v3.15.0 ద్వారా అధిగమించబడింది).**

---

### [v3.13.0] - 2026-02-05

#### కొత్త AI ఏజెంట్ల గైడ్
**ఈ సంచిక Azure Developer CLI తో AI ఏజెంట్లను నియామకం చేసే సమగ్ర గైడ్‌ను జోడిస్తుంది.**

#### జోడించబడింది
- **🤖 docs/microsoft-foundry/agents.md**: పూర్తి గైడ్ కవర్ చేస్తోంది:
  - AI ఏజెంట్లు అంటే ఏమిటి మరియు అవి చాట్‌బాట్లతో ఎలా భిన్నంగా ఉంటాయి
  - మూడు త్వరిత-ప్రారంభ ఏజెంట్ టెంప్లేట్లు (Foundry Agents, Prompty, RAG)
  - ఏజెంట్ శిల్పకళ నమూనాలు (ఒకే ఏజెంట్, RAG, మళ్లీ ఏజెంట్లు)
  - టూల్ కాన్ఫిగరేషన్ మరియు అనుకూలత
  - మానిటరింగ్ మరియు మెట్రిక్స్ ట్రాకింగ్
  - ఖర్చు పరిగణనలు మరియు ఆప్టిమైజేషన్
  - సామాన్య సమస్యలు పరిష్కారం దృశ్యాలు
  - విజయ ప్రమాణాలతో మూడు అనుభవాత్మక వ్యాయామాలు

#### సామగ్రి నిర్మాణం
- **పరిచయం**: ప్రారంభికుల కోసం ఏజెంట్ సంక్షిప్తాతి
- **త్వరిత ప్రారంభం**: `azd init --template get-started-with-ai-agents` తో ఏజెంట్లను నియామకం చేయండి
- **శిల్పకళ నమూనాలు**: ఏజెంట్ నమూనాల దృశ్య диаг్రమ్లు
- **కాన్ఫిగరేషన్**: టూల్ సెటప్ మరియు వాతావరణ వేరియబుల్స్
- **మానిటరింగ్**: అనువర్తన అన్వేషణల సమగ్రత
- **వ్యాయామాలు**: ప్రోగ్రెసివ్ అనుభవాత్మక నేర్చుకోవడం (ప్రతి 20-45 నిమిషాలు)

---

### [v3.12.0] - 2026-02-05

#### DevContainer వాతావరణం నవీకరణ
**ఈ సంచిక AZD నేర్చుకునే అనుభవం కోసం ఆధునిక టూల్స్ మరియు మెరుగైన డిఫాల్ట్‌లతో డెవలప్‌మెంట్ కంటైనర్ కాన్ఫిగరేషన్‌ను నవీకరిస్తుంది.**

#### మార్చబడింది
- **🐳 బేస్ ఇమేజ్**: `python:3.12-bullseye` నుండి `python:3.12-bookworm` (తాజా Debian స్థిరమైన) కు నవీకరించబడింది
- **📛 కంటైనర్ పేరు**: స్పష్టత కోసం "Python 3" నుండి "AZD for Beginners"గా పేరు మార్చబడింది

#### జోడించబడింది
- **🔧 కొత్త డెవ్ కంటైనర్ ఫీచర్స్**:
  - `azure-cli` బిసెప్ మద్దతుతో ఎనేబుల్ చేయబడింది
  - `node:20` (AZD టెంప్లేట్ల కోసం LTS సంచిక)
  - టెంప్లేట్ నిర్వహణ కోసం `github-cli`
  - కంటైనర్ అనువర్తన నియామకాల కోసం `docker-in-docker`

- **🔌 పోర్ట్ ఫార్వార్డింగ్**: సాధారణ డెవలప్‌మెంట్ కోసం ముందుగానే కాన్ఫిగర్ చేసిన పోర్టులు:
  - 8000 (MkDocs ప్రివ్యూ)
  - 3000 (వెబ్ అనువర్తనాలు)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 కొత్త VS కోడ్ విస్తరణలు**:
  - `ms-python.vscode-pylance` - మెరుగైన Python ఇంటెల్లీసెన్స్
  - `ms-azuretools.vscode-azurefunctions` - ఆజూర్ ఫంక్షన్లు మద్దతు
  - `ms-azuretools.vscode-docker` - Docker మద్దతు
  - `ms-azuretools.vscode-bicep` - Bicep భాష మద్దతు
  - `ms-azure-devtools.azure-resource-groups` - ఆజూర్ వనరుల నిర్వహణ
  - `yzhang.markdown-all-in-one` - మార్క్‌డౌన్ ఎడిటింగ్
  - `DavidAnson.vscode-markdownlint` - మార్క్‌డౌన్ లింటింగ్
  - `bierner.markdown-mermaid` - Mermaid డయాగ్రామ్ మద్దతు
  - `redhat.vscode-yaml` - YAML మద్దతు (azure.yaml కోసం)
  - `eamodio.gitlens` - Git విజువలైజేషన్
  - `mhutchie.git-graph` - Git చరిత్ర

- **⚙️ VS కోడ్ సెట్టింగ్స్**: Python ఇంటర్‌ప్రెటర్, సంరక్షణపై ఫార్మాట్, మరియు వైట్‌స్పేస్ తొలగింపు కోసం డిఫాల్ట్ సెట్టింగ్స్ జోడించబడ్డాయి

- **📦 requirements-dev.txt అప్డేట్ చేయబడింది**:
  - MkDocs minify ప్లగిన్ జోడించబడింది
  - కోడ్ నాణ్యత కోసం ప్రీ-కమిట్ జోడించబడింది
  - Azure SDK ప్యాకేజీలు జోడించబడ్డాయి (azure-identity, azure-mgmt-resource)

#### పరిష్కరించబడింది
- **పోస్ట్-క్రియేట్ కమాండ్**: కంటైనర్ ప్రారంభం వద్ద AZD మరియు Azure CLI సంస్థాపనని ధృవీకరించడం עכשיו

---

### [v3.11.0] - 2026-02-05

#### రవాణా స్నేహపూర్వక README పునరుద్ధరణ
**ఈ సంచిక README.md ను కొత్త వారికి మరింత సులభంగా మార్చింది మరియు AI అభివృద్ధి కర్తల కోసం అవసరమైన వనరులను జోడించింది.**

#### జోడించబడింది
- **🆚 Azure CLI వర్సెస్ AZD సరిపోలిక**: ఎప్పుడు ఏ టూల్ ఉపయోగించాలో స్పష్టమైన వివరణ ఆచరణాత్మక ఉదాహరణలతో
- **🌟 అద్భుతమైన AZD లింకులు**: కమ్యూనిటీ టెంప్లేట్ గ్యాలరీ మరియు కాంట్రిబ్యూషన్ వనరులకు నేర లింకులు:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ తయారైన-నియామక టెంప్లేట్లు
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - కమ్యూనిటీ కాంట్రిబ్యూషన్
- **🎯 త్వరిత ప్రారంభ గైడ్**: సరళీకృత 3-స్టెప్ getting started విభాగం (ఇన్‌స్టాల్ → లాగిన్ → డిప్లాయ్)
- **📊 అనుభవ ఆధారిత నావిగేషన్ పట్టిక**: అభివృద్ధి కర్త అనుభవం ఆధారంగా ఎక్కడ ప్రారంభించాలో స్పష్టమైన మార్గదర్శకత్వం

#### మార్చబడింది
- **README నిర్మాణం**: ప్రగతిశీల గోప్యత కోసం మళ్ళీ ఏర్పాటు - ముఖ్య సమాచారం ముందుగా
- **పరిచయ విభాగం**: పూర్తి కొత్త వారికి "The Magic of `azd up`" వివరించడానికి పునఃరాసి
- **నకిలీ కంటెంట్ తీసివేయబడింది**: అనవసరమైన డ్యుప్లికేట్ troubleshooting విభాగం తొలగించబడింది

- **సమస్య పరిష్కార ఆజ్ఞలు**: సరైన `azd monitor --logs` ఉపయోగించడానికి `azd logs` సూచనను సరిచేశారు

#### సరిచేసినవి

- **🔐 ప్రమాణీకరణ కమాండ్లు**: `azd auth login` మరియు `azd auth logout` cheat-sheet.md లో చేర్చబడినవి
- **తప్పుడు కమాండ్ సూచనలు**: README పరిష్కార విభాగం నుండి మిగిలిన `azd logs` తొలగించబడింది

#### గమనికలు
- **పరిధి**: మార్పులు ప్రధాన README.md మరియు resources/cheat-sheet.md కు వర్తిస్తాయి
- **లక్ష్య ప్రేక్షకులు**: ప్రత్యేకంగా AZD కొత్తవారికి అభివృద్ధి చేసిన సవరణలు

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI కమాండ్ సరైనతా నవీకరణ
**ఈ సంస్కరణ చివర ఉపయోగంలో లేకపోయే AZD కమాండ్లను డాక్యుమెంటేషన్ అంతటా సరిదిద్దుతూ, అన్ని కోడ్ ఉదాహరణలు సరైన Azure Developer CLI సింటాక్స్ ఉపయోగిస్తున్నాయని నిర్ధారిస్తుంది.**

#### సరి చేయబడింది
- **🔧 లేదని నిరూపిత AZD కమాండ్లు తొలగింపు**: తప్పు కమాండ్ల సమగ్ర సమీక్ష మరియు సవరణ:
  - `azd logs` (ఉండదు) → `azd monitor --logs` లేదా Azure CLI ప్రత్యామ్నాయాలతో మార్చబడింది
  - `azd service` ఉపకమాండ్లు (ఉండవు) → `azd show` మరియు Azure CLI తో మార్చబడింది
  - `azd infra import/export/validate` (ఉండవు) → తొలగింపబడింది లేదా సరైన ప్రత్యామ్నాయాలతో మార్చబడింది
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` ఫ్లాగ్లు (ఉండవు) → తొలగించబడ్డాయి
  - `azd provision --what-if/--rollback` ఫ్లాగ్లు (ఉండవు) → `--preview` ఉపయోగించేలా మార్చబడింది
  - `azd config validate` (ఉండదు) → `azd config list` తో మార్చబడింది
  - `azd info`, `azd history`, `azd metrics` (ఉండవు) → తొలగించబడ్డాయి

- **📚 కమాండ్ సవరణలతో ఫైళ్లు నవీకరణ**:
  - `resources/cheat-sheet.md`: కమాండ్ సూచనను ప్రధానంగా పునఃసమీక్ష
  - `docs/deployment/deployment-guide.md`: రోల్బ్యాక్ మరియు నియామక వ్యూహాలు సరి చేయబడినవి
  - `docs/troubleshooting/debugging.md`: లాగ్ విశ్లేషణ విభాగాలు సరి చేయబడినవి
  - `docs/troubleshooting/common-issues.md`: పరిష్కార కమాండ్లు నవీకరించబడినవి
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD డీబగ్గింగ్ సెక్షన్ సరి చేయబడింది
  - `docs/getting-started/azd-basics.md`: మానిటరింగ్ కమాండ్లు సరి చేయబడ్డాయి
  - `docs/getting-started/first-project.md`: మానిటరింగ్ మరియు డీబగ్గింగ్ ఉదాహరణలు నవీకరించబడ్డాయి
  - `docs/getting-started/installation.md`: సహాయం మరియు వెర్షన్ ఉదాహరణలు సరి చేయబడ్డాయి
  - `docs/pre-deployment/application-insights.md`: లాగ్ వీక్షణ కమాండ్లు సరి చేయబడ్డాయి
  - `docs/pre-deployment/coordination-patterns.md`: ఏజెంట్ డీబగ్గింగ్ కమాండ్లు సరి చేయబడ్డాయి

- **📝 వెర్షన్ సూచన నవీకరణ**: 
  - `docs/getting-started/installation.md`: హార్డ్ కోడ్ చేసిన `1.5.0` వెర్షన్‌ను సాధారణ `1.x.x` కు మార్చి విడుదలల లింక్ చేర్చబడింది

#### మార్చబడింది
- **రోల్బ్యాక్ వ్యూహాలు**: Git ఆధారిత రోల్బ్యాక్ ఉపయోగించి డాక్యుమెంటేషన్ నవీకరించబడింది (AZD లో స్వంత రోల్బ్యాక్ లేదు)
- **లాగ్ వీక్షణ**: `azd logs` సూచనలను `azd monitor --logs`, `azd monitor --live`, మరియు Azure CLI కమాండ్లతో మార్చబడింది
- **బద్దల విభాగం**: ఉనికిలో లేనిదైన సమాంతర/సంచలిత నియామక ఫ్లాగ్లు తొలగింపబడినవి, సరైన ప్రత్యామ్నాయాలు ఇవ్వబడ్డాయి

#### సాంకేతిక వివరాలు
- **చెల్లుబాటు అయ్యే AZD కమాండ్లు**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **చెల్లుబాటు అయ్యే azd monitor ఫ్లాగ్లు**: `--live`, `--logs`, `--overview`
- **తొలగించిన ఫీచర్లు**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### గమనికలు
- **తదుపరి నిర్ధారణ**: కమాండ్లు Azure Developer CLI v1.23.x తో ధృవీకరించబడాయి

---

### [v3.9.0] - 2026-02-05

#### వర్క్ షాప్ పూర్తి మరియు డాక్యుమెంటేషన్ నాణ్యత నవీకరణ
**ఈ సంస్కరణ ఇంటరాక్టివ్ వర్క్ షాప్ మాడ్యూల్స్‌ను పూర్తి చేస్తుంది, అన్నీ చెల్లని డాక్యుమెంటేషన్ లింక్లను సరి చేస్తుంది మరియు Microsoft AZD ఉపయోగించే AI డెవలపర్లు కోసం మొత్తం విషయం నాణ్యతను మెరుగుపరుస్తుంది.**

#### జోడించబడింది
- **📝 CONTRIBUTING.md**: కొత్త సహకారం మార్గదర్శకాలు డాక్యుమెంట్:
  - సమస్యల నివేదిక మరియు మార్పులు ప్రతిపాదించే స్పష్టమైన సూచనలు
  - కొత్త విషయం కోసం డాక్యుమెంటేషన్ ప్రమాణాలు
  - కోడ్ ఉదాహరణ మార్గదర్శకాలు మరియు కమిట్ సందేశ రూపకాళ్లు
  - కమ్యూనిటీ పాల్గొనడం సమాచారం

#### పూర్తయింది
- **🎯 వర్క్ షాప్ మాడ్యూల్ 7 (ముగింపు)**: పూర్తి చేసిన ముగింపు మాడ్యూల్:
  - వర్క్ షాప్ విజయాల సమగ్ర సారాంశం
  - AZD, టెంప్లేట్లు మరియు Microsoft Foundry పై కీలక భావనలు
  - శిక్షణ ప్రయాణం కొనసాగింపుపై సూచనలని
  - వర్క్ షాప్ సవాలు వ్యాయామాలు, కష్టం రేటింగ్‌లు
  - కమ్యూనిటీ ఫీడ్బ్యాక్ మరియు మద్దతు లింకులు

- **📚 వర్క్ షాప్ మాడ్యూల్ 3 (విభజన)**: అభ్యాస లక్ష్యాలు నవీకరించబడ్డాయి:
  - GitHub Copilot MCP సర్వర్ల యాక్టివేషన్ మార్గదర్శకం
  - AZD టెంప్లేట్ ఫోల్డర్ నిర్మాణ అవగాహన
  - ఇన్ఫ్రాస్ట్రక్చర్-యాజ్ఞ (Bicep) వ్యవస్థాపనా నమూనాలు
  - హ్యాండ్స్-ఆన్ ల్యాబ్ సూచనలు

- **🔧 వర్క్ షాప్ మాడ్యూల్ 6 (విధ్వంసం)**: పూర్తయింది:
  - వనరుల శుభ్రపరిచే ప్రయత్నం మరియు ఖర్చు నిర్వహణ లక్ష్యాలు
  - `azd down` సురక్షిత ఇన్ఫ్రాస్ట్రక్చర్ డిప్రొవిజనింగ్ కోసం ఉపయోగం
  - సున్నితంగా తొలగించిన కాగ్నిటివ్ సర్వీస్‌లను పునరుద్ధరించడం సూచనలు
  - GitHub Copilot మరియు Azure పోర్టల్ ‌పైన అదనపు అన్వేషణ సూచనలు

#### సరి చేయబడింది
- **🔗 విరిగిన లింక్ సవరణలు**: 15+ విరిగిన అంతర్గత డాక్యుమెంటేషన్ లింక్లను పరిష్కరించినవి:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.mdకి మార్గదర్శకమైన మార్గాలను సరి చేయబడ్డాయి
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md మరియు production-ai-practices.md మార్గాలు సరి చేయబడ్డాయి
  - `docs/getting-started/first-project.md`: ఉండని cicd-integration.mdని deployment-guide.mdతో మార్చారు
  - `examples/retail-scenario.md`: FAQ మరియు పరిష్కార గైడ్ మార్గాలను సరి చేయబడ్డాయి
  - `examples/container-app/microservices/README.md`: కోర్సు హోమ్ మరియు డిప్లాయ్ గైడ్ మార్గాలు సరి చేయబడ్డాయి
  - `resources/faq.md` మరియు `resources/glossary.md`: AI అధ్యాయ సూచనలను నవీకరించారు
  - `course-outline.md`: ఇన్‌స్ట్రక్టర్ గైడ్ మరియు AI వర్క్ షాప్ ల్యాబ్ సూచనలు సరి చేయబడ్డాయి

- **📅 వర్క్ షాప్ స్థితి బ్యానర్**: "అడుగులో ఉంది" నుండి ఫలితం ఫిబ్రవరి 2026కి మార్చబడింది

- **🔗 వర్క్ షాప్ నావిగేషన్**: ఉండని lab-1-azd-basics ఫోల్డర్ వైపు చూపు ఉండే README.md లో విరిగిన నావిగేషన్ లింక్స్ సరి చేయబడ్డాయి

#### మార్చబడింది
- **వర్క్ షాప్ ప్రదర్శన**: "అడుగులో ఉంది" హెచ్చరిక తొలగించి, వర్క్ షాప్ సంపూర్ణంగా సిద్ధంగా ఉంది
- **నావిగేషన్ సुसంపన్నత**: అన్ని మాడ్యూల్స్ మధ్య సరైన మధ్యనావిగేషన్ నిర్ధారించబడింది
- **అభ్యాస మార్గ సూచనలు**: microsoft-foundry మార్గాలను సరైన రీతిలో అధ్యాయ క్రాస్-రెఫరెన్సులతో నవీకరించారు

#### ధృవీకరించబడింది
- ✅ అన్ని ఇంగ్లీష్ మార్క్డౌన్ ఫైళ్లు చెల్లుబాటు అయ్యే అంతర్గత లింకులు కలిగి ఉన్నాయి
- ✅ వర్క్ షాప్ మాడ్యూల్స్ 0-7 పూర్తయినవి, అభ్యాస లక్ష్యాలతో
- ✅ అధ్యాయాలు మరియు మాడ్యూల్‌లకు మధ్య నావిగేషన్ సరిగ్గా పనిచేస్తుంది
- ✅ Microsoft AZD ఉపయోగించే AI డెవలపర్లు కోసం విషయం అనుకూలంగా ఉంటుంది
- ✅ ప్రారంభస్థాయి అనుకూలమైన భాష మరియు నిర్మాణం మొత్తంలో కొనసాగుతోంది
- ✅ CONTRIBUTING.md కమ్యూనిటీ సహకారులకు స్పష్టమైన మార్గదర్శకం ఇస్తుంది

#### సాంకేతిక అమలు
- **లింక్ ధృవీకరణ**: ఆటోమేటెడ్ PowerShell స్క్రిప్ట్ ద్వారా అన్ని .md అంతర్గత లింకులు ధృవీకరించబడ్డాయి
- **విషయం సమీక్ష**: వర్క్ షాప్ పూర్తిగా మరియు ప్రారంభ అనుకూలతకు మాన్యువల్ సమీక్ష
- **నావిగేషన్ వ్యవస్థ**: అధ్యాయ మరియు మాడ్యూల్ నావిగేషన్ నమూనాలు సక్రమంగా అమలు చేయబడ్డాయి

#### గమనికలు
- **పరిధి**: మార్పులు ఇంగ్లీష్ డాక్యుమెంటేషన్‌లో మాత్రమే వర్తిస్తాయి
- **అనువాదాలు**: అనువాద ఫోల్డర్లు ఈ సంస్కరణలో నవీకరించబడలేదు (ఆటోమేటెడ్ అనువాదం తర్వాత సమకాలీకరణ చేస్తుంది)
- **వర్క్ షాప్ వ్యవధి**: పూర్తి వర్క్ షాప్ ఇప్పుడు 3-4 గంటల హ్యాండ్స్-ఆన్ శిక్షణని అందిస్తుంది

---

### [v3.8.0] - 2025-11-19

#### ఆధునిక డాక్యుమెంటేషన్: మానిటరింగ్, సెక్యూరిటీ, మరియు మల్టీ-ఏజెంట్ నమూనాలు
**ఈ సంస్కరణ అప్లికేషన్ ఇన్స్‌లెయిట్స్ ఇంటిగ్రేషన్, ప్రమాణీకరణ నమూనాలు, మరియు ఉత్పత్తి నియామకాల కోసం మల్టీ-ఏజెంట్ సమన్వయం పై సమగ్ర A-గ్రేడ్ పాఠాలు జోడిస్తుంది.**

#### జోడించబడింది
- **📊 అప్లికేషన్ ఇన్స్‌లెయిట్స్ ఇంటిగ్రేషన్ పాఠం**: `docs/pre-deployment/application-insights.md` లో:
  - AZD-కేంద్రీకృత నియామకం ఆటోమేటిక్ provisioning తో
  - అప్లికేషన్ ఇన్స్‌లెయిట్స్ + లాగ్ విశ్లేషణ కోసం పూర్తి Bicep టెంప్లేట్లు
  - 1,200+ లైన్లతో సజీవ Python అనువర్తనాలు కస్టమ్ టెలిమేట్రీ తో
  - AI/LLM మానిటరింగ్ నమూనాలు (Microsoft Foundry Models టోకెన్/ఖర్చు ట్రాకింగ్)
  - 6 మெர్మైడ్ డయాగ్రామ్‌లు (స్థాపన, పంపిణీ చేసిన ట్రేస్, టెలిమేట్రీ ప్రవాహం)
  - 3 హ్యాండ్స్-ఆన్ వ్యాయామాలు (అలెర్టులు, డాష్‌బోర్డ్లు, AI మానిటరింగ్)
  - కుస్టో క్వెరీ ఉదాహరణలు మరియు ఖర్చు మెరుగుదల వ్యూహాలు
  - ప్రత్యక్ష మ్యాట్రిక్స్ స్ట్రీమింగ్ మరియు రియల్-టైమ్ డీబగ్గింగ్
  - 40-50 నిమిషాల శిక్షణ సమయం ఉత్పత్తి-తయారు నమూనాలతో

- **🔐 ప్రమాణీకరణ & సెక్యూరిటీ నమూనాలు పాఠం**: `docs/getting-started/authsecurity.md` లో:
  - 3 ప్రమాణీకరణ నమూనాలు (కనెక్షన్ స్ట్రింగ్స్, కీ వాల్టు, మేనేజ్‌డ్ ఐడెంటిటీ)
  - సురక్షిత నియామకాల కోసం పూర్తి Bicep ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు
  - Node.js అనువర్తనం కోడ్ Azure SDK ఇంటిగ్రేషన్‌తో
  - 3 పూర్తి వ్యాయామాలు (మేనేజ్‌డ్ ఐడెంటిటీ, యూజర్-అసైన్‌డ్ ఐడెంటిటీ, కీ వాల్ట్ రొటేషన్)
  - సెక్యూరిటీ ఉత్తమ ఆచారాలు మరియు RBAC కాన్ఫిగరేషన్లు
  - పరిష్కార మార్గదర్శకం మరియు ఖర్చు విశ్లేషణ
  - ఉత్పత్తి-సిద్ధమైన పాస్వర్డ్‌లెస్ ప్రమాణీకరణ నమూనాలు

- **🤖 మల్టీ-ఏజెంట్ సమన్వయ నమూనాలు పాఠం**: `docs/pre-deployment/coordination-patterns.md` లో:
  - 5 సమన్వయ నమూనాలు (సీక్వెన్షియల్, సమాంతర, హైరార్కికల్, ఈవెంట్-చాలిత, కన్సెన్సస్)
  - పూర్తి ఆర్కెస్ట్రేటర్ సర్వీస్ అమలు (Python/Flask, 1,500+ లైన్లు)
  - 3 ప్రత్యేక ఏజెంట్ అమలు (రిసెర్చ్, రైటర్, ఎడిటర్)
  - సందేశ క్యూయింగ్ కోసం సర్వీస్ బస్ ఇంటిగ్రేషన్
  - పంపిణీ చేసిన సిస్టమ్స్ కోసం కోస్మోస్ DB స్టేట్ మేనేజ్మెంట్
  - ఏజెంట్ పరస్పర సంబంధాలను చూపించే 6 మெர్మైడ్ డయాగ్రామ్‌లు
  - 3 ప్రగాఢ వ్యాయామాలు (టైమ్‌ఔట్ హ్యాండ్లింగ్, రీట్రై లాజిక్, సర్క్యూట్ బ్రేకర్)
  - ఖర్చు వివరాల (240-565 డాలర్లు/నెల) మరియు మెరుగుదల వ్యూహాలు
  - మానిటరింగ్ కోసం అప్లికేషన్ ఇన్స్‌లెయిట్స్ ఇంటిగ్రేషన్

#### మెరుగుపరచబడింది
- **ప్రీ-నియామక అధ్యాయము**: ఇప్పుడు సమగ్ర మానిటరింగ్ మరియు సమన్వయ నమూనాలను కలిగి ఉంది
- **ప్రారంభ అధ్యాయము**: ప్రొఫెషనల్ ప్రమాణీకరణ నమూనాలతో మెరుగుపరచబడింది
- **ఉత్పత్తి సిద్ధత**: సెక్యూరిటీ నుండి ఆబ్జర్వబిలిటీ వరకు పూర్తి కవరేజ్
- **కోర్సు అవుట్‌లైన్**: అధ్యాయాలు 3 మరియు 6లో కొత్త పాఠాలు సూచించబడ్డాయి

#### మార్చబడింది
- **అభ్యాస పురోగతి**: సెక్యూరిటీ మరియు మానిటరింగ్ యొక్క సమగ్ర సమన్వయం
- **డాక్యుమెంటేషన్ నాణ్యత**: కొత్త పాఠాలలో కConsistent A-గ్రేడ్ ప్రమాణాలు (95-97%)
- **ఉత్పత్తి నమూనాలు**: సంస్థ నియామకాల పూర్తి పరిధి

#### మెరుగుపరచబడింది
- **డెవలపర్ అనుభవం**: అభివృద్ధి నుండి ఉత్పత్తి మానిటరింగ్ వరకు స్పష్టమైన మార్గం
- **సెక్యూరిటీ ప్రమాణాలు**: ప్రమాణీకరణ మరియు రహస్యాల నిర్వహణలో ప్రొఫెషనల్ నమూనాలు
- **ఆబ్జర్వబిలిటీ**: AZD తో పూర్తి అప్లికేషన్ ఇన్స్‌లెయిట్స్ ఇంటిగ్రేషన్
- **AI పనితీరులు**: Microsoft Foundry Models మరియు మల్టీ-ఏజెంట్ సిస్టమ్స్ కోసం ప్రత్యేక మానిటరింగ్

#### ధృవీకరించబడింది
- ✅ అన్ని పాఠాలు పూర్తి పని చేసే కోడ్ (స్నిపెట్లు కాదు) కలిగి ఉన్నాయి
- ✅ దృశ్య అభ్యాసం కోసం 19 మొత్తం మெர్మైడ్ డయాగ్రామ్‌లు మూడు పాఠాలలో
- ✅ ధృవీకరణ దశలతో 9 హ్యాండ్స్-ఆన్ వ్యాయామాలు
- ✅ `azd up` ద్వారా డిప్లొయ్ చేయగల ఉత్పత్తి-సిద్ధమైన Bicep టెంప్లేట్లు
- ✅ ఖర్చు విశ్లేషణ మరియు మెరుగుదల వ్యూహాలు
- ✅ పరిష్కార మార్గదర్శకాలు మరియు ఉత్తమ ఆచారాలు
- ✅ పరిజ్ఞాన పరీక్షలు మరియు ధృవీకరణ కమాండ్లు

#### డాక్యుమెంటేషన్ గ్రేడ్ ఫలితాలు
- **docs/pre-deployment/application-insights.md**: - సమగ్ర మానిటరింగ్ గైడ్
- **docs/getting-started/authsecurity.md**: - ప్రొఫెషనల్ సెక్యూరిటీ నమూనాలు
- **docs/pre-deployment/coordination-patterns.md**: - ఆధునిక మల్టీ-ఏజెంట్ ఆర్కిటెక్చర్స్
- **మొత్తం కొత్త విషయం**: - సతతమైన ఉన్నత నాణ్యత ప్రమాణాలు

#### సాంకేతిక అమలు
- **అప్లికేషన్ ఇన్స్‌లెయిట్స్**: లాగ్ విశ్లేషణ + కస్టమ్ టెలిమేట్రీ + పంపిణీ చేసిన ట్రేసింగ్
- **ప్రమాణీకరణ**: మేనేజ్‌డ్ ఐడెంటిటీ + కీ వాల్ట్ + RBAC నమూనాలు
- **మల్టీ-ఏజెంట్**: సర్వీస్ బస్ + కోస్మోస్ DB + కంటెయినర్ యాప్లస్ + ఆర్కెస్ట్రేషన్
- **మానిటరింగ్**: ప్రత్యక్ష మ్యాట్రిక్స్ + కుస్తో క్వెరీలు + అలెర్ట్లు + డాష్‌బోర్డ్లు
- **ఖర్చు నిర్వహణ**: సాంప్లింగ్ వ్యూహాలు, రిటెన్షన్ విధానాలు, బడ్జెట్ నియంత్రణలు

### [v3.7.0] - 2025-11-19

#### డాక్యుమెంటేషన్ నాణ్యత మెరుగుదలలు మరియు కొత్త Microsoft Foundry Models ఉదాహరణ
**ఈ సంస్కరణ రిపాజిటరీలో డాక్యుమెంటేషన్ నాణ్యతను మెరుగుపరిచింది మరియు gpt-4.1 చాట్ ఇంటర్‌ఫేస్ తో Microsoft Foundry Models పూర్తి నిర్వాహణ ఉదాహరణను జోడించింది.**

#### జోడించబడింది
- **🤖 Microsoft Foundry Models చాట్ ఉదాహరణ**: `examples/azure-openai-chat/` లో పూర్తి gpt-4.1 డిప్లొయ్ మెంట్ ప్రక్రియ:
  - పూర్తి Microsoft Foundry Models మౌలిక సదుపాయాలు (gpt-4.1 మోడల్ డిప్లొయ్ మెంట్)
  - సంభాషణ చరిత్రతో Python కమాండ్-లైన్ చాట్ ఇంటర్‌ఫేస్
  - API కీల జరిగేలా కీ వాల్ట్ ఇంటిగ్రేషన్
  - టోకెన్ వినియోగం ట్రాకింగ్ మరియు ఖర్చు అంచనా
  - రేటు పరిమితి మరియు లోపాల నిర్వహణ
  - 35-45 నిమిషాల డిప్లొయ్ గైడ్ గల సమగ్ర README
  - 11 ఉత్పత్తి-సిద్ధమైన ఫైళ్ళు (Bicep టెంప్లేట్లు, Python యాప్, కాన్ఫిగరేషన్)
- **📚 డాక్యుమెంటేషన్ వ్యాయామాలు**: కాన్ఫిగరేషన్ గైడ్‌లో హ్యాండ్స్-ఆన్ ప్రాక్టీస్ వ్యాయామాలు జోడించబడ్డాయి:
  - వ్యాయామం 1: బహుముఖ వాతావరణ కాన్ఫిగరేషన్ (15 నిమిషాలు)
  - వ్యాయామం 2: రహస్యాల నిర్వహణ సాధన (10 నిమిషాలు)
  - స్పష్టమైన విజయ ప్రమాణాలు మరియు ధృవీకరణ దశలు
- **✅ నియామకం ధృవీకరణ**: నియామక గైడ్‌లో ధృవీకరణ విభాగం జోడించబడింది:
  - ఆరోగ్య తనిఖీ విధానాలు
  - విజయ ప్రమాణాల జాబితా
  - అన్ని నియామక కమాండ్ల కోసం అంచనా ఫలితాలు
  - పరిష్కార సందేశ త్వరిత సూచనలు

#### మెరుగుపరచబడింది
- **examples/README.md**: A-గ్రేడ్ నాణ్యతకు నవీకరించబడింది (93%):
  -azure-openai-chatని అన్ని సంబంధిత విభాగాలలో చేర్చబడింది
  - లోకల్ ఉదాహరణల సంఖ్య 3 నుండి 4కి పెరిగింది
  - AI అప్లికేషన్ ఉదాహరణల పట్టికలో చేర్చబడింది
  - మద్యవర్తి వినియోగదారుల కోసం త్వరిత ప్రారంభంలో తెలుగు అన్వయించబడింది
  - Microsoft Foundry టెంప్లేట్ల విభాగంలో జోడించబడింది
  - సరసమైన గణాంకపట్టిక మరియు సాంకేతిక అన్వేషణ విభాగాలు నవీకరించబడ్డాయి
- **డాక్యుమెంటేషన్ నాణ్యత**: docs ఫొల్డర్‌లో B+ (87%) నుండి A- (92%)లో మెరుగుదల  

  - కీలక కమాండ్ ఉదాహరణలకు అంచనా ఫలితాలు జోడించబడ్డాయి
  - కాన్ఫిగరేషన్ మార్పుల కోసం ధృవపరిచే చర్యలు చేర్చబడ్డాయి
  - ప్రాక్టికల్ వ్యాయామాలతో హ్యాండ్స్-ఆన్ నేర్చుకోవడం అభివృద్ధి చెందింది

#### మార్చబడింది
- **లెర్నింగ్ ప్రోగ్రెషన్**: మధ్యస్థ స్థాయి అభ్యాసకులు కోసం AI ఉదాహరణల మెరుగైన సమగ్రత
- **డాక్యుమెంటేషన్ నిర్మాణం**: నిర్దిష్ట ఫలితాలతో మరిన్ని ఆచరణీయ వ్యాయామాలు
- **ధృవీకరణ ప్రక్రియ**: ముఖ్యమైన వర్క్‌ఫ్లోలకు స్పష్టమైన విజయ ప్రమాణాలు జోడించబడ్డాయి

#### మెరుగుపరచబడింది
- **డెవలపర్ అనుభవం**: Microsoft Foundry Models అమరిక ఇప్పుడు 35-45 నిమిషాలు పడుతుంది (కంప్లెక్స్ ప్రత్యామ్నాయాలకంటే 60-90 నిమిషాలు)
- **ఖర్చు పారదర్శకత**: Microsoft Foundry Models ఉదాహరణకు క్లియర్ ఖర్చు అంచనాలు ($50-200/నెల)
- **లెర్నింగ్ పాథ్**: AI డెవలపర్స్‌కు azure-openai-chat‌తో స్పష్టమైన ప్రవేశ బిందువు
- **డాక్యుమెంటేషన్ ప్రమాణాలు**: సుసంగతమైన అంచనా ఫలితాలు మరియు ధృవీకరణ చర్యలు

#### ధృవీకరించబడింది
- ✅ Microsoft Foundry Models ఉదాహరణ పూర్తిగా `azd up` తో పనిచేస్తోంది
- ✅ 11 అమలు ఫైళ్లు అన్ని వ్యాకరణ పరంగా సరైనవి
- ✅ README సూచనలు వాస్తవ అమరణ అనుభవంతో సరిపోతున్నాయి
- ✅ 8+ స్థానాలలో డాక్యుమెంటేషన్ లింకులు నవీకరించబడ్డాయి
- ✅ ఉదాహరణల సూచిక 4 స్థానిక ఉదాహరణలను ఖచ్చితంగా పరిగణలోకి తీసుకుంటుంది
- ✅ పట్టికలలో ఏ ఇతర లింకుల మళ్లీ పునరావృతం లేదు
- ✅ అన్ని నావిగేషన్ సూచనలు సరైనవి

#### సాంకేతిక అమలు
- **Microsoft Foundry Models వాస్తుదర్శనం**: gpt-4.1 + కీ వాల్ట్ + కంటైనర్ యాప్స్ నమూనా
- **సెక్యూరిటీ**: మేనేజ్డ్ ఐడెంటిటీ సిద్ధం, రహస్యాలు కీ వాల్ట్ లో
- **నిరీక్షణ**: అప్లికేషన్ ఇన్సైట్స్ సమాకరణ
- **ఖర్చు నిర్వహణ**: టోకెన్ ట్రాకింగ్ మరియు వాడక ఆప్టిమైజేషన్
- **అమరిక**: పూర్తి సెటప్ కోసం ఒక్కటి `azd up` కమాండ్

### [v3.6.0] - 2025-11-19

#### ప్రధాన నవీకరణ: కంటైనర్ యాప్ అమరికా ఉదాహరణలు
**ఈ వర్షన్ Azure Developer CLI (AZD) ఉపయోగించి సమగ్ర, ప్రొడక్షన్-సిద్ధ కంటైనర్ అప్లికేషన్ అమరిక ఉదాహరణలను పరిచయం చేస్తుంది, పూర్తి డాక్యుమెంటేషన్ మరియు లెర్నింగ్ పథంలో సమగ్రమైన సమన్వయం తో.**

#### జోడించబడింది
- **🚀 కంటైనర్ యాప్ ఉదాహరణలు**: `examples/container-app/` లో కొత్త స్థానిక ఉదాహరణలు:
  - [మాస్టర్ గైడ్](examples/container-app/README.md): కంటైనరైజ్డ్ అమరికల పూర్తి అవలోకనం, తక్షణ ప్రారంభం, ప్రొడక్షన్, మరియు పురోగతి నమూనాలు
  - [సింపుల్ ఫ్లాస్క్ API](../../examples/container-app/simple-flask-api): మొదటి అడుగు REST API స్కేల్-టు-జీరో, హెల్త్ ప్రోబ్‌లు, నిరీక్షణ, మరియు ట్రబుల్‌షూటింగ్ తో
  - [మైక్రోసర్వీసెస్ వాస్తుదర్శనం](../../examples/container-app/microservices): ప్రొడక్షన్ సిద్ధ బహు-సేవా అమరిక (API గేట్‌వే, ప్రొడక్ట్, ఆర్డర్, యూజర్, నోటిఫికేషన్), అసింక్ మెసేజింగ్, సర్వీస్ బస్, కోస్మాస్ DB, Azure SQL, పంపిణీ ట్రేసింగ్, బ్లూ-గ్రీన్/కెనరీ అమరిక
- **ఉత్తమ అభ్యాసాలు**: సెక్యూరిటీ, నిరీక్షణ, ఖర్చు ఆప్టిమైజేషన్, మరియు CI/CD మార్గనిర్దేశం కంటైనరైజ్డ్ వర్క్‌లోడ్ల కోసం
- **కోడ్ నమూనాలు**: పూర్తి `azure.yaml`, బీసెప్ టెంప్లేట్లు, మరియు బహుభాష సేవా అమలు (Python, Node.js, C#, Go)
- **పర్యవేక్షణ & ట్రబుల్‌షూటింగ్**: ముగింపుకు ముగింపు టెస్ట్ సన్నివేశాలు, నిరీక్షణ కమాండ్లు, ట్రబుల్‌షూటింగ్ మార్గనిర్దేశం

#### మార్చబడింది
- **README.md**: ఫీచర్ చేయడం మరియు "స్థానిక ఉదాహరణలు - కంటైనర్ అప్లికేషన్లు" క్రింద కొత్త కంటైనర్ యాప్ ఉదాహరణలకు లింకు అప్డేట్ చేయడం
- **examples/README.md**: కంటైనర్ యాప్ ఉదాహరణలను హైలైట్ చేయడం, సరిపోలింపు మ్యాట్రిక్స్ ఎంట్రీలు జోడించడం, మరియు సాంకేతికత/వాస్తుదర్శన సూచనలు నవీకరించడం
- **కోర్సు అవుట్‌లైన్ & స్టడీ గైడ్**: సంబంధిత అధ్యాయాలలో కొత్త కంటైనర్ యాప్ ఉదాహరణలు మరియు అమరిక నమూనాలను సూచించడం

#### ధృవీకరించబడింది
- ✅ అన్ని కొత్త ఉదాహరణలు `azd up` తో అమర్చదగినవి మరియు ఉత్తమ అభ్యాసాలను అనుసరిస్తున్నాయి
- ✅ డాక్యుమెంటేషన్ క్రాస్-లింకులు మరియు నావిగేషన్ నవీకరించబడ్డాయి
- ✅ ఉదాహరణలు మొదటి పటి నుండి పురోగతి దశ వరకు సన్నివేశాలను కవర్ చేస్తాయి, ప్రొడక్షన్ మైక్రోసర్వీసులతో సహా

#### గమనికలు
- **వ్యాప్తి**: ఇంగ్లీష్ డాక్యుమెంటేషన్ మరియు ఉదాహరణలకే పరిమితం
- **తదుపరి దశలు**: భవిష్యత్ విడుదలల్లో మరిన్ని అభివృద్ధి కంటైనర్ నమూనాలు మరియు CI/CD ఆటోమేషన్ విస్తరించబడనుంటాయి

### [v3.5.0] - 2025-11-19

#### ఉత్పత్తి పేరు రీబ్రాండింగ్: Microsoft Foundry
**ఈ వర్షన్ "Microsoft Foundry" నుండి "Microsoft Foundry" అనే పేరును అన్ని ఇంగ్లీష్ డాక్యుమెంటేషన్లలో సమగ్రమైనగా మార్చుతుంది, మైక్రోసాఫ్ట్ అధికారిక రీబ్రాండింగ్ ప్రతిబింబంగా ఉంటుంది.**

#### మార్చబడింది
- **🔄 ఉత్పత్తి పేరు నవీకరణ**: "Microsoft Foundry" నుండి "Microsoft Foundry"కి పూర్తిగా రీబ్రాండింగ్
  - `docs/` ఫోల్డర్ లోని అన్ని ఇంగ్లీష్ డాక్యుమెంటేషన్ల సూచనలు నవీకరించబడ్డాయి
  - ఫోల్డర్ పేరు మార్చబడింది: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ఫైల్ పేరు మార్చబడింది: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - మొత్తం: 7 డాక్యుమెంటేషన్ ఫైళ్లలో 23 కంటెంట్ సూచనలు నవీకరించబడ్డాయి

- **📁 ఫోల్డర్ నిర్మాణ మార్పులు**:
  - `docs/ai-foundry/` పేరును `docs/microsoft-foundry/`గా మార్చబడింది
  - కొత్త ఫోల్డర్ నిర్మాణాన్ని ప్రతిబింబిస్తూ అన్ని క్రాస్-రిఫరెన్సులు నవీకరించబడ్డాయి
  - అన్ని డాక్యుమెంటేషన్‌లో నావిగేషన్ లింకులు ధృవీకరించబడ్డాయి

- **📄 ఫైల్ పేర్ల మార్పులు**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - అంతర్గత అన్ని లింకులు కొత్త ఫైల్ పేరును సూచించగా నవీకరించబడ్డాయి

#### నవీకరించిన ఫైళ్లు
- **ఛాప్టర్ డాక్యుమెంటేషన్** (7 ఫైళ్లు):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 నావిగేషన్ లింకుల అప్డేట్
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ఉత్పత్తి పేరు సూచనలు మార్చబడ్డాయి
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ఇప్పటికే Microsoft Foundry ఉపయోగిస్తోంది (మునుపటి నవీకరణలు నుండి)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 సూచనలు అప్డేట్ (అవలోకనం, కమ్యూనిటీ ఫీడ్‌బ్యాక్, డాక్యుమెంటేషన్)
  - `docs/getting-started/azd-basics.md` - 4 క్రాస్-రిఫరెన్స్ లింకు నవీకరణలు
  - `docs/getting-started/first-project.md` - 2 అధ్యాయ నావిగేషన్ లింకులు నవీకరించబడ్డాయి
  - `docs/getting-started/installation.md` - 2 నెక్స్ట్ ఛాప్టర్ లింకులు నవీకరించబడ్డాయి
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 సూచనలు (నావిగేషన్, Discord కమ్యూనిటీ) నవీకరించబడ్డాయి
  - `docs/troubleshooting/common-issues.md` - 1 నావిగేషన్ లింకు నవీకరించబడింది
  - `docs/troubleshooting/debugging.md` - 1 నావిగేషన్ లింకు నవీకరించబడింది

- **కోర్సు నిర్మాణ ఫైళ్లు** (2 ఫైళ్లు):
  - `README.md` - 17 సూచనల అప్డేట్ (కోర్స్ అవలోకనం, అధ్యాయ శీర్షికలు, టెంప్లేట్స్ విభాగం, కమ్యూనిటీ ఇన్సైట్స్)
  - `course-outline.md` - 14 సూచనలు నవీకరించబడ్డాయి (అవలోకనం, విద్యా లక్ష్యాలు, అధ్యాయ వనరులు)

#### ధృవీకరించబడింది
- ✅ ఇంగ్లీష్ డాక్స్ లో "ai-foundry" ఫోల్డర్ మార్గ సూచనలు లేకపోవటం
- ✅ ఇంగ్లీష్ డాక్స్ లో "Microsoft Foundry" ఉత్పత్తి పేరు సూచనలు మిగిలి లేవు
- ✅ కొత్త ఫోల్డర్ నిర్మాణంతో అన్ని నావిగేషన్ లింకులు పనిచేస్తున్నాయి
- ✅ ఫైల్ మరియు ఫోల్డర్ పేర్ల మార్పులు విజయవంతంగా పూర్తి
- ✅ అధ్యాయాల మధ్య క్రాస్-రీఫరెన్సులు ధృవీకరించబడ్డాయి

#### గమనికలు
- **వ్యాప్తి**: `docs/` ఫోల్డర్‌లో ఇంగ్లీష్ డాక్యుమెంటేషన్‌కు మాత్రమే మార్పులు వర్తింపజేయబడినవి
- **అనువాదాలు**: ఈ వర్షన్లో అనువాద ఫోల్డర్స్ (`translations/`) నవీకరణలు చేయబడలేదని
- **వర్క్‌షాప్**: వర్క్‌షాప్ మెటీరియల్స్ (`workshop/`) ఈ వర్షన్లో నవీకరించబడలేదు
- **ఉదాహరణలు**: ఉదాహరణ ఫైళ్లు ఇంకా పాత పేర్లను సూచించవచ్చు (భవిష్యత్ నవీకరణలో పరిష్కరించబడును)
- **బాహ్య లింకులు**: బాహ్య URLలు మరియు GitHub రిపాజిటరీ సూచనలు మార్పు లేకుండా ఉన్నాయి

#### సహకారుల కోసం మార్పిడి మార్గదర్శిని
మీ దగ్గర స్థానిక బ్రాంచ్లు లేదా పాత నిర్మాణం సూచించే డాక్యుమెంటేషన్ ఉంటే:
1. ఫోల్డర్ సూచనలు నవీకరించండి: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ఫైల్ సూచనలు నవీకరించండి: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. ఉత్పత్తి పేరు మార్చండి: "Microsoft Foundry" → "Microsoft Foundry"
4. అంతర్గత డాక్యుమెంటేషన్ లింకులు పనిచేస్తున్నాయో ధృవీకరించండి

---

### [v3.4.0] - 2025-10-24

#### ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ మరియు ధృవీకరణ అభివృద్ధులు
**ఈ వర్షన్ కొత్త Azure Developer CLI ప్రివ్యూ ఫీచర్‌కు సమగ్ర మద్దతు ఇస్తుంది మరియు వర్క్‌షాప్ వినియోగదారు అనుభవం మెరుగుపరుస్తుంది.**

#### జోడించబడింది
- **🧪 azd provision --preview ఫీచర్ డాక్యుమెంటేషన్**: కొత్త ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ సామర్థ్యం యొక్క సమగ్ర కవరేజ్
  - చిట్కా షీట్‌లో కమాండ్ సూచన మరియు వాడుక ఉదాహరణలు
  - వినియోగాలు మరియు లాభాలతో ప్రొవిజనింగ్ గైడ్ లో సవివర సమైక్యం
  - సురక్షిత అమరిక ధృవీకరణ కోసం ప్రీ-ఫ్లైట్ చెక్ సమైక్యం
  - సురక్షత-ప్రథమ అమరిక ప్రాక్టీసులతో ప్రారంభ మార్గదర్శిని నవీకరణలు
- **🚧 వర్క్‌షాప్ స్టేటస్ బ్యానర్**: వర్క్‌షాప్ అభివృద్ధి స్థితిని సూచించే ప్రొఫెషనల్ HTML బ్యానర్
  - గ్రేడియెంట్ డిజైన్ తో నిర్మాణ సూచనలు స్పష్టమైన వినియోగదారు కమ్యూనికేషన్ కోసం
  - పారదర్శకత్వం కోసం చివరి నవీకరణ సమయం
  - అన్ని పరికరాల కోసం మొబైల్ స్పందనీయ డిజైన్

#### అభివృద్ధి
- **ఇన్ఫ్రాస్ట్రక్చర్ సేఫ్టీ**: ప్రివ్యూ సామర్థ్యం అమరిక డాక్యుమెంటేషన్ అంతటా సమైక్యం
- **అమరిక ముందస్తు ధృవీకరణ**: ఆటోమేటెడ్ స్క్రిప్ట్లు ఇప్పుడు ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ పరీక్షలతో కలిపి ఉన్నాయి
- **డెవలపర్ వర్క్‌ఫ్లో**: బాగువారుగా ప్రివ్యూ ను ఉత్తమ ప్రాక్టీసులో చేర్చడం కోసం కమాండ్ వరుసలు నవీకరణ
- **వర్క్‌షాప్ అనుభవం**: అభివృద్ధి స్థితి గురించి వినియోగదారులకు స్పష్టమైన అంచనాలు

#### మార్చబడింది
- **అమరిక ఉత్తమ అభ్యాసాలు**: ప్రివ్యూ-ప్రథమ వర్క్‌ఫ్లో ఇప్పుడు సిఫార్సు కాని విధానం
- **డాక్యుమెంటేషన్ మార్గం**: ఇన్ఫ్రాస్ట్రక్చర్ ధృవీకరణను నేర్చుకునే ప్రక్రియలో ముందుగా వదిలివేత
- **వర్క్‌షాప్ ప్రదర్శన**: స్పష్టమైన అభివృద్ధి సమయరేఖతో ప్రొఫెషనల్ స్థితి కమ్యూనికేషన్

#### మెరుగుపరచబడింది
- **సేఫ్టీ-ప్రథమ దృష్టికోణం**: అమరికకు ముందు ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ధృవీకరించవచ్చు
- **జట్టు సహకారం**: సమీక్ష మరియు ఆమోదానికి ప్రివ్యూ ఫలితాలను పంచుకోవచ్చు
- **ఖర్చు అవగాహన**: ప్రొవిజనింగ్ ముందు వనరుల ఖర్చు గురించి మెరుగైన అవగాహన
- **ప్రమాద నివృత్తి**: ముందస్తు ధృవీకరణ ద్వారా అమరిక వైఫల్యాలు తక్కువ

#### సాంకేతిక అమలు
- **బహుళ డాక్యుమెంట్ సమైక్యం**: ప్రివ్యూ ఫీచర్ 4 ముఖ్య ఫైళ్లలో డాక్యుమెంటేషన్
- **కమాండ్ నమూనాలు**: అన్ని డాక్యుమెంటేషన్‌లో సुसంగత సింటాక్స్ మరియు ఉదాహరణలు
- **ఉత్తమ అభ్యాస సమైక్యం**: ధృవీకరణ వర్క్‌ఫ్లోలు మరియు స్క్రిప్ట్‌లలో ప్రివ్యూ చేర్చబడింది
- **దృష్టి సూచికలు**: కొత్త ఫీచర్లకు స్పష్టమైన మార్కింగ్స్

#### వర్క్‌షాప్ ఇన్ఫ్రాస్ట్రక్చర్
- **స్థితి కమ్యూనికేషన్**: గ్రేడియెంట్ స్టైలింగ్ ఉన్న ప్రొఫెషనల్ HTML బ్యానర్
- **వినియోగదారుని అనుభవం**: స్పష్టమైన అభివృద్ధి స్థితి గందరగోళం నివారిస్తుంది
- **ప్రొఫెషనల్ ప్రదర్శన**: రిపాజిటరీ విశ్వసనీయతను కాపాడుతూ అంచనాలు సెట్ చేస్తుంది
- **టైంలైన్ పారదర్శకత**: అక్టోబర్ 2025 చివరి నవీకరణ సమయం బాధ్యతాయుతత కోసం

### [v3.3.0] - 2025-09-24

#### మెరుగైన వర్క్‌షాప్ మెటీరియల్స్ మరియు ఇంటరాక్టివ్ లెర్నింగ్ అనుభవం
**ఈ వర్షన్ బ్రౌజర్ ఆధారిత ఇంటరాక్టివ్ గైడ్లతో మరియు నిర్మిత విద్యా మార్గాలతో సమగ్ర వర్క్‌షాప్ మెటీరియల్స్‌ను పరిచయం చేస్తుంది.**

#### జోడించబడింది
- **🎥 ఇంటరాక్టివ్ వర్క్‌షాప్ గైడ్**: MkDocs ప్రివ్యూ సామర్థ్యంతో బ్రౌజర్ ఆధారిత వర్క్‌షాప్ అనుభవం
- **📝 నిర్మిత వర్క్‌షాప్ సూచనాలు**: డిస్కవరీ నుండి కస్టమైజేషన్ వరకు 7-దశల మార్గదర్శక విద్యా మార్గం
  - 0-పరిచయం: వర్క్‌షాప్ అవలోకనం మరియు సెటప్
  - 1-AI టెంప్లేట్ను ఎంచుకోవడం: టెంప్లేట్ డిస్కవరీ మరియు ఎంపిక ప్రక్రియ
  - 2-AI టెంప్లేట్ ధృవీకరణ: అమరిక మరియు ధృవీకరణ విధానాలు
  - 3-AI టెంప్లేట్ విడగొడతాం: టెంప్లేట్ వాస్తుదర్శనాన్ని అర్ధం చేసుకోవడం
  - 4-AI టెంప్లేట్ సర్దుబాటు: కాన్ఫిగరేషన్ మరియు కస్టమైజేషన్
  - 5-AI టెంప్లేట్ అనుకూలీకరణ: అభివృద్ధి చేసిన మార్పులు మరియు పునరావృతాలు
  - 6-ఇన్ఫ్రాస్ట్రక్చర్ తుడిచివేత: క్లీనప్ మరియు వనరు నిర్వహణ
  - 7-సంక్షిప్తం: సారాంశం మరియు తదుపరి దశలు
- **🛠️ వర్క్‌షాప్ టూలింగ్**: మెటీరియల్ థీమ్‌తో MkDocs కాన్ఫిగరేషన్ మెరుగైన విద్యా అనుభవం కోసం
- **🎯 హ్యాండ్స్-ఆన్ లెర్నింగ్ పాథ్**: 3-దశల విధానం (డిస్కవరీ → అమరిక → కస్టమైజేషన్)
- **📱 GitHub కోడ్స్‌పేస్‌ల సమైక్యం**: అంతరించారు లేదు అభివృద్ధి వాతావరణం ఏర్పాటు

#### అభివృద్ధి
- **AI వర్క్‌షాప్ ల్యాబ్**: సమగ్ర 2-3 గంటల నిర్మిత శ్రేణి లెర్నింగ్ అనుభవంతో విస్తరింపబడింది
- **వర్క్‌షాప్ డాక్యుమెంటేషన్**: నావిగేషన్ మరియు దృష్టి సహాయాలతో ప్రొఫెషనల్ ప్రదర్శన
- **లెర్నింగ్ ప్రోగ్రెషన్**: టెంప్లేట్ ఎంపిక నుండి ప్రొడక్షన్ అమరిక వరకు స్పష్టమైన దశల వారీ మార్గదర్శనం
- **డెవలపర్ అనుభవం**: సమగ్రమైన ఉద్యోగ ప్రవాహాల కోసం సమైకృత టూలింగ్

#### మెరుగుపరచబడింది
- **అాక్సెస్‌బిలిటీ**: సెర్చ్, కాపీ ఫంక్షనాలిటీ, మరియు థీమ్ టోగుల్ ఉన్న బ్రౌజర్-ఆధారిత ఇంటర్ఫేస్
- **స్వీయ-అవధి లెర్నింగ్**: విభిన్న నేర్చుకునే వేగాలకు అనుకూలమైన వర్క్‌షాప్ నిర్మాణం
- **ప్రాయోగిక అప్లికేషన్**: వాస్తవ ప్రపంచ AI టెంప్లేట్ అమరిక సన్నివేశాలు
- **కమ్యూనిటీ సమైక్యం**: వర్క్‌షాప్ మద్దతు మరియు సహకారానికి Discord సమైక్యం

#### వర్క్‌షాప్ ఫీచర్లు
- **అంతర్లీన సెర్చ్**: వేగవంతమైన కీవర్డ్ మరియు పాఠం కనుగొనడం
- **కోడ్ బ్లాక్‌ల కాపీ**: అంతులేని కోడ్ ఉదాహరణలకు హోవర్ చేసి కాపీ చేయటం
- **థీమ్ టోగుల్**: వివిధ ఇష్టాలకు డార్క్/లైట్ మోడ్ మద్దతు
- **దృష్టి ఆస్తులు**: మెరుగైన అవగాహన కోసం స్క్రీన్‌షాట్లు మరియు చిత్రాలు
- **సహాయం సమైక్యం**: కమ్యూనిటీ మద్దతు కోసం నేరుగా Discord యాక్సెస్

### [v3.2.0] - 2025-09-17

#### ప్రధాన నావిగేషన్ పునఃనిర్మాణం మరియు అధ్యాయాల ఆధారిత విద్యా వ్యవస్థ
**ఈ వర్షన్ అంతా రిపాజిటరీ అంతటా మెరుగైన నావిగేషన్ తో సమగ్ర అధ్యాయాల ఆధారిత విద్యా నిర్మాణాన్ని పరిచయం చేస్తుంది.**

#### జోడించబడింది
- **📚 అధ్యాయాల ఆధారిత లెర్నింగ్ వ్యవస్థ**: పూర్తి కోర్సును 8 ప్రగతిశీల అధ్యాయాలుగా సమీకృతం చేయడం
  - అధ్యాయము 1: మౌలికం & తక్షణ ప్రారంభం (⭐ - 30-45 నిమిషాలు)
  - అధ్యాయము 2: AI-మొదటి అభివృద్ధి (⭐⭐ - 1-2 గంటలు)
  - అధ్యాయము 3: కాన్ఫిగరేషన్ & ధృవీకరణ (⭐⭐ - 45-60 నిమిషాలు)
  - అధ్యాయము 4: కోడ్ & అమరిక (⭐⭐⭐ - 1-1.5 గంటలు)
  - అధ్యాయము 5: బహు-ఏజెంట్ AI పరిష్కారాలు (⭐⭐⭐⭐ - 2-3 గంటలు)
  - అధ్యాయము 6: అమరిక ముందు ధృవీకరణ & ప్రణాళిక (⭐⭐ - 1 గంట)
  - అధ్యాయము 7: సమస్యల పరిష్కారం & డీబగ్గింగ్ (⭐⭐ - 1-1.5 గంటలు)
  - అధ్యాయము 8: ప్రొడక్షన్ & ఎంటర్‌ప్రైజ్ నమూనాలు (⭐⭐⭐⭐ - 2-3 గంటలు)
- **📚 సమగ్ర నావిగేషన్ వ్యవస్థ**: అన్ని డాక్యుమెంటేషన్‌లో సుస్థిరమైన నావిగేషన్ హెడ్డర్లు మరియు ఫుటర్స్
- **🎯 పురోగతి ట్రాకింగ్**: కోర్సు పూర్తిచేసే తనిఖీ పట్టిక మరియు నేర్చుకున్న ధృవీకరణ వ్యవస్థ
- **🗺️ లెర్నింగ్ పాథ్ గైడెన్స్**: అనుభవాలు మరియు లక్ష్యాలకు స్పష్టమైన ప్రవేశ బిందువులు
- **🔗 క్రాస్-రెఫరెన్స్ నావిగేషన్**: సంబంధిత అధ్యాయాలు మరియు ముందస్తులూ స్పష్టంగా లింకు చేయబడ్డాయి

#### అభివృద్ధి
- **README నిర్మాణం**: అధ్యాయాల ఆధారంగా క్రమబద్ధీకరింపబడిన లెర్నింగ్ ప్లాట్‌ఫాం గా మార్పు
- **డాక్యుమెంటేషన్ నావిగేషన్**: ప్రతి పేజీ ఇప్పటికే అధ్యాయ సందర్భం మరియు పురోగతి మార్గదర్శకాలను కలిగి ఉంది
- **టెంప్లేట్ అమరిక**: ఉదాహరణలు మరియు టెంప్లేట్లు అనుకూల అధ్యాయాలకు మ్యాపింగ్

- **వనరు సమన్వయం**: cheat షీట్స్, తరచుగా అడగబడే ప్రశ్నలు, మరియు అధ్యాయాలకు సంబంధించి అధ్యయన మార్గదర్శకాలు
- **వరకల వర్క్షాప్ సమన్వయం**: అనేక అధ్యాయాల అభ్యాస లక్ష్యాలకు మ్యాప్ చేసిన ప్రాక్టికల్ ల్యాబ్‌లు

#### మార్చబడింది
- **అభ్యాస పురోగతి**: లినియర్ డాక్యుమెంటేషన్ నుండి ఫ్లెక్సిబుల్ అధ్యాయ-ఆధారిత అభ్యాస దిశగా మార్పు
- **రూపకల్పన అమరిక స్థానం**: మెరుగైన అభ్యాస ప్రవాహం కోసం కన్ఫిగరేషన్ గైడ్ ను అధ్యాయము 3 గా మార్చబడింది
- **เอไอ కంటెంట్ సమన్వయం**: అభ్యాస గమ్యం అంతటా AI-ప్రత్యేక కంటెంట్ మెరుగైన సమన్వయం
- **ఉత్పత్తి కంటెంట్**: ఆధునిక నమూనాలు అధ్యాయము 8 లో ఎంటర్ప్రైజ్ అభ్యాసకుల కోసం కేంద్రీకృతం

#### మెరుగుపరచింది
- **వాడుకరి అనుభవం**: స్పష్టమైన నావిగేషన్ బ్రెడ్క్రంబ్స్ మరియు అధ్యాయ పురోగతి సూచీలు
- **ఆక్సెసిబిలిటీ**: కోర్స్ ప్రయాణాన్ని సులభతరం చేసే స్థిరమైన నావిగేషన్ నమూనాలు
- **ప్రొఫెషనల్ ప్రస్తావన**: అకడమిక్ మరియు కార్పొరేట్ శిక్షణకు అనుకూలమైన విశ్వవిద్యాలయ శైలిలో కోర్స్ నిర్మాణం
- **అభ్యాస సామర్థ్యం**: మెరుగైన నిర్వహణ ద్వారా సంబంధిత కంటెంట్ కనుగొనడానికి సమయం తగ్గింపు

#### సాంకేతిక అమలు
- **నావిగేషన్ హెడర్లు**: 40+ డాక్యుమెంటేషన్ ఫైల్స్ అంతటా అధ్యాయ నావిగేషన్ ని ప్రామాణికపరిచింది
- **ఫుటర్ నావిగేషన్**: స్థిరమైన పురోగతి మార్గదర్శకాలు మరియు అధ్యాయ పూర్తి సూచీలు
- **క్రాస్-లింకింగ్**: సంబంధిత భావనలను కలిపే సమగ్ర అంతర్గత లింకింగ్ సిస్టమ్
- **అధ్యాయ మ్యాపింగ్**: అభ్యాస లక్ష్యాలకు స్పష్టంగా అనుసంధానించబడిన టెంప్లేట్స్ మరియు ఉదాహరణలు

#### అధ్యయన మార్గదర్శకం మెరుగుదల
- **📚 సమగ్ర అభ్యాస లక్ష్యాలు**: 8 అధ్యాయాల వ్యవస్థకు సరిపోయేలా అధ్యయన మార్గదర్శకాన్ని పునఃరూపకల్పన చేసినది
- **🎯 అధ్యాయ-ఆధారిత అంచనా**: ప్రతి అధ్యాయంలో ప్రత్యేక అభ్యాస లక్ష్యాలు మరియు ప్రాక్టికల్ వ్యాయామాలు ఉంటాయి
- **📋 పురోగతి ట్రాకింగ్**: మాపుకోదగిన ఫలితాలు మరియు పూర్తయ్యాయి జాబితాలతో వారాంత అభ్యాస షెడ్యూల్
- **❓ అంచనా ప్రశ్నలు**: ప్రతి అధ్యాయానికి సంకలిత జ్ఞాన నిర్ధారణ ప్రశ్నలు మరియు వృత్తిపరమైన ఫలితాలు
- **🛠️ ప్రాక్టికల్ వ్యాయామాలు**: వాస్తవ డిప్లాయ్‌మెంట్ పరిస్థితులు మరియు సమస్య పరిష్కారాలతో హ్యాండ్స్-ఆన్ కార్యకలాపాలు
- **📊 నైపుణ్య పురోగతి**: ప్రాథమిక భావనల నుండి ఎంటర్ప్రైజ్ నమూనాల వరకు స్పష్టమైన అభివృద్ధి, కెరీర్ అభివృద్ధి పై దృష్టి
- **🎓 సర్టిఫికేషన్ ఫ్రేమ్‌వర్క్**: వృత్తిపరమైన అభివృద్ధి ఫలితాలు మరియు సముదాయ గుర్తింపు వ్యవస్థ
- **⏱️ సమయ నిర్వహణ**: మేజర్ స్టోన్ ధృవీకరణతో 10 వారాల సరంజామా అభ్యాస అనుసరణ

### [v3.1.0] - 2025-09-17

#### మెరుగైన బహుళ-ఏజెంట్ AI పరిష్కారాలు
**ఈ వెర్షన్ బహుళ-ఏజెంట్ రీటైల్ పరిష్కారాన్ని మెరుగైన ఏజెంట్ పేరు మరియు మెరుగైన డాక్యుమెంటేషన్ తో అభివృద్ధి చేస్తుంది.**

#### మార్చబడింది
- **బహుళ-ఏజెంట్ ఆజ్ఞార్థం**: మరియూ క్లియర్ అవగాహనకు రీటైల్ బహుళ-ఏజెంట్ పరిష్కారంలో "Cora ఏజెంట్" స్థానంలో "Customer ఏజెంట్" ఉపయోగం
- **ఏజెంట్ నిర్మాణం**: అన్ని డాక్యుమెంటేషన్, ARM టెంప్లేట్స్ మరియు కోడ్ ఉదాహరణల్లో సజావుగా "Customer ఏజెంట్" పేరుతో నవీకరించారు
- **కాన్ఫిగరేషన్ ఉదాహరణలు**: కొత్త నామకరణ సూత్రాలతో ఏజెంట్ కాన్ఫిగరేషన్ నమూనాలను ఆధునీకరించారు
- **డాక్యుమెంటేషన్ సुसంపత్తి**: అన్ని తెలిపిన దిశగా వృత్తిపరమైన, వివరణాత్మక ఏజెంట్ పేర్లను ఉపయోగించినట్టు నిర్ధారించారు

#### మెరుగుపరచబడింది
- **ARM టెంప్లేట్ ప్యాకేజీ**: రీటైల్-బహుళఏజెంట్-ARM-టెంప్లేట్ ని Customer ఏజెంట్ సూచనలతో నవీకరించారు
- **నిర్మాణ చిత్రాలు**: Mermaid డయాగ్రామ్లను నవీకరించి ఏజెంట్ పేర్లను మార్చుకున్నారు
- **కోడ్ ఉదాహరణలు**: Python తరగతులు మరియు అమలు ఉదాహరణలు ఇప్పుడు CustomerAgent పేరుతో ఉపయోగిస్తున్నాయి
- **పరిసర మార్పులు**: CUSTOMER_AGENT_NAME నామకరణ సూత్రాలతో అన్ని డిప్లాయ్‌మెంట్ స్క్రిప్టులను నవీకరించారు

#### మెరుగుపరచింది
- **డెవలపర్ అనుభవం**: డాక్యుమెంటేషన్ లో ఏజెంట్ పాత్రలు మరియు బాధ్యతలను స్పష్టంగా చూపించారు
- **ఉత్పత్తి సిద్ధత**: ఎంటర్ప్రైజ్ నామకరణ సూత్రాలకు మెరుగైన అనుసరణ
- **అభ్యాస పదార్థాలు**: విద్యార్థులకు మరింత సులభమైన ఏజెంట్ పేర్ల చేయి
- **టెంప్లేట్ ఉపయోగకరణ**: ఏజెంట్ పనులు మరియు డిప్లాయ్‌మెంట్ నమూనాలను సులభతరం చేసిన వివరాలు

#### సాంకేతిక వివరాలు
- CustomerAgent సూచనలతో Mermaid నిర్మాణ చిత్రాల నవీకరణ
- Python ఉదాహరణల్లో CoraAgent తరగతిని CustomerAgent తో మార్చారు
- "customer" ఏజెంట్ రకంగా ARM టెంప్లేట్ JSON కాన్ఫిగరేషన్లను సవరించారు
- CORA_AGENT_* నుండి CUSTOMER_AGENT_* నమూనాలకు పరిసర మార్పులను నవీకరించారు
- అన్ని deployment కమాండ్లు మరియు కంటైనర్ కాన్ఫిగరేషన్లను రిఫ్రెష్ చేశారు

### [v3.0.0] - 2025-09-12

#### ప్రధాన మార్పులు - AI డెవలపర్ ఫోకస్ మరియు Microsoft Foundry సమన్వయం
**ఈ వెర్షన్ రిపోజిటరీని విస్తృతమైన AI-ఫోకస్ అభ్యాస వనరుగా మరియు Microsoft Foundry సమన్వయంతో మారుస్తుంది.**

#### జోడించినవి
- **🤖 AI-మొదటి అభ్యాస మార్గం**: AI డెవలపర్లు మరియు ఇంజనీర్లకు ప్రాధాన్యంతో పూర్తి పునఃరూపకల్పన
- **Microsoft Foundry సమన్వయ గైడ్**: AZD ను Microsoft Foundry సేవలతో జరగించడానికి సమగ్ర డాక్యుమెంటేషన్
- **AI మోడల్ డిప్లాయ్‌మెంట్ నమూనాలు**: మోడల్ ఎంపిక, కాన్ఫిగరేషన్, మరియు ఉత్పత్తి డిప్లాయ్‌మెంట్ వ్యూహాల గురించి పూర్తిగా మార్గదర్శనం
- **AI వర్క్షాప్ ల్యాబ్**: 2-3 గంటల చేతస్తో కాని వర్క్షాప్ AI అనువర్తనాలను AZD-Deployable పరిష్కారాల్లోకి మార్చడానికి
- **ఉత్పత్తి AI ఉత్తమ సాధనాలు**: AI పని భారాలను స్కేలింగ్, మానిటరింగ్ మరియు భద్రత కోసం ఎంటర్ప్రైజ్ సిద్ధమైన నమూనాలు
- **AI-ప్రత్యేక సమస్య పరిష్కార గైడ్**: Microsoft Foundry మోడల్స్, Cognitive Services, మరియు AI డిప్లాయ్‌మెంట్లకు సమగ్ర ట్రబుల్‌షూటింగ్
- **AI టెంప్లేట్ గ్యాలరీ**: Microsoft Foundry టెంప్లేట్‌ల విశిష్ట సేకరణ, సంక్లిష్టత రేటింగ్‌లతో
- **వర్క్షాప్ పదార్థాలు**: పూర్తి వర్క్షాప్ నిర్మాణం, చేతస్తో ల్యాబ్‌లు మరియు సూచన పదార్థాలు

#### మెరుగుపరచబడింది
- **README నిర్మాణం**: AI-డెవలపర్ ఫోకస్‌తో Microsoft Foundry Discord నుండి 45% కమ్యూనిటీ ఆసక్తితో
- **అభ్యాస మార్గాలు**: విద్యార్థులు మరియు DevOps ఇంజనీర్ల సాంప్రదాయ మార్గాల వెంట AI డెవలపర్ ప్రయాణం
- **టెంప్లేట్ సిఫార్సులు**: azure-search-openai-demo, contoso-chat, మరియు openai-chat-app-quickstart వంటి AI టెంప్లేట్‌లు
- **కమ్యూనిటీ సమన్వయం**: AI-ప్రత్యేక చానల్స్ మరియు చర్చలతో Discord కమ్యూనిటీ మద్దతు మెరుగుపడింది

#### భద్రత & ఉత్పత్తి ఫోకస్
- **మేనేజ్‌డ్ ఐడెన్టిటీ నమూనాలు**: AI-ప్రత్యేక ధృవీకరణ మరియు భద్రత కాన్ఫిగరేషన్లు
- **ఖర్చు ఆప్టిమైజేషన్**: AI పని భారాల కోస_token వినియోగం ట్రాకింగ్ మరియు బడ్జెట్ నియంత్రణలు
- **బహు-ప్రాంత డిప్లాయ్‌మెంట్**: బ్రహ్మాండ AI అనువర్తన డిప్లాయ్‌మెంట్ వ్యూహాలు
- **పనితీరు మానిటరింగ్**: AI-ప్రత్యేక ప్రమాణాలు మరియు అప్లికేషన్ ఇన్సైట్స్ సమన్వయం

#### డాక్యుమెంటేషన్ నాణ్యత
- **లినియర్ కోర్స్ నిర్మాణం**: ఆధారం నుండి అధునాతన AI డిప్లాయ్‌మెంట్ నమూనాల దిశగా లాజికల్ పురోగతి
- **ధృవీకరించబడిన URLs**: అన్ని బాహ్య రిపోజిటరీ లింకులు ధృవీకరించబడినవి మరియు అందుబాటులో ఉన్నాయి
- **సంపూర్ణ సూచన**: అన్ని అంతర్గత డాక్యుమెంటేషన్ లింకులు ధృవీకరించబడ్డవి మరియు పనిచేస్తున్నవి
- **ఉత్పత్తి సిద్ధం**: నిజ-ప్రపంచ ఉదాహరణలతో ఎంటర్ప్రైజ్ డిప్లాయ్‌మెంట్ నమూనాలు

### [v2.0.0] - 2025-09-09

#### ప్రధాన మార్పులు - రిపోజిటరీ పునఃరూపకల్పన మరియు ప్రొఫెషనల్ మెరుగుదల
**ఈ వెర్షన్ రిపోజిటరీ నిర్మాణం మరియు కంటెంట్ ప్రదర్శనలో గణనీయమైన మార్పును సూచిస్తుంది.**

#### జోడించినవి
- **సంక్రమణాభ్యాస ఫ్రేమ్‌వర్క్**: అన్ని డాక్యుమెంటేషన్ పేజీలు పరిచయము, అభ్యాస లక్ష్యాలు, మరియు అభ్యాస ఫలితాల విభాగాలతో
- **నావిగేషన్ సిస్టమ్**: అన్ని డాక్యుమెంటేషన్‌లో పూర్వ/తదుపరి పాఠాలు లింకులను జోడించి మార్గ సూచనతో అభ్యాస పురోగతి
- **అధ్యయన మార్గదర్శకం**: అభ్యాస లక్ష్యాలు, సాధన వ్యాయామాలు మరియు అంచనా పదార్థాలతో సంపూర్ణ study-guide.md
- **ప్రొఫెషనల్ ప్రదర్శన**: మెరుగైన ఆక్సెసిబిలిటీ మరియు వృత్తిపరమైన రూపంకోసం అన్ని ఇమోజి చిహ్నాలు తొలగించాయి
- **మెరుగొందిన కంటెంట్ నిర్మాణం**: అభ్యాస పదార్థాల వ్యవస్థీకరణ మరియు ప్రవాహం మెరుగులు

#### మార్చబడింది
- **డాక్యుమెంటేషన్ ఫార్మాట్**: అన్ని డాక్యుమెంటేషన్ ని ఒకరూపత తో అభ్యాస ఫోకస్ నిర్మాణంలో సాదరపరిచింది
- **నావిగేషన్ ప్రవాహం**: అన్ని అభ్యాస పదార్థాలతో తార్కిక పురోగతి అమలు
- **కంటెంట్ ప్రదర్శన**: స్పష్టమైన, వృత్తిపరమైన ఫార్మాటింగ్ కు అలంకరణా అంశాలు తొలగింపు
- **లింకు నిర్మాణం**: కొత్త నావిగేషన్ సిస్టమ్ కి అన్ని అంతర్గత లింకులను నవీకరణ

#### మెరుగుపరచబడింది
- **ఆక్సెసిబిలిటీ**: మెరుగైన స్క్రీన్ రీడర్ అనుకూలత కోసం ఇమోజి ఆధారిత అంశాలు తొలగించబడ్డాయి
- **ప్రొఫెషనల్ రూపం**: ఎంటర్ప్రైజ్ అభ్యాసానికి అనుకూలమైన స్వచ్ఛమైన అకడమిక్ శైలి
- **అభ్యాస అనుభవం**: ప్రతి పాఠానికి స్పష్టమైన లక్ష్యాలు మరియు ఫలితాలతో నిర్మిత దృష్టिकोణం
- **కంటెంట్ నిర్వహణ**: సంబంధిత అంశాల మధ్య బెటర్ తార్కిక ప్రవాహం మరియు సంబంధం

### [v1.0.0] - 2025-09-09

#### ముది విడుదల - సంపూర్ణ AZD అభ్యాస రిపోజిటరీ

#### జోడించినవి
- **కోర్ డాక్యుమెంటేషన్ నిర్మాణం**
  - పూర్తి గెట్టింగ్-స్టార్టెడ్ గైడ్ సిరీస్
  - సంపూర్ణ డిప్లాయ్‌మెంట్ మరియు ప్రొవిజనింగ్ డాక్యుమెంటేషన్
  - వివరమైన ట్రబుల్‌షూటింగ్ వనరులు మరియు డీబగింగ్ మార్గదర్శకాలు
  - డిప్లాయ్‌మెంట్ కు ముందు ధృవీకరణ సాధనాలు మరియు విధానాలు

- **గెట్టింగ్ స్టార్టెడ్ మాడ్యూల్**
  - AZD పాఠాలు: మూల భావనలు మరియు పదజాలం
  - ఇన్‌స్టలేషన్ గైడ్: ప్లాట్‌ఫారమ్-ప్రత్యేక సెటప్ సూచనలు
  - కాన్ఫిగరేషన్ గైడ్: పరిసర సెటప్ మరియు ధృవీకరణ
  - మొదటి ప్రాజెక్ట్ ట్యుటోరియల్: దశల వారీ చేతస్తో విద్య

- **డిప్లాయ్‌మెంట్ మరియు ప్రోవిజనింగ్ మాడ్యూల్**
  - డిప్లాయ్‌మెంట్ గైడ్: సంపూర్ణ పని ప్రవాహం డాక్యుమెంటేషన్
  - ప్రోవిజనింగ్ గైడ్: Bicep తో ఇన్ఫ్రాస్ట్రక్చర్ కోడ్
  - ఉత్పత్తి డిప్లాయ్‌మెంట్ ఉత్తమ సాధనాలు
  - బహు-సేవ ఆర్కిటెక్చర్ నమూనాలు

- **డిప్లాయ్‌మెంట్ ముందు ధృవీకరణ మాడ్యూల్**
  - సామర్థ్య ప్రణాళిక: Azure వనరు అందుబాటుదనం ధృవీకరణ
  - SKU ఎంపిక: సంపూర్ణ సేవ స్థాయి మార్గదర్శకాలు
  - ప్రీవైట్ చెక్స్: స్వయంచాలిత ధృవీకరణ స్క్రిప్టులు (PowerShell మరియు Bash)
  - ఖర్చు అంచనా మరియు బడ్జెట్ ప్రణాళిక సాధనాలు

- **ట్రబుల్‌షూటింగ్ మాడ్యూల్**
  - సాధారణ సమస్యలు: తరచుగా ఎదురయ్యే సమస్యలు మరియు పరిష్కారాలు
  - డీబగింగ్ గైడ్: వ్యవస్థబద్ధమైన ట్రబుల్‌షూటింగ్ విధానాలు
  - అధునాతన నిర్ధారణ సాంకేతికతలు మరియు సాధనాలు
  - పనితీరు మానిటరింగ్ మరియు ఆప్టిమైజేషన్

- **వనరులు మరియు సూచనలు**
  - కమాండ్ చీట్ షీట్: కీలక కమాండ్ల కోసం వేగవంతమైన మార్గదర్శనం
  - గ్లోసరీ: సమగ్ర పదజాలం మరియు సంక్షిప్తపద నిర్వచనలు
  - FAQ: సాధారణ ప్రశ్నలకు వివరణాత్మక జవాబులు
  - బయటి వనరు లింకులు మరియు కమ్యూనిటీ కనెక్షన్లు

- **ఉదాహరణలు మరియు టెంప్లేట్స్**
  - సులభ వెబ్ అప్లికేషన్ ఉదాహరణ
  - స్థిర వెబ్‌సైట్ డిప్లాయ్‌మెంట్ టెంప్లేట్
  - కంటైనర్ అప్లికేషన్ కాన్ఫిగరేషన్
  - డేటాబేస్ సమన్వయ నమూనాలు
  - మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్ ఉదాహరణలు
  - సర్వర్‌లెస్ ఫంక్షన్ అమలు విధానాలు

#### లక్షణాలు
- **బహుళ-ప్లాట్‌ఫారమ్ మద్దతు**: Windows, macOS, మరియు Linux కోసం ఇన్‌స్టలేషన్ మరియు కాన్ఫిగరేషన్ గైడ్‌లు
- **విభిన్న నైపుణ్య స్థాయిలు**: విద్యార్థుల నుండి ప్రొఫెషనల్ డెవలపర్లు వరకు కంటెంట్ డిజైన్
- **ప్రాక్టికల్ దృష్టి**: హ్యాండ్స్-ఆన్ ఉదాహరణలు మరియు వాస్తవ పరిస్థితులు
- **సంపూర్ణ కవర్**: మౌలిక నుంచి అధునాతన ఎంటర్ప్రైజ్ నమూనాలు వరకు
- **భద్రత-మొదటి దృష్టికోణం**: మొత్తం పరిధిలో భద్రత ఉత్తమ సాధనాలు
- **ఖర్చు ఆప్టిమైజేషన్**: ఖర్చులతో సమర్థవంతమైన డిప్లాయ్‌మెంట్ మరియు వనరు నిర్వహణకు మార్గదర్శనం

#### డాక్యుమెంటేషన్ నాణ్యత
- **వివరమైన కోడ్ ఉదాహరణలు**: ప్రయోగాత్మక, తనిఖీ చేసిన కోడ్ నమూనాలు
- **దశల వారీ సూచనలు**: స్పష్టమైన, అమలు చేయదగిన మార్గదర్శకాలు
- **సంపూర్ణ లోపాల నిర్వహణ**: సాధారణ సమస్యల ట్రబుల్‌షూటింగ్
- **ఉత్తమ సాధనాల సమగ్రత**: పారిశ్రామిక ప్రమాణాలు మరియు సిఫారసులు
- **సంస్కరణ అనుకూలత**: తాజా Azure సేవలు మరియు azd ఫీచర్లకు అనుగుణంగా

## కావలసిన భవిష్యత్తు మెరుగుదలలు

### వెర్షన్ 3.1.0 (యోజనలో ఉంది)
#### AI ప్లాట్‌ఫారమ్ విస్తరణ
- **బహుళ-మోడల్ మద్దతు**: Hugging Face, Azure Machine Learning, మరియు అనుకూల మోడళ్ల కోసం సమన్వయ నమూనాలు
- **AI ఏజెంట్ ఫ్రేమ్‌వర్క్లు**: LangChain, Semantic Kernel, మరియు AutoGen డిప్లాయ్‌మెంట్ టెంప్లేట్లు
- **అధునాతన RAG నమూనాలు**: Azure AI Search తో పాటు Pinecone, Weaviate వంటి వెక్టర్ డేటాబేస్ ఎంపికలు
- **AI ఆబ్జర్వబిలిటీ**: మోడల్ పనితీరు, టోకెన్ వినియోగం, మరియు స్పందన నాణ్యతకు మెరుగైన మానిటరింగ్

#### డెవలపర్ అనుభవం
- **VS కోడ్ ఎక్స్టెన్షన్**: AZD + Microsoft Foundry ఇంటిగ్రేటెడ్ అభివృద్ధి అనుభవం
- **GitHub Copilot సమన్వయం**: AI సహాయక AZD టెంప్లేట్ తయారీ
- **ఇంటరాక్టివ్ ట్యుటోరియల్స్**: ఆటోమేటెడ్ ధృవీకరణతో చేతస్తో కోడింగ్ వ్యాయామాలు AI సందర్భాల్లో
- **వీడియో కంటెంట్**: AI డిప్లాయ్‌మెంట్లపై దృష్టి కేంద్రీకరించిన.Visual learners కోసం సప్లిమెంటరీ వీడియో ట్యుటోరియల్స్

### వెర్షన్ 4.0.0 (యోజనలో ఉంది)
#### ఎంటర్ప్రైజ్ AI నమూనాలు
- **పాలనా ఫ్రేమ్‌వర్క్**: AI మోడల్ పాలన, అనుకూలత మరియు ఆడిట్ ట్రైల్స్
- **బహు-టెనెంట్ AI**: విభిన్న కస్టమర్లకు స్వతంత్ర AI సేవల నమూనాలు
- **ఎడ్జ్ AI డిప్లాయ్‌మెంట్**: Azure IoT ఎడ్జ్ మరియు కంటైనర్ ఇన్‌స్టాన్సులతో సమన్వయం
- **హైబ్రిడ్ క్లౌడ్ AI**: AI పని బరా కోసం బహు-క్లౌడ్ మరియు హైబ్రిడ్ డిప్లాయ్‌మెంట్ నమూనాలు

#### అధునాతన లక్షణాలు
- **AI పైప్‌లైన్ ఆటోమేషన్**: Azure Machine Learning పైప్‌లైన్లతో MLOps సమన్వయం
- **అధునాతన భద్రత**: జీరో-ట్రస్ట్ నమూనాలు, ప్రైవేట్ ఎండ్‌పాయింట్లు, మరియు అధునాతన ముప్పు రక్షణ
- **పనితీరు ఆప్టిమైజేషన్**: అధునాతన ట్యూనింగ్ మరియు స్కేలింగ్ వ్యూహాలు అధిక ఉత్పాదక AI అప్లికేషన్ల కోసం
- **గ్లోబల్ పంపిణీ**: AI అప్లికేషన్ల కోసం కంటెంట్ డెలివరీ మరియు ఎడ్జ్ కాచింగ్ నమూనాలు

### వెర్షన్ 3.0.0 (యోజనమయ్యింది) - ప్రస్తుత విడుదల ద్వారా తొలగింపబడింది
#### ప్రతిపాదిత జోడింపులు - ఇప్పుడు v3.0.0 లో అమలు చేయబడింది
- ✅ **AI-ఫోకస్ కంటెంట్**: సమగ్ర Microsoft Foundry సమన్వయం (పూర్తయింది)
- ✅ **ఇంటరాక్టివ్ ట్యుటోరియల్స్**: చేతస్తో AI వర్క్షాప్ ల్యాబ్ (పూర్తయింది)
- ✅ **అధునాతన భద్రతా మాడ్యూల్**: AI-ప్రత్యేక భద్రత నమూనాలు (పూర్తయింది)
- ✅ **పనితీరు ఆప్టిమైజేషన్**: AI పని భారాల ట్యూనింగ్ వ్యూహాలు (పూర్తయింది)

### వెర్షన్ 2.1.0 (యోజనలో ఉంది) - భాగస్వామ్యంగా v3.0.0 లో అమలు చేయబడింది
#### స్వల్ప మెరుగుదలలు - కొన్ని ప్రస్తుత రిలీజ్ లో పూర్తి చేయబడినవి
- ✅ **అదనపు ఉదాహరణలు**: AI-ఆధారిత డిప్లాయ్‌మెంట్ పరిస్థితులు (పూర్తయింది)
- ✅ **విస్తృత FAQ**: AI-ప్రత్యేక ప్రశ్నలు మరియు ట్రబుల్‌షూటింగ్ (పూర్తయింది)
- **సాధన సమన్వయం**: మెరుగైన IDE మరియు ఎడిటర్ ఇంటిగ్రేషన్ గైడ్‌లు
- ✅ **మానిటరింగ్ విస్తరణ**: AI-ప్రత్యేక మానిటరింగ్ మరియు అలర్టింగ్ నమూనాలు (పూర్తయింది)

#### ఇంకా భవిష్యత్తు విడుదల కోసం యోజనలో ఉన్నాయి
- **మొబైల్-ఫ్రెండ్లీ డాక్యుమెంటేషన్**: మొబైల్ అభ్యాసం కొరకు స్పందనాత్మక డిజైన్
- **ఆఫ్‌లైన్ ప్రాప్తి**: డాక్యుమెంటేషన్ ప్యాకేజీల డౌన్లోడ్
- **మెరుగైన IDE సమన్వయం**: AZD + AI వర్క్‌ఫ్లోస్ కోసం VS కోడ్ ఎక్స్టెన్షన్
- **కమ్యూనిటీ డాష్‌బోర్డ్**: వాస్తవ-సమయ కమ్యూనిటీ ప్రమాణాలు మరియు సహకారం ట్రాకింగ్

## చేంజ్‌లాగ్‌కు సహకారం

### మార్పులను నివేదించడం
ఈ రిపోజిటరీకు సహకరిస్తున్నప్పుడు, దయచేసి నిర్ధారించండి చేంజ్‌లాగ్ ప్రవేశాలు ఈ వివరాలను కలిగి ఉన్నాయని:

1. **వెర్షన్ నెంబర్**: సెమాంటిక్ వెర్షనింగ్ ప్రకారం (ముఖ్య.సూక్ష్మ.ప్యాచ్)
2. **తేదీ**: విడుదల లేదా నవీకరణ తేదీ YYYY-MM-DD రూపంలో
3. **వర్గం**: జోడించబడినవి, మార్చబడినవి, పాతవి చేయబడినవి, తీసివేయబడినవి, సరి చేసినవి, భద్రత
4. **స్పష్ట వివరణ**: మార్పు వివరాల సంక్షిప్త వివరణ
5. **ప్రభావం అంచనాలు**: మార్పులు ఎలా ప్రస్తుత వాడుకొనేవారిని ప్రభావితం చేస్తాయి

### మార్చు వర్గాలు

#### జోడించబడ్డవి
- కొత్త లక్షణాలు, డాక్యుమెంటేషన్ విభాగాలు లేదా సామర్థ్యాలు
- కొత్త ఉదాహరణలు, టెంప్లేట్లు లేదా అభ్యాస వనరులు
- అదనపు సాధనాలు, స్క్రిప్టులు, లేదా ఉపకరణాలు

#### మార్చబడ్డవి
- ఇరుగుపోయిన విధానానికి లోపల మార్పులు లేదా డాక్యుమెంటేషన్
- స్పష్టత లేదా ఖచ్చితత్వం మెరుగుపరచడానికి నవీకరణలు
- కంటెంట్ లేదా సగటు వ్యవస్థను పునఃసంఘటన

#### పాతవి చేయబడ్డవి
- దశలవారీగా తొలగించబడుతోన్న లక్షణాలు లేదా విధానాలు
- తొలగించబడే డాక్యుమెంటేషన్ విభాగాలు
- మెరుగైన ప్రత్యామ్నాయాలు కలిగిన విధానాలు

#### తీసివేయబడ్డవి
- మరింత వర్తించని లక్షణాలు, డాక్యుమెంటేషన్, లేదా ఉదాహరణలు
- పాత సమాచారం లేదా పాత విధానాలు
- అవశ్యకత లేని లేదా ఏకీకృత కంటెంట్

#### సరిదిద్దబడింది
- డాక్యుమెంటేషన్ లేదా కోడ్ లో లోపాల సవరణలు
- నివేదించబడిన సమస్యలు లేదా లోపాలు పరిష్కరణ
- ఖచ్చితత్వం లేదా కార్యాచరణ మెరుగలు


#### భద్రత
- భద్రత సంబంధిత మెరుగుదలలు లేదా పరిష్కారాలు
- భద్రత ఉత్తమ అభ్యాసాల నవీకరణలు
- భద్రతలో ఉన్న అసురక్షితతల పరిష్కారం

### సేమాంటిక్ వెర్షనింగ్ సూచనలు

#### ముఖ్య వెర్షన్ (X.0.0)
- వినియోగదారుని చర్య అవసరమైన విరుద్ధ మార్పులు
- విషయ లేదా సంస్థావిప్రతిపత్తి గణనీయమైన పునఃరూపకల్పన
- ప్రాథమిక విధానం లేదా పద్ధతి మార్చే మార్పులు

#### సన్నిహిత వెర్షన్ (X.Y.0)
- కొత్త ఫీచర్లు లేదా విషయ జోడింపులు
- వెనుకబడక ఉండే మెరుగుదలలు
- అదనపు ఉదాహరణలు, సాధనాలు లేదా వనరులు

#### ప్యాచ్ వెర్షన్ (X.Y.Z)
- బగ్ సవరణలు మరియు సరిచర్యలు
- ఉన్న విషయంపై చిన్న మెరుగుదలలు
- వివరణలు మరియు చిన్న పద్ధతులు

## సమాజ అభిప్రాయం మరియు సూచనలు

ఈ నేర్చుకోవడంతో సహాయపడేందుకు మేము సమాజ అభిప్రాయాన్ని ప్రోత్సహిస్తున్నాము:

### అభిప్రాయం అందించే విధానం
- **GitHub Issues**: సమస్యలు నివేదించండి లేదా మెరుగుదలలు సూచించండి (AI-ను ప్రత్యేకించి సంబందించిన సమస్యలు స్వాగతం)
- **Discord Discussions**: ఆలోచనలు పంచుకోండి మరియు Microsoft Foundry సమాజంతో జోడి పడండి
- **Pull Requests**: విషయంపై నేరుగా మెరుగుదలలు అందించండి, ముఖ్యంగా AI టెంప్లేట్లు మరియు మార్గదర్శకాలు
- **Microsoft Foundry Discord**: AZD + AI చర్చలకు #Azure చానెల్లో చురుకుగా పాల్గొనండి
- **Community Forums**: విస్తృత Azure అభివృద్ధి చర్చల్లో పాల్గొనండి

### అభిప్రాయ విభాగాలు
- **AI విషయ ఖచ్చితత్వం**: AI సేవల సమగ్రత మరియు వేటపట్ల సవరణలు
- **అధ్యయన అనుభవం**: మెరుగైన AI డెవలపర్ విద్యా ప్రవాహానికి సూచనలు
- **లేకపోయిన AI విషయాలు**: అదనపు AI టెంప్లేట్లు, నమూనాలు లేదా ఉదాహరణల కొరకు అభ్యర్థనలు
- **అపరిమిత సౌలభ్యం**: వివిధా నేర్చుకోవటానికి మెరుగుదలలు
- **AI టూల్ సమం కల్పన**: మెరుగైన AI అభివృద్ధి వర్క్‌ఫ్లోకి సూచనలు
- **ఉత్పత్తి AI నమూనాలు**: సంస్థల AI నియామకాల నమూనాలు కోరికలు

### స్పందన పరిమితి
- **సమస్యలకు స్పందన**: నివేదించిన సమస్యలకు 48 గంటలలో
- **ఫీచర్ అభ్యర్థనలు**: ఒక వారంలో మూల్యాంకనం
- **సమాజ దాతలు**: ఒక వారంలో సమీక్ష
- **భద్రతా సమస్యలు**: వెంటనే సత్వర ప్రతిస్పందనతో ప్రాధాన్యత

## నిర్వహణ షెడ్యూల్

### నియమిత నవీకరణలు
- **నెలవారీ సమీక్షలు**: విషయ ఖచ్చితత్వం మరియు లింకు ధ్రువీకరణ
- **త్రైమాసిక నవీకరణలు**: ప్రధాన విషయ జోడింపులు మరియు మెరుగుదలలు
- **ఆరవారీ సమీక్షలు**: సమగ్ర పునఃరూపకల్పన మరియు మెరుగుదల
- **వార్షిక విడుదలలు**: గణనీయమైన మెరుగుదలలతో ముఖ్య వెర్షన్ నవీకరణలు

### పర్యవేక్షణ మరియు నాణ్యత హామీ
- **స్వయంచాలిత పరీక్షలు**: కోడ్ ఉదాహరణలు మరియు లింకుల నియమిత ధృవీకరణ
- **సమాజ అభిప్రాయం కలయిక**: వినియోగదారుల సూచనలను నియమితంగా చేర్పించడం
- **సాంకేతిక నవీకరణలు**: తాజా Azure సేవలు మరియు azd విడుదలలతో సరిపోల్చడం
- **అపరిమితతా ఆడిట్లు**: సమగ్ర డిజైనింగ్ సూత్రాల నియమిత సమీక్ష

## వెర్షన్ మద్దతు విధానము

### ప్రస్తుత వెర్షన్ మద్దతు
- **ఇటివంటి ముఖ్య వెర్షన్**: పూర్తి మద్దతు మరియు నియమిత నవీకరణలు
- **మునుపటి ముఖ్య వెర్షన్**: భద్రత నవీకరణలు మరియు ముఖ్యమైన సరిచేయింపులు 12 నెలలకు
- **పాత వెర్షన్లు**: సమాజ మద్దతు మాత్రమే, అధికారిక నవీకరణలు లేవు

### మైగ్రేషన్ మార్గదర్శకాలు
ముఖ్య వెర్షన్లు విడుదల అయినప్పుడు, మేము ఇస్తాము:
- **మైగ్రేషన్ గైడ్‌లు**: దశలవారీ మార్పుల సూచనలు
- **సమ్మతి గమనికలు**: విరుద్ధ మార్పుల వివరాలు
- **సాధన మద్దతు**: మార్పులో సహాయం చేసే స్క్రిప్టులు లేదా ఉపకరణాలు
- **సమాజ మద్దతు**: మైగ్రేషన్ ప్రశ్నల కోసం ప్రత్యేక ఫోరమ్‌లు

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [పాఠ్య గైడ్](resources/study-guide.md)
- **తర్వాతి పాఠం**: తిరిగి [ప్రధాన README](README.md) వద్దకు వెళ్లండి

**నవీకరింపులతో ఉండండి**: ఈ నిల్వను కొత్త విడుదలలు మరియు ముఖ్యమైన నేర్చుకునే పదార్థాల నవీకరణల విజ్ఞప్తుల కోసం వీక్షించండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
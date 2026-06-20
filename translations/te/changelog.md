# చేంజ్‌లాగ్ - AZD For Beginners

## పరిచయం

ఈ చేంజ్‌లాగ్ AZD For Beginners రిపోజిటరీలోని అన్ని ముఖ్యమైన మార్పులు, నవీకరణలు మరియు అభివృద్ధులను డాక్యుమెంట్ చేస్తుంది. మేము సెమాంటిక్ వెర్షనింగ్ సూత్రాలను అనుసరిస్తాము మరియు వర్షన్ల మధ్య ఏమి మారిందో వినియోగదారులకు అర్థం అయ్యేందుకుగా ఈ లాగ్‌ను నిర్వహిస్తున్నాము.

## నేర్చుకునే లక్ష్యాలు

ఈ చేంజ్‌లాగ్‌ను సమీక్షించడం ద్వారా, మీరు:
- కొత్త ఫీచర్లు మరియు కంటెంట్ చేర్పులను గురించి సమాచారం పొందగలుగుతారు
- ఉన్న డాక్యుమెంటేషన్‌లో చేసిన మెరుగుదలలను అర్థం చేసుకోగలుగుతారు
- ఖచ్చితత్వం కోసం బగ్ ఫిక్సులు మరియు సవరణలను ట్రాక్ చేయగలుగుతారు
- శిక్షణ సామగ్రి కాలక్రమేణా ఎలా అభివృద్ధి చెందిందో అనుసరించగలుగుతారు

## నేర్చుకోవడంవల్లExpected విధానాలు (Learning Outcomes)

చేంజ్‌లాగ్ ఎంట్రీలను సమీక్షించిన తరువాత, మీరు చేయగలుగుతారు:
- నేర్చుకోవడానికి అందుబాటులో ఉన్న కొత్త కంటెంట్ మరియు వనరులను గుర్తించడం
- ఏ సెక్షన్లు నవీకరించబడ్డాయో లేదా మెరుగుపరచబడ్డాయో అర్థం చేసుకోవడం
- తాజా సామగ్రి ఆధారంగా మీ నేర్చుకునే మార్గాన్ని ప్లాన్ చేయడం
- భవిష్యత్ మెరుగుదలల కోసం అభిప్రాయం మరియు ప్రతిపాదనలు అందించడం

## వెర్షన్ చరిత్ర

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**ఈ వెర్షన్ azd-coverage విశ్లేషణ ద్వారా తెలుస్తున్న మిగిలిన ఇంటర్‌మీడియట్ గ్యాపులను మూసేస్తుంది: మీ స్వంత టెంప్లేట్‌ను ఎలా రచించాలి మరియు ప్రచురించాలో, పునర్నిర్మాణీయ dev-container/Codespaces వాతావరణాలు, Pulumi ఇన్ఫ్రాస్ట్రక్చర్ ప్రొవైడర్, Azure DevOps CI/CD వాక్‌త్రూ, సర్వీస్-ప్రిన్సిపల్ ఆథెంటికేషన్, హోస్ట్-ఎంపిక గైడెన్స్ (AKS/Spring Apps), `azd restore`/`azd package` వివరణలు, హుక్ ఎర్రర్-హ్యాండ్లింగ్, మరియు టీమ్/షేర్డ్-ఎన్విరాన్‌మెంట్ పద్దతులు.**

#### జోడించబడింది
- **🧱 కొత్త చాప్టర్ 4 పాఠం** `docs/chapter-04-infrastructure/custom-templates.md` — మీ స్వంత azd టెంప్లేట్ ను రచించడం: అవసరమైన నిర్మాణం (`azure.yaml`, `infra/`, `src/`), `metadata.template` ఫీల్డ్, `uniqueString()` రిసోర్సు టోకెన్ మరియు `azd-env-name` ట్యాగ్ తో ఇన్ఫ్రా పరామెటరైజ్ చేయడం, స్థానికంగా పరీక్షించడం `azd init --template <local-path>` తో, GitHub కు ప్రచురించడం, మరియు Awesome AZD గ్యాలరీకి సమర్పించడం
- **📦 కొత్త చాప్టర్ 1 పాఠం** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers మరియు GitHub Codespaces తో పునర్నిర్మాణీయ azd వాతావరణాలు: కనిష్ట `.devcontainer/devcontainer.json` ఆఫిషియల్ `ghcr.io/azure/azure-dev/azd` ఫీచర్ ఉపయోగించడం, భాష-స్పెసిఫిక్ ఫీచర్లు, కంటైనర్ హోస్టుల కోసం `docker-in-docker`, మరియు రిమోట్ సైన్-ఇన్ కోసం `azd auth login --use-device-code`
- **🧩 Pulumi with azd** విభాగం `docs/chapter-04-infrastructure/provisioning.md` లో — `infra.provider: pulumi`, Pulumi ఫోల్డర్ లేఅవుట్, స్టాక్స్‌ను azd ఎన్విరాన్‌మెంట్లికి మ్యాపింగ్ చేయడం, అవసరమైన ఔట్పుట్స్/ట్యాగింగ్, మరియు ఇదే `azd up` / `azd down` వర్క్‌ఫ్లో
- **🎯 హోస్ట్-ఎంపిక గైడెన్స్** `docs/chapter-04-infrastructure/provisioning.md` లో — ప్రారంభశిక్షకులకు అనుకూలంగా `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, మరియు `springapp` ను పోల్చడం, AKS లేదా Azure Spring Apps ఎప్పుడు ఎంచుకోవాలో మార్గదర్శకం
- **🛠️ Azure DevOps CI/CD వాక్‌త్రూ** `docs/chapter-08-production/production-ai-practices.md` లో — `azd pipeline config --provider azdo`, workload identity federation (OIDC)తో సర్వీస్ కనెక్షన్, తీయబడిన `azure-dev.yml`, మరియు వేరియబుల్-గ్రూప్ సెటప్లో వివరాలు
- **🔑 Service Principals (Pattern 4)** `docs/chapter-03-configuration/authsecurity.md` లో జోడించబడింది — `az ad sp create-for-rbac`, క్లయింట్ సీక్రెట్ vs. ఫెడరేటెడ్/OIDC క్రెడెన్షియల్స్ తో నాన్-ఇంటరాక్టివ్ `azd auth login`, ఎప్పుడчитать ఉపయోగించాలి, మరియు క్రెడెన్షియల్స్ ను సురక్షితంగా నిల్వ చేయడం
- **🪝 హుక్ ఎర్రర్-హ్యాండ్లింగ్** ఉపవిభాగం `docs/chapter-04-infrastructure/deployment-guide.md` లో — ఎగ్జిట్ కోడ్స్ మరియు `set -e`, `continueOnError`, `azd hooks run` తో హుక్స్ ను ఐసొలేషన్‌లో పరీక్షించడం, OS-స్పెసిఫిక్ షెల్స్, మరియు `--debug`
- **👥 టీమ్ / షేర్డ్ ఎన్విరాన్‌మెంట్లు** విభాగం `docs/chapter-03-configuration/configuration.md` లో — `.azure/`లో ఏమి ఉంటుంది, ఏమి gitignore చేయాలి, per-developer ఎన్విరాన్‌మెంట్స్, `azd env list`/`select`, మరియు CI/CDలో ఎన్విరాన్‌మెంట్ విలువలను ఇవ్వడం
- **🧰 `azd restore` మరియు విస్తరించిన `azd package`** వివరణలు `resources/cheat-sheet.md` లో — డిపెండెన్సీలను పునరుద్ధరించడం మరియు డిప్లాయ్ చేయకుండా ఒక డిప్లాయబుల్ ఆర్టిఫాక్ట్ తయారు చేయడం

#### మార్పు
- **🧭 చాప్టర్ 4 పాఠాల పట్టిక** కొత్త "Authoring Your Own Template" పాఠాన్ని (పాఠం 3) చేర్చడానికి నవీకరించబడింది
- **🧭 చాప్టర్ 1 పాఠాల పట్టిక** కొత్త "Dev Containers & Codespaces" పాఠాన్ని (పాఠం 5) చేర్చడానికి నవీకరించబడింది; `bring-your-own-app.md` మరియు `dev-containers.md` మధ్య నావిగేషన్ ఫుటర్లు కనెక్ట్ చేయబడ్డాయి

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**ఈ వెర్షన్ పూర్తి ప్రారంభికుల గైడ్ కోసం పెద్ద గ్యాపులను మూసేస్తుంది: రెండు కొత్త హ్యాండ్స్-ఆన్ పాఠాలు (డిప్లాయబుల్ మల్టీ-ఏజెంట్ వాక్‌త్రూ మరియు మెరుగైన విధంగా azd ను ఇప్పటికే ఉన్న app లో చేర్చడం), ప్రారంభశిక్షకులకు అనుకూలమైన హుక్స్ పరిచయం, azd తో Terraform విభాగం, స్టెప్-బై-స్టెప్ GitHub Actions పైప్‌లైన్ వాక్‌త్రూ, కొత్త ప్రీవ్యూ ఎక్స్టెన్షన్స్ గురించి వివరణ, మరియు స్పష్టమైన డిప్లాయ్‌మెంట్-వెరిఫికేషన్ చెక్‌లిస్ట్.**

#### జోడించబడింది
- **🤝 కొత్త చాప్టర్ 5 పాఠం** `docs/chapter-05-multi-agent/multi-agent-basics.md` — పూర్తిగా హ్యాండ్స్-ఆన్, డిప్లాయబుల్ రెండు-ఏజెంట్ వాక్‌త్రూ (ఆర్చెస్ట్రేటర్ + స్పెషలిస్టులు) ఒక రియల్ టెంప్లెట్ (`contoso-creative-writer`) ఉపయోగించి, multi-agent ను ఎప్పుడు ఉపయోగించాలో, `azd up` వర్క్‌ఫ్లో, డిప్లాయ్ చేయబడ్డ రెసోర్సుల అవగాహన, క్రాస్-ఏజెంట్ ట్రేసింగ్, అనుకరణ, మరియు క్లీనప్ కవ‌ర్ చేస్తుంది
- **📦 కొత్త చాప్టర్ 1 పాఠం** `docs/chapter-01-foundation/bring-your-own-app.md` — `azd init` తో ఇప్పటికే ఉన్న ప్రాజెక్ట్‌లో azd ను ఎలా చేర్చాలో ("use code in the current directory"), `azure.yaml` మరియు `infra/` ను అర్థం చేసుకోవడం, `azd infra generate`, హోస్ట్ గుర్తింపు, మరియు `azd up` తో డిప్లాయ్ చేయడం
- **🌐 Terraform with azd** విభాగం `docs/chapter-04-infrastructure/provisioning.md` లో జోడించబడింది — `infra.provider: terraform` కాన్ఫిగ్, `.tf` ఫోల్డర్ లేఅవుట్, అవసరమైన `AZURE_*` ఔట్పుట్స్ మరియు `azd-env-name` ట్యాగింగ్, మరియు ఇదే `azd up` / `azd down` వర్క్‌ఫ్లో (Terraform సపోర్ట్ పేర్కొన్నప్పటికీ మాత్రమే Bicep చూపిన గ్యాప్‌ను మూసేసింది)
- **⚙️ స్టెప్-బై-స్టెప్ GitHub Actions వాక్‌త్రూ** `docs/chapter-08-production/production-ai-practices.md` లో — GitHub రిపో నుండి ఆటోమేటెడ్ డిప్లాయ్స్ వరకు: `azd pipeline config`, OIDC ఫెడరేటెడ్ క్రెడెన్షియల్స్ (సేవ్ చేయబడిన సీక్రెట్స్ లేకుండా), తీయబడిన `azure-dev.yml`, మరియు సీక్రెట్స్-వర్సెస్-వేరియబుల్స్ గైడెన్స్
- **🪝 ఆరంభశిక్షకుల కోసం "New to hooks?" పరిచయం** `docs/chapter-04-infrastructure/deployment-guide.md` లో — హుక్ అంటే ఏమిటి, హుక్-స్టేజ్ పట్టిక, కనిష్ట మొదటి హుక్, మరియు `azd hooks run` తో హుక్స్ ను మాన్యువ్గా నడపడం
- **✅ "Verify Your Deployment" చెక్‌లిస్ట్** Step 5లో `docs/chapter-01-foundation/first-project.md` కు జోడించబడింది — స్మోక్ టెస్ట్, హెల్త్-ఎండ్పాయింట్ చెక్, మరియు స్పష్టమైన విజయ ప్రమాణాలు
- **🧩 కొత్త ప్రీవ్యూ ఎక్స్టెన్షన్స్ కోసం వివరణ** `azure.ai.skills` మరియు `azure.ai.connections` (ఏంటి మరియు ఎప్పుడు ఉపయోగించాలో) `docs/chapter-08-production/production-ai-practices.md` లో

#### మార్పు
- **🧭 చాప్టర్ 5 పాఠాల పట్టిక** సరిచేయబడింది: `multi-agent-basics.md` ఇప్పుడు పాఠం 1 (అదే ఒకే పూర్తిగా హ్యాండ్స్-ఆన్ పాఠం), నిజాయతీగా లేబులింగ్ చేయబడింది పాఠం 2 చాప్టర్ 6 లో ఉంది అని మరియు రిటైలు సీనారియో ఒక ఆర్కిటెక్చర్ బ్లూప్రింట్ మాత్రమే, ఒక one-command టెంప్లేట్ కాదు
- **🧭 చాప్టర్ 1 పాఠాల పట్టిక** ఇప్పుడు కొత్త "Bring Your Own App" పాఠాన్ని (పాఠం 4) చేరిస్తుంది
- **🔗 నావిగేషన్ ఫుటర్లు** నవీకరించబడ్డాయి: `first-project.md` ఇప్పుడు ముందుకు `bring-your-own-app.md` కి లింక్ చేస్తుంది

#### సరిచేసింది
- **🧱 "దావా చేయబడిన కానీ లేనిది" Terraform గ్యాప్ మూసివేయబడింది** — ఈ కోర్సు మునుపెప్పుడూ Terraform సపోర్ట్ ను సూచించినప్పటికీ దాన్ని చూపించలేదు
- **🔀 తప్పుదారి చూపించే చాప్టర్ 5 క్రాస్-లింక్స్ సరిచేయబడ్డాయి** ఈ లింక్స్ అమలులో ఉన్న పూర్తి మల్టీ-ఏజెంట్ ఇంప్లిమెంటేషన్ ఉందని సూచించేవిగా ఉండటం వల్ల కలిగిన తప్పుదారిని సరిచేశాం, ఇక్కడ అది కేవలం ఆర్కిటెక్చర్ బ్లూప్రింట్ మాత్రమే అని

#### అప్డేట్లైన ఫైళ్లు
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(నవీనమైనది)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(నవీనమైనది)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**ఈ వెర్షన్ కోర్సును `azd` `1.25.6` (జూన్ 2026) మరియు `azure.ai.agents` `0.1.40-preview` ఎక్స్టెన్షన్ వర్సన్లకు తిరిగి పరిశీలిస్తుంది, AI మార్గదర్శకాలను "ఎజెంట్ స్కాఫోల్డ్ చేయడం" నుండి పూర్తి ఏజెంట్ లైఫ్సైకిల్‌కి (test → evaluate → optimize → inspect → delete) విస్తరిస్తుంది, కొత్త `azure.ai.skills` మరియు `azure.ai.connections` ప్రీవ్యూ ఎక్స్టెన్షన్లను వెలికి తెస్తుంది, మరియు ".NET Aspire" → "Aspire" ఉత్పత్తి రీబ్రాండ్ ని గమనిస్తుంది.**

#### జోడించబడింది
- **🔁 ప్రారంభశిక్షకులు మరియు AI ఇంజనీర్ల కోసం పూర్తి ఏజెంట్ లైఫ్సైకిల్ కవరేజ్** డాక్స్ మొత్తం:
  - `docs/chapter-01-foundation/azd-basics.md` — లైఫ్సైకిల్ పట్టిక (scaffold → test → measure → improve → inspect → clean up) Extensions మరియు AI Commands సెక్షన్‌కి జోడించబడింది
  - `docs/chapter-08-production/production-ai-practices.md` — "Managing the Agent Lifecycle" కొత్త సెక్షన్, `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, మరియు `delete --force` ని కవర్ చేస్తుంది
  - `resources/cheat-sheet.md` — విస్తరించిన AI Agent Commands: `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, మరియు `delete --force`
- **🧩 కొత్త ప్రీవ్యూ ఎక్స్టెన్షన్స్** డాక్యుమెంటు చేయబడ్డాయి: `azure.ai.skills` (పునర్వినియోగపరచదగిన ఏజెంట్ స్కిల్స్) మరియు `azure.ai.connections` (Foundry కనెక్షన్లు) ఎక్స్టెన్షన్స్ పట్టిక మరియు చీట్ షీట్‌లో జోడించబడ్డాయి
- **⏱️ రెస్పాన్స్-టైమింగ్ మార్గదర్శకం** — `azd ai agent invoke` ఉదాహరణలు ఇప్పుడీ మొత్తం లాటెన్సీ మరియు టైమ్-టు-ఫస్ట్-బైట్ ను ప్రింట్ చేయడం గురించి సూచిస్తాయి
- **📌 వర్షన్ బానర్** రూట్ README లో నేలర్పుల్ని `azd version` మరియు `azd upgrade` వైపు చూపుతుందని జోడించబడింది

#### మార్పు
- **✅ వాలిడేషన్ బేస్‌లైన్ నవీకరించబడింది** `azd 1.23.12` (మార్చి 2026) నుండి `azd 1.25.6` (జూన్ 2026) గా అన్ని చాప్టర్ README ల్లో మరియు వర్క్షాప్ డాక్స్‌లో
- **🤖 చాప్టర్ 2 ఎక్స్టెన్షన్ నోటు** `azure.ai.agents` `0.1.18-preview` నుండి `0.1.40-preview` కి నవీకరించబడింది
- **🧪 వర్క్షాప్ వాలిడేషన్ ఉదాహరణ** (`azd version` అవుట్పుట్) `1.25.6` కి నవీకరించబడింది
- **🧭 README "What's New in azd Today"** తాజా ఏజెంట్ లైఫ్సైకిల్, కొత్త AI ఎక్స్టెన్షన్లు, మరియు ఇటీవల జరిగిన క్వాలిటీ-ఆఫ్-లైఫ్ ఫిక్సులపై ( `azd init` ఐడంపోటెన్సీ, `azd auth login` స్టేల్-టోకెన్ క్లీరింగ్, `azd tool` ఫస్ట్-రన్ ప్రాంప్ట్) హైలైట్ చేయడానికి రిఫ్రెష్ చేయబడింది
- **📖 చాప్టర్ 2 agents.md (Option 4)** ఇప్పుడు గమనిక పాఠకులకు పోస్ట్-డిప్లాయ్ లైఫ్సైకిల్ క‌మాండ్ల వైపు చూపిస్తుంది, కేవలం `azd up` వద్ద ఆగవంతు కాదు

#### సరిచేయబడింది
- **🏷️ ఉత్పత్తి పేరు** — Aspire రీబ్రాండ్ నోటు జోడించబడింది (".NET Aspire" ఇప్పుడు సరళంగా "Aspire"); azd లో Aspire మద్దతు మారలేదు
- **🔎 లైవ్ రీలీజ్ వాలిడేషన్** Azure Developer CLI రీలీజ్ ఫీడ్‌ను ధృవీకరించింది: స్థిర CLI `1.25.6` (2026-06-12) మరియు `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### అప్డేట్లైన ఫైళ్లు
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
#### ప్రారంభికుల ఆన్బోర్డింగ్ స్పష్టీకరణ, సెటప్ ధృవీకరణ & చివరి AZD కమాండ్ శుభ్రపరచడం
**ఈ సంచిక AZD 1.23 ధృవీకరణ స్వీప్‌ను ప్రారంభికులకు లక్ష్యంగా ఉన్న డాక్యుమెంటేషన్ పాస్‌తో ఫాలోఅప్ చేస్తుంది: ఇది AZD-ప్రథమ గుర్తింపు మార్గదర్శకాన్ని స్పష్టత ఇస్తుంది, స్థానిక సెటప్ ధృవీకరణ స్క్రిప్టులను జోడిస్తుంది, ప్రాధాన్య కమాండ్లను జీవిత AZD CLIతో సరిపోల్చి ధృవీకరిస్తుంది, మరియు ఛేంజ్‌లాగ్ బహిష్కృతమైనతర్వాత చివరి అపరచేయబడిన ఇంగ్లీష్ మూల కమాండ్ సూచనలను తొలగిస్తుంది.**

#### Added
- **🧪 ప్రారంభికుల సెటప్ ధృవీకరణ స్క్రిప్ట్‌లు** `validate-setup.ps1` మరియు `validate-setup.sh` తో, zodat learners can confirm required tools before starting Chapter 1
- **✅ ముందస్తు సెటప్ ధృవీకరణ దశలు** రూట్ README మరియు Chapter 1 README లో, తద్వారా అవసరమైన పూర్వాపరాలు `azd up` తాకే ముందు పట్టుబడతాయి

#### Changed
- **🔐 ప్రారంభికుల గుర్తింపు మార్గదర్శకాలు** ఇప్పుడు నిరంతరం `azd auth login` ను AZD వర్క్‌ఫ్లోల కోసం ప్రధాన మార్గంగా పరిగణిస్తుంది, `az login` ను మాత్రమే ఆప్షనల్ గా చూపిస్తుంది తప్పనిసరి కాదు, అలాగే ఇది Azure CLI కమాండ్‌లు నేరుగా ఉపయోగించినపుడు తప్పనిసరి కావచ్చు అని సూచిస్తుంది
- **📚 Chapter 1 ఆన్బోర్డింగ్ ఫ్లో** ఇప్పుడు నేర్చుకునేవారిని ఇన్‌స్టాలేషన్, గుర్తింపు మరియు మొదటి డిపLOYమెంట్ దశలకి ముందు తమ స్థానిక సెటప్‌ను ధృవీకరించమని చూపిస్తుంది
- **🛠️ validators సందేశాలు** ఇప్పుడు అడ్డుకునే అవసరాలు మరియు AZD-మాత్రమే మార్గం కోసం ఐచ్ఛిక Azure CLI హెచ్చరికలను స్పష్టంగా వేరుచేస్తుంది
- **📖 కాన్ఫిగరేషన్, సమస్య పరిష్కారం, మరియు ఉదాహరణ డాక్స్** ఇప్పుడు అవసరమైన AZD గుర్తింపును మరియు ఐచ్ఛిక Azure CLI సైన్-ఇన్‌ను విభజించాయి, గతంలో రెండింటినీ సందర్భం లేకుండా प्रस्तुत చేయబడింది

#### Fixed
- **📋 మిగిలిన ఇంగ్లీష్ మూల కమాండ్ సూచనలు** తాజా AZD రూపాలకు నవీకరించారు, వీటిలో చీట్ షీట్‌లో `azd config show` మరియు Azure పోర్టల్ అవలోకన మార్గదర్శకానికి ఉద్దేశించిన చోట `azd monitor --overview` ఉన్నాయి
- **🧭 Chapter 1లో ఉన్న ప్రారంభిక నినాదాలు** అన్ని టెంప్లేట్లు మరియు Azure వనరులపై గ్యారెంటీ చేసిన జీరో-లోపం లేదా రోల్బాక్ ప్రవర్తనను హామీ ఇవ్వకుండా మరమత్తు చేయబడ్డాయి
- **🔎 లైవ్ CLI ధృవీకరణ** ప్రస్తుత మద్దతును నిర్ధారించింది: `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, మరియు `azd down --force --purge`

#### Files Updated
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

#### AZD 1.23.12 ధృవీకరణ, వర్క్షాప్ పరిసర విస్తరణ & AI మోడల్ రిఫ్రెష్
**ఈ సంచిక `azd` `1.23.12` పై డాక్యుమెంటేషన్ ధృవీకరణ స్వీప్ నిర్వహిస్తుంది, పాత AZD కమాండ్ ఉదాహరణలను నవీకరిస్తుంది, AI మోడల్ మార్గదర్శకాలను ప్రస్తుత డిఫాల్ట్స్‌కు రిఫ్రెష్ చేస్తుంది, మరియు వర్క్షాప్ సూచనలను GitHub Codespaces బయట కూడా dev containerలు మరియు స్థానిక క్లోన్లను మద్దతు చేయడానికి విస్తరిస్తుంది.**

#### Added
- **✅ మూల అధ్యాయాల మరియు వర్క్షాప్ డాక్స్ లో ధృవీకరణ గమనికలు** సులభంగా నేర్చుకునేవారికి పరీక్షించిన AZD బేస్‌లైన్ స్పష్టంగా తెలియజేయడానికి
- **⏱️ డిప్లాయ్‌మెంట్ టైమౌట్ మార్గదర్శకాలు** దీర్ఘకాలిక AI యాప్ల డిప్లాయ్‌మెంట్స్ కోసం `azd deploy --timeout 1800` ఉపయోగించమనీ సూచన
- **🔎 ఎక్స్‌టెన్షన్ తనిఖీ దశలు** AI వర్క్‌ఫ్లో డాక్స్‌లో `azd extension show azure.ai.agents` తో
- **🌐 విస్తృత వర్క్షాప్ పరిసర మార్గదర్శకాలు** GitHub Codespaces, dev containerలు, మరియు MkDocs తో స్థానిక క్లోన్లను కవర్ చేయడం

#### Changed
- **📚 అధ్యాయ పరిచయ READMEలు** ఇప్పుడు ఫౌండేషన్, కాన్ఫిగరేషన్, ఇన్ఫ్రాస్ట్రక్చర్, మల్టీ-ఏజెంట్, ప్రీ-డిప్లాయ్‌మెంట్, ట్రబుల్‌షూటింగ్ మరియు ప్రొడక్షన్ విభాగాలలో `azd 1.23.12` పై ధృవీకరణ చేయబడినదని నిరంతరం సూచిస్తాయి
- **🛠️ AZD కమాండ్ సూచనలు** డాక్స్ అంతటా ప్రస్తుత రూపాలలో నవీకరించబడ్డాయి:
  - `azd config list` → `azd config show`
  - `azd env show` → సందర్భానుసారం `azd env list` లేదా `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights అవలోకనం ఉద్దేశించిన చోట `azd monitor --overview`
- **🧪 Provision preview ఉదాహరణలు** ప్రస్తుత మద్దతుతో సరిపడే రూపానికి సరళీకృతమయ్యాయి, ఉదాహరణకు `azd provision --preview` మరియు `azd provision --preview -e production`
- **🧭 వర్క్షాప్ ఫ్లో** ఇప్పుడు నేర్చుకునేవారు Codespaces, dev container లేదా స్థానిక క్లోన్‌లో ల్యాబ్‌లు పూర్తి చేయచ్చని చూపిస్తుంది; Codespaces మాతృకంగా ఊహించడం మానింది
- **🔐 గుర్తింపు మార్గదర్శకాలు** ఇప్పుడు AZD వర్క్‌ఫ్లోల కోసం `azd auth login` ను ప్రాధాన్యంగా ప్రాధాన్యం ఇస్తుంది, Azure CLI కమాండ్‌లు నేరుగా ఉపయోగిస్తే మాత్రమే `az login` ఐచ్ఛికంగా ఉంచబడింది

#### Fixed
- **🪟 Windows ఇన్‌స్టాల్ కమాండ్లు** ఇన్‌స్టాలేషన్ గైడ్‌లో ప్రస్తుత `winget` ప్యాకేజ్ కేసింగ్కు సాధారణీకరించబడ్డాయి
- **🐧 Linux ఇన్‌స్టాల్ మార్గదర్శకాలు** వాడకానికి మద్దతు లేని డిస్ట్రో-నిర్దిష్ట `azd` ప్యాకేజ్ మేనేజర్ సూచనలను తొలగించి, అవసరమైతే రీలీజ్ ఆస్తులకు సూచిస్తున్నాయి
- **📦 AI మోడల్ ఉదాహరణలు** పాత డిఫాల్ట్స్ నుండి రిఫ్రెష్ చేయబడ్డాయి: `gpt-35-turbo`, `text-embedding-ada-002` వంటి వాటిని వరాతమునకు అనుగుణంగా `gpt-4.1-mini`, `gpt-4.1`, మరియు `text-embedding-3-large` వంటి ప్రస్తుత ఉదాహరణలతో మార్చారు
- **📋 డిప్లాయ్‌మెంట్ మరియు డయాగ్నొస్టిక్స్ స్నిపెట్లు** లాగ్స్, స్క్రిప్టులు, మరియు ట్రబుల్‌షూటింగ్ దశలలో ప్రస్తుత ఎన్విరన్మెంట్ మరియు స్థితి కమాండ్లను ఉపయోగించేలా సరిచేశారు
- **⚙️ GitHub Actions మార్గదర్శకాలు** `Azure/setup-azd@v1.0.0` నుండి `Azure/setup-azd@v2` కు నవీకరించబడ్డాయి
- **🤖 MCP/Copilot అనుమతి మార్గదర్శకాలు** `azd mcp consent` నుండి `azd copilot consent list` కు నవీకరించబడ్డాయి

#### Improved
- **🧠 AI అధ్యాయం మార్గదర్శకాలు** ఇప్పుడు preview-సెన్సిటివ్ `azd ai` ప్రవర్తన, టెనెంట్-నిర్దిష్ట లాగిన్, ప్రస్తుత ఎక్స్‌టెన్షన్ ఉపయోగం, మరియు తాజా మోడల్ డిప్లాయ్‌మెంట్ సిఫార్సుల గురించి మెరుగ్గా వివరించాయి
- **🧪 వర్క్షాప్ సూచనలు** చేతిలో ఉండే వర్షన్ ఉదాహరణలు మరియు స్పష్టమైన పరిసర సెటప్ భాషతో మరింత నిజమైనచిన్న ఉదాహరణలు ఉపయోగించబడుతున్నాయి
- **📈 ప్రొడక్షన్ మరియు ట్రబుల్‌షూటింగ్ డాక్స్** ప్రస్తుత మానిటరింగ్, ఫాల్బ్యాక్ మోడల్, మరియు ఖర్చు-తరగతి ఉదాహరణలతో మెరుగ్గా సర్దుబాటు చేయబడ్డాయి

#### Files Updated
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
**ఈ సంచిక `azd ai`, `azd extension`, మరియు `azd mcp` కమాండ్ కవరేజ్‌ను అన్ని AI-సంబంధిత అధ్యాయాల్లో జోడిస్తుంది, agents.md లో విరిగిపోయిన లింకులు మరియు డిప్రికేటెడ్ కోడ్‌ను సరి చేస్తుంది, చీట్ షీట్‌ను నవీకరించి ఉదాహరణ టెంప్లెట్స్ విభాగాన్ని validated వివరణలతో మరియు కొత్త Azure AI AZD టెంప్లేట్స్‌తో మరమ్మతు చేస్తుంది.**

#### Added
- **🤖 AZD AI CLI కవరేజ్** 7 ఫైల్స్ అంతటా (ముందుగా కేవలం Chapter 8 లో ఉండేది):
  - `docs/chapter-01-foundation/azd-basics.md` — కొత్త "Extensions and AI Commands" సెక్షన్ `azd extension`, `azd ai agent init`, మరియు `azd mcp` పరిచయం చేస్తుంది
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` టెంప్లేట్ vs మానిఫెస్ట్ పద్ధతుల తులనాపరమైన పట్టికతో
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" మరియు "Agent-First Deployment" ఉపశీర్షికలు
  - `docs/chapter-05-multi-agent/README.md` — Quick Start ఇప్పుడు టెంప్లేట్ మరియు మానిఫెస్ట్-ఆధారిత డిప్లాయ్‌మెంట్ మార్గాలను చూపిస్తుంది
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy సెక్షన్ ఇప్పుడు `azd ai agent init` ఆప్షన్‌ను కూడా కలిగి ఉంటుంది
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" ఉపశీర్షిక
  - `resources/cheat-sheet.md` — కొత్త "AI & Extensions Commands" సెక్షన్ `azd extension`, `azd ai agent init`, `azd mcp`, మరియు `azd infra generate` తో
- **📦 కొత్త AZD AI ఉదాహరణ టెంప్లేట్‌లు** `microsoft-foundry-integration.md` లో:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, మరియు వాయిస్ చాట్ సహాయంతో .NET RAG చాట్
  - **azure-search-openai-demo-java** — ACA/AKS డిప్లాయ్‌మెంట్ ఆప్షన్లతో Java RAG చాట్ Langchain4J ఉపయోగించి
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, మరియు Prompty ఉపయోగించి మల్టీ-ఏజెంట్ క్రియేటివ్ రైటింగ్ యాప్
  - **serverless-chat-langchainjs** — Ollama స్థానిక డెవ్ మద్దతుతో Azure Functions + LangChain.js + Cosmos DB ఉపయోగించే సర్వర్‌లెస్ RAG
  - **chat-with-your-data-solution-accelerator** — అడ్మిన్ పోర్టల్, Teams ఇంటిగ్రేషన్, మరియు PostgreSQL/Cosmos DB ఆప్షన్లతో ఎంటర్ప్రైజ్ RAG త్వరణకర్త
  - **azure-ai-travel-agents** — .NET, Python, Java, మరియు TypeScriptలో సర్వర్స్ ఉన్న మల్టీ-ఏజెంట్ MCP ఆర్కెస్ట్రేషన్ సూచన యాప్
  - **azd-ai-starter** — కనిష్ట Azure AI ఇన్‌ఫ్రాస్ట్రక్చర్ Bicep స్టార్టర్ టెంప్లేట్
  - **🔗 Awesome AZD AI Gallery link** — సూచన [awesome-azd AI గ్యాలరీ](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 agents.md నావిగేషన్**: Previous/Next లింకులు ఇప్పుడు Chapter 2 README పాఠ్యക്രമానికి సరిపోతున్నవి (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md విరిగిన లింకులు**: `production-ai-practices.md` ను `../chapter-08-production/production-ai-practices.md` కు సరిచేశారు (3 చోట్ల)
- **📦 agents.md లో డిప్రికేటెడ్ కోడ్**: `opencensus` ను `azure-monitor-opentelemetry` + OpenTelemetry SDK తో మార్చారు
- **🐛 agents.md లో చెల్లని API**: `max_tokens` ను `create_agent()` నుండి `create_run()` లో `max_completion_tokens` గా తరలించారు
- **🔢 agents.md టోకెన్ కౌంటింగ్**: సాధారణ `len//4` అంచనాను `tiktoken.encoding_for_model()` తో మార్చారు
- **azure-search-openai-demo**: సేవల పేర్లను "Cognitive Search + App Service" నుండి "Azure AI Search + Azure Container Apps" గా సరి తెలిపారు (డిఫాల్ట్ హోస్ట్ అక్టోబర్ 2024 లో మార్చబడింది)
- **contoso-chat**: వివరణను Azure AI Foundry + Prompty కి సూచించడం కోసం నవీకరించారు, ఇది రిపో యొక్క వాస్తవ శీర్షిక మరియు టెక్ స్టాక్‌కు సరిపోతుంది

#### Removed
- **ai-document-processing**: పనిచేయని టెంప్లేట్ సూచనను తొలగించారు (రీపో పబ్లిక్‌గా అందుబాటులో లేదు అందువల్ల AZD టెంప్లేట్‌గా పనిచేయట్లేదు)

#### Improved
- **📝 agents.md వ్యాయామాలు**: Exercise 1 ఇప్పుడు ఆశించిన అవుట్‌పుట్ మరియు `azd monitor` దశను చూపిస్తుంది; Exercise 2 పూర్తిస్థాయి `FunctionTool` రిజిస్ట్రీ కోడ్‌ను కలిగి ఉంటుంది; Exercise 3 అస్పష్ట మార్గదర్శకాన్ని నిజమైన `prepdocs.py` కమాండ్లతో భర్తీ చేసింది
- **📚 agents.md వనరులు**: డాక్యుమెంటేషన్ లింకులను ప్రస్తుత Azure AI Agent Service డాక్స్ మరియు క్విక్‌స్టార్ట్‌కు నవీకరించారు
- **📋 agents.md Next Steps పట్టిక**: పూర్తి అధ్యాయ కవరేజ్ కోసం AI వర్క్షాప్ లాబ్ లింక్ జోడించారు

#### Files Updated
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
**ఈ సంస్కరణ మెరుగైన పట్టిక ఫార్మాట్‌తో README.md అధ్యాయ నావిగేషన్‌ను మెరుగుపరుస్తుంది.**

#### మార్చబడింది
- **కోర్సు మ్యాప్ పట్టిక**: ప్రత్యక్ష పాఠ లింకులు, కాల వ్యవధి అంచనాలు, మరియు క్లిష్టత రేటింగ్స్ తో మెరుగుపరచబడింది
- **ఫోల్డర్ శుభ్రపరచడం**: మిగిలిన పాత ఫోల్డర్‌లను తీసివేశారు (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **లింక్ ధృవీకరణ**: కోర్సు మ్యాప్ పట్టికలో ఉన్న అన్ని 21+ అంతర్గత లింకులు ధృవీకరించబడ్డాయి

### [v3.16.0] - 2026-02-05

#### ఉత్పత్తి పేరు నవీకరణలు
**ఈ సంస్కరణ ప్రస్తుత Microsoft బ్రాండింగ్‌కు ఉత్పత్తి సూచనలను నవీకరిస్తుంది.**

#### మార్చబడింది
- **Microsoft Foundry → Microsoft Foundry**: అన్ని సూచనలు నాన్-ట్రాన్స్‌లేషన్ ఫైళ్లలో నవీకరించబడ్డాయి
- **Azure AI Agent Service → Foundry Agents**: సేవ పేరు ప్రస్తుత బ్రాండింగ్‌ను ప్రతిబింబించేందుకు నవీకరించబడినది

#### ఫైళ్ళు నవీకరించబడ్డాయి
- `README.md` - ప్రధాన కోర్సు ల్యాండింగ్ పేజీ
- `changelog.md` - వెర్షన్ చరిత్ర
- `course-outline.md` - కోర్సు నిర్మాణం
- `docs/chapter-02-ai-development/agents.md` - AI ఏజెంట్స్ గైడ్
- `examples/README.md` - ఉదాహరణల డాక్యుమెంటేషన్
- `workshop/README.md` - వర్క్షాప్ ల్యాండింగ్ పేజీ
- `workshop/docs/index.md` - వర్క్షాప్ సూచిక
- `workshop/docs/instructions/*.md` - అన్ని వర్క్షాప్ సూచనా ఫైళ్లు

---

### [v3.15.0] - 2026-02-05

#### ప్రధాన రిపోజిటరీ పునర్యథానం: అధ్యాయ-ఆధారిత ఫోల్డర్ పేర్లు
**ఈ సంస్కరణ స్పష్టమైన నావిగేషన్ కోసం డాక్యుమెంట్‌లను ప్రత్యేక అధ్యాయ ఫోల్డర్స్‌గా పునఃసంఘటిస్తుంది.**

#### ఫోల్డర్ పేరు మార్పులు
పాత ఫోల్డర్లు అధ్యాయ-సంఖ్యల ఫోల్డర్లతో మార్పు చేయబడ్డాయి:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### ఫైల్ మైగ్రేషన్లు
| ఫైల్ | నుంచి | కు |
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
- **📚 అధ్యాయ README ఫైళ్లు**: ప్రతి అధ్యాయ ఫోల్డర్‌లో README.md సృష్టించబడింది, ఇందులో:
  - అభ్యాస లక్ష్యాలు మరియు వ్యవధి
  - వివరణలతో పాఠ పట్టిక
  - తక్షణ ప్రారంభ ఆదేశాలు
  - ఇతర అధ్యాయాలకు నావిగేషన్

#### మార్చబడింది
- **🔗 అంతర్గత అన్ని లింకులు నవీకరించబడ్డాయి**: 78+ మార్గాలు అన్ని డాక్యుమెంటేషన్ ఫైళ్లలో నవీకరించబడ్డాయి
- **🗺️ ప్రధాన README.md**: కొత్త అధ్యాయ నిర్మాణంతో కోర్సు మ్యాప్ నవీకరించబడింది
- **📝 examples/README.md**: అధ్యాయ ఫోల్డర్లకు క్రాస్-రెఫరెన్సులు నవీకరించబడ్డాయి

#### తొలగించబడింది
- పాత ఫోల్డర్ నిర్మాణం తొలగించబడింది (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### రిపోజిటరీ పునర్యథనం: అధ్యాయ నావిగేషన్
**ఈ సంస్కరణ అధ్యాయ నావిగేషన్ README ఫైళ్లను జోడించింది (v3.15.0 ద్వారా ఆధిపత్యం పెట్టబడింది).**

---

### [v3.13.0] - 2026-02-05

#### కొత్త AI ఏజెంట్స్ గైడ్
**ఈ సంస్కరణ Azure Developer CLI తో AI ఏజెంట్లను విడుదలచేయడానికి సమగ్ర మార్గదర్శకాన్ని జోడిస్తుంది.**

#### జోడించబడింది
- **🤖 docs/microsoft-foundry/agents.md**: కవర్ చేసే పూర్తి గైడ్:
  - AI ఏజెంట్లు ఏమిటి మరియు అవి చాట్‌బాట్లతో ఎలా భేదపడతాయి
  - మూడింటి తక్షణ-ప్రారంభ ఏజెంట్ టెంప్లేట్లు (Foundry Agents, Prompty, RAG)
  - ఏజెంట్ ఆర్కిటెక్చర్ నమూనాలు (సింగిల్ ఏజెంట్, RAG, మల్టీ-ఏజెంట్)
  - టూల్ కాన్ఫిగరేషన్ మరియు అనుకూలీకరణ
  - మానిటరింగ్ మరియు మెట్రిక్స్ ట్రాకింగ్
  - ఖర్చుల పరిశీలనలు మరియు ఆప్టిమైజేషన్
  - సాధారణ సమస్య పరిష్కార సూచనలు
  - విజయ క్రైటీరియా కలిగిన మూడు ప్రాక్టికల్ అభ్యాసాలు

#### కంటెంట్ నిర్మాణం
- **పరిచయం**: ప్రారంభికుల కోసం ఏజెంట్ సూత్రాలు
- **త్వరిత ప్రారంభం**: ఏజెంట్లను డిప్లాయ్ చేయడానికి `azd init --template get-started-with-ai-agents`
- **ఆర్కిటెక్చర్ నమూనాలు**: ఏஜెంట్ నమూనాల యొక్క దృశ్య డయాగ్రామ్లు
- **కాన్ఫిగరేషన్**: టూల్ సెటప్ మరియు ఎన్‌విరాన్మెంట్ వేరియబుల్స్
- **మానిటరింగ్**: Application Insights ఇంటిగ్రేషన్
- **ప్రాక్టికల్స్**: ప్రగతిశీల ప్రాక్టికల్ నేర్చుకునే (ప్రతి ఒక్కటి 20-45 నిమిషాలు)

---

### [v3.12.0] - 2026-02-05

#### డెవ్‌కంటైనర్ పరిసర నవీకరణ
**ఈ సంస్కరణ AZD అభ్యాస అనుభవానికి ఆధునిక టూల్స్ మరియు మెరుగైన డిఫాల్ట్స్‌తో డెవలప్‌మెంట్ కంటైనర్ కాన్ఫిగరేషన్‌ను నవీకరిస్తుంది.**

#### మార్చబడింది
- **🐳 బేస్ ఇమేజ్**: `python:3.12-bullseye` నుండి `python:3.12-bookworm` కు నవీకరించబడింది (తాజా Debian స్థిర)
- **📛 కంటైనర్ పేరు**: స్పష్టత కోసం "Python 3" నుండి "AZD for Beginners" కు పేరు మార్చబడింది

#### జోడించబడింది
- **🔧 కొత్త Dev Container లక్షణాలు**:
  - `azure-cli` Bicep మద్దతుతో కూడి
  - `node:20` (AZD టెంప్లేట్స్ కోసం LTS సంస్కరణ)
  - `github-cli` టెంప్లేట్ నిర్వహణ కోసం
  - కంటైనర్ యాప్ డిప్లాయ్‌మెంట్‌ల కోసం `docker-in-docker`

- **🔌 పోర్ట్ ఫార్వార్డింగ్**: సామాన్య అభివృద్ధి కోసం ముందుగా కాన్ఫిగర్ చేసిన పోర్టులు:
  - 8000 (MkDocs ప్రివ్యూ)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 కొత్త VS Code ఎక్స్టెన్షన్స్**:
  - `ms-python.vscode-pylance` - మెరుగైన Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions మద్దతు
  - `ms-azuretools.vscode-docker` - Docker మద్దతు
  - `ms-azuretools.vscode-bicep` - Bicep భాష మద్దతు
  - `ms-azure-devtools.azure-resource-groups` - Azure రీసోర్సు నిర్వహణ
  - `yzhang.markdown-all-in-one` - Markdown ఎడిటింగ్
  - `DavidAnson.vscode-markdownlint` - Markdown లింటింగ్
  - `bierner.markdown-mermaid` - Mermaid డయాగ్రామ్ మద్దతు
  - `redhat.vscode-yaml` - YAML మద్దతు (for azure.yaml)
  - `eamodio.gitlens` - Git విజ్యువలైజేషన్
  - `mhutchie.git-graph` - Git చరిత్ర

- **⚙️ VS Code సెట్టింగ్స్**: Python ఇంటర్‌ప్రెటర్, సేవ్‌పై ఫార్మాట్ మరియు వైట్‌స్పేస్ ట్రిమ్మింగ్ కోసం డిఫాల్ట్ సెట్టింగ్స్ జోడించబడ్డాయి

- **📦 requirements-dev.txt నవీకరించబడింది**:
  - MkDocs minify ప్లగిన్ జోడించబడింది
  - కోడ్ నాణ్యత కోసం pre-commit జోడించబడింది
  - Azure SDK ప్యాకేజీలు జోడించబడ్డాయి (azure-identity, azure-mgmt-resource)

#### పరిష్కరించబడింది
- **Post-Create ఆదేశం**: ఇప్పుడు కంటైనర్ ప్రారంభంలో AZD మరియు Azure CLI సంస్థాపనను నిర్ధారిస్తుంది

---

### [v3.11.0] - 2026-02-05

#### ప్రారంభికులకు అనుకూల README పునర్నిర్మాణం
**ఈ సంస్కరణ README.md ను ప్రారంభికులకు అందుబాటు చేయడానికి గణనీయంగా మెరుగు పరుస్తుంది మరియు AI డెవలపర్లకు అవసరమైన వనరులు జోడిస్తుంది.**

#### జోడించబడింది
- **🆚 Azure CLI vs AZD సరిపోలిక**: ప్రతి టూల్‌ను ఎప్పుడు ఉపయోగించాలో వ్యావహారిక ఉదాహరణలతో స్పష్టమైన వివరణ
- **🌟 అద్భుత AZD లింకులు**: కమ్యూనిటీ టెంప్లేట్ గ్యాలరీ మరియు కాంట్రిబ్యూషన్ వనరులకు ప్రత్యక్ష లింకులు:
  - [అద్భుత AZD గ్యాలరీ](https://azure.github.io/awesome-azd/) - 200+ సిద్ధంగా డిప్లాయ్ చేయగల టెంప్లేట్లు
  - [టెంప్లేట్‌ను సమర్పించండి](https://github.com/Azure/awesome-azd/issues) - కమ్యూనిటీ కాంట్రిబ్యూషన్
- **🎯 తక్షణ ప్రారంభ మార్గదర్శి**: సరళమైన 3-దశల ఆరంభ విభాగం (Install → Login → Deploy)
- **📊 అనుభవ ఆధారిత నావిగేషన్ పట్టిక**: డెవలపర్ అనుభవం ప్రకారం ఎక్కడ మొదలుపెట్టాలో స్పష్టమైన మార్గదర్శనం

#### మార్చబడింది
- **README నిర్మాణం**: స్థాయిగత వెదజామా కోసం పునఃసంఘటించబడింది - ప్రధాన సమాచారం ముందుగా
- **పరిచయం విభాగం**: పూర్తిగా ప్రారంభికుల కోసం "The Magic of `azd up`" వివరణ ఇవ్వడానికి పునఃరాయించబడింది
- **నకిలీ విషయాన్ని తొలగించడం**: డూప్లికేట్ ట్రబుల్‌షూటింగ్ విభాగాన్ని తొలగించబడింది
- **ట్రబుల్‌షూటింగ్ ఆదేశాలు**: చెల్లని `azd logs` సూచనను సరైన `azd monitor --logs` ఉపయోగానికి సరి చేశారు

#### పరిష్కరించబడింది
- **🔐 ప్రామాణీకరణ ఆదేశాలు**: `azd auth login` మరియు `azd auth logout` cheat-sheet.md లో జోడించబడ్డాయి
- **చెల్లని ఆదేశ సూచనలు**: README ట్రబుల్‌షూటింగ్ విభాగంలో మిగిలివుండే `azd logs` తీసివేయబడింది

#### గమనికలు
- **వ్యాప్తి**: మార్పులు ప్రధాన README.md మరియు resources/cheat-sheet.md కు వర్తించబడినవి
- **లక్ష్య ప్రేక్షకులు**: AZD కొత్తగా ఉన్న డెవలపర్లకి ప్రత్యేకంగా లక్ష్యంగా పెట్టుకుని మెరుగుదలలు

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI ఆదేశ ఖచ్చితత్వం నవీకరణ
**ఈ సంస్కరణ డాక్యుమెంటేషన్ మొత్తం చెల్లని AZD ఆదేశాలను సరిచేస్తుంది, అన్ని కోడ్ ఉదాహరణలు చెల్లుబాటు అయ్యే Azure Developer CLI సింటాక్స్ ఉపయోగించారని నిర్ధారిస్తుంది.**

#### పరిష్కరించబడింది
- **🔧 ఆకార్ లేని AZD ఆదేశాలు తొలగించబడ్డాయి**: చెల్లని ఆదేశాల సమగ్ర ఆడిట్ మరియు సవరణ:
  - `azd logs` (ఉపలభ్యంకాదు) → `azd monitor --logs` లేదా Azure CLI ప్రత్యామ్నాయాలతో మార్చబడింది
  - `azd service` subcommands (ఉపలభ్యంకాదు) → `azd show` మరియు Azure CLI తో మార్చబడినవి
  - `azd infra import/export/validate` (ఉపలభ్యంకాదు) → తీసివేయబడినవి లేదా చెల్లుబాటు అయ్యే ప్రత్యామ్నాయాలతో బదిలీ చేయబడ్డాయి
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` ఫ్లాగ్‌లు (ఉపలభ్యంకాదు) → తీసివేయబడ్డాయి
  - `azd provision --what-if/--rollback` ఫ్లాగ్‌లు (ఉపలభ్యంకాదు) → `--preview` ఉపయోగించడానికి నవీకరించబడ్డాయి
  - `azd config validate` (ఉపలభ్యంకాదు) → `azd config list` తో బదిలీ చేయబడింది
  - `azd info`, `azd history`, `azd metrics` (ఉపలభ్యంకాదు) → తీసివేయబడ్డాయి

- **📚 కమాండ్ సరిచేసిన ఫైళ్ళు**:
  - `resources/cheat-sheet.md`: కమాండ్ రిఫరెన్స్‌లో కమేష్ పరమైన సవరణ
  - `docs/deployment/deployment-guide.md`: రోల్‌బ్యాక్ మరియు డిప్లాయ్‌మెంట్ వ్యూహాలు సరిచేసాయి
  - `docs/troubleshooting/debugging.md`: లాగ్ విశ్లేషణ సెక్షన్లు సరి చేయబడ్డాయి
  - `docs/troubleshooting/common-issues.md`: ట్రబుల్‌షూటింగ్ ఆదేశాలు నవీకరించబడ్డాయి
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD డీబగ్గింగ్ సెక్షన్ సరి చేయబడింది
  - `docs/getting-started/azd-basics.md`: మానిటరింగ్ ఆదేశాలు సరిచేయబడ్డాయి
  - `docs/getting-started/first-project.md`: మానిటరింగ్ మరియు డీబగ్గింగ్ ఉదాహరణలు నవీకరించబడ్డాయి
  - `docs/getting-started/installation.md`: సహాయం మరియు వర్షన్ ఉదాహరణలు సరిచేయబడ్డాయి
  - `docs/pre-deployment/application-insights.md`: లాగ్ వీయింగ్ ఆదేశాలు సరిచేయబడ్డాయి
  - `docs/pre-deployment/coordination-patterns.md`: ఏజెంట్ డీబగ్గింగ్ ఆదేశాలు సరి చేయబడ్డాయి

#### మార్చబడింది
- **Rollback వ్యూహాలు**: AZDకు స్వదేశీ రోల్‌బ్యాక్ లేకపోవడంతో Git-ఆధారిత రోల్‌బ్యాక్ ఉపయోగించడానికి డాక్యూమెంటేషన్ నవీకరించబడింది
- **లాగ్ వీయింగ్**: `azd logs` సూచనలను `azd monitor --logs`, `azd monitor --live`, మరియు Azure CLI ఆదేశాలతో మార్చారు
- **పర్ఫార్మెన్స్ విభాగం**: లేవని parallel/incremental డిప్లాయ్‌మెంట్ ఫ్లాగ్‌లను తీసివేసి చెల్లుబాటు అయ్యే ప్రత్యామ్నాయాలు ఇచ్చారు

#### సాంకేతిక వివరాలు
- **చెల్లుబాటు అయ్యే AZD ఆదేశాలు**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **చెల్లుబాటు అయ్యే azd monitor ఫ్లాగ్‌లు**: `--live`, `--logs`, `--overview`
- **తొలగించబడిన ఫీచర్లు**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### గమనికలు
- **ధృవీకరణ**: ఆదేశాలను Azure Developer CLI v1.23.x కు సరిపోల్చి ధృవీకరించినవి

---

### [v3.9.0] - 2026-02-05

#### వర్క్షాప్ పూర్తి మరియు డాక్యుమెంటేషన్ నాణ్యత నవీకరణ
**ఈ సంస్కరణ ఇంటరాక్టివ్ వర్క్షాప్ మాడ్యూల్‌లను పూర్తి చేస్తుంది, అన్ని బగ్గడైన డాక్యుమెంటేషన్ లింకులను సరిచేస్తుంది, మరియు Microsoft AZD ఉపయోగించే AI డెవలపర్ల కోసం మొత్తం కంటెంట్ నాణ్యతను మెరుగుపరుస్తుంది.**

#### జోడించబడింది
- **📝 CONTRIBUTING.md**: క్రింది ప్రత్యేక అంశాలతో కొత్త కన్ట్రిబ్యూషన్ మార్గదర్శక డాక్యుమెంటు:
  - ఇష్యూలను నివేదించడానికి మరియు మార్పులను ప్రతిపాదించడానికి స్పష్టమైన సూచనలు
  - కొత్త కంటెంటుకు డాక్యుమెంటేషన్ ప్రమాణాలు
  - కోడ్ ఉదాహరణ మార్గదర్శకాలు మరియు కమిట్ మెసేజ్ కన్వెన్షన్స్
  - కమ్యూనిటీ పాల్గొనడం గురించి సమాచారం

####uelt పూర్తయినవి
- **🎯 Workshop Module 7 (సారాంశం)**: పూర్తి అయిన సారాంశ మాడ్యూల్:
  - వర్క్‌షాప్ విజయాల సమగ్ర సారాంశం
  - AZD, టెంప్లేట్లు మరియు Microsoft Foundry ను కవర్ చేసే కీలక భావనల విభాగం
  - అధ్యయన ప్రయాణం కొనసాగింపుకు సూచనలు
  - కష్టం రేటింగ్స్ ఉన్న వర్క్‌షాప్ ఛాలెంజ్ వ్యాయామాలు
  - కమ్యూనిటీ ఫీడ్‌బ్యాక్ మరియు సపోర్ట్ లింక్స్

- **📚 Workshop Module 3 (Deconstruct)**: నవీకరించిన నేర్చుకునే లక్ష్యాలు:
  - MCP సర్వర్లతో GitHub Copilot యాక్టివేషన్ గైడెన్స్
  - AZD టెంప్లేట్ ఫోల్డర్ నిర్మాణం అవగాహన
  - Infrastructure-as-code (Bicep) సంస్థాగత నమూనాలు
  - హ్యాండ్స్-ఆన్ ల్యాబ్ సూచనలు

- **🔧 Workshop Module 6 (Teardown)**: పూర్తి చేయబడినవి:
  - వనరుల శుభ్రపరిచే విధానం మరియు ఖర్చు నిర్వహణ లక్ష్యాలు
  - సురక్షితంగా ఇన్ఫ్రాస్ట్రక్చర్‌ను డీప్రోవిజనింగ్ చేయడానికి `azd down` వాడుక
  - సాఫ్ట్-డిలీట్ అయిన cognitive services పునరుద్ధరణ మార్గదర్శకాలు
  - GitHub Copilot మరియు Azure Portal కోసం బోనస్ అన్వేషణ సూచనలు

#### Fixed
- **🔗 పగిలిపోయిన లింక్‌ల పరిష్కారాలు**: 15+ లోపంగా ఉన్న అంతర్గత డాక్యుమెంటేషన్ లింక్స్ ను పరిష్కరించాం:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md కు మార్గాలను సరిచేశాం
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md మరియు production-ai-practices.md మార్గాలను సరిచేశాం
  - `docs/getting-started/first-project.md`: ఉనికిలో లేని cicd-integration.md ను deployment-guide.md తో మార్చాం
  - `examples/retail-scenario.md`: FAQ మరియు ట్రబుల్షూటింగ్ గైడ్ మార్గాలను సరిచేశాం
  - `examples/container-app/microservices/README.md`: కోర్సు హోమ్ మరియు డిప్లాయ్‌మెంట్ గైడ్ మార్గాలను సరిచేశాం
  - `resources/faq.md` మరియు `resources/glossary.md`: AI అధ్యాయం సూచనలను నవీకరించాం
  - `course-outline.md`: ఇన్‌స్ట్రక్టర్ గైడ్ మరియు AI వర్క్‌షాప్ ల్యాబ్ సూచనలను సరిచేశాం

- **📅 Workshop Status Banner**: "Under Construction" నుండి చురుకైన వర్క్‌షాప్ స్థితికి నవీకరించబడింది, తేదీ: ఫిబ్రవరి 2026

- **🔗 Workshop Navigation**: workshop README.md లోని లేదు ఉన్న lab-1-azd-basics ఫోల్డర్ వైపు సూచించే బ్రోకెన్ నావిగేషన్ లింక్‌లను సరిచేశాం

#### Changed
- **Workshop Presentation**: "under construction" హెచ్చరికని తీసివేశారు, వర్క్‌షాప్ ఇప్పుడు పూర్తిగా సిద్ధంగా మరియు ఉపయోగానికి సిద్ధంగా ఉంది
- **Navigation Consistency**: అన్ని వర్క్‌షాప్ మాడ్యూల్కు సరైన మధ్య-మాడ్యూల్ నావిగేషన్ అమలు చేయబడింది
- **Learning Path References**: ధృవీకృత microsoft-foundry మార్గాలను ఉపయోగించడానికి అధ్యాయ క్రాస్-రెఫరెన్సెస్ నవీకరించబడ్డాయి

#### Validated
- ✅ అన్ని ఇంగ్లీష్ మార్క్డౌన్ ఫైళ్లకి సరైన అంతర్గత లింక్స్ ఉన్నట్టుగా నిర్ధారించబడింది
- ✅ వర్క్‌షాప్ మాడ్యూల్స్ 0-7 నేర్చుకునే లక్ష్యాలతో పూర్తి చేయబడ్డాయి
- ✅ అధ్యాయాల మధ్య మరియు మాడ్యూల్స్ మధ్య నావిగేషన్ సరిగ్గా పని చేస్తుంది
- ✅ కంటెంట్ Microsoft AZD ఉపయోగించే AI డెవలపర్లకు అనుకూలంగా ఉంది
- ✅ ప్రారంభ స్థాయి ఫ్రెండ్లీ భాష మరియు నిర్మాణం కొనసాగించబడింది
- ✅ CONTRIBUTING.md కమ్యూనిటీ కాంట్రిబ్యూటర్లకు స్పష్టమైన మార్గదర్శకాన్ని అందిస్తుంది

#### Technical Implementation
- **Link Validation**: ఆటోమెటెడ్ PowerShell స్క్రిప్ట్ అన్ని .md అంతర్గత లింక్స్ ను ధృవీకరించింది
- **Content Audit**: వర్క్‌షాప్ పూర్తి స్థాయిని మరియు ప్రారంభకులకి సరిపోవడాన్ని మాన్యువల్ రివ్యూ ద్వారా నిర్ధారించారు
- **Navigation System**: స్థిరమైన అధ్యాయ మరియు మాడ్యూల్ నావిగేషన్ ప్యాటర్న్స్ వర్తించబడ్డాయి

#### Notes
- **Scope**: మార్పులు కేవలం ఇంగ్లీష్ డాక్యుమెంటేషన్‌కు వర్తిస్తాయి
- **Translations**: అనువాద ఫోల్డర్లు ఈ వెర్షన్‌లో నవీకరించబడలేదు (ఆటోమేటెడ్ అనువాదం తరువాత సింక్ అవుతుంది)
- **Workshop Duration**: పూర్తి వర్క్‌షాప్ ఇప్పుడు 3-4 గంటల హ్యాండ్స్-ఆన్ శిక్షణని అందిస్తుంది

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**ఈ వెర్షన్ Application Insights ఇంటిగ్రేషన్, ఆథెంటికేషన్ ప్యాటర్న్స్, మరియు ప్రొడక్షన్ డిప్లాయ్‌మెంట్స్ కోసం మల్టీ-ఏజెంట్ koordinేషన్ పై సమగ్ర A-గ్రేడ్ పాఠ్యాంశాలను జోడిస్తుంది.**

#### Added
- **📊 Application Insights Integration Lesson**: `docs/pre-deployment/application-insights.md` లో:
  - ఆటోమేటిక్ ప్రోవిజనింగ్‌తో AZD-కేంద్రీకృత డిప్లాయ్‌మెంట్
  - Application Insights + Log Analytics కోసం పూర్తయిన Bicep టెంప్లేట్లు
  - కస్టమ్ టెలిమెట్రీతో పనిచేసే Python అప్లికేషన్లు (1,200+ పంక్తులు)
  - AI/LLM మానిటరింగ్ ప్యాటర్న్లు (Microsoft Foundry Models టోకెన్/ఖర్చు ట్రాకింగ్)
  - 6 Mermaid డయాగ్రామ్లు (ఆర్కిటెక్చర్, డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్, టెలిమెట్రీ ఫ్లో)
  - 3 హ్యాండ్స్-ఆన్ వ్యాయామాలు (అలెర్ట్స్, డాష్‌బోర్డులు, AI మానిటరింగ్)
  - Kusto క్వరీ ఉదాహరణలు మరియు ఖర్చు ఆప్టిమైజేషన్ వ్యూహాలు
  - లైవ్ మెట్రిక్స్ స్ట్రీమింగ్ మరియు రియల్-టైమ్ డీబగ్గింగ్
  - ఉత్పత్తి-సిద్ధ ప్యాటర్న్స్‌తో 40-50 నిమిషాల అధ్యయన సమయం

- **🔐 Authentication & Security Patterns Lesson**: `docs/getting-started/authsecurity.md` లో:
  - 3 ఆథెంటికేషన్ నమూనాలు (connection strings, Key Vault, managed identity)
  - సురక్షిత డిప్లాయ్‌మెంట్స్ కోసం పూర్తయిన Bicep ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు
  - Azure SDK ఇంటిగ్రేషన్‌తో Node.js అప్లికేషన్ కోడ్
  - 3 పూర్తయిన వ్యాయామాలు (managed identity ప్రారంభించడం, user-assigned identity, Key Vault రొటేషన్)
  - సెక్యూరిటీ బెస్ట్ ప్రాక్టీసులు మరియు RBAC కాన్ఫిగరేషన్లు
  - ట్రబుల్షూటింగ్ గైడ్ మరియు ఖర్చు విశ్లేషణ
  - ప్రొడక్షన్-సिद्ध్ పాస్‌వర్డ్‌లెస్ ఆథెంటికేషన్ ప్యాటర్న్స్

- **🤖 Multi-Agent Coordination Patterns Lesson**: `docs/pre-deployment/coordination-patterns.md` లో:
  - 5 సమన్వయ ప్యాటర్న్స్ (sequential, parallel, hierarchical, event-driven, consensus)
  - పూర్తి ఒർക്കిస్ట్రేటర్ సర్వీస్ ఇంప్లిమెంటేషన్ (Python/Flask, 1,500+ పంక్తులు)
  - 3 ప్రత్యేక ఏజెంట్ ఇంప్లిమెంటేషన్లు (Research, Writer, Editor)
  - మెసేజ్ క్యూయింగ్ కోసం Service Bus ఇంటిగ్రేషన్
  - డిస్ట్రిబ్యూటెడ్ సిస్టమ్స్ కోసం Cosmos DB స్టేట్ మేనేజ్‌మెంట్
  - ఏజెంట్ ఇన్‌టరాక్షన్లను చూపించిన 6 Mermaid డయాగ్రామ్లు
  - 3 ఆధునిక వ్యాయామాలు (టైమౌట్ హ్యాండ్లింగ్, రీట్రై లాజిక్, సర్క్యూట్ బ్రేకర్)
  - ఖర్చు విభజన ($240-565/month) మరియు ఆప్టిమైజేషన్ వ్యూహాలు
  - మానిటరింగ్ కోసం Application Insights ఇంటిగ్రేషన్

#### Enhanced
- **Pre-deployment Chapter**: ఇప్పుడు మానిటరింగ్ మరియు సమన్వయ ప్యాట్రన్‌లను విస్తృతంగా కలిగి ఉంది
- **Getting Started Chapter**: ప్రొఫెషనల్ ఆథెంటికేషన్ ప్యాటర్న్స్‌తో మెరుగైనది
- **Production Readiness**: సెక్యూరిటీ నుంచి ఆబ్జర్వబిలిటీ వరకు పూర్తి కవర్ చేయబడింది
- **Course Outline**: చాప్టర్లు 3 మరియు 6 లో కొత్త పాఠ్యాంశాలను సూచించేలా నవీకరించబడింది

#### Changed
- **Learning Progression**: కోర్సులో సెక్యూరిటీ మరియు మానిటరింగ్ యొక్క మెరుగైన సమన్వయం
- **Documentation Quality**: కొత్త పాఠ్యాంశాలు అంతటా స్థిరమైన A-గ్రేడ్ ప్రమాణాలు (95-97%)
- **Production Patterns**: ఎంటర్ప్రైజ్ డిప్లాయ్‌మెంట్స్ కోసం పూర్తి ఎండ్-టు-ఎండ్ కవరేజ్

#### Improved
- **Developer Experience**: డెవలప్‌మెంట్ నుండి ప్రొడక్షన్ మానిటరింగ్ వరకు స్పష్టమైన మార్గం
- **Security Standards**: ఆథెంటికేషన్ మరియు సీక్రెట్స్ నిర్వహణ కోసం ప్రొఫెషనల్ ప్యాటర్న్స్
- **Observability**: AZD తో పూర్తయిన Application Insights ఇంటిగ్రేషన్
- **AI Workloads**: Microsoft Foundry Models మరియు మల్టీ-ఏజెంట్ సిస్టమ్స్ కోసం ప్రత్యేక మానిటరింగ్

#### Validated
- ✅ అన్ని పాఠ్యాంశాలు పూర్తిగా పని చేసే కోడ్ కలిగి ఉన్నాయి (స్నిపెట్లుగా కాదు)
- ✅ విజువల్ నేర్చుకునే కోసం Mermaid డయాగ్రామ్లు (మొత్తం 19 మూడు పాఠ్యాంశాల్లో)
- ✅ ధృవీకరణ అడుగులతో హ్యాండ్స్-ఆన్ వ్యాయామాలు (మొత్తం 9)
- ✅ `azd up` ద్వారా డిప్లాయ్ చేయదగిన ప్రొడక్షన్-సిద్ధ Bicep టెంప్లేట్లు
- ✅ ఖర్చు విశ్లేషణ మరియు ఆప్టిమైజేషన్ వ్యూహాలు
- ✅ ట్రబుల్షూటింగ్ గైడ్లు మరియు బెస్ట్ ప్రాక్టీసులు
- ✅ వెరిఫికేషన్ ఆదేశాలతో జ్ఞాన చెక్పాయింట్లు

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - సమగ్ర మానిటరింగ్ గైడ్
- **docs/getting-started/authsecurity.md**: - ప్రొఫెషనల్ సెక్యూరిటీ ప్యాటర్న్లు
- **docs/pre-deployment/coordination-patterns.md**: - అధునాతన మల్టీ-ఏజెంట్ ఆర్కిటెక్చర్లు
- **Overall New Content**: - స్థిరమైన ఉన్నత-నాణ్యత ప్రమాణాలు

#### Technical Implementation
- **Application Insights**: Log Analytics + కస్టమ్ టెలిమెట్రీ + డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్
- **Authentication**: Managed Identity + Key Vault + RBAC ప్యాటర్న్లు
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ఒర్కిస్ట్రేషన్
- **Monitoring**: లైవ్ మెట్రిక్స్ + Kusto క్వెరీలు + అలెర్ట్స్ + డాష్‌బోర్డులు
- **Cost Management**: శాంప్లింగ్ వ్యూహాలు, రిటెన్షన్ పాలీసీలు, బడ్జెట్ నియంత్రణలు

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**ఈ వెర్షన్ రిపాజిటరీ అంతటా డాక్యుమెంటేషన్ నాణ్యతను మెరుగుపరుస్తూ gpt-4.1 చాట్ ఇంటర్ఫేస్ తో పూర్తి Microsoft Foundry Models డిప్లాయ్‌మెంట్ ఉదాహరణను జోడిస్తుంది.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: `examples/azure-openai-chat/` లో పూర్తి gpt-4.1 డిప్లాయ్‌మెంట్:
  - Microsoft Foundry Models ఇన్ఫ్రాస్ట్రక్చర్ పూర్తి (gpt-4.1 మోడల్ డిప్లాయ్‌మెంట్)
  - సంభాషణ చరిత్రతో Python కమాండ్-లైన్ చాట్ ఇంటర్‌ఫేస్
  - సురక్షిత API కీ నిల్వ కోసం Key Vault ఇంటిగ్రేషన్
  - టోకెన్ వినియోగ ట్రాకింగ్ మరియు ఖర్చు అంచనా
  - రేట్‌లిమిటింగ్ మరియు ఎర్రర్ హ్యాండ్లింగ్
  - 35-45 నిమిషాల డిప్లాయ్‌మెంట్ గైడ్‌తో సమగ్ర README
  - 11 ప్రొడక్షన్-సిద్ధ ఫైల్స్ (Bicep టెంప్లేట్లు, Python యాప్, కాన్ఫిగరేషన్)
- **📚 Documentation Exercises**: కాన్ఫిగరేషన్ గైడ్‌కు హ్యాండ్స్-ఆన్ ప్రాక్టీస్ వ్యాయామాలు జోడించబడినవి:
  - వ్యాయామం 1: మల్టీ-ఎన్విరాన్‌మెంట్ కాన్ఫిగరేషన్ (15 నిమిషాలు)
  - వ్యాయామం 2: సీక్రెట్ మేనేజ్‌మెంట్ ప్రాక్టీస్ (10 నిమిషాలు)
  - స్పష్టమైన విజయ ప్రమాణాలు మరియు ధృవీకరణ స్టెప్‌లు
- **✅ Deployment Verification**: డిప్లాయ్‌మెంట్ గైడ్‌కు వెరిఫికేషన్ విభాగం జోడించబడినది:
  - హెల్త్ చెక్ ప్రక్రియలు
  - విజయ ప్రమాణాల చెక్లిస్ట్
  - అన్ని డిప్లాయ్‌మెంట్ ఆదేశాల కోసం ఆశించిన అవుట్‌పుట్స్
  - ట్రబుల్షూటింగ్ షార్ట్-రెఫరెన్స్

#### Enhanced
- **examples/README.md**: A-గ్రేడ్ నాణ్యత (93%) కి నవీకరించబడింది:
  - azure-openai-chat అన్ని సంబంధిత సెక్షన్లలో జోడించబడింది
  - స్థానిక ఉదాహరణల సంఖ్య 3 నుండి 4 కి అప్‌డేట్ చేయబడింది
  - AI అప్లికేషన్ ఉదాహరణల పట్టికలో చేరుచేసింది
  - ఇంటర్మీడియేట్ వినియోగదారుల కోసం క్విక్ స్టార్ట్‌లో సమీకృతం
  - Microsoft Foundry టెంప్లేట్స్ విభాగంలో చేర్చబడింది
  - కాంపెరిజన్ మ్యాట్రిక్స్ మరియు టెక్నాలజీ సెక్షన్లను నవీకరించింది
- **Documentation Quality**: docs ఫోల్డర్ అంతటా B+ (87%) → A- (92%) గా మెరుగుపరచబడింది:
  - కీలక కమాండ్ ఉదాహరణలకు ఆశించిన అవుట్‌పుట్స్ జోడించబడ్డాయి
  - కాన్ఫిగరేషన్ మార్పుల ధృవీకరణ స్టెప్పులు చేర్చబడ్డాయి
  - ప్రాక్టికల్ వ్యాయామాలతో హ్యాండ్స్-ఆన్ నేర్చే అనుభవం మెరుగుపరిచారు

#### Changed
- **Learning Progression**: ఇంటర్మీడియేట్ లెర్నర్ల కోసం AI ఉదాహరణల బెటర్ ఇంటిగ్రేషన్
- **Documentation Structure**: స్పష్టమైన ఫలితాలతో మరింత చర్యాత్మక వ్యాయామాలు
- **Verification Process**: కీలక వర్క్‌ఫ్లోలకు స్పష్టం చేసిన విజయం ప్రమాణాలు జోడించబడ్డాయి

#### Improved
- **Developer Experience**: Microsoft Foundry Models డిప్లాయ్‌మెంట్ ఇప్పుడంటే 35-45 నిమిషాల వ్యవధి (సంక్లిష్ట బదులుగా 60-90 నిమిషాల స్థానంలో)
- **Cost Transparency**: Microsoft Foundry Models ఉదాహరణకు స్పష్టమైన ఖర్చు అంచనాలు ($50-200/month)
- **Learning Path**: AI డెవలపర్లకు azure-openai-chat తో స్పష్టమైన ఎంట్రీ పాయింట్
- **Documentation Standards**: కీలక కమాండ్‌లకు స్థిరమైన ఆశించిన అవుట్‌పుట్స్ మరియు వరిఫికేషన్ స్టెప్పులు

#### Validated
- ✅ Microsoft Foundry Models ఉదాహరణ పూర్తి పనితీరు కలిగి `azd up` తో డిప్లాయ్ అవుతుంది
- ✅ అన్ని 11 ఇంప్లిమెంటేషన్ ఫైల్స్ వాక్యరచనపరంగా సరిగా ఉన్నాయి
- ✅ README సూచనలు వాస్తవ డిప్లాయ్‌మెంట్ అనుభవానికి సరిపోతున్నాయి
- ✅ డాక్యుమెంటేషన్ లింక్స్ 8+ స్థలాలలో నవీకరించబడ్డాయి
- ✅ ఉదాహరణల ఇండెక్స్ 4 స్థానిక ఉదాహరణలను సరిగ్గా ప్రదర్శిస్తుంది
- ✅ పట్టికల్లో బహుళ బహిర్గత లింక్స్ లేదు
- ✅ అన్ని నావిగేషన్ సూచనలు సరిగా ఉన్నాయి

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps ప్యాటర్న్
- **Security**: Managed Identity రెడీ, రహస్యాలు Key Vault లో
- **Monitoring**: Application Insights ఇంటిగ్రేషన్
- **Cost Management**: టోకెన్ ట్రాకింగ్ మరియు వినియోగ ఆప్టిమైజేషన్
- **Deployment**: పూర్తి సెటప్ కోసం ఒక్కే `azd up` ఆదేశం

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**ఈ వెర్షన్ Azure Developer CLI (AZD) ఉపయోగించి కంటెయినర్ అప్లికేషన్ డిప్లాయ్‌మెంట్ ఉదాహరణలను సమగ్రంగా, ప్రొడక్షన్-సిద్ధంగా ప్రవేశపరుస్తుంది, పూర్తి డాక్యుమెంటేషన్ మరియు లెర్నింగ్ పాథ్ ఇంటిగ్రేషన్‌తో.**

#### Added
- **🚀 Container App Examples**: కొత్త స్థానిక ఉదాహరణలు `examples/container-app/` లో:
  - [Master Guide](examples/container-app/README.md): కంటైనరైజ్డ్ డిప్లాయ్‌మెంట్స్ యొక్క పూర్తి అవ్లోకనం, క్విక్ స్టార్ట్, ప్రొడక్షన్, మరియు అధునాతన ప్యాటర్న్స్
  - [Simple Flask API](../../examples/container-app/simple-flask-api): స్కేల్-టు-జీరో, హెల్త్ ప్రోబ్స్, మానిటరింగ్, మరియు ట్రబుల్షూటింగ్ కలిగిన ప్రారంభకులకు అనుకూల REST API
  - [Microservices Architecture](../../examples/container-app/microservices): ప్రొడక్షన్-సిద్ధ బహు-సర్వీస్ డిప్లాయ్‌మెంట్ (API గేట్‌వే, Product, Order, User, Notification), అసింక్ మెసేజింగ్, Service Bus, Cosmos DB, Azure SQL, డిస్ట్రిబ్యూటెడ్ ట్రేసింగ్, బ్లూ-గ్రీన్/కెనరీ డిప్లాయ్‌మెంట్
- **Best Practices**: సెక్యూరిటీ, మానిటరింగ్, ఖర్చు ఆప్టిమైజేషన్, మరియు CI/CD మార్గదర్శకత్వం కంటైనరైజ్డ్ వర్క్‌లోడ్‌ల కోసం
- **Code Samples**: పూర్తి `azure.yaml`, Bicep టెంప్లేట్లు, మరియు బహుభాషా సర్వీస్ ఇంప్లిమెంటేషన్లు (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: ఎండ్-టు-ఎండ్ టెస్ట్ సీనారియోలు, మానిటరింగ్ ఆదేశాలు, ట్రబుల్షూటింగ్ సూచనలు

#### Changed
- **README.md**: కొత్త కంటెయినర్ అప్లికేషన్ ఉదాహరణలను "Local Examples - Container Applications" క్రింద ఫీచర్ చేసి లింక్ చేయడానికి నవీకరించింది
- **examples/README.md**: కంటెయినర్ అప్లికేషన్ ఉదాహరణలను హైలైట్ చేయడానికి, కాంపెరిజన్ మ్యాట్రిక్స్ ఎంట్రీలను జోడించడానికి, మరియు టెక్నాలజీ/ఆర్కిటెక్చర్ సూచనలను అప్‌డేట్ చేయడానికి నవీకరించింది
- **Course Outline & Study Guide**: సంబంధిత అధ్యాయాలలో కొత్త కంటెయినర్ అప్లికేషన్ ఉదాహరణలు మరియు డిప్లాయ్‌మెంట్ ప్యాటర్న్లను సూచించడానికి నవీకరించింది

#### Validated
- ✅ అన్ని కొత్త ఉదాహరణలు `azd up` తో డిప్లాయ్ చేయదగినవి మరియు బెస్ట్ ప్రాక్టీసులను అనుసరిస్తాయి
- ✅ డాక్యుమెంటేషన్ క్రాస్-లింక్స్ మరియు నావిగేషన్ నవీకరించబడ్డాయి
- ✅ ఉదాహరణలు ప్రారంభ స్థాయి నుండి అధునాతన సన్నివేశాల వరకు, ప్రొడక్షన్ మైక్రోసర్వీసులను కలిపి కవర్ చేయుతాయి

#### Notes
- **Scope**: ఇంగ్లీష్ డాక్యుమెంటేషన్ మరియు ఉదాహరణలు మాత్రమే
- **Next Steps**: భవిష్య విడుదలల్లో అదనపు అధునాతన కంటెయినర్ ప్యాటర్న్లు మరియు CI/CD ఆటోమేషన్‌తో విస్తరించాలి

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**ఈ వెర్షన్ ఇంగ్లీష్ డాక్యూమెంటేషన్ అంతటా ఉత్పత్తి పేరు మార్పును "Microsoft Foundry"గా అమలుచేస్తుంది, Microsoft యొక్క అధికారిక రీబ్రాండింగ్ ను ప్రతిబింబిస్తూ.**

#### Changed
- **🔄 Product Name Update**: "Microsoft Foundry" కు పూర్తి రీబ్రాండింగ్
  - English డాక్యూమెంటేషన్‌లోని అన్ని సూచనలను నవీకరించబడినవి `docs/` ఫోల్డర్‌లో
  - ఫోల్డర్ పేరు మార్చబడింది: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - ఫైల్ పేరు మార్చబడింది: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - మొత్తం: 7 డాక్యుమెంటేషన్ ఫైల్స్‌లో 23 కంటెంట్ రిఫరెన్సులు నవీకరించబడ్డాయి

- **📁 ఫోల్డర్ నిర్మాణ మార్పులు**:
  - `docs/ai-foundry/` ను `docs/microsoft-foundry/` గా పేరు మార్చారు
  - కొత్త ఫోల్డర్ నిర్మాణాన్ని ప్రతిబింబించేందుకు అన్ని క్రాస్-రెఫరెన్సులు నవీకరించబడ్డాయి
  - అన్ని డాక్యుమెంట్స్‌లో నావిగేషన్ లింకులు సరిచూసబడ్డాయి

- **📄 ఫైల్ పేరు మార్పులు**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - అన్ని లోపల లింకులు కొత్త ఫైల్ పేరును చూపించేలా నవీకరించబడ్డాయి

#### నవీకరించబడిన ఫైల్‌లు
- **అధ్యాయ డాక్యుస్యుమెంటేషన్** (7 ఫైల్‌లు):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 నావిగేషన్ లింక్ నవీకరణలు
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ఉత్పత్తి పేరు సూచనలు నవీకరించబడ్డాయి
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ఇప్పటికే Microsoft Foundry ఉపయోగంలో ఉంది (మునుపటి నవీకరణల నుండి)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 సూచనలు నవీకరించబడ్డాయి (అవలోకనం, కమ్యూనిటీ ఫీడ్బ్యాక్, డాక్యుమెంటేషన్)
  - `docs/getting-started/azd-basics.md` - 4 క్రాస్-రెఫరెన్స్ లింకులు నవీకరించబడ్డాయి
  - `docs/getting-started/first-project.md` - 2 అధ్యాయ నావిగేషన్ లింకులు నవీకరించబడ్డాయి
  - `docs/getting-started/installation.md` - 2 తదుపరి అధ్యాయం లింకులు నవీకరించబడ్డాయి
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 సూచనలు నవీకరించబడ్డాయి (నావిగేషన్, Discord కమ్యూనిటీ)
  - `docs/troubleshooting/common-issues.md` - 1 నావిగేషన్ లింక్ నవీకరించబడింది
  - `docs/troubleshooting/debugging.md` - 1 నావిగేషన్ లింక్ నవీకరించబడింది

- **కోర్స్ స్ట్రక్చర్ ఫైల్స్** (2 ఫైల్‌లు):
  - `README.md` - 17 సూచనలు నవీకరించబడ్డాయి (కోర్స్ అవలోకనం, అధ్యాయ శీర్షికలు, టెంప్లేట్స్ సెక్షన్, కమ్యూనిటీ సూచనలు)
  - `course-outline.md` - 14 సూచనలు నవీకరించబడ్డాయి (అవలోకనం, నేర్చుకోవడం లక్ష్యాలు, అధ్యాయ వనరులు)

#### ధృవీకరించబడింది
- ✅ ఇంగ్లీష్ డాక్యుమెంట్స్‌లో "ai-foundry" ఫోల్డర్ పాత్ రిఫరెన్సులు మరొకటి మిగలలేదు
- ✅ ఇంగ్లీష్ డాక్యుమెంట్స్‌లో "Microsoft Foundry" ఉత్పత్తి పేరుకు సంబంధించిన ఏ రిఫరెన్సులు మిగలలేదు
- ✅ కొత్త ఫోల్డర్ నిర్మాణంతో అన్ని నావిగేషన్ లింకులు సరైనవిగా పనిచేస్తున్నాయి
- ✅ ఫైల్ మరియు ఫోల్డర్ పేరుప్రత్యేకణలు విజయవంతంగా పూర్తి అయ్యాయి
- ✅ అధ్యాయాల మధ్య క్రాస్-రెఫరెన్సులు ధృవీకరించబడ్డాయి

#### గమనికలు
- **వ్యాప్తి**: మార్పులు కేవలం `docs/` ఫోల్డర్‌లోని ఇంగ్లీష్ డాక్యుమెంటేషన్‌లో అమర్చబడ్డాయి
- **అనువాదాలు**: అనువాద ఫోల్డర్లు (`translations/`) ఈ వెర్షన్లో నవీకరించబడలేదు
- **వర్క్‌షాప్**: వర్క్‌షాప్ మెటీరియల్స్ (`workshop/`) ఈ వెర్షన్లో నవీకరించబడలేదు
- **ఉదాహరణలు**: ఉదాహరణ ఫైళ్లు ఇంకా పాత నామకరణాన్ని సూచించే అవకాశం ఉంది (తర్వాతి నవీకరణలో పరిష్కరించబడుతుంది)
- **బాహ్య లింకులు**: బాహ్య URLs మరియు GitHub రిపాజిటరీ సూచనలు మారబడ్డాయి కాదని నిలిపి ఉన్నారు

#### కాంట్రిబ్యూటర్ల కోసం మైగ్రేషన్ గైడ్
If you have local branches or documentation referencing the old structure:
1. ఫోల్డర్ రిఫరెన్సులను నవీకరించండి: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. ఫైల్ రిఫరెన్సులను నవీకరించండి: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. ఉత్పత్తి పేరు మార్చండి: "Microsoft Foundry" → "Microsoft Foundry"
4. అన్ని లోపలి డాక్యుమెంట్ లింకులు ఇంకా పనిచేసుతున్నాయా అని ధృవీకరించండి

---

### [v3.4.0] - 2025-10-24

#### ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ మరియు ధృవీకరణ బలోపేతాలు
**ఈ వెర్షన్ కొత్త Azure Developer CLI ప్రివ్యూ ఫీచర్‌కు సమగ్ర మద్దతు పరిచయం చేస్తుంది మరియు వర్క్‌షాప్ వినియోగదారుల అనుభవాన్ని మెరుగుపరుస్తుంది.**

#### జోడించారు
- **🧪 azd provision --preview ఫీచర్ డాక్యుమెంటేషన్**: కొత్త ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ సామర్ధ్యానికి సమగ్ర కవర్
  - చీట్‌షీట్‌లో ఆజ్ఞా సూచిక మరియు ఉపయోగ ఉదాహరణలు
  - ప్రొవిజనింగ్ గైడ్‌లో కేస్‌ల మరియు ప్రయోజనాలతో తోడుగా సమగ్ర ఇంటిగ్రేషన్
  - సురక్షితమైన డిప్లాయ్‌మెంట్ ధృవీకరణ కోసం pre-flight చెక్ ఇంటిగ్రేషన్
  - సురక్ష్యత-ప్రథమ డిప్లాయ్‌మెంట్ ప్రక్రియలతో ప్రారంభ మార్గదర్శి నవీకరణలు
- **🚧 వర్క్‌షాప్ స్థితి బ్యానర్**: వర్క్‌షాప్ అభివృద్ధి స్థితిని సూచించే ప్రొఫెషనల్ HTML బ్యానర్
  - స్పష్టమైన వినియోగదారికి సమాచారానికి గ్రాడియెంట్ డిజైన్ మరియు కన్‌స్ట్రక్షన్ సూచనలు
  - పారదర్శకత్వానికి చివరిసారి నవీకరణ టైమ్‌స్టాంప్
  - అన్ని పరికర రకాల కోసం మొబైల్-స్పందనశీల డిజైన్

#### మెరుగుపరచబడింది
- **ఇన్ఫ్రాస్ట్రక్చర్ సేఫ్టీ**: ప్రివ్యూ ఫంక్షనాలిటీని డిప్లాయ్‌మెంట్ డాక్యుమెంటేషన్‌లో అంతులేని చేర్పు
- **ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ**: ఆటోమేటెడ్ స్క్రిప్ట్స్ ఇప్పుడు ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ టెస్టింగ్‌ను కలిగివుంటాయి
- **డెవలపర్ వర్క్‌ఫ్లో**: బెస్ట్ ప్రాక్టీస్‌గా ప్రివ్యూ కలిగి ఆజ్ఞా సరసరణలు నవీకరించబడ్డాయి
- **వర్క్‌షాప్ అనుభవం**: కాంటెంట్ అభివృద్ధి స్థితి గురించి వినియోగదారులకు స్పష్టం చేయబడిన సూచనలు

#### మార్పులు
- **డిప్లాయ్‌మెంట్ బెస్ట్ ప్రాక్టీసెస్**: ప్రివ్యూ-ఫస్ట్ వర్క్‌ఫ్లో ఇప్పుడు సిఫార్సు చేయబడే విధానం
- **డాక్యుమెంటేషన్ ప్రవాహం**: ఇన్ఫ్రాస్టక్చర్ ధృవీకరణను నేర్చుకునే ప్రక్రియలో ముందుగా దింపారు
- **వర్క్‌షాప్ ప్రెజెంటేషన్**: అభివృద్ధి టైమ్‌లైన్‌తో ప్రొఫెషనల్ స్థితి కమ్యూనికేషన్

#### మెరుగుపడింది
- **సురక్ష్యత-ప్రథమ దృక్పథం**: డిప్లాయ్ చేయకముందే ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ధృవీకరించవచ్చు
- **టీమ్ సహకారం**: సమీక్ష మరియు అనుమతికి ప్రివ్యూ ఫలితాలు పంచుకోవచ్చు
- **ఖర్చు అవగాహన**: ప్రొవిజన్ చేయకముందే వనరుల ఖర్చు గురించి మెరుగైన అవగాహన
- **రిస్క్ తగ్గించడం**: ముందస్తు ధృవీకరణ ద్వారా డిప్లాయ్‌మెంట్ తప్పిదాలు తగ్గాయి

#### సాంకేతిక అమలు
- **బహుళ-డాక్యుమెంటు ఇంటిగ్రేషన్**: ప్రివ్యూ ఫీచర్ 4 కీలక ఫైళ్లలో డాక్యుమెంట్ చేయబడింది
- **ఆజ్ఞా నమూనాలు**: సమానమైన సింటాక్స్ మరియు ఉదాహరణలు మొత్తం డాక్యుమెంటేషన్‌లో
- **బెస్ట్ ప్రాక్టీస్ ఇంటిగ్రేషన్**: వాలిడేషన్ వర్క్‌ఫ్లోలు మరియు స్క్రిప్ట్స్‌లో ప్రివ్యూ చేర్చబడింది
- **దృశ్య సూచికలు**: కొత్త ఫీచర్ కనుగొనడానికి స్పష్టమైన NEW సూచనలు

#### వర్క్‌షాప్ ఇన్ఫ్రాస్ట్రక్చర్
- **స్థితి కమ్యూనికేషన్**: గ్రాడియెంట్ శైలిద్వారా ప్రొఫెషనల్ HTML బ్యానర్
- **వినియోగదారుని అనుభవం**: అభివృద్ధి స్థితిలు বিভ్రాంతి నివారిస్తుంది
- **ప్రొఫెషనల్ ప్రెజెంటేషన్**:@Repository విశ్వసనీయతను నిర్వహిస్తూ అంచనాలు సెట్ చేయబడతాయి
- **టైమ్‌లైన్ పారదర్శకత**: బాధ్యతకై October 2025 చివరిసారి నవీకరణ టైమ్‌స్టాంప్

### [v3.3.0] - 2025-09-24

#### మెరుగుపడిన వర్క్‌షాప్ మెటీరియల్స్ మరియు ఇంటరాక్టివ్ లెర్నింగ్ అనుభవం
**ఈ వెర్షన్ బ్రౌజర్-ఆధారిత ఇంటరాక్టివ్ మార్గదర్శకాలు మరియు నిర్మిత శిక్షణ మార్గాలతో సమగ్ర వర్క్‌షాప్ మెటీరియల్స్‌ను పరిచయం చేస్తుంది.**

#### జోడించారు
- **🎥 ఇంటరాక్టివ్ వర్క్‌షాప్ గైడ్**: MkDocs ప్రివ్యూ సామర్థ్యంతో బ్రౌజర్-ఆధారిత వర్క్‌షాప్ అనుభవం
- **📝 నిర్మిత వర్క్‌షాప్ సూచనలు**: అన్వేషణ నుండి అనుకూలీకరణ దాకా 7-దశా మార్గదర్శక శ్రేణి
  - 0-Introduction: వర్క్‌షాప్ అవలోకనం మరియు సెటప్
  - 1-Select-AI-Template: టెంప్లేట్ అన్వేషణ మరియు ఎంపిక ప్రక్రియ
  - 2-Validate-AI-Template: డిప్లాయ్‌మెంట్ మరియు ధృవీకరణ చర్యలు
  - 3-Deconstruct-AI-Template: టెంప్లేట్ ఆర్కిటెక్చర్ అవగాహన
  - 4-Configure-AI-Template: కాన్ఫిగరేషన్ మరియు అనుకూలీకరణ
  - 5-Customize-AI-Template: అధునాతన మార్పులు మరియు పునరావృతాలు
  - 6-Teardown-Infrastructure: క్లీనప్ మరియు వనరుల నిర్వహణ
  - 7-Wrap-up: సారాంశం మరియు తదుపరి దశలు
- **🛠️ వర్క్‌షాప్ టూలింగ్**: మెరుగయిన లెర్నింగ్ అనుభవానికి Material థీమ్‌తో MkDocs కాన్ఫిగరేషన్
- **🎯 హ్యాండ్స్-ఆన్ లెర్నింగ్ పాత్**: 3-దశా విధానం (అన్వేషణ → డిప్లాయ్‌మెంట్ → అనుకూలీకరణ)
- **📱 GitHub Codespaces ఇంటిగ్రేషన్**: నిరంతర అభివృద్ధి వాతావరణానికి సజావుగా కనెక్ట్ అవ్వడం

#### మెరుగుపరచబడింది
- **AI వర్క్‌షాప్ లాబ్**: 2-3 గంటల నిర్మిత శిక్షణ అనుభవంతో విస్తరించబడింది
- **వర్క్‌షాప్ డాక్యుమెంటేషన్**: నావిగేషన్ మరియు దృశ్య సహాయాలతో ప్రొఫెషనల్ ప్రదర్శన
- **లెర్నింగ్ ప్రోగ్రెషన్**: టెంప్లేట్ ఎంపిక నుండి ప్రొడక్షన్ డిప్లాయ్‌మెంట్ వరకు స్పష్టమైన దశల వారీ మార్గదర్శకాలు
- **డెవలపర్ అనుభవం**: సమాహిత టూలింగ్ ద్వారా స్ట్రీమ్లైన్ చేయబడిన వర్క్‌ఫ్లోలు

#### మెరుగుపడింది
- **అభిగమ్యత**: శోధన, కాపీ ఫంక్షనాలిటీ మరియు థీమ్ టోగుల్ ఉన్న బ్రౌజర్-ఆధారిత ఇంటర్ఫేస్
- **స్వీయ-వేగంలో నేర్చుకోవడం**: వేరువేరు నేర్చుకునే వేగాలకు అనుగుణంగా లవచ్య స్ట్రక్చర్
- **ప్రయోగాత్మక అప్లికేషన్**: నిజజీవిత AI టెంప్లేట్ డిప్లాయ్‌మెంట్ సందర్భాలు
- **సమాజ కార్యకలాపం**: వర్క్‌షాప్ మద్దతుకు Discord ఇంటిగ్రేషన్

#### వర్క్‌షాప్ ఫీచర్లు
- **బిల్ట్-ఇన్ శోధన**: వేగవంతమైన కీలకపద మరియు పాఠం గుర్తింపు
- **కోడ్ బ్లాక్స్‌ను కాపీ చేయడం**: అన్ని కోడ్ ఉదాహరణల కోసం హోవర్-తో-కాపీ ఫంక్షనాలిటీ
- **థీమ్ టోగుల్**: వివిధ ఇష్టాలకు డార్క్/లైట్ మోడ్ మద్దతు
- **దృశ్య ఆస్తులు**: మెరుగైన అవగాహన కోసం స్క్రీన్‌షాట్లు మరియు డయాగ్రామ్లు
- **సహాయం ఇంటిగ్రేషన్**: కమ్యూనిటీ మద్దతుకు డైరెక్ట్ Discord యాక్సెస్

### [v3.2.0] - 2025-09-17

#### ముఖ్య నావిగేషన్ పునర్రృష్టి మరియు అధ్యాయ ఆధారిత శిక్షణ వ్యవస్థ
**ఈ వెర్షన్ మొత్తం రిపోజిటరీలో మెరుగైన నావిగేషన్‌తో మరియు అధ్యాయ-ఆధారిత శిక్షణ నిర్మాణంతో సమగ్ర అధ్యాయ పద్ధతిని పరిచయం చేస్తుంది.**

#### జోడించారు
- **📚 అధ్యాయ-ఆధారిత లెర్నింగ్ సిస్టమ్**: మొత్తం కోర్సును 8 ప్రగతిశీల అధ్యాయాలలో పునఃరూపరేఖగా విడగొట్టారు
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 సమగ్ర నావిగేషన్ సిస్టమ్**: అన్ని డాక్యుమెంటేషన్‌లో స్థిరమైన నావిగేషన్ హెడ్డర్లు మరియు ఫుటర్లు
- **🎯 పురోగతి ట్రాకింగ్**: కోర్స్ పూర్తి చెక్‌లిస్ట్ మరియు లెర్నింగ్ వెరిఫికేషన్ సిస్టమ్
- **🗺️ లెర్నింగ్ పాత్ మార్గదర్శనం**: వివిధ అనుభవ స్థాయిలు మరియు లక్ష్యాల కోసం స్పష్టమైన ప్రవేశ పాయింట్లు
- **🔗 క్రాస్-రెఫరెన్స్ నావిగేషన్**: సంబంధిత అధ్యాయాలు మరియు అవసరమైన ప్రీ-రెక్విజిట్‌లు స్పష్టంగా లింక్ చేయబడ్డాయి

#### మెరుగుపరచబడింది
- **README నిర్మాణం**: అధ్యాయ-ఆధారిత సంస్థాపనతో రీ_STRUCTURED
- **డాక్యుమెంటేషన్ నావిగేషన్**: ప్రతి పేజీ ఇప్పుడు అధ్యాయ కంటెక్స్ట్ మరియు ప్రోగ్రెషన్ మార్గదర్శకాలను కలిగి ఉంది
- **టెంప్లెట్ సంఘటన**: ఉదాహరణలు మరియు టెంప్లేట్లు సరైన అధ్యాయాలకు మ్యాప్ చేయబడ్డాయి
- **వనరుల సమగ్రత**: చీట్ షీట్స్, FAQs, మరియు స్టడీ గైడ్లు సంబంధిత అధ్యాయాలకు కనెక్ట్ చేయబడ్డాయి
- **వర్క్‌షాప్ ఇంటిగ్రేషన్**: హ్యాండ్స్-ఆన్ ల్యాబ్లు అనేక అధ్యాయల లెర్నింగ్ లక్ష్యాలకు మ్యాప్ చేయబడ్డాయి

#### మార్పులు
- **లెర్నింగ్ ప్రోగ్రెషన్**: లీనియర్ డాక్యుమెంటేషన్ నుండి వెర్సటైల్ అధ్యాయ-ఆధారిత లెర్నింగ్‌కు మార్పు
- **కాన్ఫిగరేషన్ ప్లేస్‌మెంట్**: మంచి నేర్చుకునే ప్రవాహానికి కన్ఫిగరేషన్ గైడ్‌ను Chapter 3 గా పునఃస్థాపించాం
- **AI కంటెంట్ ఇంటిగ్రేషన్**: లెర్నింగ్ ప్రయాణం అంతటా AI-స్పెసిఫిక్ కంటెంట్ మెరుగ్గా శాంపదీకరించబడింది
- **ప్రొడక్షన్ కంటెంట్**: ఎంటర్ప్రైజ్ కోసం అధునాతన నమూనాలను Chapter 8 లో సంకలితం చేశారు

#### మెరుగుపడింది
- **వినియోగదారు అనుభవం**: స్పష్టమైన నావిగేషన్ బ్రెడ్‌క్రంబ్‌లు మరియు అధ్యాయ పురోగతి సూచికలు
- **అభిగమ్యత**: సులభమైన కోర్స్ traversal కోసం స్థిరమైన నావిగేషన్ నమూనాలు
- **ప్రొఫెషనల్ ప్రెజెంటేషన్**: అకాడెమిక్ మరియు కార్పొరేట్ శిక్షణకు అనుకూలమైన విశ్వవిద్యాలయ శైలి కోర్స్ నిర్మాణం
- **లెర్నింగ్ సామర్థ్యాలు**: మెరుగైన సంస్థాపన ద్వారా సంబంధిత కంటెంట్ కనుక সহজంగా కనుగొనగలుగుతారు

#### సాంకేతిక అమలు
- **నావిగేషన్ హెడ్డర్లు**: 40+ డాక్యుమెంట్ ఫైళ్లలో స్టాండర్డైజ్ చేయబడిన అధ్యాయ నావిగేషన్
- **ఫుటర్ నావిగేషన్**: స్థిరమైన ప్రొగ్రెషన్ మార్గదర్శకాలు మరియు అధ్యాయ పూర్తి సూచికలు
- **క్రాస్-లింకింగ్**: సంబంధిత కాన్సెప్ట్‌లను కలుపుకునే సమగ్ర లోపలి లింకింగ్ సిస్టమ్
- **చాప్టర్ మ్యాపింగ్**: టెంప్లేట్లు మరియు ఉదాహరణలు లెర్నింగ్ లక్ష్యాలకు స్పష్టంగా అనుసంధానించబడ్డాయి

#### స్టడీ గైడ్ మెరుగుదల
- **📚 సమగ్ర లెర్నింగ్ ఆబ్జెక్టివ్స్**: 8-అధ్యాయ వ్యవస్థకు అనుగుణంగా స్టడీ గైడ్ పునఃరూపరేఖ
- **🎯 అధ్యాయ-ఆధారిత అసెస్‌మెంట్**: ప్రతి అధ్యాయానికి నిర్దిష్ట లెర్నింగ్ లక్ష్యాలు మరియు ప్రాక్టికల్ వ్యాయామాలు
- **📋 పురోగతి ట్రాకింగ్**: వారానికి ఒక లెర్నింగ్ షెడ్యూల్ మరియు పూర్తిచేసే చెక్‌లిస్ట్‌లు
- **❓ అసెస్‌మెంట్ ప్రశ్నలు**: ప్రతి అధ్యాయానికి నోలెడ్జ్ వెరిఫికేషన్ ప్రశ్నలు
- **🛠️ ప్రాక్టికల్ ఎక్సర్సైజ్‌లు**: నిజమైన డిప్లాయ్‌మెంట్ పరిస్థితులతో హ్యాండ్స్-ఆన్ కార్యకలాపాలు
- **📊 నైపుణ్య పురోగతి**: ప్రాథమిక కాన్సెప్ట్‌ల నుండి ఎంటర్ప్రైజ్ నమూనాల వరకు స్పష్టమైన అభివృద్ధి మార్గం
- **🎓 సర్టిఫికేషన్ ఫ్రేమ్‌వర్క్**: ప్రొఫెషనల్ డెవలప్‌మెంట్ అవుట్‌కమ్స్ మరియు కమ్యూనిటీ గుర్తింపు వ్యవస్థ
- **⏱️ టైమ్‌లైన్ నిర్వహణ**: మైలురాళ్ళు ధృవీకరించుకునే 10-వారాల నిర్మిత ప్లాన్

### [v3.1.0] - 2025-09-17

#### మెరుగైన బహుళ-ఏజెంట్ AI పరిష్కారాలు
**ఈ వెర్షన్ రిటైల్ బహుళ-ఏజెంట్ పరిష్కారంలో ఏజెంట్ పేరింగ్ మరియు డాక్యుమెంటేషన్‌ను మెరుగుపరుస్తుంది.**

#### మార్పులు
- **బహుళ-ఏజెంట్ పదజాలం**: రిటైల్ బహుళ-ఏజెంట్ పరిష్కారంలో స్పష్టత కోసం "Cora agent" ను "Customer agent" గా ప్రతిసారీ మార్చారు
- **ఏజెంట్ ఆర్కిటెక్చర్**: అన్ని డాక్యుమెంటేషన్, ARM టెంప్లేట్స్, మరియు కోడ్ ఉదాహరణల్లో "Customer agent" పేరును ఉపయోగించి నవీకరణలు
- **కాన్ఫిగరేషన్ ఉదాహరణలు**: నవీకరించిన పేరింగ్ కన్వెన్షన్లతో ఆధునిక agent కాన్ఫిగరేషన్ నమూనాలు
- **డాక్యుమెంటేషన్ సంతులనం**: అన్ని సూచనల్లో ప్రొఫెషనల్, వివరణాత్మక ఏజెంట్ పేర్లను ఉపయోగించడం నిర్ధారించబడింది

#### మెరుగుపరచబడింది
- **ARM టెంప్లేట్ ప్యాకేజ్**: Customer agent సూచనలతో retail-multiagent-arm-template నవీకరణ
- **ఆర్కిటెక్చర్ డయాగ్రామ్లు**: నవీకరించిన ఏజెంట్ పేరుతో Mermaid డయాగ్రామ్లు
- **కోడ్ ఉదాహరణలు**: Python క్లాసులు మరియు అమలులో ఇప్పుడు CustomerAgent అనే నామకరణ ఉపయోగం
- **ఇన్విరాన్‌మెంట్ వెరియబుల్స్**: అన్ని డిప్లాయ్‌మెంట్ స్క్రిప్ట్స్‌లో CUSTOMER_AGENT_NAME కాంవెన్షన్ అప్డేట్

#### మెరుగుపడింది
- **డెవలపర్ అనుభవం**: డాక్యుమెంటేషన్‌లో స్పష్టమైన ఏజెంట్ పాత్రలు మరియు బాధ్యతలు
- **ప్రొడక్షన్ రెడినెస్**: ఎంటర్ప్రైజ్ నామకరణ కన్వెన్షన్లకు మెరుగైన సరైకత్వం
- **లెర్నింగ్ మెటీరియల్స్**: శిక్షణ ప్రయోజనాల కోసం మరింత సహజమైన ఏజెంట్ పేరింగ్
- **టెంప్లెట్ వినియోగదారుడు అనుకూలత**: ఏజెంట్ ఫంక్షన్ల మరియు డిప్లాయ్‌మెంట్ నమూనాలను సులభంగా అర్థం చేసుకోవడం

#### సాంకేతిక వివరాలు
- Mermaid ఆర్కిటెక్చర్ డయాగ్రామ్లలో CustomerAgent సూచనలు నవీకరించబడ్డాయి
- Python ఉదాహరణల్లో CoraAgent క్లాస్ పేర్లను CustomerAgent తో మార్చింది
- ARM టెంప్లేట్ JSON కాన్ఫిగరేషన్‌లలో "customer" ఎజెంట్ టైప్ ఉపయోగానికి మార్పులు
- ఇన్విరాన్‌మెంట్ వెరియబుల్స్‌ను CORA_AGENT_* నుండి CUSTOMER_AGENT_* కాంవెన్షన్‌కు మార్చబడింది
- అన్ని డిప్లాయ్‌మెంట్ ఆజ్ఞలు మరియు కన్టెయినర్ కాన్ఫిగ్యురేషన్లు రిఫ్రెష్ చేయబడ్డాయి

### [v3.0.0] - 2025-09-12

#### ప్రధాన మార్పులు - AI డెవలపర్ ఫోకస్ మరియు Microsoft Foundry ఇన్‌టీగ్రేషన్
**ఈ వెర్షన్ రిపోజిటరీని AI-ఆధారిత సమగ్ర లెర్నింగ్ వనరుగా మరియు Microsoft Foundry ఇన్‌టిగ్రేషన్‌తో మార్చుతుంది.**

#### జోడించారు
- **🤖 AI-ఫస్ట్ లెర్నింగ్ పాత్**: AI డెవలపర్స్ మరియు ఇంజనీర్స్‌ను ప్రాధాన్యంగా చూసే పూర్తి పునర్నిర్మాణం
- **Microsoft Foundry Integration Guide**: AZDను Microsoft Foundry సేవలతో కనెక్ట్ చేయడానికి పూర్తి డాక్యుమెంటేషన్
- **AI మోడల్ డిప్లాయ్‌మెంట్ ప్యాటర్న్స్**: మోడల్ ఎంపిక, కాన్ఫిగరేషన్, మరియు ప్రొడక్షన్ డిప్లాయ్‌మెంట్ వ్యూహాలపై విస్తృత మార్గదర్శి
- **AI Workshop Lab**: 2-3 గంటల చేతికి-చేయి వర్క్‌‌షాప్, AI అప్లికేషన్లను AZD-డిప్లాయ్ చేయదగిన పరిష్కారాలుగా మార్చడానికి
- **Production AI Best Practices**: AI వర్క్‌లోడ్లు స్కేల్ చేయడము, మానిటరింగ్ చేయడము మరియు భద్రపరచడము కోసం ఎంటర్‌ప్రైజ్-తయారైన నమూనాలు
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry మోడల్స్, Cognitive Services మరియు AI డిప్లోయ్‌మెంట్ సమస్యల కోసం సమగ్ర ట్రబుల్‌షూటింగ్
- **AI Template Gallery**: క్లిష్టత రేటింగ్స్‌తో Microsoft Foundry టెంప్లేట్స్ యొక్క ప్రత్యేక సేకరణ
- **Workshop Materials**: చేతికి-చేయి ప్రయోగశాలలు మరియు సూచన పదార్థాలతో పూర్తి వర్క్‌‌షాప్ నిర్మాణం

#### Enhanced
- **README Structure**: AI-డెవలపర్‌పై దృష్టి పెట్టిన నిర్మాణం, Microsoft Foundry Discord నుండి 45% సంఘాల ఆసక్తి డేటాతో
- **Learning Paths**: విద్యార్థులు మరియు DevOps ఇంజనీర్ల కోసం సంప్రదాయ మార్గాలతో పాటు ప్రత్యేక AI డెవలపర్ ప్రయాణం
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, మరియు openai-chat-app-quickstart వంటి ఫీచర్డ్ AI టెంప్లేట్స్
- **Community Integration**: AI-స్పెసిఫిక్ చానెల్స్ మరియు చర్చలతో బలోపేతమైన Discord కమ్యూనిటీ మద్దతు

#### Security & Production Focus
- **Managed Identity Patterns**: AI-స్పెసిఫిక్ ఆథెంటికేషన్ మరియు సెక్యూరిటీ కాన్ఫిగరేషన్లు
- **Cost Optimization**: టోకెన్ వినియోగం ట్రాకింగ్ మరియు AI వర్క్‌లోడ్ల కోసం బడ్జెట్ నియంత్రణలు
- **Multi-Region Deployment**: గ్లోబల్ AI అప్లికేషన్ డిప్లాయ్‌మెంట్ కోసం వ్యూహాలు
- **Performance Monitoring**: AI-స్పెసిఫిక్ మెట్రిక్స్ మరియు Application Insights ఇంటిగ్రేషన్

#### Documentation Quality
- **Linear Course Structure**: ప్రారంభ స్థాయిలుండి అధునాతన AI డిప్లాయ్‌మెంట్ నమూనాల వరకు తార్కిక ప్రగతి
- **Validated URLs**: అన్ని బాహ్య రిపాజిటరీ లింకులు నిర్ధారించబడ్డవి మరియు యాక్సెస్ చేయదగినవి
- **Complete Reference**: అన్ని అంతర్గత డాక్యుమెంటేషన్ లింకులు నిర్ధారించబడ్డవి మరియు ఫంక్షనల్
- **Production Ready**: రియల్-వరల్డ్ ఉదాహరణలతో ఎంటర్‌ప్రైజ్ డిప్లాయ్‌మెంట్ నమూనాలు

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**ఈ వెర్షన్ రిపాజిటరీ నిర్మాణం మరియు కంటెంట్ ప్రదర్శనలో ముఖ్యమైన పునఃసంయోజనాన్ని సూచిస్తుంది.**

#### Added
- **Structured Learning Framework**: ఇప్పుడు అన్ని డాక్యుమెంటేషన్ పేజీలు పరిచయం, లెర్నింగ్ గోల్స్ మరియు లెర్నింగ్ అవుట్‌కమ్స్ విభాగాలను కలిగి ఉంటాయి
- **Navigation System**: మార్గనిర్దేశక పాఠ్య ప్రగతికి మార్గదర్శకంగా అన్ని డాక్యుమెంటేషన్‌లో Previous/Next పాఠ లింక్‌లు జోడించబడ్డాయి
- **Study Guide**: నేర్చుకునే లక్ష్యాలు, ప్రాక్టీస్ వ్యాయామాలు మరియు అసెస్‌మెంట్ పదార్థాలతో సమగ్ర study-guide.md
- **Professional Presentation**: మెరుగైన యాక్ససిబిలిటీ మరియు ప్రొఫెషనల్ రూపానికి అందులోని అన్ని ఇమోజీలను తొలగించారు
- **Enhanced Content Structure**: లెర్నింగ్ పదార్థాల యొక్క సమగ్ర నిర్వహణ మరియు ప్రవాహం మెరుగుపరచబడింది

#### Changed
- **Documentation Format**: నిరంతరంగా లెర్నింగ్-ఫోకస్డ్ నిర్మాణంతో అన్ని డాక్యుమెంటేషన్లను స్టాండర్డైజ్ చేయబడింది
- **Navigation Flow**: అన్ని లెర్నింగ్ పదార్థాల ద్వారా తార్కిక ప్రగతిని అమలు చేయబడింది
- **Content Presentation**: స్పష్టమైన, ప్రొఫెషనల్ ఫార్మాటింగ్ కోసం అలంకార ముల్యాలు తీసివేయబడ్డాయి
- **Link Structure**: కొత్త నావిగేషన్ సిస్టమ్‌కు మద్దతుగా అన్ని అంతర్గత లింకులు నవీకరించబడ్డాయి

#### Improved
- **Accessibility**: స్క్రీన్ రీడర్ అనుకూలత కోసం ఇమోజీ ఆధారితత్వాన్ని తొలగించడం
- **Professional Appearance**: ఎంటర్‌ప్రైజ్ లెర్నింగ్‌కు సరిపడే శుభ్రమైన, అకాడెమిక్ శైలి ప్రదర్శన
- **Learning Experience**: ప్రతి పాఠానికి స్పష్టమైన లక్ష్యాలు మరియు అవుట్‌కమ్స్‌తో నిర్మాణాత్మక విధానం
- **Content Organization**: సంబంధిత విషయాల మధ్య మెరుగైన తార్కిక ప్రవాహం మరియు కనెక్షన్

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - పూర్తి getting-started గైడ్ సిరీస్
  - సంపూర్ణ డిప్లాయ్‌మెంట్ మరియు ప్రోవిజనింగ్ డాక్యుమెంటేషన్
  - విపులమైన ట్రబుల్‌షూటింగ్ వనరులు మరియు డీబగ్గింగ్ గైడ్లు
  - ప్రీ-డిప్లాయ్‌మెంట్ వెరిఫికేషన్ టూల్స్ మరియు ప్రక్రియలు

- **Getting Started Module**
  - AZD Basics: ప్రాథమిక భావనలు మరియు పదజాలం
  - Installation Guide: ప్లాట్‌ఫార్మ్-స్పెసిఫిక్ సెటప్ సూచనలు
  - Configuration Guide: ఎన్విరాన్‌మెంట్ సెటప్ మరియు ఆథెంటికేషన్
  - First Project Tutorial: దశలవారీగా చేతికి-చేయి నేర్చుకుందాం

- **Deployment and Provisioning Module**
  - Deployment Guide: పూర్తి వర్క్‌‌ఫ్లో డాక్యుమెంటేషన్
  - Provisioning Guide: Bicep తో ఇన్ఫ్రాస్ట్రక్చర్ as Code
  - ప్రొడక్షన్ డిప్లాయ్‌‌మెంట్‌ల కోసం ఉత్తమ అభ్యాసాలు
  - మల్టీ-సర్వీస్ ఆర్కిటెక్చర్ నమూనాలు

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure రిసోర్స్ లబ్ధత వాలిడేషన్
  - SKU Selection: సేవ తరం గురించి సమగ్ర మార్గదర్శకత్వం
  - Pre-flight Checks: ఆటోమేటెడ్ వాలిడేషన్ స్క్రిప్ట్‌లు (PowerShell మరియు Bash)
  - ఖర్చు అంచనా మరియు బడ్జెట్ ప్లానింగ్ టూల్స్

- **Troubleshooting Module**
  - Common Issues: తరచుగా ఎదురయ్యే సమస్యలు మరియు పరిష్కారాలు
  - Debugging Guide: సిస్టమెటిక్ ట్రబుల్‌షూటింగ్ పద్ధతులు
  - అధునాతన డయాగ్నస్టిక్ సాంకేతికతలు మరియు టూల్స్
  - పనితీరు మానిటరింగ్ మరియు ఆప్టిమైజేషన్

- **Resources and References**
  - ఆదేశాల మూస: అవసరమైన కమాండ్లకు త్వరిత సూచన
  - గ్లోస్సరీ: సంపూర్ణ పదజాలం మరియు సంక్షిప్త రూపాల నిర్వచనలు
  - FAQ: సాధారణ ప్రశ్నలకు విపుల జవాబులు
  - బాహ్య వనరు లింకులు మరియు కమ్యూనిటీ కనెక్షన్లు

- **Examples and Templates**
  - సింపుల్ వెబ్ అప్లికేషన్ ఉదాహరణ
  - స్టాటిక్ వెబ్‌సైట్ డిప్లాయ్‌‌మెంట్ టెంప్లేట్
  - కంటెయినర్ అప్లికేషన్ కాన్ఫిగరేషన్
  - డేటాబేస్ ఇంటిగ్రేషన్ నమూనాలు
  - మైక్రోసర్వీసెస్ ఆర్కిటెక్చర్ ఉదాహరణలు
  - సర్వర్‌లెస్ ఫంక్షన్ అమలు విధానాలు

#### Features
- **Multi-Platform Support**: Windows, macOS, మరియు Linux కోసం ఇన్‌స్టాలేషన్ మరియు కాన్ఫిగరేషన్ గైడ్లు
- **Multiple Skill Levels**: విద్యార్థుల నుంచి ప్రొఫెషనల్ డెవలపర్‌ల వరకు రూపొందించిన కంటెంట్
- **Practical Focus**: చేతికి-చేయి ఉదాహరణలు మరియు రియల్-వర్డ్ సన్నివేశాలు
- **Comprehensive Coverage**: ప్రాథమిక భావనల నుంచి అధునాతన ఎంటర్‌ప్రైజ్ నమూనాల వరకు
- **Security-First Approach**: భద్రత ఉత్తమ చర్యలు అంతటా అనుసరించబడ్డాయి
- **Cost Optimization**: ఖర్చు సమర్థవంతంగా డిప్లాయ్‌మెంట్‌లు మరియు రిసోర్స్ నిర్వహణ కొరకు మార్గదర్శకత్వం

#### Documentation Quality
- **Detailed Code Examples**: ప్రాయోగిక, పరీక్షించబడిన కోడ్ నమూనాలు
- **Step-by-Step Instructions**: స్పష్టమైన, కార్యాచరణ-దారిత సూచనలు
- **Comprehensive Error Handling**: తరచుగా వచ్చే సమస్యలకు ట్రబుల్‌షూటింగ్
- **Best Practices Integration**: పరిశ్రమ ప్రమాణాలు మరియు సిఫార్సులు
- **Version Compatibility**: తాజా Azure సేవలు మరియు azd ఫీచర్లకు సమకాలీకరణ

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, మరియు కస్టమ్ మోడల్స్ కోసం ఇంటిగ్రేషన్ నమూనాలు
- **AI Agent Frameworks**: LangChain, Semantic Kernel, మరియు AutoGen డిప్లాయ్‌మెంట్‌లకు టెంప్లేట్స్
- **Advanced RAG Patterns**: Azure AI Search వెలుపల వెక్టర్ డేటాబేస్ ఎంపికలు (Pinecone, Weaviate, మొదలైనవి)
- **AI Observability**: మోడల్ పనితీరు, టోకెన్ వినియోగం, మరియు ప్రతిస్పందన నాణ్యత కోసం మెరుగైన మానిటరింగ్

#### Developer Experience
- **VS Code Extension**: AZD + Microsoft Foundry అభివృద్ధి అనుభవం ఐక్యీకృతంగా
- **GitHub Copilot Integration**: AI-సహాయంతో AZD టెంప్లేట్ జనరేషన్
- **Interactive Tutorials**: AI సన్నివేశాల కోసం ఆటోమేటెడ్ వెరిఫికేషన్‌తో చేతికి-చేయి కోడింగ్ వ్యాయామాలు
- **Video Content**: AI డిప్లాయ్‌మెంట్‌లపై దృష్టి కలిగిన విజువల్ శిక్షణార్థుల కోసం ఉపకారక వీడియో ట్యుటోరియల్స్

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI మోడల్ గవర్నెన్స్, కంప్లయిన్స్, మరియు ఆడిట్ ట్రైల్స్
- **Multi-Tenant AI**: బహుళ వినియోగదారులను వేరుచేసిన AI సేవలతో సేవలందించే నమూనాలు
- **Edge AI Deployment**: Azure IoT Edge మరియు కంటెయినర్ ఇన్స్టాన్స్‌లతో ఇంటిగ్రేషన్
- **Hybrid Cloud AI**: AI వర్క్‌లోడ్ల కోసం మల్టీ-క్లౌడ్ మరియు హైబ్రిడ్ డిప్లాయ్‌మెంట్ నమూనాలు

#### Advanced Features
- **AI Pipeline Automation**: Azure Machine Learning పైప్లైన్లతో MLOps ఇంటిగ్రేషన్
- **Advanced Security**: జీరో-ట్రస్టు నమూనాలు, ప్రైవేట్ ఎండ్‌పాయింట్లు, మరియు అధునాతన థ్రీట్ ప్రొటెక్షన్
- **Performance Optimization**: అధిక-త్రబుల్‌పుట్ AI అప్లికేషన్ల కోసం అధునాతన ట్యూనింగ్ మరియు స్కేలింగ్ వ్యూహాలు
- **Global Distribution**: AI అప్లికేషన్ల కోసం కంటెంట్ డెలివరీ మరియు ఎడ్జ్ కాషింగ్ నమూనాలు

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Microsoft Foundry ఇంటిగ్రేషన్‌ను విస్తృతంగా కవర్ చేయడం (Completed)
- ✅ **Interactive Tutorials**: చేతికి-చేయి AI వర్క్‌‌షాప్ ల్యాబ్ (Completed)
- ✅ **Advanced Security Module**: AI-స్పెసిఫిక్ సెక్యూరిటీ నమూనాలు (Completed)
- ✅ **Performance Optimization**: AI వర్క్‌లోడ్ ట్యూన్ చేయడానికి వ్యూహాలు (Completed)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-కేంద్రీకృత డిప్లాయ్‌మెంట్ సన్నివేశాలు (Completed)
- ✅ **Extended FAQ**: AI-స్పెసిఫిక్ ప్రశ్నలు మరియు ట్రబుల్‌షూటింగ్ (Completed)
- **Tool Integration**: మెరుగైన IDE మరియు ఎడిటర్ ఇంటిగ్రేషన్ గైడ్లు
- ✅ **Monitoring Expansion**: AI-స్పెసిఫిక్ మానిటరింగ్ మరియు అలెర్టింగ్ నమూనాలు (Completed)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: మొబైల్ అభ్యాసానికి అనుకూల రూపకల్పన
- **Offline Access**: డౌన్లోడబుల్ డాక్యుమెంటేషన్ ప్యాకేజీలు
- **Enhanced IDE Integration**: AZD + AI వర్క్‌ఫ్లోల కోసం VS Code యాక్స్టెన్షన్
- **Community Dashboard**: రియల్-టైమ్ కమ్యూనిటీ మెట్రిక్స్ మరియు కాంట్రిబ్యూషన్ ట్రాకింగ్

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: సమస్యలను నివేదించండి లేదా మెరుగుదలల-suujestions ఇవ్వండి (AI-స్పెసిఫిక్ ఇష్యూస్ స్వాగతం)
- **Discord Discussions**: ఆలోచనలు పంచుకోండి మరియు Microsoft Foundry కమ్యూనిటీతో చర్చలో పాల్గొనండి
- **Pull Requests**: ముఖ్యంగా AI టెంప్లేట్స్ మరియు గైడ్‌లకు సంబంధించి కంటెంట్‌లో ప్రత్యక్ష మెరుగుదలలకు योगदानించండి
- **Microsoft Foundry Discord**: AZD + AI చర్చల కోసం #Azure ఛానల్‌లో పాల్గొనండి
- **Community Forums**: విస్తృత Azure డెవలపర్ చర్చలలో పాల్గొనండి

### Feedback Categories
- **AI Content Accuracy**: AI సేవల ఇంటిగ్రేషన్ మరియు డిప్లాయ్‌మెంట్ సమాచారంలో సవరణలు
- **Learning Experience**: మెరుగైన AI డెవలపర్ లెర్నింగ్ ఫ్లో కోసం సూచనలు
- **Missing AI Content**: అదనపు AI టెంప్లేట్స్, నమూనాలు, లేదా ఉదాహరణల అభ్యర్థనలు
- **Accessibility**: విభిన్న అభ్యాస అవసరాల కోసం మెరుగుదలలు
- **AI Tool Integration**: మెరుగైన AI అభివృద్ధి వర్క్‌ఫ్లో ఇంటిగ్రేషన్ కోసం ప్రతిపాదనలు
- **Production AI Patterns**: ఎంటర్‌ప్రైజ్ AI డిప్లాయ్‌మెంట్ నమూనాల అభ్యర్థనలు

### Response Commitment
- **Issue Response**: నివేదించబడిన సమస్యలకు 48 గంటల లోపల స్పందన
- **Feature Requests**: ఒక వారంలో లోగా మూల్యాంకనం
- **Community Contributions**: ఒక వారంలో లోగా సమీక్ష
- **Security Issues**: తక్షణ ప్రాధాన్యతతో వేగవంతమైన స్పందన

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: కంటెంట్ నిర్ధారితత్వం మరియు లింక్ వాలిడేషన్
- **Quarterly Updates**: ప్రధాన కంటెంట్ జోడింపులు మరియు మెరుగుదలలు
- **Semi-Annual Reviews**: సమగ్ర పునఃసంయోజన మరియు మెరుగుదలలు
- **Annual Releases**: ముఖ్య వెర్షన్ నవీకరణలు మరియు గణనీయమైన మెరుగుదలలు

### Monitoring and Quality Assurance
- **Automated Testing**: కోడ్ ఉదాహరణలు మరియు లింక్‌ల యొక్క నియమిత ధృవీకరణ
- **Community Feedback Integration**: వినియోగదారు సూచనల регулярగా చేర్చడం
- **Technology Updates**: తాజా Azure సేవలు మరియు azd రిలీజ్‌లకు అనుగుణంగా సరిపోల్చడం
- **Accessibility Audits**: సమా౦వేశీయ డిజైన్ సిద్ధాంతాల కోసం నియమిత సమీక్ష

## Version Support Policy

### Current Version Support
- **Latest Major Version**: పూర్తి మద్దతుతో నియమిత నవీకరణలు
- **Previous Major Version**: 12 నెలల పాటు సెక్యూరిటీ నవీకరణలు మరియు కీలక ఫిక్సులు
- **Legacy Versions**: కేవలం కమ్యూనిటీ మద్దతు, అధికారిక నవీకరణలు లేవు

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: దశలవారీ మార్పుకు మార్గదర్శక సూచనలు
- **Compatibility Notes**: బ్రేకింగ్ మార్పుల గురించి వివరాలను
- **Tool Support**: మైగ్రేషన్‌కు సహాయపడే స్క్రిప్ట్‌లు లేదా యుటిలిటీలను
- **Community Support**: మైగ్రేషన్ ప్రశ్నల కోసం ప్రత్యేక ఫోరమ్‌లు

---

**Navigation**
- **Previous Lesson**: [అధ్యయన మార్గదర్శి](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: ఈ రిపాజిటరీపై నోటిఫికేషన్ల కోసం వాచ్ చేయండి; కొత్త విడుదలల మరియు నేర్చుకునే పదార్థాల ముఖ్యమైన అప్‌డేట్స్ గురించి తెలుపబడతారు.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
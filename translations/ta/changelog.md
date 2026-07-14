# மாற்றங்களின் வரலாறு - AZD தொடக்கத்திக்கானது

## அறிமுகம்

இந்த மாற்றப்பட்ட பட்டியல் AZD தொடக்கத்திக்கானது களஞ்சியத்தில் சம்பந்தப்பட்ட அனைத்து முக்கிய மாற்றங்கள், புதுப்பிப்புகள், மற்றும் மேம்பாடுகளை பதிவு செய்கிறது. நாங்கள் அர்த்தமுள்ள பதிப்பு முறைமைகளை பின்பற்றுகின்றோம் மற்றும் பதிப்புகளுக்கிடையில் என்ன மாற்றம் ஏற்பட்டுள்ளது என்பதை பயனர்களுக்கு புரிய உதவ இந்த பதிவை பராமரிக்கின்றோம்.

## கற்றல் இலக்குகள்

இந்த மாற்ற பட்டியலைப் பார்வையிடுவதன் மூலம், நீங்கள்:
- புதிய பண்புகள் மற்றும் உள்ளடக்கம் சேர்க்கப்படுத்தல்கள் குறித்த தகவல் பெற்றிருப்பீர்கள்
- உள்ள құжатங்களை மேம்படுத்தப்பட்டுள்ளதைப் புரிந்துகொள்ளுவீர்கள்
- பிழை சரிசெய்தல்கள் மற்றும் திருத்தங்களை கண்காணித்து துல்லியத்தை உறுதி செய்யுங்கள்
- கற்றல் பொருட்களின் வளர்ச்சியை காலப்போக்கு பின்பற்றுங்கள்

## கற்றல் முடிவுகள்

மாற்றப்பட்ட பட்டியல் பதிவுகளைப் பார்வையிட்ட பின், நீங்கள்:
- கற்றலுக்கான புதிய உள்ளடக்கம் மற்றும் வளங்களை அடையாளம் காணலாம்
- எந்த பிரிவுகள் புதுப்பிக்கப்பட்டுள்ளன அல்லது மேம்படுத்தப்பட்டுள்ளன என்பதை புரிந்துகொள்ளலாம்
- சமீபத்திய பதிப்புகளின் அடிப்படையில் உங்கள் கற்றல் பாதையை திட்டமிடலாம்
- எதிர்கால மேம்பாடுகளுக்கான கருத்துக்களைப் பகிரலாம்

## பதிப்பு வரலாறு

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 புதுப்பிப்பு: பதிப்பு நவீனப்படுத்தல்
**இந்த பதிப்பு `azd` `1.27.1` (ஜூலை 2026, சமீபத்திய நிலையான வெளியீடு) மற்றும் தற்போதைய முன் நோக்கு AI முகவர் நீட்டிப்பு `azure.ai.agents` `1.0.0-beta.5` உடன் பாடத்திட்டத்தை மீண்டும் சரிபார்க்கிறது, இதனால் 1.26.0, 1.27.0 மற்றும் 1.27.1 வெளியீடுகளுக்குப் பிறகு அனைத்து "சரிபார்க்கப்பட்டது" பேனர்கள் புதுப்பிக்கப்படுகின்றன.**

#### மாற்றங்கள்
- **✅ சரிபார்ப்பு அடிப்படை புதுப்பிக்கப்பட்டது** `azd 1.25.6` (ஜூன் 2026) இருந்து `azd 1.27.1` (ஜூலை 2026) க்கு வழிமொழிREADME, அனைத்து அத்தியாய READMEகள், அத்தியாயம் 1 டெவ்-கண்டெய்னர் பாடம் (பின் பதிப்பு எடுத்துக்காட்டுகள் உட்பட), அத்தியாயம் 4 கஸ்டம்-டெம்ப்ளேட்டுகள் பாடம், அத்தியாயம் 5 மல்டி-ஏஜென்ட் பாடம் மற்றும் பணிமன்ற ஆவணங்கள்
- **🤖 அத்தியாயம் 2 அடிப்படை புதுப்பிப்பு** `azd 1.23.12` (மார்ச் 2026) இருந்து `azd 1.27.1` வரை `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, மற்றும் `microsoft-foundry-integration.md` கோப்புகளில்; சரிபார்ப்பு குறிப்புக்கள் தேதி 2026-07-13க்கு மாற்றப்பட்டது
- **🧩 AI முகவர் நீட்டிப்பு உயர்த்தப்பட்டது** `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` இருந்து தற்போதைய `1.0.0-beta.5` வெளியீட்டுக்கு அத்தியாயம் 2 README மற்றும் `agents.md`ல்
- **🧪 பணிமன்ற சரிபார்ப்பு எடுத்துக்காட்டு** (`azd version` வெளியீடு) `1.27.1` ஆக புதுப்பிக்கப்பட்டது

#### சம்பந்தப்பட்ட azd வெளியீடுகளின் குறிப்புகள் (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Azure Functionsக்கு Flex Consumptionக்கு Go ஆதரவு, `azd config sub-filter` அண்டை-பொருள் சபலான்டங்கள், சுய-உட்புகும் நீட்டிப்பு பெண்டில்கள் (`azd x pack --bundle`), மற்றும் `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Azure AI Foundry திட்டங்கள்/முகவர்கள் நேரடியாக `azure.yaml`ல் மாதிரிப்படுத்தல் (Bicep இல்லாமல்/Terraform இல்லாமல் தொடக்கம்), App Serviceக்கான கண்டெய்னர் வெளியீடு ஆதரவு (`host: appservice` + `language: docker`), `azd extension` கட்டளைகளுக்கான நேரடி `-s/--source`, மற்றும் `azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install`க்கான `--no-dependencies` கொடி, பழைய மாதிரிகள் இயல்பாக பட்டியலில்/கொட்டா அறிவிப்புகளில் நீக்கப்பட்டுள்ளன, மற்றும் பல பிழை திருத்தல்கள்

#### பத்திரிகைகள் புதுப்பிக்கப்பட்டது
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

#### தொடக்கத்துக்கான இடைவெளி பூர்த்தி #2: டெம்ப்ளேட் உருவாக்கம், டெவ் கண்டெய்னர்கள், புளுமி, அஜுர் டெவ்ஓப்ஸ், சேவை பிரதிநிதிகள் மற்றும் பல
**இந்த பதிப்பு azd-coverage பகுப்பாய்வின் மூலம் வெளிப்பட்ட இடைநிலை இடைவெளிகளைக் கொண்டு முடிக்கிறது: உங்கள் சொந்த மாதிரியை உருவாக்கவும் வெளியிடவும் எப்படி, மறுபடியும் உருவாக்கக்கூடிய டெவ் கண்டெய்னர்/Codespaces சூழல்கள், புளுமி கட்டமைப்பு வழங்குநர், அஜுர் டெவ்ஓப்ஸ் CI/CD நடைமுறை, சேவை பிரதிநிதி அங்கீகாரம், ஹோஸ்ட் தேர்வு வழிகாட்டி (AKS/Spring Apps), `azd restore`/`azd package` விளக்கங்கள், ஹுக் பிழை கையாளும், மற்றும் குழு/பகிர்ந்து கொள்ளப்பட்ட சூழல் நடைமுறைகள்.**

#### சேர்
- **🧱 புதிய அத்தியாயம் 4 பாடம்** `docs/chapter-04-infrastructure/custom-templates.md` — உங்கள் சொந்த azd மாதிரியை உருவாக்குதல்: தேவையான அமைப்பு (`azure.yaml`, `infra/`, `src/`), `metadata.template` புலம், `uniqueString()` வளச்சீட்டு மற்றும் `azd-env-name` குறிச்சொல் கொண்டு கட்டமைப்பை அளவுரு செய்யுதல், உள்ளகமாக `azd init --template <local-path>` மூலம் சோதனை செய்தல், GitHubக்கு வெளியிடுதல், மற்றும் அசாதாரண AZD கலரிக்கு சமர்ப்பித்தல்
- **📦 புதிய அத்தியாயம் 1 பாடம்** `docs/chapter-01-foundation/dev-containers.md` — டெவ் கண்டெய்னர்கள் மற்றும் GitHub Codespaces பயன்படுத்தி மறுபடியும் உருவாக்கக்கூடிய azd சூழல்கள்: அதிகாரப்பூர்வமான `ghcr.io/azure/azure-dev/azd` அம்சம் கொண்ட குறைந்தபட்ச `.devcontainer/devcontainer.json`, மொழி-புதிய அம்சங்கள், தொகுப்பு ஹோஸ்ட்களுக்கு `docker-in-docker`, மற்றும் தொலைநிலை உள்நுழைவுக்கு `azd auth login --use-device-code`
- **🧩 azd உடன் புளுமி** பிரிவு `docs/chapter-04-infrastructure/provisioning.md`ல் — `infra.provider: pulumi`, புளுமி கோப்பு வரிசை, தாழ்வுகளை azd சூழல்களுடன் பொருத்துதல், தேவையான வெளியீடுகள்/குறிச்சொற்கள், மற்றும் அதேபோல் `azd up` / `azd down` வேலைநடவடிக்கைகள்
- **🎯 ஹோஸ்ட் தேர்வு வழிகாட்டி** `docs/chapter-04-infrastructure/provisioning.md`ல் — தொடக்கத்துக்கு உகந்தவாறு `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, மற்றும் `springapp`வைக் கடந்தவுடன் AKS அல்லது Azure Spring Apps தேர்வு செய்யும் போது வழிகாட்டி
- **🛠️ அஜுர் டெவ்ஓப்ஸ் CI/CD நடைமுறை** `docs/chapter-08-production/production-ai-practices.md`ல் — `azd pipeline config --provider azdo`, வலுவான பணிப் பிணைக்க xidmət அடையாள இணைப்பு (OIDC), உருவாக்கப்பட்ட `azure-dev.yml`, மற்றும் மாறி குழுவை அமைத்தல்
- **🔑 சேவை பிரதிநிதிகள் (வடிவமைப்பு 4)** `docs/chapter-03-configuration/authsecurity.md`ல் சேர்க்கப்பட்டது — `az ad sp create-for-rbac`, வாடிக்கையாளர் ரகசியத்துடன் அல்லது கூட்டிணைந்த/OIDC அங்கீகாரத்துடன் பிணையமில்லாத `azd auth login`, எப்போது பயன்படுத்துவது, மற்றும் பாதுகாப்பான ரகசிய சேமிப்பு
- **🪝 ஹுக் பிழை கையாளல்** துணைப்பிரிவு `docs/chapter-04-infrastructure/deployment-guide.md`ல் — வெளியேறும் குறியீடுகள் மற்றும் `set -e`, `continueOnError`, தனியாக ஹுக்குகளை சோதிக்க `azd hooks run` பயன்படுத்துதல், OS சிறப்பான ஷெல்கள், மற்றும் `--debug`
- **👥 குழு / பகிர்ந்துக்கொள்ளும் சூழல்கள்** பிரிவு `docs/chapter-03-configuration/configuration.md`ல் — `.azure/` உள்ளவை, என்ன கிட்டாய்க்கப்பட வேண்டும், ஒவ்வொரு டெவலப்பரின் சூழல்கள், `azd env list`/`select`, மற்றும் CI/CDல் சூழல் மதிப்புகளை வழங்குதல்
- **🧰 `azd restore` மற்றும் விரிவாக்கப்பட்ட `azd package`** விளக்கங்கள் `resources/cheat-sheet.md`ல் — சார்புகளை மீட்டமைக்கும் மற்றும் பயன்படுத்தாமல் ஒரு விடலைக் கட்டமைத்தல்

#### மாற்றங்கள்
- **🧭 அத்தியாயம் 4 பாட அட்டவணை** புதிய "உங்கள் சொந்த மாதிரி உருவாக்குதல்" பாடத்தை (பாடம் 3) சேர்ப்பதற்காக புதுப்பிக்கப்பட்டது
- **🧭 அத்தியாயம் 1 பாட அட்டவணை** புதிய "டெவ் கண்டெய்னர்கள் மற்றும் Codespaces" பாடத்தை (பாடம் 5) சேர்க்க புதுப்பிக்கப்பட்டது; `bring-your-own-app.md` மற்றும் `dev-containers.md` இடையேயான வழிசெலுத்தல் அடி பகுதிகள் இணைக்கப்பட்டுள்ளன

### [v3.21.0] - 2026-06-16

#### தொடக்கத்துக்கான இடைவெளி பூர்த்தி: கைமுறை மல்டி-ஏஜென்ட் பாடம், "உங்கள் சொந்த பயன்பாட்டை கொண்டு வாருங்கள்," Terraform, மற்றும் CI/CD நடைமுறை
**இந்த பதிப்பு முழுமையான தொடக்க வாரியர் கையேடு இடைவெளிகளைக் கட்டுக்குள் கொண்டு வருகின்றது: இரண்டு புதிய கைமுறை பாடங்கள் (deployable multi-agent நடைமுறை மற்றும் ஒரு தற்போதைய பயன்பாட்டிற்கு azd சேர்த்தல்), தொடக்கவாரியர் நட்பு ஹுக்குகள் அறிமுகம், Terraform உடன் azd பிரிவு, படி படியாக GitHub செயல்பாடுகள் குழுவுக்கான நடைமுறை, புதிய முன் நோக்கு நீட்டிப்புகளுக்கான விளக்கக்குறிப்பு, மற்றும் தெளிவான பதிப்பு உறுதிப்படுத்தல் சரிபார்ப்பு பட்டியல்.**

#### சேர்
- **🤝 புதிய அத்தியாயம் 5 பாடம்** `docs/chapter-05-multi-agent/multi-agent-basics.md` — முழுமையாக கைமுறை, deploy செய்யக்கூடிய இரண்டு முகவரி நடைமுறை (ஆர்க்கெஸ்ட்ரேட்டர் + நிபுணர்கள்) ஒரு உண்மையான மாதிரியை (`contoso-creative-writer`) கொண்டு, எப்போது மல்டி-ஏஜென்ட் பயன்படுத்துவது, `azd up` வேலைநடவடிக்கை, deploy செய்யப்பட்ட வளங்களை புரிந்துகொள்வது, முகவர்களது மீதான கண்காணிப்பு, தனிப்பயனாக்கம் மற்றும் சுத்திகரிப்பு
- **📦 புதிய அத்தியாயம் 1 பாடம்** `docs/chapter-01-foundation/bring-your-own-app.md` — `azd init` உடன் ஒரு நடப்பு திட்டத்தில் azd சேர்ப்பது ("தற்போதைய அடைவை பயன்படுத்தவும்"), `azure.yaml` மற்றும் `infra/` புரிந்துகொள்வது, `azd infra generate`, ஹோஸ்ட் கண்டறிதல், மற்றும் `azd up` கொண்டு deploy செய்தல்
- **🌐 azd உடன் Terraform** பிரிவு `docs/chapter-04-infrastructure/provisioning.md`ல் சேர்க்கப்பட்டது — `infra.provider: terraform` கட்டமைப்பு, `.tf` கோப்புறை வரிசை, தேவையான `AZURE_*` வெளியீடுகள் மற்றும் `azd-env-name` குறிச்சொல், மற்றும் அதே போல `azd up` / `azd down` வேலைநடவடிக்கைகள் (Terraform ஆதரவு கோரப்பட்டிருந்த இடைவெளியை மூடுகிறது ஆனால் Bicep மட்டும் காட்டப்பட்டது)
- **⚙️ படி படியாக GitHub செயல்பாடுகள் நடைமுறை** `docs/chapter-08-production/production-ai-practices.md`ல் — GitHub தளத்திலிருந்து தானாக deploy செய்வது: `azd pipeline config`, OIDC கூட்டிணைந்த அங்கீகாரங்கள் (சாமர்த்திய ரகசியங்கள் இல்லாமல்), உருவாக்கப்பட்ட `azure-dev.yml`, மற்றும் ரகசியங்கள்-மாறிகள் வழிகாட்டி
- **🪝 தொடக்கவாரியர் "ஹுக்குகள் புதியதா?" அறிமுகம்** `docs/chapter-04-infrastructure/deployment-guide.md`ல் — ஹுக் என்பது என்ன, ஹுக்-நிலை அட்டவணை, குறைந்தபட்ச முதல் ஹுக், மற்றும் கைமுறையாக ஹுக்குகளை `azd hooks run` பயன்படுத்தி இயக்குதல்
- **✅ "உங்கள் பதிப்பை சரிபார்க்கவும்" சரிபார்ப்பு பட்டியல்** `docs/chapter-01-foundation/first-project.md` படி 5ல் சேர்க்கப்பட்டது — புகை சோதனை, உடல் நிலை முடிவுக் கடைசிக் குறிப்பு மற்றும் தெளிவான வெற்றி மாதிரிகள்
- **🧩 புதிய முன்நோக்கு நீட்டிப்புகளுக்கான விளக்கக்குறிப்பு** `azure.ai.skills` மற்றும் `azure.ai.connections` (அவை என்ன மற்றும் எப்போது பயன்படுத்துவது) `docs/chapter-08-production/production-ai-practices.md`ல்

#### மாற்றங்கள்
- **🧭 அத்தியாயம் 5 பாட அட்டவணை** சீர்செய்யப்பட்டது: `multi-agent-basics.md` இப்போது பாடம் 1 (ஒன்றே முழு கைமுறை பாடம்), நம்பகமான குறிச்சொற்களுடன் பாடம் 2 அத்தியாயம் 6 இல் உள்ளது மற்றும் சில்லறை காட்சி ஒன்று கட்டமைப்பு மாதிரி; ஒரே கட்டளை மாதிரி அல்ல
- **🧭 அத்தியாயம் 1 பாட அட்டவணை** இப்போது புதிய "உங்கள் சொந்த பயன்பாட்டை கொண்டு வாருங்கள்" பாடத்தை (பாடம் 4) கொண்டுள்ளது
- **🔗 வழிசெலுத்தல் அடிப்பகுதிகள்** புதுப்பிக்கப்பட்டன: `first-project.md` இல் இப்போது முன்னோக்கி இணைப்பு `bring-your-own-app.md`க்கு உள்ளது

#### திருத்தப்பட்டது
- **🧱 "கோரப்பட்டாலும் காணாமல் போன" Terraform இடைவெளி மூடப்பட்டது** - பாடத்தில் Terraform ஆதரவு குறிப்பிடப்பட்டிருந்தாலும் காட்டப்படவில்லை
- **🔀 புரியாமை ஏற்பட்ட அத்தியாயம் 5 குறுக்கு இணைப்புகள் திருத்தப்பட்டன** - முழு மல்டி-ஏஜென்ட் அமலாக்கம் இருந்தது என்று தோன்றும் போது அது கட்டமைப்பு மாதிரி மட்டுமே இருந்தது

#### புதுப்பிக்கப்பட்ட பத்திரிகைகள்
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(புதிய)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(புதிய)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 புதுப்பிப்பு, முழு முகவர் வாழ்நாள் கட்டளை மற்றும் Aspire மறுபெயர்ப்பு

**இந்த பதிப்பு `azd` `1.25.6` (ஜூன் 2026) மற்றும் `azure.ai.agents` `0.1.40-preview` விரிவாக்கத்துக்கு எதிராக பாடத்திட்டத்தை மறுஆதாரமாகச் சோதிக்கிறது, "ஏப்ரேண்ட் ஏஜன்ட்" என்பதிலிருந்து முழு ஏஜன்ட் வாழ்க்கைச் சுழற்சிக்கு (சோதனை → மதிப்பீடு → முன்னேற்றம் → ஆய்வு → அகற்று) AI வழிகாட்டுதலை விரிவுபடுத்துகிறது, புதிய `azure.ai.skills` மற்றும் `azure.ai.connections` முன்னோட்டு விரிவாக்கங்களைக் காண்பிக்கிறது, மற்றும் ".NET Aspire" → "Aspire" தயாரிப்பு மாற்றத்தை கவனிக்கிறது.**

#### சேர்க்கப்பட்டது
- **🔁 முழு ஏஜன்ட் வாழ்க்கைச் சுழற்சி காப்புறுதி** புதியவர்கள் மற்றும் AI பொறியாளர்களுக்கான ஆவணங்களில் கடக்கப்படுகிறது:
  - `docs/chapter-01-foundation/azd-basics.md` — விரிவாக்கங்கள் மற்றும் AI கட்டளைகள் பகுதி சேர்க்கப்பட்ட வாழ்க்கை அட்டவணை (ஏப்ரேண்ட் → சோதனை → அளவை → முன்னேற்றம் → ஆய்வு → சுத்தம்)
  - `docs/chapter-08-production/production-ai-practices.md` — புதிய "ஏஜன்ட் வாழ்க்கைச் சுழற்சியை நிர்வகித்தல்" பகுதி `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, மற்றும் `delete --force` களை உள்ளடக்கியது
  - `resources/cheat-sheet.md` — விரிவுபடுத்தப்பட்ட AI ஏஜன்ட் கட்டளைகள் `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, மற்றும் `delete --force`
- **🧩 புதிய முன்னோட்டு விரிவாக்கங்கள்** ஆவணப்படுத்தப்பட்டவை: `azure.ai.skills` (மறுபயன்பாட்டிற்கான ஏஜன்ட் திறன்கள்) மற்றும் `azure.ai.connections` (Foundry இணைப்புகள்) விரிவாக்க அட்டவணையும் அறிவுறுத்தல் பதித்தியிலும் சேர்க்கப்பட்டது
- **⏱️ பதிலை-நேர வழிகாட்டுதல்** — `azd ai agent invoke` உதாரணங்கள் தற்போது மொத்த தாமதமும் முதன்மை பைட்டுக்கான நேரத்தையும் அச்சிடும் என்பதை குறிப்பிடுகிறது
- **📌 பதிப்பு பட்டி** ரூட் README-வில் கற்றுக்கொள்ளுபவர்கள் `azd version` மற்றும் `azd upgrade` க்கு நோக்கிச் செல்லும்

#### மாற்றப்பட்டது
- **✅ சரிபார்ப்பு அடிப்படை புதுப்பிப்பு** அனைத்து அத்தியாய README களிலும் மற்றும் பணியகம் ஆவணங்களிலும் `azd 1.23.12` (மார்ச் 2026) இலிருந்து `azd 1.25.6` (ஜூன் 2026) ஆக மேம்படுத்தப்பட்டது
- **🤖 அத்தியாயம் 2 விரிவாக்க குறிப்பு** `azure.ai.agents` `0.1.18-preview` இலிருந்து `0.1.40-preview` ஆக மேம்படுத்தப்பட்டது
- **🧪 பணியகம் சரிபார்ப்பு உதாரணம்** (`azd version` வெளியீடு) `1.25.6` ஆக மேம்படுத்தப்பட்டது
- **🧭 README "azd இல் இன்று என்ன புதியது"** மறுசீரமைக்கப்பட்டது துணை வழிகளில் முழு ஏஜன்ட் வாழ்க்கைச்சுழற்சி, புதிய AI விரிவாக்கங்கள், மற்றும் சமீபத்திய பயன்பாட்டுக் குறைகள் (`azd init` இடமாற்றத்தன்மை, `azd auth login` பழைய டோக்கன் நீக்கல், `azd tool` முதல் ஓட்டம் உச்சரிப்பு)
- **📖 அத்தியாயம் 2 agents.md (விருப்பம் 4)** இப்போது கற்றுக்கொள்ளுபவர்கள் `azd up` இல் நிறுத்தாமல் பிறப்பி வாழ்க்கைச் சுழற்சி கட்டளைகள் நோக்கிச் செல்லும்

#### சரி செய்யப்பட்டது
- **🏷️ தயாரிப்பு பெயரிடல்** — Aspire மறுபெயரிடல் குறிப்பு சேர்க்கப்பட்டது (".NET Aspire" இப்போது வெறும் "Aspire"); azd இன் Aspire ஆதரவு மாற்றமில்லை
- **🔎 நேரடி வெளியீடு சரிபார்ப்பு** Azure Developer CLI வெளியீடு ஊடாக உறுதிசெய்தல்: நிலையான CLI `1.25.6` (2026-06-12) மற்றும் `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### கோப்புகள் புதுப்பிக்கப்பட்டது
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

#### ஆரம்ப நிலை சேர்க்கை தெளிவுபடுத்தல், அமைப்பு சரிபார்ப்பும் இறுதி AZD கட்டளை சுத்திகரிப்பும்
**இந்த பதிப்பு AZD 1.23 சரிபார்ப்பு சுற்றுப்பயணத்தை தொடர்ந்து ஆரம்ப நிலை கவனிப்பான ஆவணப்படுத்தல் கடத்துகிறது: AZD முதலில் அங்கீகாரம் வழிகாட்டுதலை தெளிவுபடுத்துகிறது, உள்ளூர் அமைப்பு சரிபார்ப்பு ஸ்கிரிப்ட்களை சேர்க்கிறது, நேரடி AZD CLI-க்கு முக்கிய கட்டளைகளை உறுதிப்படுத்துகிறது, மற்றும் மாற்றிதாரகத்தில் உள்ள கடைசி பழைய ஆங்கில மூலக் கட்டளை குறிப்புகளை நீக்குகிறது.**

#### சேர்க்கப்பட்டது
- **🧪 ஆரம்ப நிலை அமைப்பு சரிபார்ப்பு ஸ்கிரிப்ட்கள்** `validate-setup.ps1` மற்றும் `validate-setup.sh` மூலம் கற்றுக்கொள்பவர்கள் அத்தியாயம் 1 தொடங்குவதற்கு முன் தேவையான கருவிகளை உறுதிப்படுத்த முடியும்
- **✅ முன்பதிவு அமைப்பு சரிபார்ப்பு படிகள்** ரூட் README மற்றும் அத்தியாயம் 1 README இல் தவறிய முன் தேவைகளை `azd up` முன்னர் கைப்பற்றுவதற்காக

#### மாற்றப்பட்டது
- **🔐 ஆரம்ப நிலை அங்கீகாரம் வழிகாட்டுதல்** இப்போது AZD வேலைவழக்கங்களுக்கு முதன்மை பாதையாக `azd auth login` ஐ தொடர்ந்து பயன்படுத்துகிறது, Azure CLI கட்டளைகள் நேரடியாக பயன்படுத்தப்படும் போது `az login` விருப்பமாக்கப்படுகிறது
- **📚 அத்தியாயம் 1 onboarding ஓட்டம்** இப்போது கற்றுக்கொள்பவர்களை நிறுவல், அங்கீகாரம் மற்றும் முதலாவது பிணைய இயக்கு படிகளிற்கு முன்னதாக உள்ளூர் அமைப்பை உறுதிப்படுத்தச் சொல்லுகிறது
- **🛠️ சரிபார்ப்பு செய்தி** இப்போது தடுப்பு தேவைகளையும் விருப்ப Azure CLI எச்சரிக்கையும் தெளிவாக பிரிக்கிறது AZD மட்டுமே ஆரம்ப நிலை பாதை க்காக
- **📖 கட்டமைப்பு, சிக்கல் தீர்க்கல் மற்றும் உதாரண ஆவணங்கள்** இப்போது தேவையான AZD அங்கீகாரத்தையும் விருப்ப Azure CLI உள்நுழைவையும் முன்னால் தெரிவிக்காத உரைக்குறிப்புகளுடன் வேறுபடுத்துகிறது

#### சரி செய்யப்பட்டது
- **📋 மீதமுள்ள ஆங்கில மூலக் கட்டளை குறிப்புகள்** தற்போதைய AZD வடிவங்களுக்கு மேம்படுத்தப்பட்டவை, உதாரணத்திற்கு `azd config show` அறிவுறுத்தல் படியில் மற்றும் `azd monitor --overview` Azure போர்டல் மேலோட்ட வழிகாட்டலுக்கு
- **🧭 அத்தியாயம் 1 ஆரம்ப நிலை கூறுகள்** அனைத்து வார்ப்புருக்கள் மற்றும் Azure வளங்கள் மீது லாபமில்லா குறையோ திரும்பப்பெறலோ இல்லாததை உறுதிப்படுத்தி மிக அதிகமான வாக்குறுதிகளை மென்மையாக்கியது
- **🔎 நேரடி CLI சரிபார்ப்பு** `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, மற்றும் `azd down --force --purge` ஆகியன புதுப்பிக்கப்பட்ட ஆதரவை உறுதிசெய்து

#### கோப்புகள் புதுப்பிக்கப்பட்டன
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

#### AZD 1.23.12 சரிபார்ப்பு, பணியகம் சுற்றுப்புற விரிவாக்கம் மற்றும் AI மாதிரி மேம்பாடு
**இந்த பதிப்பு `azd` `1.23.12` ஐ எதிர்த்து ஆவணங்களின் சரிபார்ப்பைச் செய்கிறது, பழைய AZD கட்டளை உதாரணங்களை புதுப்பிக்கிறது, AI மாதிரி வழிகாட்டுதலை தற்போதைய இயல்புகளுக்கு மீண்டும் உருவாக்குகிறது, மற்றும் பணியகம் விளக்கக்குறிப்புகளை GitHub Codespaces ஐத் தவிர dev கன்டெய்னர்கள் மற்றும் உள்ளூர் கிளோன்களுக்கும் ஆதரவு அளிக்க விரிவாக்குகிறது.**

#### சேர்க்கப்பட்டது
- **✅ முக்கிய அத்தியாயங்கள் மற்றும் பணியகம் ஆவணங்களில் சரிபார்ப்பு குறிப்பு** புதிய அல்லது பழைய CLI கட்டமைப்புகளை பயன்படுத்துகிற கற்றுக்கொள்பவர்களுக்கு தேர்ந்தெடுத்த AZD அடிப்படையானது தெளிவாக இருக்க
- **⏱️ நீண்டகால AI செயலியலம் பெய் நேர வழிகாட்டுதல்** `azd deploy --timeout 1800` பயன்படுத்தி
- **🔎 விரிவாக்க ஆய்வு படிகள்** AI வேலைநெறி ஆவணங்களில் `azd extension show azure.ai.agents`
- **🌐 பரந்த பணியகம் சுற்றுப்புற வழிகாட்டுதல்** GitHub Codespaces, dev கன்டெய்னர்கள் மற்றும் உள்ளூர் கிளோன்கள் MkDocs உடன்

#### மாற்றப்பட்டது
- **📚 அத்தியாய அறிமுக README கள்** இப்போது `azd 1.23.12` சரிபார்ப்பை அடிப்படையாகக் கொண்டு சீரான தகவல்களை வழங்குகின்றன பிம்பக் கோப்புறைகள், கட்டமைப்பு, அடுக்கமைப்பு, பன்முக ஏஜன்ட், முன்னேற்பாடு, சிக்கல் தீர்க்கல் மற்றும் தயாரிப்பு பகுதியிலும்
- **🛠️ AZD கட்டளை குறிப்பிடுதல்கள்** ஆவணங்களில் தற்போதைய வடிவங்களுக்கு மேம்படுத்தப்பட்டன:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` அல்லது `azd env get-value(s)` சூழல்படுத்தலில் ஏற்ப்படும்
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights மேலோட்டம் குறித்த இடங்களில் `azd monitor --overview`
- **🧪 Provision முன்னோட்டு உதாரணங்கள்** தற்போதைய ஆதரவுடன் எளிமைப்படுத்தப்பட்டவை உதாரணமாக: `azd provision --preview` மற்றும் `azd provision --preview -e production`
- **🧭 பணியகம் ஓட்டம்** இப்போது கற்றுக்கொள்பவர்கள் Codespaces, dev கன்டெய்னர் அல்லது உள்ளூர் கிளோன் என்று ஆய்வுகளை நிறைவேற்ற முடியும். பிழையில்லை Codespaces மட்டும் என எண்ணுவதில்லை
- **🔐 அங்கீகாரம் வழிகாட்டுதல்** இப்போது `azd auth login` AZD வேலைவழக்கங்களுக்கு முன்னுரிமை அளிக்கப்படுகிறது, அப்போது Azure CLI கட்டளைகள் நேரடியாக பயன்படுத்தப்படும் போது மட்டுமே `az login` விருப்பமாக்கப்படுகிறது

#### சரி செய்யப்பட்டது
- **🪟 விண்டோஸ் நிறுவல் கட்டளைகள்** நிறுவல் வழிகாட்டியில் தற்போதைய `winget` தொகுப்பு எழுத்துப்பிரிவு முறைப்படி சீரமைக்கப்பட்டது
- **🐧 லினக்ஸ் நிறுவல் வழிகாட்டுதல்** ஆதரிக்கப்படாத டிஸ்ட்ரோ-சொந்த `azd` தொகுப்பு மேலாளர் வழிமுறைகளை தவிர்த்து வெளியீட்டு சொத்துகளைக் குறிப்பிடுகிறது
- **📦 AI மாதிரி உதாரணங்கள்** பழைய இயல்புகளான `gpt-35-turbo` மற்றும் `text-embedding-ada-002` இலிருந்து தற்போதைய உதாரணங்கள் `gpt-4.1-mini`, `gpt-4.1`, மற்றும் `text-embedding-3-large` ஆக புதுப்பிக்கப்பட்டன
- **📋 பயன்படுத்தல் மற்றும் கருத்தாய்வு குறிபடிகள்** சிக்கல் தீர்க்கல் படிகள் மற்றும் ஸ்கிரிப்ட்களில் தற்போதைய சூழல் மற்றும் நிலை கட்டளைகள் பயன்படுத்தும் வகையில் சரிசெய்யப்பட்டன
- **⚙️ GitHub செயல்பாடுகள் வழிகாட்டுதல்** `Azure/setup-azd@v1.0.0` இலிருந்து `Azure/setup-azd@v2` ஆக மேம்படுத்தப்பட்டது
- **🤖 MCP/Copilot சம்மத வழிகாட்டுதல்** `azd mcp consent` இலிருந்து `azd copilot consent list` ஆக புதுப்பிக்கப்பட்டது

#### மேம்படுத்தப்பட்டது
- **🧠 AI அத்தியாய வழிகாட்டுதல்** இப்போது முன்னோட்டு-சென்சிட்டிவ் `azd ai` நடத்தை, சந்தா-சந்த் உள்நுழைவுகள், தற்போதைய விரிவாக்க பயன்பாடு மற்றும் புதுப்பித்த மாதிரி வெளியீடு பரிந்துரைகளை சிறப்பாக விளக்குகிறது
- **🧪 பணியகம் வழிமுறைகள்** தற்போது மிகவும் நடைமுறையான பதிப்பு உதாரணங்களுடன் மற்றும் தெளிவான சுற்றுப்புற அமைப்புக் கேள்வியுடன் கையேடாக உள்ளன
- **📈 தயாரிப்பு மற்றும் சிக்கல் தீர்க்கல் ஆவணங்கள்** தற்போதைய கண்காணிப்பு, மாற்று மாதிரி மற்றும் செலவு நிலை உதாரணங்களுடன் ஒத்திசைவாக உள்ளன

#### கோப்புகள் புதுப்பிக்கப்பட்டன
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

#### AZD AI CLI கட்டளைகள், உள்ளடக்க சரிபார்ப்பு மற்றும் வடிவமைப்பு விரிவாக்கம்
**இந்த பதிப்பு அனைத்து AI சார்ந்த அத்தியாயங்களில் `azd ai`, `azd extension`, மற்றும் `azd mcp` கட்டளை வரம்புகளைச் சேர்க்கிறது, agents.md இல் பிணைக்கப்பட்டுள்ள விரிவுகளையும் பழைய குறியீடுகளையும் திருத்துகிறது, அறிவுறுத்தல் பதித்தியையும் புதுப்பிக்கிறது, மற்றும் புது Azure AI AZD மாதிரிகளை உறுதிசெய்த விவரங்கள் கொண்ட உதாரண மாதிரி பகுதியை முற்றிலும் மாற்றுகிறது.**

#### சேர்க்கப்பட்டது
- **🤖 AZD AI CLI வரம்பு** 7 கோப்புகளில் (முன்பாக மட்டும் அத்தியாயம் 8 இல்):
  - `docs/chapter-01-foundation/azd-basics.md` — புதிய "விரிவாக்கங்களும் AI கட்டளைகளும்" பகுதி `azd extension`, `azd ai agent init`, மற்றும் `azd mcp` அறிமுகப்படுத்துகிறது
  - `docs/chapter-02-ai-development/agents.md` — விருப்பம் 4: `azd ai agent init` ஒப்பீடு அட்டவணையுடன் (வடிவமைப்பு vs மானிபெஸ்ட் அணுகல்)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry க்கான AZD விரிவாக்கங்கள்" மற்றும் "ஏஜன்ட் முதன்மை பிணையம்" துணைதலைப்புகள்

  - `docs/chapter-05-multi-agent/README.md` — விரைவு தொடக்கம் இப்போது வடிவமைப்பு மற்றும் கண்காணிப்பு அடிப்படையிலான 배치 பாதைகளையும் காட்டுகிறது
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — பரவலாக்கு பகுதி இப்போது `azd ai agent init` விருப்பத்தையும் உள்ளடக்கியது
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI நீட்சிகள் கட்டளைகள் பகுதி நோயியல் குறையாக"
  - `resources/cheat-sheet.md` — புதிய "AI & நீட்சிகள் கட்டளைகள்" பகுதி `azd extension`, `azd ai agent init`, `azd mcp`, மற்றும் `azd infra generate` உடன்
- **📦 புதிய AZD AI உதாரண மாதிரிகள்** `microsoft-foundry-integration.md` இல்:
  - **azure-search-openai-demo-csharp** — .NET RAG உரையாடல் Blazor WebAssembly, Semantic Kernel, மற்றும் குரல் உரையாடல் ஆதரவுடன்
  - **azure-search-openai-demo-java** — Java RAG உரையாடல் Langchain4J பயன்படுத்தி ACA/AKS பரவலாக்கு விருப்பங்களுடன்
  - **contoso-creative-writer** — பல-பணி படைப்பாற்றல் எழுத்து செயலி Azure AI Agent சேவை, Bing Grounding மற்றும் Prompty உடன்
  - **serverless-chat-langchainjs** — Serverless RAG Azure Functions + LangChain.js + Cosmos DB உடன் Ollama உள்ளூர் dev ஆதரவுடன்
  - **chat-with-your-data-solution-accelerator** — எண் நிறுவன RAG வேகப்படுத்தி நிர்வாணுமுறை, Teams ஒருங்கிணைப்பு, மற்றும் PostgreSQL/Cosmos DB விருப்பங்கள் கொண்டது
  - **azure-ai-travel-agents** — பல-பணி MCP ஒழுங்குமுறை குறிப்புக் செயலி .NET, Python, Java, மற்றும் TypeScript படி சேவையகங்களுடன்
  - **azd-ai-starter** — குறைந்த Azure AI அடிக்கல் Bicep துவக்க மாதிரி
  - **🔗 அற்புத AZD AI காட்சிப்பட கோப்பு இணைப்பு** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ மாதிரிகள்) இற்கு அவற்றின் குறிப்பு

#### திருத்தப்பட்டது
- **🔗 agents.md வழிசெலுத்தல்**: முந்தைய/அடுத்த இணைப்புகள் இப்போது அத்தியாயம் 2 README பாடச் செய்முறை வரிசையை பின்பற்றுகின்றன (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md உடைந்த இணைப்புகள்**: `production-ai-practices.md` சரி செய்யப்பட்டது `../chapter-08-production/production-ai-practices.md` (3 முறை)
- **📦 agents.md பழைய குறியீடு**: `opencensus` மாற்றப்பட்டது `azure-monitor-opentelemetry` + OpenTelemetry SDK உடன்
- **🐛 agents.md தவறான API**: `max_tokens` `create_agent()` இல் இருந்து `create_run()` க்கு `max_completion_tokens` என மாற்றப்பட்டது
- **🔢 agents.md குறியீட்டு எண்ணிக்கை**: சுமார் `len//4` மதிப்பீடு `tiktoken.encoding_for_model()` உடன் மாற்றப்பட்டது
- **azure-search-openai-demo**: சேவைகள் "Cognitive Search + App Service" இலிருந்து "Azure AI Search + Azure Container Apps" ஆக சரி செய்யப்பட்டுள்ளது (இயல்புநிலை ஹோஸ்ட் 2024 அக்டோபர் சீர்திருத்தம்)
- **contoso-chat**: விளக்கம் புதுப்பிக்கப்பட்டது Azure AI Foundry + Prompty குறிப்பு, நிரலை மறுபரிசீலனை செய்யும் தலைப்பு மற்றும் தொழில்நுட்ப அடிப்படையை பொருத்தமாக வைத்துக் கொண்டது

#### நீக்கப்பட்டது
- **ai-document-processing**: செயல்படாத மாதிரி குறிப்பு நீக்கப்பட்டது (REPO பொதுவாக கிடைக்காது AZD மாதிரி ஆக)

#### மேம்படுத்தப்பட்டது
- **📝 agents.md பயிற்சிகள்**: பயிற்சி 1 இல் எதிர்பார்க்கப்பட்ட வெளியீடு மற்றும் `azd monitor` படிநிலை காட்டப்பட்டது; பயிற்சி 2 முழு `FunctionTool` பதிவு குறியீடு கொண்டது; பயிற்சி 3 குழப்பமான வழிகாட்டிகளை ஸ்பெசிபிக் `prepdocs.py` கட்டளைகளால் மாற்றியது
- **📚 agents.md வளங்கள்**: ஆவண இணைப்புகள் தற்போதைய Azure AI Agent சேவை ஆவணங்கள் மற்றும் விரைவான துவக்கத்துடன் மேம்படுத்தப்பட்டது
- **📋 agents.md அடுத்த படிகள் அட்டவணை**: முழுமையான அத்தியாய கவனிப்பு விரைவான AI வகுப்பு ஆய்வக இணைப்பை சேர்த்தது

#### கோப்புகள் புதுப்பிக்கப்பட்டவை
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### பாட நிலை மேம்பாடு
**இந்த பதிப்பு README.md அத்தியாய வழிசெலுத்தலை மேம்படுத்திய மேம்பட்ட அட்டவணை வடிவத்துடன் வழங்குகிறது.**

#### மாற்றப்பட்டன
- **பாட வரைபட அட்டவணை**: நேரடி பாடக் இணைப்புகள், காலம் மதிப்பீடுகள், மற்றும் சிக்கல்தன்மை மதிப்பீடுகளுடன் மேம்படுத்தப்பட்டது
- **கோப்பு தூய்மைப்படுத்தல்**: பழைய தேவையில்லாத கோப்புறைகள் நீக்கப்பட்டன (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **இணைப்பு சரிபார்த்தல்**: பாட வரைபட அட்டவணையில் உள்ள 21+ உள்ளக இணைப்புகள் அனைத்தும் சரிபார்க்கப்பட்டன

### [v3.16.0] - 2026-02-05

#### தயாரிப்பு பெயர் புதுப்பிப்புகள்
**இந்த பதிப்பு மைக்ரோசாஃப்ட் பிராண்டிங் பொருந்திய தயாரிப்பு குறிப்புகளை புதுப்பிக்கிறது.**

#### மாற்றப்பட்டன
- **Microsoft Foundry → Microsoft Foundry**: அனைத்து குறிப்புகளும் மொழிபெயர்ப்பு அல்லாத கோப்புகளில் புதுப்பிக்கப்பட்டன
- **Azure AI Agent Service → Foundry Agents**: சேவை பெயர் தற்போதைய பிராட்டிங்கை ஒட்டி புதுப்பிக்கப்பட்டது

#### கோப்புகள் புதுப்பிக்கப்பட்டன
- `README.md` - முக்கிய பாடம் முன்னணி பக்கம்
- `changelog.md` - பதிப்பு வரலாறு
- `course-outline.md` - பாட கட்டமைப்பு
- `docs/chapter-02-ai-development/agents.md` - AI முகவர்கள் வழிகாட்டு
- `examples/README.md` - உதாரண ஆவணங்கள்
- `workshop/README.md` - பணியரங்கு முன் பக்கம்
- `workshop/docs/index.md` - பணியரங்கு குறிப்பு
- `workshop/docs/instructions/*.md` - அனைத்து பணியரங்கு அறிவுறுத்தல் கோப்புகள்

---

### [v3.15.0] - 2026-02-05

#### முக்கிய முறையான கோப்பகம் மறுசீரமைப்பு: அத்தியாய அடிப்படையிலான கோப்பகம் பெயர்கள்
**இந்த பதிப்பு ஆவணங்களை தனிக்குறிப்பிட்ட அத்தியாய கோப்பகங்களுக்குள் மறுசீரமைத்து தெளிவான வழிசெலுத்தலை வழங்குகிறது.**

#### கோப்பக பெயர்கள் மாற்றம்
பழைய கோப்பகங்கள் அத்தியாய எண்களுடன் கூடிய கோப்பகங்களால் மாற்றப்பட்டன:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- புதியது சேர்க்கப்பட்டது: `docs/chapter-05-multi-agent/`

#### கோப்பு இடமாற்றங்கள்
| கோப்பு | இருந்து |க்கு |
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

#### சேர்க்கப்பட்டது
- **📚 அதிகார பகுதி README கோப்புகள்**: ஒவ்வொரு அதிகார ஃபோல்டரிலும் README.md உருவாக்கப்பட்டது:
  - கற்றல் நோக்கங்கள் மற்றும் கால அளவு
  - விளக்கங்களுடன் பாடத்திட்ட அட்டவணை
  - விரைவு துவக்க கட்டளைகள்
  - மற்ற அதிகாரங்களுக்கு வழிசெலுத்தல்

#### மாற்றம் செய்யப்பட்டது
- **🔗 அனைத்து உள்ளக இணைப்புகளும் புதுப்பிக்கப்பட்டன**: அனைத்து ஆவண கோப்புகளிலும் 78+ பாதைகள் புதுப்பிக்கப்பட்டன
- **🗺️ பிரதான README.md**: புதிய அதிகார அமைப்புடன் பாடநெறி வரைபடம் புதுப்பிக்கப்பட்டது
- **📝 examples/README.md**: அதிகார ஃபோல்டர்களுக்கான குறுக்குவழி குறிப்புகள் புதுப்பிக்கப்பட்டன

#### நீக்கப்பட்டது
- பழைய ஃபோல்டர் அமைப்பு (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### தொகுப்பு மறுசீரமைப்பு: அதிகார வழிசெலுத்தல்
**இந்த பதிப்பு அதிகார வழிசெலுத்தல் README கோப்புகளை சேர்த்துள்ளது (v3.15.0 மூலம் மாற்றப்பட்டது).**

---

### [v3.13.0] - 2026-02-05

#### புதிய AI முகவர்கள் வழிகாட்டு
**இந்த பதிப்பு Azure Developer CLI உடன் AI முகவர்களை despley செய்ய விரிவான வழிகாட்டியைக் சேர்க்கிறது.**

#### சேர்க்கப்பட்டது
- **🤖 docs/microsoft-foundry/agents.md**: முழுமையான வழிகாட்டி:
  - AI முகவர்கள் என்ன மற்றும்ச் சாட்போட்டுகளிலிருந்து எவ்வாறு வேறுபடுகின்றன
  - மூன்று விரைவு துவக்க முகவர் மாதிரிகள் (Foundry Agents, Prompty, RAG)
  - முகவர் கட்டமைப்பு மாதிரிகள் (ஒற்றை முகவர், RAG, பன்முகவர்)
  - கருவி அமைப்பு மற்றும் தனிப்பயனாக்கல்
  - கண்காணிப்பு மற்றும் அளவுகோல் தொலைபார்க்கை
  - செலவுக் கருத்துகள் மற்றும் மேம்பாடு
  - பொதுவான சிக்கல் தீர்க்கும் நிலைமைகள்
  - வெற்றி критерியுடன் மூன்று கைப்பாடுகள்

#### உள்ளடக்கத் தொகுப்பு
- **அறிமுகம்**: தொடக்கத்துக்கான முகவர் கருத்துக்கள்
- **விரைவு துவக்கம்**: `azd init --template get-started-with-ai-agents` மூலம் முகவர்களை despley செய்யவும்
- **கட்டமைப்பு மாதிரிகள்**: முகவர் மாதிரிகளின் காட்சி வரைபடங்கள்
- **அமைப்பு**: கருவி அமைப்பு மற்றும் சூழல் மாறிலிகள்
- **கண்காணிப்பு**: Application Insights ஒருங்கிணைப்பு
- **பயிற்சிகள்**: முன்னேற்றும் கைபாடுகள் (ஒவ்வொன்றும் 20-45 நிமிடங்கள்)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Περιβάλλον تحديث
**இந்த பதிப்பு AZD கற்றல் அனுபவத்திற்கு நவீன கருவிகள் மற்றும் சிறந்த இயல்புகள் கொண்ட உருவாக்கக் கெயிண்டர் அமைப்பை புதுப்பிக்கிறது.**

#### மாற்றி விடுத்தது
- **🐳 அடிப்படை படம்**: `python:3.12-bullseye` இருந்து `python:3.12-bookworm` (சமீபத்திய Debian நிலையான) க்கு புதுப்பிக்கப்பட்டது
- **📛 கெயிண்டர் பெயர்**: தெளிவுக்கு "Python 3" இருந்து "AZD தொடக்கக்காரர்கள்" என பெயர் மாற்றப்பட்டது

#### சேர்க்கப்பட்டது
- **🔧 புதிய Dev Container அம்சங்கள்**:
  - Bicep ஆதரவு கொண்ட `azure-cli`
  - AZD வார்ப்புருக்களுக்கு LTS பதிப்பு `node:20`
  - வார்ப்புரு மேலாண்மைக்கான `github-cli`
  - கெயிண்டர் செயலி despliy க்கான `docker-in-docker`

- **🔌 போர்ட் முன்னேற்றம்**: பொதுவான மேம்பாட்டிற்கான முன்-அமைக்கப்பட்ட போர்ட்டுகள்:
  - 8000 (MkDocs முன்னோட்டம்)
  - 3000 (வலை செயலிகள்)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 புதிய VS கோட் விரிவாக்கங்கள்**:
  - `ms-python.vscode-pylance` - மேம்படுத்தப்பட்ட Python அறிவுரைகள்
  - `ms-azuretools.vscode-azurefunctions` - Azure செயல்பாடுகள் ஆதரவு
  - `ms-azuretools.vscode-docker` - Docker ஆதரவு
  - `ms-azuretools.vscode-bicep` - Bicep மொழி ஆதரவு
  - `ms-azure-devtools.azure-resource-groups` - Azure வள மேலாண்மை
  - `yzhang.markdown-all-in-one` - மார்க்டவுன் தொகுப்பு
  - `DavidAnson.vscode-markdownlint` - மார்க்டவுன் பிழைத்திருத்தி
  - `bierner.markdown-mermaid` - மெர்மெய்ட் வரைபட ஆதரவு
  - `redhat.vscode-yaml` - YAML ஆதரவு (azure.yaml க்கான)
  - `eamodio.gitlens` - Git பார்வையிடுதல்
  - `mhutchie.git-graph` - Git வரலாறு

- **⚙️ VS கோட் அமைப்புகள்**: Python வரையறுத்தி, சேமிக்கும் பொழுது வடிவமைப்பு மற்றும் வெள்ளை இடங்களை நீக்கும் இயல்புகள் சேர்க்கப்பட்டன

- **📦 requirements-dev.txt புதுப்பிக்கப்பட்டது**:
  - MkDocs குறுக் குறைந்த பிளகின் சேர்க்கப்பட்டது
  - குறியீட்டு தரத்திற்கு pre-commit சேர்க்கப்பட்டது
  - Azure SDK பைல்களைச் சேர்த்தது (azure-identity, azure-mgmt-resource)

#### சரி செய்யப்பட்டது
- **பிறகு உருவாக்கு கட்டளை**: தற்போது கெயிண்டர் தொடக்கத்தில் AZD மற்றும் Azure CLI நிறுவல் சரிபார்க்கப்படுகிறது

---

### [v3.11.0] - 2026-02-05

#### தொடக்கம்-பண்புடைய README மறுசீரமைப்பு
**இந்த பதிப்பு README.md ஐ ஆரம்பக்காரர்களுக்காக மிகவும் அணுகக்கூடியதாக மாற்றியது மற்றும் AI டெவலப்பர்களுக்கான முக்கிய ஆதாரங்களை சேர்த்தது.**

#### சேர்க்கப்பட்டது
- **🆚 Azure CLI மற்றும் AZD ஒப்பீடு**: எப்போது எந்த கருவியை பயன்படுத்துவது என்பதற்கான தெளிவான விளக்கம் மற்றும் நடைமுறை உதாரணங்கள்
- **🌟 அருமையான AZD இணைப்புகள்**: சமூகம் வார்ப்புரு காட்சியகம் மற்றும் பங்களிப்பு வளங்களுக்கு நேரடி இணைப்புகள்:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ தயாராக despliy செய்யத் தயார் வார்ப்புருக்கள்
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - சமூக பங்களிப்பு
- **🎯 விரைவு துவக்கம் வழிகாட்டு**: எளிமையாக்கப்பட்ட 3 படி செய்யும் துவக்க பகுதி (நிறுவு → உள்நுழைய → despliy செய்)
- **📊 அனுபவ அடிப்படையிலான வழிசெல்லும் அட்டவணை**: டெவலப்பர் அனுபவ அடிப்படையில் எங்கே தொடங்குவது என்பதற்கான தெளிவு வழிகாட்டல்

#### மாற்றப்பட்டது
- **README அமைப்பு**: முன்னேற்ற வெளிப்பாடு குறித்துத்துடன் மறுசீரமைக்கப்பட்டது - முதலில் முக்கிய தகவல்
- **அறிமுக பகுதி**: "The Magic of `azd up`" என்பதைக் தொடங்கியவர்களுக்கு விளக்கும்படி மறுபடியும் எழுதப்பட்டது
- **நகல் உள்ளடக்கத்தை நீக்கப்பட்டது**: நகல் சிக்கல் தீர்ப்பு பகுதி அகற்றப்பட்டது

- **பிரச்சனை தீர்க்கும் கட்டளைகள்**: செல்லுபடியான `azd monitor --logs` பயன்படுத்த `azd logs` குறிப்பு சரி செய்யப்பட்டது

#### சரி செய்யப்பட்டது

- **🔐 அங்கீகாரம் கட்டளைகள்**: `azd auth login` மற்றும் `azd auth logout` cheat-sheet.md இல் சேர்க்கப்பட்டது
- **தவறான கட்டளை குறிப்புகள்**: README பிரச்சினை தீர்க்கும் பகுதியில் உள்ள மீதி `azd logs` அகற்றப்பட்டது

#### குறிப்பு
- **அளவுகோல்**: மாற்றங்கள் மெயின் README.md மற்றும் resources/cheat-sheet.md இல் பொருந்தும்
- **இலக்கு பார்வையாளர்கள்**: புதிய AZD பதிவாளர்களுக்காக சிறப்பாக மேம்படுத்தல்

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI கட்டளை துல்லிய அப்டேடு
**இந்த பதிப்பு அனைத்து ஆவணங்களிலும் இல்லாத AZD கட்டளைகளைத் திருத்துகிறது, அனைத்து குறியீட்டு உதாரணங்களும் செல்லுபடியான Azure Developer CLI இலக்கணத்தைப் பயன்படுத்துவதை உறுதிப்படுத்துகிறது.**

#### திருத்தப்பட்டது
- **🔧 இல்லாத AZD கட்டளைகள் அகற்றிச் சரி செய்யப்பட்டது**: தவறான கட்டளைகளின் முழுமையான ஆய்வு மற்றும் திருத்தம்:
  - `azd logs` (இல்லை) → `azd monitor --logs` அல்லது Azure CLI மாற்று
  - `azd service` துணைக்கட்டளைகள் (இல்லை) → `azd show` மற்றும் Azure CLI மூலம் மாற்றப்பட்டது
  - `azd infra import/export/validate` (இல்லை) → அகற்றப்பட்டது அல்லது செல்லுபடியான மாற்று
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` கொடிகள் (இல்லை) → அகற்றப்பட்டது
  - `azd provision --what-if/--rollback` கொடிகள் (இல்லை) → `--preview` ஆக மாற்றப்பட்டது
  - `azd config validate` (இல்லை) → `azd config list` ஆக மாற்றப்பட்டது
  - `azd info`, `azd history`, `azd metrics` (இல்லை) → அகற்றப்பட்டது

- **📚 கட்டளைகள் திருத்தப்பட்ட கோப்புகள்**:
  - `resources/cheat-sheet.md`: கட்டளை குறிப்பின் பெரும் திருத்தம்
  - `docs/deployment/deployment-guide.md`: ரோல்பேக் மற்றும் triểnல் உத்திகள் திருத்தம்
  - `docs/troubleshooting/debugging.md`: பதிவு பகுப்பு அத்தியாயம் திருத்தம்
  - `docs/troubleshooting/common-issues.md`: பிரச்சினை தீர்க்கும் கட்டளைகள் புதுப்பிக்கப்பட்டது
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD டீபக்கிங் பகுதி திருத்தம்
  - `docs/getting-started/azd-basics.md`: மேற்பார்வை கட்டளைகள் திருத்தம்
  - `docs/getting-started/first-project.md`: மேற்பார்வை மற்றும் டீபக்கிங் உதாரணங்கள் புதுப்பிக்கப்பட்டது
  - `docs/getting-started/installation.md`: உதவி மற்றும் பதிப்பு உதாரணங்கள் திருத்தம்
  - `docs/pre-deployment/application-insights.md`: பதிவு பார்வை கட்டளைகள் திருத்தம்
  - `docs/pre-deployment/coordination-patterns.md`: ஏஜென்ட் டீபக்கிங் கட்டளைகள் திருத்தம்

- **📝 பதிப்பு குறிப்பு புதுப்பிக்கப்பட்டது**:
  - `docs/getting-started/installation.md`: கடினமாக்கப்பட்ட `1.5.0` பதிப்பை பொதுவான `1.x.x` ஆக மாற்றி வெளியீடுகளுக்கான இணைப்புடன்

#### மாற்றப்பட்டது
- **ரோல்பேக் உத்திகள்**: ஆவணங்களை Git அடிப்படையிலான ரோல்பேக் பயன்படுத்துவதற்கு மேம்படுத்தியது (AZD இல் இயல்பான ரோல்பேக் இல்லை)
- **பதிவு பார்வை**: `azd logs` குறிப்புகளை `azd monitor --logs`, `azd monitor --live`, மற்றும் Azure CLI கட்டளைகளால் மாற்றியது
- **செயற்கை பகுதி**: இல்லாத இணைப்பு/தற்போதைய triểnல் கொடிகள் அகற்றப்பட்டு செல்லுபடியான மாற்றுகள் வழங்கப்பட்டது

#### தொழில்நுட்ப விவரங்கள்
- **செயல்படும் AZD கட்டளைகள்**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **செயல்படும் azd monitor கொடிகைகள்**: `--live`, `--logs`, `--overview`
- **அகற்றப்பட்ட அம்சங்கள்**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### குறிப்பு
- **சரிபார்த்தல்**: கட்டளைகள் Azure Developer CLI v1.23.x மூலம் சரிபார்க்கப்பட்டது

---

### [v3.9.0] - 2026-02-05

#### பணிமனை நிறைவு மற்றும் ஆவணத் தர மேம்பாடு
**இந்த பதிப்பு இடைமுக பணிமனை தொகுதிகளை நிறைவு செய்து, அனைத்து உடைப்பு ஆவண இணைப்புகளையும் சரி செய்து, Microsoft AZD ஐ பயன்படுத்தும் AI உருவாக்குநர்களுக்கான தரதை மேம்படுத்துகிறது.**

#### சேர்க்கப்பட்டது
- **📝 CONTRIBUTING.md**: புதிய பங்களிப்பு வழிகாட்டுதல்கள் ஆவணம்:
  - பிரச்சினைகளை அறிக்கை செய்ய மற்றும் மாற்றங்கள் பரிந்துரைக்கும் தெளிவான உத்தரவுகள்
  - புதிய உள்ளடக்க ஆவண நிறுவலுக்கான தரநிலைகள்
  - குறியீடு உதாரண வழிகாட்டுதல்கள் மற்றும் commit செய்தி நடைமுறைகள்
  - சமூக ஈடுபாடு தகவல்கள்

#### நிறைவு செய்தது
- **🎯 பணிமனை தொகுதி 7 (முடிவு)**: முழுமையாக நிறைவு செய்யப்பட்ட முடிவுப்பகுதி:
  - பணிமனை சாதனைகளின் விரிவான சுருக்கம்
  - AZD, தொழிற்சாணல்கள் மற்றும் Microsoft Foundry பற்றிய முக்கியக் கருத்துக்கள்
  - கற்றல் பயணம் தொடரும் பரிந்துரைகள்
  - பணிமனை சவால்கள் வெவ்வேறு சிரம நிலைகளுடன்
  - சமூக கருத்துக்களை மற்றும் ஆதரவு இணைப்புகள்

- **📚 பணிமனை தொகுதி 3 (விளக்கம்)**: கற்றல் நோக்கங்களுடன் புதுப்பிக்கப்பட்டது:
  - GitHub Copilot MCP சேவைகளுடன் செயல்பாட்டிற்கான வழிகாட்டல்
  - AZD தொழிற்சாணல் கோப்பு அமைப்பு புரிதல்
  - குழுமத் தோற்றவியல் (Bicep) ஒருங்கிணைப்பு தீர்கள்
  - கைமுறை பயிற்சித்தாள் அறிவுறுத்தல்கள்

- **🔧 பணிமனை தொகுதி 6 (சிதைவு)**: நிறைவு செய்தது:
  - வள சுத்திகரிப்பு மற்றும் செலவு மேலாண்மை இலக்குகள்
  - `azd down` உதவி மூலம் அமைப்பு பாதுகாப்பான வெளியேற்றம்
  - மென்மையான அழிக்கப்பட்ட குறிய தீர்வுகள்
  - GitHub Copilot மற்றும் Azure தொகுதிக்கு கூடுதல் ஆராய்ச்சி உத்தரவுகள்

#### திருத்தம்
- **🔗 உடைந்த ஒட்டுமொத்த இணைப்புகள் சரி செய்தல்**: 15+ உடைந்த உள்ளக அணுகல் இணைப்புகள் தீர்க்கப்பட்டன:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md பாதைகள் சரி செய்யப்பட்டது
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md மற்றும் production-ai-practices.md பாதைகள் திருத்தம்
  - `docs/getting-started/first-project.md`: இல்லாத cicd-integration.md `deployment-guide.md` உடன் மாற்றப்பட்டது
  - `examples/retail-scenario.md`: அடிக்கடி கேட்கப்படும் கேள்விகள் மற்றும் பிரச்சினை தீர்க்கும் வழிகாட்டி பாதைகள் சரி செய்யப்பட்டது
  - `examples/container-app/microservices/README.md`: பாட கோட்டையும் triểnல் வழிகாட்டியும் சரி செய்யப்பட்டது
  - `resources/faq.md` மற்றும் `resources/glossary.md`: AI அதிகார சிறந்த குறிப்புகள் புதுப்பிக்கப்பட்டது
  - `course-outline.md`: பயிற்றுநர் கையேடு மற்றும் AI பணிமனை ஆய்வு குறிப்புகள் திருத்தம்

- **📅 பணிமனை நிலை பட்டை**: "அட்டைத் தொழிலாளரின் கீழ் உள்ளது" என்பதிலிருந்து 2026 பிப்ரவரி தினத்தில் செயல்பாட்டிற்கான நிலைக்கு புதுப்பிக்கப்பட்டது

- **🔗 பணிமனை வழிசெலுத்தல்**: அமைப்பு README.md இல் இல்லாத lab-1-azd-basics கோப்புறை நோக்கி உடைந்த வழிசெலுத்தல் இணைப்புகள் சரி செய்யப்பட்டது

#### மாற்றப்பட்டது
- **பணிமனை அறிமுகம்**: "கட்டுமானத்தில் உள்ளது" என்ற எச்சரிக்கை அகற்றப்பட்டது, பணிமனை தற்போது முழுமையடைந்தது மற்றும் பயன்படுத்த தயாராக உள்ளது
- **வழிசெலுத்தல் ஒற்றுமை**: அனைத்து பணிமனை தொகுதிகளுக்கும் சரியான இடையேயான வழிசெலுத்தல் உறுதி செய்யப்பட்டது
- **கற்றல் பாதை குறிப்புகள்**: சரியான microsoft-foundry பாதைகள் உபயோகப்படுத்த பிற அதிகாரங்கள் புதுப்பிக்கப்பட்டது

#### சரிபார்க்கப்பட்டது
- ✅ அனைத்து ஆங்கில markdown கோப்புகளும் உள்ளக இணைப்புகளுடன் செல்லுபடியானவை
- ✅ பணிமனை தொகுதிகள் 0-7 கற்றல் நோக்கங்களுடன் முழுமையானவை
- ✅ அதிகாரங்கள் மற்றும் தொகுதிகள் இடையேயான வழிசெலுத்தல் சரியாக செயல்படுகிறது
- ✅ உள்ளடக்கம் Microsoft AZD பயன்படுத்தும் AI உருவாக்குநர்களுக்கு பொருத்தமானது
- ✅ துவக்க நிலை மொழி மற்றும் அமைப்பு நன்கு பராமரிக்கப்பட்டது
- ✅ CONTRIBUTING.md சமூக பங்களிப்பாளர்களுக்கு தெளிவான வழிகாட்டியைக் கொடுக்கிறது

#### தொழில்நுட்ப செயல்படுத்தல்
- **இணைப்பு சரிபார்த்தல்**: சுயமாக இயங்கும் PowerShell ஸ்கிரிப்ட் அனைத்து .md உள்ளக இணைப்புகளையும் சரிபார்த்தது
- **உள்ளடக்க ஆய்வு**: பணிமனை முழுமை மற்றும் துவக்கர்களுக்கு ஏற்ற தன்மை கையேடு காணப்பட்டது
- **வழிசெலுத்தல் முறைமை**: அதிகார மற்றும் தொகுதி வழிசெலுத்தல் முறைகள் ஒரே மாதிரியாகப் பயன்படுத்தப்பட்டன

#### குறிப்பு
- **அளவுகோல்**: மாற்றங்கள் ஆங்கில ஆவணங்களுக்கு மட்டுமே பொருந்தும்
- **மொழிபெயர்ப்பு**: இந்த பதிப்பில் மொழிபெயர்ப்பு கோப்புறைகள் புதுப்பிக்கப்படவில்லை (த் தானாக மொழிபெயர்ப்பு பின்னர் ஒத்திசைக்கப்படும்)
- **பணிமனை காலம்**: தற்போது முழுமையாக 3-4 மணி நேர கைமுறை கற்றலை வழங்குகிறது

---

### [v3.8.0] - 2025-11-19

#### மேம்பட்ட ஆவணங்கள்: கண்காணிப்பு, பாதுகாப்பு, மற்றும் பல-ஏஜென்ட் நெறிகள்
**இந்த பதிப்பு மேம்பட்ட வகுப்புகளைச் சேர்க்கிறது, Application Insights ஒருங்கிணைப்பு, அங்கீகாரம் மற்றும் பல-ஏஜென்ட் ஒத்துழைப்பு உத்திகள் பற்றிய முழுமையான A-தரம் பாடங்கள் வழங்குகிறது.**

#### சேர்க்கப்பட்டது
- **📊 Application Insights ஒருங்கிணைப்பு பாடம்**: `docs/pre-deployment/application-insights.md` இல்:
  - AZD கவனம் மையமாக கொண்ட triểnல் மற்றும் தானியங்கி வள ஒதுக்கீடு
  - Application Insights மற்றும் Log Analytics க்கான முழு Bicep தொழிற்சாணல்கள்
  - தனிப்பயன் தொலைமைபார்வைப் பயன்பாடுகளுடன் (1200+ வரிகள்)
  - AI/LLM கண்காணிப்பு நெறிகள் (Microsoft Foundry Models குறியீடு/செலவுக் கண்காணிப்பு)
  - 6 மர்மெய்ட் வரைபடங்கள் (கட்டமைப்பு, பகிர்ந்த திரைக்கோள், தொலைநோக்கு ஓட்டம்)
  - 3 கைமுறை பயிற்சிகள் (எச்சரிக்கை, டாஷ்போர்டு, AI கண்காணிப்பு)
  - குஸ்டோ கேள்விகள் மற்றும் செலவு மிகுதி நெறிமுறை
  - நேரடி அளவீடுகள் மற்றும் நேரடி டீபக்கிங்
  - 40-50 நிமிட கற்றல் நேரம் மற்றும் தயாரான triểnல் நெறிகள்

- **🔐 அங்கீகாரம் மற்றும் பாதுகாப்பு நெறிகள் பாடம்**: `docs/getting-started/authsecurity.md` இல்:
  - 3 அங்கீகாரம் வகைகள் (பெறுபடுத்தல் குறிகள், Key Vault, நிர்வகிக்கப்பட்ட அடையாளம்)
  - பாதுகாப்பான triểnல் க்கான முழுமையான Bicep தொழிற்சாணல்கள்
  - Node.js பயன்பாட்டுக் குறியீடு Azure SDK ஒருங்கிணைப்பு உடன்
  - 3 முழுமையான பயிற்சிகள் (நிர்வகிக்கப்பட்ட அடையாளம் இயக்கு, பயனர் அங்கீகாரம் மாற்று, Key Vault சுற்றுச்சுழற்சி)
  - பாதுகாப்பு சிறந்த முறைகள் மற்றும் RBAC கட்டமைப்புகள்
  - பிரச்சினை தீர்க்கும் குறிப்பு மற்றும் செலவு பகுப்பாய்வு
  - தயாரான கடவுச்சொல் இல்லாத அங்கீகாரம் நெறிகள்

- **🤖 பல-ஏஜென்ட் ஒத்துழைப்பு நெறிகள் பாடம்**: `docs/pre-deployment/coordination-patterns.md` இல்:
  - 5 ஒத்துழைப்பு வழிகள் (வரிசைப்படுத்தப்பட்ட, இணைப்பு, மரபன்படி, நிகழ்வு இயக்கப்பட்ட, ஒப்புக் குழு)
  - முழுமையான ஒருங்கிணைவு சேவை செயலாக்கம் (Python/Flask, 1500+ வரிகள்)
  - 3 சிறப்பு ஏஜென்ட் செயலாக்கங்கள் (ஆராய்ச்சி, எழுத்தாளர், தொகுப்பாளர்)
  - செய்திகள் வரிசைப்படுத்தும் சேவை பஸ் ஒருங்கிணைப்பு
  - Cosmos DB மாநில மேலாண்மை பரப்பான அமைப்புகளுக்கு
  - 6 மர்மெய்ட் வரைபடங்கள் ஏஜென்ட் தொடர்புகளை காட்டுகிறது
  - 3 மேம்பட்ட பயிற்சிகள் (காலாவதி கையாளல், மீண்டும் முயற்சி நெறிமுறை, சுற்று ஒதுக்கி)
  - செலவு பகிர்வு ($240-565/மாதம்) மற்றும் மிகுதி ஒழுங்குகள்
  - Application Insights ஒருங்கிணைப்பு கண்காணிப்புக்கு

#### மேம்படுத்தப்பட்டது
- **முன்-பதிவேற்ற அத்தியாயம்**: முழுமையான கண்காணிப்பு மற்றும் ஒத்துழைப்பு வழிகளை இப்போது கொண்டுள்ளது
- **துவக்கம் அத்தியாயம்**: தொழில்முறை அங்கீகாரம் நெறிகள் கொண்டு மேம்படுத்தப்பட்டது
- **பிரடக்க்ஷன் தயார்ப்புடன்**: பாதுகாப்பு முதல் கண்காணிப்புவரை முழுமையான வரையறை
- **பாட வகுப்பு வடிவமைப்பு**: அத்தியாயங்கள் 3 மற்றும் 6 இல் புதிய பாடங்கள் குறித்த புதுப்பித்தல்

#### மாற்றப்பட்டது
- **கற்றல் முன்னேற்றம்**: பாதுகாப்பு மற்றும் கண்காணிப்புகளை பாடத்தின் முழுவதும் நன்கு ஒருங்கிணைத்தது
- **ஆவண தரம்**: புதிய பாடங்களில் ஒரே மாதிரி A-தரம் தரநிலைகள் (95-97%)
- **பிரடக்க்ஷன் வகைகள்**: நிறுவன triểnல்கள் முழுவதும் முழுமையான உள்ளடக்கம்

#### மேம்படுத்தப்பட்டது
- **உருவாக்குநர் அனுபவம்**: வளமைக்கான கண்காணிப்புக்கு தெளிவான பாதை
- **பாதுகாப்பு தரங்கள்**: அங்கீகாரம் மற்றும் ரகசிய மேலாண்மைக்கு தொழில்முறை நெறிகள்
- **கண்காணிப்பு திறன்**: AZD உடன் முழுமையான Application Insights ஒருங்கிணைப்பு
- **AI பணிகள்**: Microsoft Foundry Models மற்றும் பல-ஏஜென்ட் அமைப்புகளுக்கான சிறப்பு கண்காணிப்பு

#### சரிபார்க்கப்பட்டது
- ✅ அனைத்து பாடங்களிலும் முழுமையான செயல்படும் குறியீடு (குறும்பாக அல்ல)
- ✅ காட்சி கற்றலுக்கான மர்மெய்ட் வரைபடங்கள் (3 பாடங்களில் 19 மொத்தம்)
- ✅ செயல்பாட்டு பயிற்சிகள் சரிபார்த்தல் படிகள் உடன் (9 மொத்தம்)
- ✅ தயாரான Bicep தொழிற்சாணல்கள் `azd up` மூலம் triểnக்கக்கூடியவை
- ✅ செலவு பகுப்பாய்வு மற்றும் மிகுதி நெறிமுறைகள்
- ✅ பிரச்சினை தீர்க்கும் கையேடுகள் மற்றும் சிறந்த நடைமுறைகள்
- ✅ அறிவுத்திறன் கட்டுப்பாட்டு கட்டளைகள் உடன் தேர்வு நிலைகள்

#### ஆவண தர மதிப்பீடு முடிவுகள்
- **docs/pre-deployment/application-insights.md**: - முழுமையான கண்காணிப்பு கையேடு
- **docs/getting-started/authsecurity.md**: - தொழில்முறை பாதுகாப்பு நெறிகள்
- **docs/pre-deployment/coordination-patterns.md**: - மேம்பட்ட பல-ஏஜென்ட் கட்டமைப்புகள்
- **மொத்த புதிய உள்ளடக்கம்**: - ஒரே மாதிரி உயர் தர தரநிலைகள்

#### தொழில்நுட்ப செயல்பாட்டாக்கம்
- **Application Insights**: Log Analytics + தனிப்பயன் தொலைநோக்கு + பகிர்ந்த திரைச்சீட்டு
- **அங்கீகாரம்**: நிர்வகிக்கப்பட்ட அடையாளம் + Key Vault + RBAC நெறிகள்
- **பல-ஏஜென்ட்**: சேவை பஸ் + Cosmos DB + குழாய் பயன்பாடுகள் + ஒருங்கிணைப்பு
- **கண்காணிப்பு**: நேரடி அளவீடுகள் + குஸ்டோ கேள்விகள் + எச்சரிக்கைகள் + டாஷ்போர்டுகள்
- **செலவு மேலாண்மை**: மாதிரீடு நெறிகள், பதிலீட்டு கொள்கைகள், பட்ஜெட் கட்டுப்பாடுகள்

### [v3.7.0] - 2025-11-19

#### ஆவணத் தர மேம்பாடு மற்றும் புதிய Microsoft Foundry Models உதாரணம்
**இந்த பதிப்பு முழுவெளியீட்டில் ஆவணத் தரத்தை மேம்படுத்துகிறது மற்றும் gpt-4.1 உரையாடல் இடைமுகத்துடன் Microsoft Foundry Models triểnல் முழுமையான உதாரணத்தை சேர்க்கிறது.**

#### சேர்க்கப்பட்டது
- **🤖 Microsoft Foundry Models உரையாடல் உதாரணம்**: முழு gpt-4.1 triểnல் `examples/azure-openai-chat/` இல் செயல்முறையுடன்:
  - Microsoft Foundry Models முழுமையான மைய தொழிற்சாலை (gpt-4.1 மாதிரி triểnல்)
  - பேச்சு வரலாறு உடன் Python கட்டளை வரி உரையாடல் இடைமுகம்
  - பாதுகாப்பான API விசை சேமிப்புக்கு Key Vault ஒருங்கிணைப்பு
  - குறியீட்டு பயன்பாடு கண்காணிப்பு மற்றும் செலவு மதிப்பீடு
  - வரம்பிடல் மற்றும் தவறு கையாளுதல்
  - 35-45 நிமிட triểnல் வழிகாட்டியுடன் விரிவான README
  - 11 தயாரான கோப்புகள் (Bicep தொழிற்சாணல்கள், Python பயன்பாடு, கட்டமைப்பு)
- **📚 ஆவணப் பயிற்சிகள்**: கட்டமைப்பு வழிகாட்டியில் கைமுறை பயிற்சிகள் சேர்க்கப்பட்டது:
  - பயிற்சி 1: பன்முக சுற்றுச்சூழல் கட்டமைப்பு (15 நிமிடங்கள்)
  - பயிற்சி 2: ரகசிய மேலாண்மை பயிற்சி (10 நிமிடங்கள்)
  - தெளிவான வெற்றி அளவுக் критерியைகள் மற்றும் சரிபார்த்தல் படிகள்
- **✅ triểnல் சரிபார்த்தல்**: triểnல் வழிகாட்டியில் சரிபார்த்தல் பகுதி சேர்க்கப்பட்டது:
  - ஆரோக்கியச் சோதனைகள் நடைமுறைகள்
  - வெற்றி குறியீட்டு பட்டியல்
  - அனைத்து triểnல் கட்டளைகளுக்கான எதிர்பார்க்கப்படும் வெளியீடுகள்
  - பிரச்சினை தீர்க்கும் விரைந்து அணுகல்

#### மேம்படுத்தப்பட்டது
- **examples/README.md**: A தரத்தில் (93%) மேம்படுத்தப்பட்டது:
  - azure-openai-chat அனைத்து தொடர்புடைய பகுதிகளுக்கு சேர்க்கப்பட்டது
  - உள்ளூர் உதாரண எண்ணிக்கை 3 இலிருந்து 4 ஆக மேம்பட்டது
  - AI பயன்பாட்டு உதாரண அட்டவணையில் சேர்க்கப்பட்டது
  - இடைநிலை பயனருக்கான விரைவு துவக்கம் உபயோகப்படுத்தல் உட்படுத்தப்பட்டது
  - Microsoft Foundry தொழிற்சாணல் பிரிவில் சேர்க்கப்பட்டது
  - ஒப்பீட்டு கட்டமைப்பு மற்றும் தொழில்நுட்பக் காண்கைகள் புதுப்பிக்கப்பட்டது
- **ஆவணத் தரம்**: docs கோப்புறையில் B+ (87%) → A- (92%) மென்மேலும் மேம்படுத்தப்பட்டது

  - முக்கிய கட்டளை எடுத்துக்காட்டுகளுக்கு எதிர்பார்க்கப்படும் வெளியீடுகள் சேர்க்கப்பட்டன
  - कॉन्फ़िगरेशन மாற்றங்களுக்கு சரிபார்ப்பு படிகள் சேர்க்கப்பட்டன
  - ப்ரயோகபூர்வ பயிற்சிகளுடன் கைமுறை கற்றல் மேம்படுத்தப்பட்டது

#### மாற்றப்பட்டது
- **கற்றல் முன்னேற்றம்**: நடுத்தர கற்றாளர்களுக்கான AI எடுத்துக்காட்டுகளின் சிறந்த ஒருங்கிணைப்பு
- **ஆவண ஒழுங்கமைப்பு**: தெளிவான முடிவுகளுடன் மேலும் செயல்படக்கூடிய பயிற்சிகள்
- **சரிபார்ப்பு செயல்முறை**: முக்கிய பணியிட செயல்முறைகளுக்கு தெளிவான வெற்றி அளவுகோல்கள் சேர்க்கப்பட்டன

#### மேம்படுத்தப்பட்டது
- **வளர்ச்சியாளருக்கு அனுபவம்**: Microsoft Foundry மாதிரிகள் பிணைப்பு இப்போது 35-45 நிமிடங்கள் (சிக்கலான மாற்றுகளுக்கு 60-90 நிமிடங்களுக்கு மாறாக)
- **விலை வெளிப்படைமை**: Microsoft Foundry மாதிரிகளுக்கான தெளிவான செலவுக் கணக்குகள் ($50-200/மாதம்)
- **கற்றல் பாதை**: AI வளர்ச்சியாளர்களுக்கு azure-openai-chat உடன் தெளிவான நுழைவாயில்
- **ஆவண தரநிலைகள்**: எதிர்பார்க்கப்பட்ட வெளியீடுகள் மற்றும் சரிபார்ப்பு படிகள் ஒரே நிலைமை

#### சொல்லப்பட்டன
- ✅ Microsoft Foundry மாதிரி `azd up` உடன் முழுமையாக செயல்படுகிறது
- ✅ 11 செயலாக்கக் கோப்புகள் முறையாக உள்ளன
- ✅ README கட்டளை அனுபவத்துடன் பொருந்தும்
- ✅ ஆவண இணைப்புகள் 8+ இடங்களில் புதுப்பிக்கப்பட்டன
- ✅ எடுத்துக்காட்டுகள் குறியீடு 4 உள்ளூர் எடுத்துக்காட்டுகளை சரியாக பிரதிபலிக்கிறது
- ✅ அட்டவணைகளில் எந்தவொரு நகல் வெளியீட்டு இணைப்புகள் இல்லை
- ✅ அனைத்து வழிசெலுத்தல் குறிப்புகளும் சரியானவை

#### தொழில்நுட்ப செயலாக்கம்
- **Microsoft Foundry மாதிரிகள் கட்டமைப்பு**: gpt-4.1 + Key Vault + Container Apps வடிவமைப்பு
- **பாதுகாப்பு**: Managed Identity தயார், Key Vault இல் ரகசியங்கள்
- **கண்காணிப்பு**: Application Insights ஒருங்கிணைப்பு
- **செலவு மேலாண்மை**: டோகன் கண்காணிப்பு மற்றும் பயன்பாடு மேம்பாடு
- **பிணைப்பு**: முழுமையான அமைப்புக்கான தனி `azd up` கட்டளை

### [v3.6.0] - 2025-11-19

#### முக்கிய புதுப்பிப்பு: கன்டெய்னர் செயலி பிணைப்புத் எடுத்துக்காட்டுகள்
**இந்த பதிப்பு Azure Developer CLI (AZD) பயன்படுத்தி முழுமையான தயாரிப்பு-தயார் கன்டெய்னர் செயலி பிணைப்புத் எடுத்துக்காட்டுகளையும், முழுமையான ஆவணத்தையும் கற்றல் பாதையில் ஒருங்கிணைத்துள்ளது.**

#### சேர்க்கப்பட்டது
- **🚀 கன்டெய்னர் செயலி எடுத்துக்காட்டுகள்**: புதிய உள்ளூர் எடுத்துக்காட்டுகள் `examples/container-app/`:
  - [மாஸ்டர் வழிகாட்டி](examples/container-app/README.md): கன்டெய்னரை அடிப்படையாகக் கொண்ட பிணைப்புகளுக்கு முழுமையான பார்வை, விரைவு துவக்கம், தயாரிப்பு, முன்னேற்ற வடிவங்கள்
  - [சாதாரண Flask API](../../examples/container-app/simple-flask-api): தொடக்கம் தொடங்கும் REST API உடன் அளவுக்கு-சுழற்சி, ஆரோக்கிய பரிசோதனைகள், கண்காணிப்பு மற்றும் பிழைதிருத்தம்
  - [மைக்ரோசெர்வீசஸ் கட்டமைப்பு](../../examples/container-app/microservices): தயாரிப்பு-தயார் பல்சேவைகள் பிணைப்பு (API Gateway, தயாரிப்பு, ஆர்டர், பயனர், அறிவிப்பு), அசிங்க் செய்தியிடல், சேவை பஸ், கோஸ்மாஸ் DB, Azure SQL, பரவலான தடயப்படுத்தல், நீலம்-பச்சை/கேனரி பிணைப்பு
- **சிறந்த நடைமுறைகள்**: பாதுகாப்பு, கண்காணிப்பு, செலவு மேம்பாடு மற்றும் சிஐ/சிடி வழிகாட்டி கன்டெய்னரை அடிப்படையாகக் கொண்ட பணிகளுக்கு
- **கோடு எடுத்துக்காட்டுகள்**: முழுமையான `azure.yaml`, Bicep மாதிரிகள் மற்றும் பல்மொழி சேவை அமலாக்கங்கள் (Python, Node.js, C#, Go)
- **சோதனை மற்றும் பிழைதிருத்தம்**: முழுமையான சோதனை நிகழ்வுகள், கண்காணிப்பு கட்டளைகள், பிழை திருத்த வழிகாட்டி

#### மாற்றப்பட்டது
- **README.md**: புதிய கன்டெய்னர் செயலி எடுத்துக்காட்டுக்களை "உள்ளூர் எடுத்துக்காட்டுகள் - கன்டெய்னர் செயலிகள்" கீழ் இணைத்து புதுப்பித்தல்
- **examples/README.md**: கன்டெய்னர் செயலி எடுத்துக்காட்டுகளை வலியுறுத்தி, ஒப்பீட்டு அட்டவணை செருகி, தொழில்நுட்ப/கட்டமைப்பு குறிப்புகள் புதுப்பிக்கப்பட்டன
- **பாடம் திட்டம் மற்றும் ஆய்வு வழிகாட்டி**: புதிய கன்டெய்னர் செயலி எடுத்துக்காட்டுகளும் பிணைப்புக் காட்சிகளும் தொடர்புடைய அத்தியாயங்களில் புதுப்பிக்கப்பட்டன

#### சொல்லப்பட்டன
- ✅ அனைத்து புதிய எடுத்துக்காட்டுகளும் `azd up` மூலம் பிணைக்கக்கூடியவை மற்றும் சிறந்த நடைமுறைகளை பின்பற்றுகின்றன
- ✅ ஆவண குறும்பட்டைகாட்கள் மற்றும் வழிசெலுத்தல் புதுப்பிக்கப்பட்டது
- ✅ எடுத்துக்காட்டுகள் புதியவர்களிலிருந்து முன்னேற்ற நிலைகளின் சூழல்களை உள்ளடக்கியவை

#### குறிப்புகள்
- **களலம்**: ஆங்கில ஆவணங்கள் மற்றும் எடுத்துக்காட்டுகள் மட்டுமே
- **அடுத்த படிகள்**: மேலதிக முன்னேற்ற கன்டெய்னர் வடிவங்கள் மற்றும் சிஐ/சிடி தானியக்கத்தை எதிர்கால பதிப்புகளில் விரிவாக்கம்

### [v3.5.0] - 2025-11-19

#### தயாரிப்பு மறுபெயரிடல்: Microsoft Foundry
**இந்த பதிப்பு "Microsoft Foundry" என்ற தயாரிப்பு பெயரை முழுமையாக ஆங்கில ஆவணங்களில் மாற்றி Microsoft இன் அதிகாரப்பூர்வ மறுபெயரிடலை பிரதிபலிக்கிறது.**

#### மாற்றப்பட்டது
- **🔄 தயாரிப்பு பெயர் புதுப்பிப்பு**: "Microsoft Foundry" இல் முழுமையான மறுபெயரிடல்
  - `docs/` கோப்புறையில் உள்ள அனைத்து குறிப்புகளும் புதுப்பிக்கப்பட்டன
  - கோப்புறை பெயர் மாற்றம்: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - கோப்பு பெயர் மாற்றம்: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - மொத்தம்: 7 ஆவணக் கோப்புகளில் 23 உள்ளடக்க குறிப்புகள் புதுப்பிக்கப்பட்டன

- **📁 கோப்புறை அமைப்பு மாற்றங்கள்**:
  - `docs/ai-foundry/` இல் பெயர் மாற்றம் `docs/microsoft-foundry/` ஆக
  - புதிய கோப்புறை அமைப்புக்கு ஏற்ப அனைத்து குறும்பட்டைகள் புதுப்பிக்கப்பட்டன
  - அனைத்து ஆவணங்களில் வழிசெலுத்தல் இணைப்புகள் சரிபார்க்கப்பட்டன

- **📄 கோப்பு பெயர் மாற்றங்கள்**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - புதிய கோப்பு பெயர் மூலம் அனைத்து உள்ளுறை இணைப்புகள் புதுப்பிக்கப்பட்டன

#### புதுப்பிக்கபட்ட கோப்புகள்
- **அத்தியாய ஆவணங்கள்** (7 கோப்புகள்):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 வழிசெலுத்தல் இணைப்பு புதுப்பிப்புகள்
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 தயாரிப்பு பெயர் குறிப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ஏற்கனவே Microsoft Foundry பயன்படுத்தப்படுகிறது (முன் புதுப்பிப்புகளிலிருந்து)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 குறிப்புகள் புதுப்பிக்கப்பட்டன (அறிமுகம், சமுதாய கருத்துக்களம், ஆவணங்கள்)
  - `docs/getting-started/azd-basics.md` - 4 குறும்பட்டை இணைப்புகள் புதியதாக்கப்பட்டன
  - `docs/getting-started/first-project.md` - 2 அத்தியாய வழிசெலுத்தல் இணைப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/getting-started/installation.md` - 2 அடுத்த அத்தியாய இணைப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 குறிப்புகள் புதுப்பிக்கப்பட்டன (வழிசெலுத்தல், Discord சமுதாயம்)
  - `docs/troubleshooting/common-issues.md` - 1 வழிசெலுத்தல் இணைப்பு புதுப்பிக்கப்பட்டது
  - `docs/troubleshooting/debugging.md` - 1 வழிசெலுத்தல் இணைப்பு புதுப்பிக்கப்பட்டது

- **பாட திட்ட அமைப்பு கோப்புகள்** (2 கோப்புகள்):
  - `README.md` - 17 குறிப்புகள் புதுப்பிக்கப்பட்டன (பாடக்குறிப்பு, அத்தியாய தலைப்புகள், மாதிரிகள் பகுதி, சமுக பார்வைகள்)
  - `course-outline.md` - 14 குறிப்புகள் புதுப்பிக்கப்பட்டன (அறிமுகம், கற்றல் குறிக்கோள்கள், அத்தியாய வளங்கள்)

#### சொல்லப்பட்டன
- ✅ ஆங்கில ஆவணங்களில் “ai-foundry” கோப்புறை பாதை குறிப்புகள் முழுமையாக நீக்கப்பட்டுள்ளன
- ✅ ஆங்கில ஆவணங்களில் "Microsoft Foundry" தயாரிப்பு பெயர் குறிப்புகள் முழுமையாக மாற்றப்பட்டுள்ளன
- ✅ புதிய கோப்புறை அமைப்புடன் அனைத்து வழிசெலுத்தல் இணைப்புகளும் செயல்படுகின்றன
- ✅ கோப்பு மற்றும் கோப்புறை பெயர் மாற்றங்கள் வெற்றிகரமாக செய்யப்பட்டது
- ✅ அத்தியாயத்துக்குள் இடைநிலைக்குறிப்புகள் சரிபார்க்கப்பட்டன

#### குறிப்புகள்
- **களலம்**: மாற்றங்கள் ஆங்கில ஆவணங்கள் `docs/` கோப்புறையில் மட்டுமே
- **மொழிபெயர்ப்பு**: மொழிபெயர்ப்பு கோப்புறைகள் (`translations/`) இந்த பதிப்பில் புதுப்பிக்கப்படவில்லை
- **பயிற்சி மையம்**: பயிற்சி குறிப்பு (`workshop/`) இந்த பதிப்பில் புதுப்பிக்கப்படவில்லை
- **எடுத்துக்காட்டுகள்**: எடுத்துக்காட்டு கோப்புகள் இன்னும் பழைய பெயர்களைக் குறிப்பிடலாம் (எதிர்கால புதுப்பிப்பில் பராமரிக்கப்படும்)
- **வெளியிட இணைப்புகள்**: வெளியீட்டு URLகள் மற்றும் GitHub ரிப்பொசிடரி குறிப்புகள் மாற்றப்படவில்லை

#### பங்களிப்பாளர்களுக்கு மாற்ற வழிகாட்டி
உங்கள் உள்ளூர் கிளைகளில் அல்லது ஆவணங்கள் பழைய அமைப்பை குறிக்கின்றன என்றால்:
1. கோப்புறை குறிப்புகளைக் மாற்றவும்: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. கோப்பு குறிப்புகளை மாற்றவும்: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. தயாரிப்பு பெயரை மாற்றவும்: "Microsoft Foundry" → "Microsoft Foundry"
4. அனைத்து உள்ளுறை ஆவண இணைப்பும் இன்னும் செயல்படுவதை சரிபார்க்கவும்

---

### [v3.4.0] - 2025-10-24

#### உடைமை முன்னோட்டம் மற்றும் சரிபார்ப்பு மேம்பாடுகள்
**இந்த பதிப்பு புதிய Azure Developer CLI முன்னோட்ட அம்சத்திற்கு முழுமையான ஆதரவு வழங்கும் மற்றும் பயிற்சி பயனர் அனுபவத்தை மேம்படுத்தும்.**

#### சேர்க்கப்பட்டது
- **🧪 azd provision --preview அம்ச ஆவணங்கள்**: புதிய உடைமை முன்னோட்ட திறனை முழுமையாக உள்ளடக்கியது
  - கட்டளை குறிப்பு மற்றும் பயன்பாட்டு எடுத்துக்காட்டுகள்
  - பயன்படுத்தும் வழிகாட்டி வழிகளுடன் விரிவான ஒருங்கிணைப்பு
  - பாதுகாப்பான பிணைப்பு சரிபார்ப்புக்கான முன்னோட்ட சோதனை
  - பாதுகாப்பு-முதலில் பிணைப்பு நடைமுறைகளுக்கு தொடக்க வழிகாட்டி புதுப்பிப்புகள்
- **🚧 பயிற்சி நிலை பட்டை**: தொழில்முறை HTML பட்டை, பயிற்சி மேம்பாட்டு நிலையை காட்டும்
  - தெளிவான பயனர் தகவலுக்கான கட்டுமான குறியீட்டு வடிவமைப்பு
  - சற்றும் புதுப்பிக்கப்பட்ட நேரம் காட்டுகிறது
  - அனைத்து சாதனங்களுக்கும் மொபைல் திறன் வடிவமைப்பு

#### மேம்படுத்தப்பட்டது
- **உடைமை பாதுகாப்பு**: பிணைப்பு ஆவணங்களில் முன்னோட்ட அம்சம் ஒருங்கிணைக்கப்பட்டது
- **பிணைப்பு முன் சரிபார்ப்பு**: தானாக இயக்கப்படும் ஸ்கிரிப்ட்கள் முன்னோட்ட சோதனை சேர்த்து மேம்படுத்தப்பட்டன
- **வளர்ச்சியாளர் பணித் தொடர்**: சிறந்த நடைமுறையாக முன்னோட்ட கட்டளை தொடர்கள் புதுப்பிக்கப்பட்டன
- **பயிற்சி அனுபவம்**: உள்ளடக்க மேம்பாட்டைப் பற்றி பயனர்களுக்கு தெளிவான எதிர்பார்ப்புகள் அமைக்கப்பட்டன

#### மாற்றப்பட்டது
- **அமைப்பு சிறந்த நடைமுறைகள்**: முன்னோட்டம் முதலில் செயன்முறை பரிந்துரை
- **ஆவண ஓட்டை**: உடைமை சரிபார்ப்பு கற்றல் முறையில் முன்னிலை
- **பயிற்சி நிகழ்ச்சி**: தெளிவான மேம்பாட்டு நேரவரிசையுடன் தொழில்முறை நிலை தகவல்

#### மேம்படுத்தப்பட்டது
- **பாதுகாப்பு-முதலாக அணுகுமுறை**: பிணைப்புக்கு முன் உடைமை மாற்றங்கள் சரிபார்க்கப்படுவதை அனுமதிக்கும்
- **அணி ஒத்துழைப்பு**: துல்லியமடைந்த முடிவுகளை விமர்சனத்துக்கும் ஒப்புதலுக்கும் பகிரலாம்
- **செலவு விழிப்புணர்வு**: வள செலவுகளைக் கொள்வனவு செய்வதற்கு முன் ஓர்லான அறிதல்
- **ஆபத்து குறைத்தல்**: முன்னேற்பாடான சரிபார்ப்பு மூலம் பிணைப்பு தோல்விகளை குறைத்தல்

#### தொழில்நுட்ப செயலாக்கம்
- **பல ஆவண ஒருங்கிணைப்பு**: 4 முக்கிய கோப்புகளில் முன்னோட்ட அம்சம் ஆவணப்படுத்தப்பட்டது
- **கட்டளை உருவப்படிவங்கள்**: ஆவணங்களின் முழுவதும் ஒத்தான இலக்கணமும் எடுத்துக்காட்டுகளும்
- **சிறந்த நடைமுறை ஒருங்கிணைப்பு**: சரிபார்ப்பு பணியியலிலும் ஸ்கிரிப்ட்களிலும் முன்னோட்டம் சேர்க்கப்பட்டது
- **அருவ呈கக் குறிகள்**: புதிய அம்சங்களை எளிதில் கண்டறிவதற்கான தெளிவான குறிகள்

#### பயிற்சி உடைமை
- **நிலை தகவல்**: தொழில்முறை HTML பட்டை, இழையின் நிற வடிவமைப்புடன்
- **பயனர் அனுபவம்**: தெளிவான மேம்பாட்டுத் நிலை குழப்பம் தடுக்கும்
- **தொழில்முறை விளக்கம்**: சேமிப்பக நம்பகத்தன்மையை பேணிச் செல்லும், எதிர்பார்ப்புகள் அமைக்கும்
- **நேர வரிசை வெளிப்படைமை**: 2025 அக்டோபர் கடைசி புதுப்பிப்பு நேரம் பொறுப்புபடுத்தல்

### [v3.3.0] - 2025-09-24

#### மேம்படுத்தப்பட்ட பயிற்சி பொருட்கள் மற்றும் இணைய வழி கற்றல் அனுபவம்
**இந்த பதிப்பு முழுமையான பயிற்சி பொருட்களுடன் கூடிய உலாவி அடிப்படையிலான இணைய வழி வழிகாட்டிகள் மற்றும் கட்டமைக்கப்பட்ட கற்றல் பாதைகளையும் அறிமுகப்படுத்துகிறது.**

#### சேர்க்கப்பட்டது
- **🎥 இணைய வழி பயிற்சி வழிகாட்டி**: MkDocs முன்னோட்டத்துடன் உலாவி அடிப்படையிலான பயிற்சி அனுபவம்
- **📝 கட்டமைக்கப்பட்ட பயிற்சி அறிவுறுத்தல்கள்**: 7 படி வழிகாட்டப்பட்ட கற்றல் பாதை கண்டுபிடிப்பு முதல் தனிப்பயனர் மாற்றத்திற்குள்
  - 0-அறிமுகம்: பயிற்சி மேம்பாடு மற்றும் அமைப்பு
  - 1-AI-பாதுகாப்பு தேர்வு: மாதிரிகள் கண்டுபிடிப்பு மற்றும் தேர்வு செயல்முறை
  - 2-AI-மாதிரி சரிபார்ப்பு: பிணைப்பு மற்றும் சரிபார்ப்பு நடைமுறைகள்
  - 3-AI-மாதிரியை பகுப்பாய்வு செய்தல்: மாதிரி கட்டமைப்பு புரிதல்
  - 4-AI-மாதிரி அமைப்பு: வரையறை மற்றும் தனிப்பயன்பாடு
  - 5-AI-மாதிரி தனிப்பயன்பாடு: முன்னேற்ற மாற்றங்கள் மற்றும் மறுபடியும் செயலாக்கம்
  - 6-உடைமைத் தூய்மைப் பணி: சுத்தசெய்தல் மற்றும் வள மேலாண்மை
  - 7-பொருத்திப்பு: சுருக்கமும் அடுத்த படிகள்
- **🛠️ பயிற்சி கருவிகள்**: மேம்படுத்தப்பட்ட கற்றல் அனுபவத்திற்கு Material கருவிகளுடன் MkDocs கட்டமைப்பு
- **🎯 கைமுறை கற்றல் பாதை**: 3 படி முறைமைகல் (கண்டுபிடி → பிணைப்பு → தனிப்பயன்பாடு)
- **📱 GitHub Codespaces ஒருங்கிணைப்பு**: ஒத்துழைப்பு வளர்ச்சியுத்தள அமைப்பு

#### மேம்படுத்தப்பட்டது
- **AI பயிற்சி ஆய்வு அறை**: 2-3 மணி நேர கட்டமைக்கப்பட்ட கற்றல் அனுபவத்துடன் விரிவுபடுத்தப்பட்டது
- **பயிற்சி ஆவணம்**: வழிசெலுத்தல் மற்றும் கையாளும் புகைப்படங்களுடன் தொழில்முறை விளக்கம்
- **கற்றல் முன்னேற்றம்**: மாதிரி தேர்வு முதல் தயாரிப்பு பிணைப்பு வரை தெளிவான படிப்படியான வழிகாட்டி
- **வளர்ச்சியாளர் அனுபவம்**: ஒருங்கிணைக்கப்பட்ட கருவிகள் மூலம் சீரான வளர்ச்சி பணித் தொடர்கள்

#### மேம்படுத்தப்பட்டது
- **நூலணை அணுகல்**: தேடல், நகல் செய்ஹந்தி மற்றும் தீம் மாற்றத்துடன் உலாவி அடிப்படையிலான இடைமுகம்
- **சுயநிலை கற்றல்**: வேறு வேறு கற்றல் வேகங்களுக்கு பொருத்தமான வசதியான அமைப்பு
- **ப்ரயோக பூர்வ கையாளல்**: நிஜஉலக AI மாதிரி பிணைப்புத் திட்டங்கள்
- **சமூக ஒருங்கிணைப்பு**: பயிற்சி ஆதரவு மற்றும் ஒத்துழைப்புக்கு Discord இணைப்பு

#### பயிற்சி அம்சங்கள்
- **உள்ளமைக்கப்பட்ட தேடல்**: கூடிய விசை வார்த்தைகள் மற்றும் பாடங்கள் விரைவான கண்டுபிடிப்பு
- **குறியீடு பிரிவுகளை நகல் செய்யவும்**: அனைத்து கோடு எடுத்துக்காட்டுகளுக்கும் ஏறத்தாழ நகல் செயல்பாடு
- **தீம் மாற்று**: மைலம்/இருண்டு முறையை ஆதரிக்கும்
- **காணொலி மற்றும் வரைபடங்கள்**: மேம்பட்ட புரிதலுக்கான காட்சிக்கட்டளைகள்
- **உதவி ஒருங்கிணைப்பு**: சமூக ஆதரவுக்கான நேரடி Discord அணுகல்

### [v3.2.0] - 2025-09-17

#### முக்கிய வழிசெலுத்தல் மறுசீரமைப்பு மற்றும் அத்தியாயவாரியாக கற்றல் அமைப்பு
**இந்த பதிப்பு முழு சேமிப்பகத்தில் மேம்பட்ட வழிசெலுத்தல் மற்றும் அத்தியாயவாரியான கற்றல் கட்டமைப்பை அறிமுகப்படுத்துகிறது.**

#### சேர்க்கப்பட்டது
- **📚 அத்தியாயவாரியான கற்றல் அமைப்பு**: முழு பாடத்திட்டத்தை 8 முன்னேற்ற அத்தியாயங்களுக்கு மறுசீரமைத்தல்
  - அத்தியாயம் 1: அடித்தளம் மற்றும் விரைவு துவக்கம் (⭐ - 30-45 நிமிடங்கள்)
  - அத்தியாயம் 2: AI-முதலீட்டுக் காட்சி (⭐⭐ - 1-2 மணி நேரம்)
  - அத்தியாயம் 3: கட்டமைப்பு மற்றும் அங்கீகாரம் (⭐⭐ - 45-60 நிமிடங்கள்)
  - அத்தியாயம் 4: உடைமை என்கோடு மற்றும் பிணைப்பு (⭐⭐⭐ - 1-1.5 மணி நேரம்)
  - அத்தியாயம் 5: பல முகவர் AI தீர்வுகள் (⭐⭐⭐⭐ - 2-3 மணி நேரம்)
  - அத்தியாயம் 6: பிணைப்பு முன் சரிபார்ப்பு மற்றும் திட்டமிடல் (⭐⭐ - 1 மணி நேரம்)
  - அத்தியாயம் 7: பிழைதிருத்தல் மற்றும் பிழை கண்டறிதல் (⭐⭐ - 1-1.5 மணி நேரம்)
  - அத்தியாயம் 8: தயாரிப்பு மற்றும் நிறுவன வடிவங்கள் (⭐⭐⭐⭐ - 2-3 மணி நேரம்)
- **📚 முழுமையான வழிசெலுத்தல் அமைப்பு**: அனைத்து ஆவணங்களிலும் ஒத்த வழிசெலுத்தல் தலைப்புகள் மற்றும் அடிவரிசைகள்
- **🎯 முன்னேற்றத்தைக் கண்காணித்தல்**: பாடம் முடிவு சரிபார்ப்பு பட்டியல் மற்றும் கற்றலான உரிமைக் கண்காணிப்பு
- **🗺️ கற்றல் பாதை வழிகாட்டி**: வேறுபட்ட அனுபவ நிலைகளுக்கும் இலக்குகளுக்கும் தெளிவான நுழைவாயில்கள்
- **🔗 இடைநிலை வழிசெலுத்தல்**: தொடர்புடைய அத்தியாயங்களும் முன்னிலை இடைமுகமும் தெளிவாக இணைக்கப்பட்டுள்ளன

#### மேம்படுத்தப்பட்டது
- **README அமைப்பு**: அத்தியாயவாரியான அமைப்புடன் கட்டமைக்கப்பட்ட கற்றல் தளமாக மாற்றப்பட்டது
- **ஆவண வழிசெலுத்தல்**: ஒவ்வொரு பக்கமும் அத்தியாயக் கருத்தும் முன்னேற்ற வழிகாட்டியும் சேர்க்கப்பட்டுள்ளது
- **மாதிரி அமைப்பு**: எடுத்துக்காட்டுகள் மற்றும் மாதிரிகள் தொடர்புடைய கற்றல் அத்தியாயங்களுக்கு வரைபடப்பட்டுள்ளன

- **வள ஒருங்கிணைப்பு**: சம்பந்தப்பட்ட அத்தியாயங்களுக்கு இணைக்கப்பட்ட சியாட் ஷீடுகள், அடிக்கடி கேட்கப்படும் கேள்விகள் மற்றும் படிப்புக்கான வழிகாட்டிகள்
- **வார்ப்போர் ஒருங்கிணைப்பு**: பல அத்தியாயக் கல்வி குறிக்கோள்களுக்கான கைமுறை ஆய்வுகூடங்கள்

#### மாற்றப்பட்டவை
- **கற்றல் முன்னேற்றம்**: நேரடி ஆவணத்திலிருந்து நெகிழ்வான அத்தியாயத்தை சார்ந்த கல்விக்குச் செல்லப்பட்டது
- **கட்டமைப்பு இடம்**: மேம்பட்ட கற்றல் ஓட்டத்திற்கு அத்தியாயம் 3 ஆக கட்டமைப்பு கையேடு மாற்றப்பட்டது
- **குறியீடு உள்ளடக்க ஒருங்கிணைப்பு**: கற்றல் பயண முழுவதிலும் ஏ.ஐ-குறிப்பிடப்பட்ட உள்ளடக்கத்தின் மேம்பாடு
- **தயாரிப்பு உள்ளடக்கம்**: தொழிற்சாலை கற்றுகொள்ளும் பயனாளிகளுக்கான மேம்பட்ட வடிவமைப்புகள் அத்தியாயம் 8-ல் சங்கிலி பண்ணப்பட்டன

#### மேம்படுத்தப்பட்டவை
- **பயனர் அனுபவம்**: தெளிவான வழிசெலுத்தும் சுட்டுமுடிகள் மற்றும் அத்தியாய முன்னேற்ற குறியீடுகள்
- **அணுகல் வசதி**: படிப்பின் எளிதான நடைப்பயணத்திற்கு ஒரே மாதிரிப் பெறுமதி வழிசெலுத்துமுறை
- **தொழில்முறை முன்னிலையில்**: கல்வியியல் மற்றும் நிறுவன பயிற்சிக்கான பல்கலைக்கழகத் தோற்றப் படிப்பு அமைப்பு
- **கற்றல் திறன்**: மேம்படுத்தப்பட்ட அமைப்பின் மூலம் சம்பந்தப்பட்ட உள்ளடக்கங்களைத் தேடும் நேரம் குறைக்கப்பட்டது

#### தொழில்நுட்ப அமலாக்கம்
- **வழிசெலுத்தும் தலைப்புகள்**: 40க்கும் மேற்பட்ட ஆவணக் கோப்புகளில் அத்தியாய வழிசெலுத்தல் நிலையானபடுத்தப்பட்டது
- **கால் வழிசெலுத்தல்**: தொடர்ந்த முன்னேற்ற வழிகாட்டல் மற்றும் அத்தியாய முடிவு குறியீடுகள்
- **இணைப்புச் சந்திப்புகள்**: தொடர்புடைய கருத்துக்களை இணைக்கும் பருமனான உள்ளக இணைப்பு அமைப்பு
- **அத்தியாய வரைபடம்**: கற்றல் குறிக்கோளுடன் தெளிவான தொடர்புடைய அச்சக வடிவங்கள் மற்றும் உதாரணங்கள்

#### படிப்பு வழிகாட்டி மேம்பாடு
- **📚 விரிவான கற்றல் குறிக்கோள்கள்**: 8-அத்தியாய அமைப்புடன் இணைந்த படிப்பு வழிகாட்டி மீண்டும் வடிவமைக்கப்பட்டது
- **🎯 அத்தியாய அடிப்படையிலான மதிப்பீடு**: ஒவ்வொரு அத்தியாயத்திலும் குறிப்பிட்ட கற்றல் குறிக்கோள்களும் நடைமுறைப் பயிற்சிகளும் உள்ளன
- **📋 முன்னேற்ற கண்காணிப்பு**: வாராந்திரக் கல்வி அட்டவணை அளவிடக்கூடிய விளைவுகளுடன் மற்றும் நிறைவு ஆய்வுகளுடன்
- **❓ மதிப்பீட்டு கேள்விகள்**: ஒவ்வொரு அத்தியாயத்திற்கும் தொழில்முறை விளைவுகளை உறுதிப்படுத்தும் அறிவு மெய்நிகர் கேள்விகள்
- **🛠️ நடைமுறை பயிற்சிகள்**: உண்மையான ஒதுக்கீடு சூழல் மற்றும் பிழைத்திருத்தத்துடன் கைமுறை செயல்பாடுகள்
- **📊 திறன் முன்னேற்றம்**: அடிப்படைக் கருத்துக்களிலிருந்து தொழிற்சாலை வடிவமைப்புகளுக்கான தெளிவான முன்னேற்றம் மற்றும் தொழில்முறை வளர்ச்சி கவனம்
- **🎓 சான்றிதழ் கட்டமைப்பு**: தொழில்முறை வளர்ச்சி விளைவுகள் மற்றும் சமூக அங்கீகார அமைப்பு
- **⏱️ நேரக்கட்டுப்பாடு**: கட்டமைக்கப்பட்ட 10-வார கற்றல் திட்டம் மற்றும் மைல்கல் சோதனை

### [v3.1.0] - 2025-09-17

#### மேம்படுத்தப்பட்ட பன்முகேஜ்ஞர் ஏ.ஐ தீர்வுகள்
**இந்த பதிப்பு பன்முகேஜ்ஞர் சில்லறைத் தீர்வை மேம்பாட்டுடன் மற்றும் மேம்பட்ட ஆவணத்துடன் உதவுகிறது.**

#### மாற்றப்பட்டவை
- **பன்முகேஜ்ஞர் சொற்பொருள்**: சில்லறை பன்முகேஜ்ஞர் தீர்வில் "கோரா ஏஜெண்ட்" பெயரை "வாடிக்கையாளர் ஏஜெண்ட்" என மாற்றி தெளிவான புரிதலுக்காக
- **ஏஜெண்ட் கட்டமைப்பு**: அனைத்து ஆவணங்கள், ARM டெம்ப்ளேட்டுகள் மற்றும் குறியீடு உதாரணங்களில் ஒரேமாதிரியாக "வாடிக்கையாளர் ஏஜெண்ட்" பெயரைப் பயன்படுத்த மாற்றப்பட்டது
- **கட்டமைப்பு உதாரணங்கள்**: மேம்பட்ட பெயரிடும் முறைகளுடன் ஏஜெண்ட் கட்டமைப்பு வடிவங்கள் சமயோஜிக்கப்பட்டன
- **ஆவண ஒத்திசைவு**: அனைத்து குறிப்புகளும் தொழில்முறை மற்றும் விளக்கமான ஏஜெண்ட் பெயர்களைப் பயன்படுத்த உறுதி செய்தது

#### மேம்படுத்தப்பட்டது
- **ARM டெம்ப்ளேட் தொகுப்பு**: retail-multiagent-arm-template இல் வாடிக்கையாளர் ஏஜெண்ட் குறிப்புகள் புதுப்பிக்கப்பட்டன
- **கட்டமைப்பு வரைபடங்கள்**: மேம்படுத்தப்பட்ட ஏஜெண்ட் பெயரிடத்துடனான மர்மெய்ட் வரைபடங்கள் புதுப்பிக்கப்பட்டன
- **குறியீடு உதாரணங்கள்**: Python வகுப்புகளும் அமல்படுத்தல் உதாரணங்களும் CustomerAgent பெயரீட்டை பயன்படுத்துகின்றன
- **சூழல் மாறிகள்**: CUSTOMER_AGENT_NAME முறைகள் தொடர்பான அனைத்து ஒதுக்கீட்டு ஸ்கிரிப்ட்களும் புதுப்பிக்கப்பட்டன

#### மேம்படுத்தப்பட்டவை
- **மென்பொருள் உருவாக்குநர் அனுபவம்**: ஆவணங்களில் தெளிவான ஏஜெண்ட் பங்கு மற்றும் பொறுப்புகள்
- **தயாரிப்பு தயாராக இருக்குமாறு**: தொழிற்சாலை பெயரிடும் முறைகளுடன் சிறந்த ஒத்திசைவு
- **கற்றல் பொருட்கள்**: கல்விக்கான தெளிவான ஏஜெண்ட் பெயரிடல்
- **டெம்ப்ளேட் பயன்பாட்டாக்கம்**: ஏஜெண்ட் செயல்பாடுகள் மற்றும் ஒதுக்கீட்டு வடிவமைப்பின் எளிய புரிதல்

#### தொழில்நுட்ப விவரங்கள்
- CustomerAgent குறிப்புகளுடன் மர்மெய்ட் கட்டமைப்பு வரைபடங்களை புதுப்பித்தது
- Python உதாரணங்களில் CoraAgent வகுப்பு பெயர்களைக் CustomerAgent ஆக மாற்றியது
- "customer" ஏஜெண்ட் வகையை பயன்படுத்த ARM டெம்ப்ளேட் JSON கட்டமைப்புகள் மாற்றப்பட்டன
- CORA_AGENT_* இருந்து CUSTOMER_AGENT_* முறைமைகளுக்கு சூழல் மாறிகள் புதுப்பிக்கப்பட்டன
- அனைத்து ஒதுக்கீட்டு கட்டளைகள் மற்றும் கன்டெய்னர் அமைப்புகளும் புதுப்பிக்கப்பட்டன

### [v3.0.0] - 2025-09-12

#### முக்கிய மாற்றங்கள் - ஏ.ஐ டெவலப்பர் கவனம் மற்றும் Microsoft Foundry ஒருங்கிணைப்பு
**இந்த பதிப்பு இந்த கிடங்கத்தை முழுமையான ஏ.ஐ-கவனமிக்க கற்றல் வளமாக மாற்றுகிறது மற்றும் Microsoft Foundry ஒருங்கிணைப்புடன் வருகிறது.**

#### சேர்க்கப்பட்டவை
- **🤖 ஏ.ஐ முன்னிலை கற்றல் பாதை**: ஏ.ஐ டெவலப்பர்கள் மற்றும் பொறியாளர்களை முன்னிலைப்படுத்தி முழுமையான மறுசீரமைப்பு
- **Microsoft Foundry ஒருங்கிணைப்பு கையேடு**: AZD மற்றும் Microsoft Foundry சேவைகளை இணைக்கும் விரிவான ஆவணங்கள்
- **ஏ.ஐ மாதிரி ஒதுக்கீட்டு வடிவங்கள்**: மாதிரி தேர்வு, கட்டமைப்பு மற்றும் தயாரிப்பு ஒதுக்கீடு மூலோபாயங்கள் 
- **ஏ.ஐ வேலைப்பாடுத்துறை ஆராய்ச்சி**: 2-3 மணி நேர கைமுறை ஆராய்ச்சிக்கூடம் AZD-ஒதுக்க கூடிய தீர்வுகளுக்கு மாற்ற ஆராய்ச்சி
- **தயாரிப்பு ஏ.ஐ சிறந்த நடைமுறைகள்**: ஏ.ஐ பணிகளுக்கான தொழிற்சாலை தயாரான மாதிரிகள்‌ масштабிப்பு, கண்காணிப்பு மற்றும் பாதுகாப்பு
- **ஏ.ஐ-குறியீடு பிழைத்திருத்தக் கையேடு**: Microsoft Foundry மாதிரிகள், Cognitive சேவைகள் மற்றும் ஏ.ஐ ஒதுக்கீடு பிரச்சனைகளுக்கான விரிவான கையேடு
- **ஏ.ஐ டெம்ப்ளேட் காட்சியகம்**: Microsoft Foundry டெம்ப்ளேட்டை உள்ளடக்கிய சிக்கலான மதிப்பீடுகளுடன் தேர்வு செய்யப்பட்ட தொகுப்பு
- **வார்ப்போர் பொருட்கள்**: கைமுறை ஆய்வுகூடங்கள் மற்றும் கூற்று பொருட்களுடன் முழுமையான வார்ப்போர் அமைப்பு

#### மேம்படுத்தப்பட்டவை
- **README அமைப்பு**: Microsoft Foundry Discord இல் 45% சமுதாய ஆர்வத்துடன் ஏ.ஐ டெவலப்பருக்கான கவனம்
- **கற்றல் பாதைகள்**: மாணவர்கள் மற்றும் DevOps பொறியாளர்களுக்கான பாரம்பரிய பாதைகளோடு ஒன்று சேர்ந்த ஏ.ஐ டெவலப்பர் பயணம்
- **டெம்ப்ளேட் பரிந்துரைகள்**: azure-search-openai-demo, contoso-chat, openai-chat-app-quickstart உட்பட ஆய்வு செய்யப்பட்ட ஏ.ஐ டெம்ப்ளேட்டுகள்
- **சமூக ஒருங்கிணைப்பு**: ஏ.ஐ-குறிப்பிடப்பட்ட சேனல்கள் மற்றும் விவாதங்களுடன் மேம்படுத்தப்பட்ட Discord சமூக ஆதரவு

#### பாதுகாப்பு மற்றும் தயாரிப்பு கவனம்
- **மேலாண்மை அடையாளம் வடிவங்கள்**: ஏ.ஐ-குறிப்பிடப்பட்ட அங்கீகாரம் மற்றும் பாதுகாப்பு கட்டமைப்புகள்
- **செலவுக் கண்காணிப்பு**: Token பயன்படுத்தும் கண்காணித்தலும் பட்ஜெட் கட்டுப்பாடுகளும் ஏ.ஐ பணிகளுக்கு
- **பல பிராந்திய ஒதுக்கீடு**: உலகளாவிய ஏ.ஐ பயன்பாட்டு ஒதுக்கீட்டு மூலோபாயங்கள்
- **செயல்திறன் கண்காணிப்பு**: ஏ.ஐ-குறிப்பிடப்பட்ட அளவுகோல்கள் மற்றும் செயலி அறிவுக் கண்காணிப்பு ஒருங்கிணைப்பு

#### ஆவண தரம்
- **நேரடி பாடத்திட்ட அமைப்பு**: ஆரம்ப நிலை முதல் மேம்பட்ட ஏ.ஐ ஒதுக்கீட்டு வடிவமைப்புக்கு தர்க்கப்பூர்வ முன்னேற்றம்
- **சரிபார்க்கப்பட்ட URL-கள்**: அனைத்து வெளிப்புற கிடங்கு இணைப்புகளும் சரிபார்க்கப்பட்ட மற்றும் அணுகக்கூடியவை
- **முழுமையான குறிப்புகள்**: அனைத்து உள்ளக ஆவணக்கישורங்களும் சரிபார்க்கப்பட்ட மற்றும் செயல்நிலை
- **தயாரிப்பு தயாரானது**: உண்மையான உலக எடுத்துக்காட்டுக்களுடன் தொழிற்சாலை ஒதுக்கீட்டு மாதிரிகள்

### [v2.0.0] - 2025-09-09

#### முக்கிய மாற்றங்கள் - கிடங்கு மறுவரிசை மற்றும் தொழில்முறை மேம்பாடு
**இந்த பதிப்பு கிடுங்கின் அமைப்பு மற்றும் உள்ளடக்கக் காட்சிப்புறத்தை பெரும் மாற்றமாக்குகிறது.**

#### சேர்க்கப்பட்டவை
- **கட்டமைக்கப்பட்ட கற்றல் கட்டமைப்பு**: அனைத்து ஆவணக் கோப்புகளும் அறிமுகம், கற்றல் குறிக்கோள்கள் மற்றும் கற்றல் விளைவுச் பகுதிகளைக் கொண்டுள்ளன
- **வழிசெலுத்தும் அமைப்பு**: கடந்த / அடுத்த பாடம் இணைப்புக்களை சேர்த்தல் எல்லா ஆவணங்களிலும் கற்றல் முன்னேற்றத்துக்காக
- **படிப்பு வழிகாட்டி**: கற்றல் குறிக்கோள்கள், நடைமுறைப் பயிற்சிகள் மற்றும் மதிப்பீட்டு பொருட்களை உள்ளடக்கிய விரிவுரைக்காக study-guide.md
- **தொழில்முறை தோற்றம்**: மேம்பட்ட அணுகல் வசதிக்காக அனைத்து எமோஜி ஐகான்களும் அகற்றப்பட்டன
- **உள்ளடக்க கட்டமைப்பு விருத்தி**: கற்றல் பொருட்களின் அமைப்பு மற்றும் ஓட்டத்தை மேம்படுத்தியது

#### மாற்றப்பட்டவை
- **ஆவண வடிவமைப்பு**: எல்லா ஆவணங்களும் ஒரே மாதிரியாக கற்றல் கவனிப்புடன் நிலைநிறுத்தப்பட்டன
- **வழிசெலுத்தல் ஓட்டம்**: அனைத்து கற்றல் பொருட்களிலும் தர்க்கப்பூர்வ முன்னேற்றம் அமல்படுத்தப்பட்டது
- **உள்ளடக்கக் காட்சிப்புறம்**: தெளிவான தொழில்முறை வடிவமைப்புக்காக அலங்கார கூறுகள் அகற்றப்பட்டன
- **இணைப்பு அமைப்பு**: புதிய வழிசெலுத்தல் அமைப்புக்கு மாற அனைத்து உள்ளக இணைப்புகளும் புதுப்பிக்கப்பட்டன

#### மேம்படுத்தப்பட்டவை
- **அணுகல் வசதி**: மேம்பட்ட திரை வாசிப்பாளருக்கான உகந்த தன்மைக்க்கு எமோஜி சார்பானகூறுகள் அகற்றப்பட்டன
- **தொழில்முறை தோற்றம்**: நிறுவனக் கற்றலுக்கேற்ப சுத்தமான, கல்வி பரிமாணத் தோற்றம்
- **கற்றல் அனுபவம்**: ஒவ்வொரு பாடத்திற்குமான தெளிவான குறிக்கோள்களுடன் கட்டமைக்கப்பட்ட அணுகல்
- **உள்ளடக்க அமைப்பு**: தொடர்புடைய தலைப்புகளுக்கு இடையிலான சிறந்த தர்க்க ஓட்டம் மற்றும் தொடர்பு

### [v1.0.0] - 2025-09-09

#### ஆரம்ப வெளியீடு - விரிவான AZD கற்றல் கிடங்கு

#### சேர்க்கப்பட்டவை
- **அடிப்படை ஆவண அமைப்பு**
  - முழுமையான தொடக்கம் கையேடு தொடர்
  - முழுமையான ஒதுக்கீடு மற்றும் வழங்கல் ஆவணங்கள்
  - விரிவான பிழைத்திருத்த வளங்கள் மற்றும் டீபக்கிங் கையேடுகள்
  - முன்னேற்பாடு சரிபார்ப்பு கருவிகள் மற்றும் நடைமுறைகள்

- **தொடக்கம் முறைமை**
  - AZD அடிப்படைகள்: மையக் கருத்துக்கள் மற்றும் சொற்பொருட்கள்
  - நிறுவல் கையேடு: தள-சார்ந்த அமைப்புச் செயல்முறைகள்
  - கட்டமைப்பு கையேடு: சூழல் அமைப்பு மற்றும் அங்கீகாரம்
  - முதல் திட்டச் சோதனை: படி படியாக கைமுறை கற்றல்

- **ஒதுக்கீடு மற்றும் வழங்கல் முறைமை**
  - ஒதுக்கீடு கையேடு: முழுமையான பணிநடை ஆவணங்கள்
  - வழங்குதல் கையேடு: Bicep கொண்டு Infrastructure as Code
  - தயாரிப்பு ஒதுக்கீடுகளுக்கான சிறந்த நடைமுறைகள்
  - பல சேவை கட்டமைப்புத் வடிவமைப்புகள்

- **முன்னேற்பாடு சரிபார்ப்பு முறைமை**
  - திறன் திட்டமிடல்: Azure வளங்கள் கிடைக்கும் தன்மையை சரிபார்ப்பு
  - SKU தேர்வு: விரிவான சேவை நிலை வழிகாட்டல்
  - முன்னேற்பாடு சோதனைகள்: தானியங்கி சரிபார்ப்பு ஸ்கிரிப்டுகள் (PowerShell மற்றும் Bash)
  - செலவு மதிப்பீடு மற்றும் பட்ஜெட் திட்டமிடல் கருவிகள்

- **பிழைத்திருத்த முறைமை**
  - பொதுவான பிரச்சினைகள்: அடிக்கடி சந்திக்கப்படும் சிக்கல்களும் தீர்வுகளும்
  - டீபக்கிங் கையேடு: முறையான பிழைத்திருத்த முறைகள்
  - மேம்பட்ட தொகு வினாடி நுட்பங்கள் மற்றும் கருவிகள்
  - செயல்திறன் கண்காணிப்பு மற்றும் மேம்பாடு

- **வளங்களும் குறிப்புகளும்**
  - கட்டளை சியாட் ஷீட்: அவசியமான கட்டளைகளுக்கான விரைவான குறிப்பு
  - சொல்வகை: விரிவான சொற்பொருள் மற்றும் சுருக்கவாக்கிய விளக்கங்கள்
  - அடிக்கடி கேட்கப்படும் கேள்விகள்: பொதுவான கேள்விகளுக்கான விரிவான பதில்கள்
  - வெளிப்புற வள இணைப்புகள் மற்றும் சமூக தொடர்புகள்

- **உதாரணங்கள் மற்றும் டெம்ப்ளேட்டுகள்**
  - எளிய வலை பயன்பாட்டு உதாரணம்
  - நிலையான வலைத்தளம் ஒதுக்கீடு டெம்ப்ளேட்
  - கன்டெய்னர் பயன்பாடு கட்டமைப்பு
  - தரவுத்தள ஒருங்கிணைப்பு வடிவங்கள்
  - மைக்ரோசெர்வீசுகள் கட்டமைப்பு உதாரணங்கள்
  - சர்வர்லஸ் செயலாக்க செயல்முறை

#### அம்சங்கள்
- **பல தள ஆதரவு**: Windows, macOS மற்றும் Linux க்கான நிறுவல் மற்றும் கட்டமைப்பு கையேடுகள்
- **பல திறன் நிலைகள்**: மாணவர்களிலிருந்து தொழில்முறை மேம்படுத்துநர்களுக்கான உள்ளடக்கம்
- **நடைமுறை கவனம்**: கைமுறை உதாரணங்கள் மற்றும் உண்மையான உலக சூழல்கள்
- **பூரணமான உள்ளடக்கம்**: அடிப்படை கருத்துக்களிலிருந்து மேம்பட்ட தொழிற்சாலை வடிவமைப்புகள் வரை
- **பாதுகாப்பு முதன்மை அணுகல்**: பாதுகாப்பு சிறந்த நடைமுறைகள் முழுமையாக இணைக்கப்பட்டவை
- **செலவு விளைவு மதிப்பீடு**: செலவைத் தவிர்க்கும் ஒதுக்கீட்டுக்கும் வள மேலாண்மைக்கும் வழிகாட்டல்

#### ஆவண தரம்
- **விரிவான குறியீடு உதாரணங்கள்**: நடைமுறை மற்றும் சோதிக்கப்பட்ட குறியீடு எடுத்துக்காட்டுகள்
- **படி படி விளக்கங்கள்**: தெளிவான, செயல்பாட்டு வழிகாட்டல்
- **பூரண பிழைத்திருத்தம்**: பொதுவான சிக்கல்களுக்கு பிழைத்திருத்த வழிமுறைகள்
- **சிறந்த நடைமுறைகள் ஒருங்கிணைப்பு**: தொழில் நிலை இடையூறுகள் மற்றும் பரிந்துரைகள்
- **பதிப்பு பொருத்தத்தன்மை**: சமீபத்திய Azure சேவைகள் மற்றும் azd அம்சங்களுடன் புதுப்பிக்கப்பட்டது

## எதிர்கால விரிவாக்க திட்டங்கள்

### பதிப்பு 3.1.0 (திட்டமிடப்பட்டது)
#### ஏ.ஐ தளம் விரிவு
- **பன்மாடல் ஆதரவு**: Hugging Face, Azure Machine Learning மற்றும் தனிப்பயன் மாதிரிகளுக்கான ஒருங்கிணைப்பு வடிவுகள்
- **ஏ.ஐ ஏஜெண்ட் கட்டமைப்புகள்**: LangChain, Semantic Kernel மற்றும் AutoGen ஒதுக்கீடுகளுக்கான டெம்ப்ளேட்டுகள்
- **மேம்பட்ட RAG வடிவைகள்**: Azure AI Search தவிர வேக்டர் தரவுத்தள விருப்பங்கள் (Pinecone, Weaviate, மற்றும் பிற)
- **ஏ.ஐ கவனிப்பு**: மாதிரி செயல்திறன், token பயன்பாடு மற்றும் பதில் தரத்தை மேம்படுத்திய கண்காணிப்பு

#### டெவலப்பர் அனுபவம்
- **VS Code விரிவாக்கம்**: ஒருங்கிணைந்த AZD + Microsoft Foundry மேம்பாட்டு அனுபவம்
- **GitHub Copilot ஒருங்கிணைப்பு**: ஏ.ஐ-உதவியுடன் AZD டெம்ப்ளேட் உருவாக்கல்
- **இணைய பயிற்சிகள்**: ஏ.ஐ சூழல்களுக்கு தானாக சரிபார்ப்பு கொண்ட கைமுறை குறியீடு பயிற்சிகள்
- **காணொளி உள்ளடக்கம்**: காட்சி கற்றலுக்கான கூடுதல் காணொளி பயிற்சிகள் ஏ.ஐ ஒதுக்கீடுகளில் கவனம்

### பதிப்பு 4.0.0 (திட்டமிடப்பட்டது)
#### நிறுவன ஏ.ஐ வடிவிக்கைகள்
- **ஆளுநர் கட்டமைப்பு**: ஏ.ஐ மாதிரி ஆளுநர்நிலை, ஒழுங்குமுறை மற்றும் கண்காணிப்பு தடையியல்
- **பன்முக வாடிக்கையாளர் ஏ.ஐ**: தனித்த AI சேவைகளுடன் பல வாடிக்கையாளர்களுக்கு சேவை வழங்கும் வடிவங்கள்
- **எடை AI ஒதுக்கீடு**: Azure IoT Edge மற்றும் கன்டெய்னர் நிகழ்வுகளுடன் ஒருங்கிணைப்பு
- **இணைமையான கிளவுட் ஏ.ஐ**: பன்முக மற்றும் இணைக்கப்பட்ட கிளவுட் ஒதுக்கீடு வடிவங்கள்

#### முன்னேற்ற அம்சங்கள்
- **ஏ.ஐ குழாய் தானியங்கி**: Azure Machine Learning குழாய் இணைப்பு MLOps
- **மேம்பட்ட பாதுகாப்பு**: பூஜ்ஜிய நம்பிக்கை வடிவங்கள், தனியார் முனைகள் மற்றும் மேம்படுத்தப்பட்ட அச்சுறுத்தல் பாதுகாப்பு
- **செயல்திறன் மேம்பாடு**: அதிக திறன் ஏ.ஐ பயன்பாடுகளுக்கான முன்னேற்ற நல்லமைவு மற்றும் பருமன் மூலோபாயங்கள்
- **உலகளாவிய விநியோகம்**: ஏ.ஐ பயன்பாடுகளுக்கான உள்ளடக்க விநியோகம் மற்றும் முனைந்த வைத்தல் வடிவங்கள்

### பதிப்பு 3.0.0 (திட்டமிட்டது) - தற்போதைய வெளியீட்டால் மாற்றப்பட்டது
#### பரிந்துரைக்கப்பட்ட கூட்டங்கள் - v3.0.0 இல் இப்போது செயல்படுத்தப்பட்டவை
- ✅ **ஏ.ஐ-வலைகளை உள்ளடக்கியது**: Microsoft Foundry ஒருங்கிணைப்பு முழுமையாக செய்யப்பட்டது
- ✅ **இணையப் பயிற்சிகள்**: கைமுறை ஏ.ஐ வேலைப்பாடுத்துறை ஆராய்ச்சி (முடிந்தது)
- ✅ **மேம்பட்ட பாதுகாப்பு தொகுதி**: ஏ.ஐ-குறிப்பிடப்பட்ட பாதுகாப்பு வடிவுகள் (முடிந்தது)
- ✅ **செயல்திறன் மேம்பாடு**: ஏ.ஐ பணிகளுக்கான சீரமைப்பு மூலோபாயங்கள் (முடிந்தது)

### பதிப்பு 2.1.0 (திட்டமிடப்பட்டது) - v3.0.0 இல் பகுதியாக செயல்படுத்தப்பட்டது
#### சிறிய மேம்பாடுகள் - தற்போதைய வெளியீட்டில் சில முடிந்தவை
- ✅ **கூடுதல் உதாரணங்கள்**: ஏ.ஐ-குறைந்த ஒதுக்கீட்டு சூழல்கள் (முடிந்தது)
- ✅ **விரிவான FAQ**: ஏ.ஐ-குறிப்பிடப்பட்ட கேள்விகள் மற்றும் பிழைத்திருத்தம் (முடிந்தது)
- **கருவி ஒருங்கிணைப்பு**: மேம்படுத்தப்பட்ட IDE மற்றும் திருத்தி ஒருங்கிணைவு கையேடுகள்
- ✅ **கண்காணிப்பு விரிவாக்கம்**: ஏ.ஐ-குறிப்பிடப்பட்ட கண்காணிப்பு மற்றும் எச்சரிக்கை வடிவங்கள் (முடிந்தது)

#### எதிர்கால வெளியீட்டிற்காக இன்னும் திட்டமிடப்பட்டுள்ளது
- **கையடக்க உகந்த ஆவணங்கள்**: மொபைல் கற்றலுக்கு பதிலான பதில் வடிவமைப்பு
- **ஆஃப்லைன் அணுகல்**: பதிவேற்றக்கூடிய ஆவண தொகுப்புகள்
- **மேம்பட்ட IDE ஒருங்கிணைப்பு**: AZD + ஏ.ஐ பணிக்ﬂలுக்கான VS Code விரிவாக்கம்
- **சமூகவியல் டாஷ்போர்டு**: நேரடி சமூக புள்ளிவிவரங்கள் மற்றும் பங்களிப்பு கண்காணிப்பு

## மாற்றக்குறிப்பில் பங்களித்தல்

### மாற்றங்களை அறிவித்தல்
இந்த கிடங்கு மேம்பாட்டில் பங்களிக்கும் போது, மாற்றக்குறிப்பில் பின்வரும் விவரங்கள் உள்ளடக்கப்பட்டுள்ளன என்பதை உறுதி செய்யவும்:

1. **பதிப்பு எண்**: செமாண்டிக் பதிப்பீட்டைப் பின்பற்றுதல் (பெரியது.சிறியது.பাজ்)
2. **திகதி**: வெளியீடு அல்லது மேம்பாட்டு தேதி YYYY-MM-DD வடிவில்
3. **வகை**: சேர்க்கப்பட்டது, மாற்றப்பட்டது, தவிர்க்கப்பட்டது, அகற்றப்பட்டது, சரி செய்யப்பட்டது, பாதுகாப்பு
4. **தெளிவான விளக்கம்**: என்ன மாற்றம் ஆனது என்பதின் சுருக்கமான விவரம்
5. **பலனாளர்கள் மீது தாக்கம்**: உள்ள பயனாளர்களுக்கு மாற்றங்கள் எப்படி பாதிக்கின்றன

### மாற்ற வகைகள்

#### சேர்க்கப்பட்டது
- புதிய அம்சங்கள், ஆவண பிரிவுகள் அல்லது திறன்கள்
- புதிய உதாரணங்கள், டெம்ப்ளேட்டுகள் அல்லது கற்றல் வளங்கள்
- கூடுதல் கருவிகள், ஸ்கிரிப்ட்கள் அல்லது பயன்பாட்டுசாதனங்கள்

#### மாற்றப்பட்டது
- உள்ள செயல்பாடுகள் அல்லது ஆவணங்களில் மாற்றங்கள்
- தெளிவு அல்லது துல்லியம் மேம்படுத்தப்பட்டுள்ளன
- உள்ளடக் குறை அமைப்பு மறுவரிசை

#### தவிர்க்கப்பட்டது
- படிப்படியாய் நிறுத்தப்படும் அம்சங்கள் அல்லது அணுகுமுறைகள்
- அகற்ற திட்டமிடப்பட்ட ஆவண பிரிவுகள்
- மேம்பட்ட மாற்று முறைகள் உள்ள செயல்பாடுகள்

#### அகற்றப்பட்டது
- இனிப்படியாக பொருந்தாத அம்சங்கள், ஆவணங்கள் அல்லது உதாரணங்கள்
- பழைய தகவல்கள் அல்லது தவிர்க்கப்பட்ட அணுகுமுறைகள்
- மீண்டும் ஒருங்கிணைக்கப்பட்ட அல்லது ஒருங்கூடிய உள்ளடக்கம்

#### சரி செய்தது
- ஆவணங்கள் அல்லது குறியீட்டில் உள்ள பிழைகளுக்கு திருத்தங்கள்
- அறிக்கை செய்யப்பட்ட பிரச்சனைகள் தீர்வு
- துல்லியம் அல்லது செயல்பாடுகள் மேம்படு


#### பாதுகாப்பு
- பாதுகாப்பு தொடர்பான மேம்பாடுகள் அல்லது திருத்தங்கள்
- பாதுகாப்பு சிறந்த நடைமுறைகளுக்கு புதுப்பிப்புகள்
- பாதுகாப்பு பலவீனங்களின் தீர்வு

### அர்த்தமுள்ள பதிப்பு வழிகாட்டிகள்

#### பெரிய பதிப்பு (X.0.0)
- பயனர் நடவடிக்கை தேவைபடும் உடைக்கக்கூடிய மாற்றங்கள்
- உள்ளடக்கம் அல்லது அமைப்பில் முக்கியமான மறுசீரமைப்பு
- அடிப்படையான அணுகுமுறையோ அல்லது முறையோ மாற்றப்படும் மாற்றங்கள்

#### சிறிய பதிப்பு (X.Y.0)
- புதிய அம்சங்கள் அல்லது உள்ளடக்கம் கூடுதல்கள்
- பின்வட்ட இணக்கமான மேம்பாடுகள்
- கூடுதல் உதাহரணைகள், கருவிகள் அல்லது வளங்கள்

#### தைக்கூறு பதிப்பு (X.Y.Z)
- பிழை திருத்தங்கள் மற்றும் சரிசெய்தல்கள்
- உள்ளடக்கத்தின் சிறிய மேம்பாடுகள்
- தெளிவுபடுத்தல்கள் மற்றும் சிறு மேம்பாடுகள்

## சமுதாய பதில் மற்றும் பரிந்துரைகள்

இந்த கற்றல் வளத்தை மேம்படுத்த நாம் சமுதாய பதிலை ஊக்குவிக்கிறோம்:

### எப்படி பதில் வழங்குவது
- **GitHub பிரச்சனைகள்**: பிரச்சனைகள் அறிக்கையிடவும் அல்லது மேம்பாடுகளை பரிந்துரைக்கவும் (AI-சந்தான பிரச்சனைகள் வரவேற்கப்படுகிறது)
- **Discord பேச்சு**: Microsoft Foundry சமுதாயத்துடன் கருத்துக்களை பகிரவும்
- **புள்ள் கோரிக்கைகள்**: உள்ளடக்கத்திற்கு நேரடி மேம்பாடுகளை செய்யுங்கள், குறிப்பாக AI வடிவங்கள் மற்றும் வழிகாட்டிகள்
- **Microsoft Foundry Discord**: AZD + AI பேச்சுகளுக்கு #Azure சேனலில் பங்கேற்கவும்
- **சமுதாய அரங்கங்கள்**: பல்வேறு Azure உருவாக்குநர் கருத்துக்களில் பங்கேற்கவும்

### பதில் வகைகள்
- **AI உள்ளடக்க துல்லியம்**: AI சேவை ஒருங்கிணைப்பு மற்றும் இயக்க தகவலுக்கான திருத்தங்கள்
- **கற்றல் அனுபவம்**: AI உருவாக்குநர் கற்றல் வழிக்கான மேம்பாட்டு பரிந்துரைகள்
- **欠ந்த AI உள்ளடக்கம்**: கூடுதல் AI வடிவங்கள், முறைமைகள் அல்லது உதாரணங்களுக்கான கோரிக்கைகள்
- **கடைதேர்வு**: பல்வேறு கற்றல் தேவைகளுக்கான மேம்பாடுகள்
- **AI கருவி ஒருங்கிணைவு**: மேம்பட்ட AI உருவாக்க வேலைநிறைவு ஒருங்கிணைப்பு பரிந்துரைகள்
- **உற்பத்தி AI முறைமைகள்**: நிறுவன AI இயக்க முறை கோரிக்கைகள்

### பதில் உறுதி
- **பிரச்சனை பதில்**: அறிக்கையிட்ட பிரச்சனைகளுக்கு 48 மணிநேரத்தில்
- **அம்ச கோரிக்கைகள்**: ஒரு வாரத்தில் மதிப்பீடு செய்யப்படும்
- **சமுதாய பங்களிப்புகள்**: ஒரு வாரத்தில் மதிப்பாய்வு செய்யப்படும்
- **பாதுகாப்பு பிரச்சனைகள்**: உடனடி முன்னுரிமை மற்றும் வேகமாக பதில்

## பராமரிப்பு அட்டவணை

### நிகழ்ச்சித் புதுப்பிப்புகள்
- **மாதாந்திர விமர்சனங்கள்**: உள்ளடக்க துல்லியம் மற்றும் இணைப்புப் பரிசோதனை
- **காலாண்டு புதுப்பிப்புகள்**: முக்கிய உள்ளடக்க கூடுதல்கள் மற்றும் மேம்பாடுகள்
- **அரையாண்டு விமர்சனங்கள்**: விரிவான மறுசீரமைப்பு மற்றும் மேம்பாடு
- **ஆண்டுதோறும் வெளியீடுகள்**: முக்கிய பதிப்பு புதுப்பிப்புகள் மற்றும் குறிப்பிடத்தக்க மேம்பாடுகள்

### கண்காணிப்பு மற்றும் தர உறுதி
- **தானியங்கி சோதனை**: குறியீட்டு உதாரணங்கள் மற்றும் இணைப்புகளின் சீரான சரிபார்ப்பு
- **சமுதாயப் பதில் ஒருங்கிணைவு**: பயனர் பரிந்துரைகளின் சீரான ஒருங்கிணைவு
- **தொழில்நுட்ப புதுப்பிப்புகள்**: சமீபத்திய Azure சேவைகள் மற்றும் azd வெளியீடுகளுடன் ஒத்திசைவு
- **படைப்பாற்று மதிப்பாய்வுகள்**: ஒட்டுமொத்த வடிவமைப்பு கோட்பாடுகளுக்கான வழக்கமான பரிசீலனை

## பதிப்பு ஆதரவு கொள்கை

### தற்போதைய பதிப்பு ஆதரவு
- **சமீபத்திய பெரிய பதிப்பு**: முழு ஆதரவு மற்றும் மாதாந்திர புதுப்பிப்புகள்
- **முன் பெரிய பதிப்பு**: 12 மாதங்கள் பாதுகாப்பு புதுப்பிப்புகள் மற்றும் அவசர திருத்தங்கள்
- **பழைய பதிப்புகள்**: சமுதாய ஆதரவு மட்டுமே, அதிகாரப்பூர்வ புதுப்பிப்புகள் இல்லை

### இடமாற்ற வழிகாட்டி
பெரிய பதிப்புகள் வெளியிடப்படும் போது, நாங்கள் வழங்குகிறோம்:
- **இடமாற்றக் கையேடுகள்**: படி படியாக மாற்றும் அறிவுரைகள்
- **இணக்கக்கூடிய குறிப்பு**: உடைக்கும் மாற்றங்களின் விவரங்கள்
- **கருவி ஆதரவு**: இடமாற்றத்திற்கு உதவும் ஸ்கிரிப்ட்கள் அல்லது பயன்பாடுகள்
- **சமுதாய ஆதரவு**: இடமாற்றக் கேள்விகளுக்கான அர்ப்பணிக்கப்பட்ட அரங்குகள்

---

**நெவிகேஷன்**
- **முந்தைய பாடம்**: [கற்றல் கையேடு](resources/study-guide.md)
- **அடுத்து பாடம்**: [பிரதான README](README.md) என்பதற்குத் திரும்பவும்

**புதுப்பிப்புகளை தொடரவும்**: புதிய வெளியீடுகள் மற்றும் கற்றல் பொருட்களின் முக்கிய புதுப்பிப்புகளுக்கான அறிவிப்புகளுக்காக இந்த தொகுப்பை அறிந்துகொள்ளுங்கள்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
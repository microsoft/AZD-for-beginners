# மாற்றப்பட்டியல் - AZD தொடக்கக்காரர்கள்

## அறிமுகம்

இந்த மாற்றப்பட்டியல் AZD For Beginners தொகுப்பில் நடந்த அனைத்து குறிப்பிடத்தகுந்த மாற்றங்கள், புதுப்பிப்புகள் மற்றும் மேம்பாடுகளையும் பதிவுசெய்கிறது. நாம் அர்த்தமுள்ள பதிப்பு வழிகாட்டுதல்களை பின்பற்றுகிறோம் மற்றும் பயனர்களுக்கு பதிப்புகளுக்கு இடையிலான மாற்றங்களைப் புரிந்துகொள்ள இந்த பதிவை பராமரிக்கிறோம்.

## கற்றல் நோக்கங்கள்

இந்த மாற்றப்பட்டியலைப் பரிசீலித்தால், நீங்கள்:
- புதிய அம்சங்கள் மற்றும் உள்ளடக்கச் சேரிப்புகள் பற்றி தகவல்களுடன் இருக்கலாம்
- உள்ளடக்கச் சான்றிதழ்கள் மேம்பட்டதைப் புரிந்துகொள்ளலாம்
- துல்லியத்தன்மையை உறுதி செய்வதற்கு பிழை திருத்தங்கள் மற்றும் சீர்படுத்தல்களைப் பின்தொடரலாம்
- கற்பித்தல் மூலக்கூறுகளின் நேரச்சீர்திருத்த வளர்ச்சியைப் பின்தொடரலாம்

## கற்றல் முடிவுகள்

மாற்றப்பட்டியல் பதிவுகளைப் பார்வையிட்டபின்னர், நீங்கள் முடியும்:
- கற்பிக்க புதிய உள்ளடக்கம் மற்றும் வளங்களை அடையாளம் காண
- எந்த பிரிவுகள் புதுப்பிக்கப்பட்டுள்ள அல்லது மேம்படுத்தப்பட்டுள்ள என்பதை புரிந்துகொள்ள
- தற்போதைய மூலக்கட்டமைப்பின் அடிப்படையில் உங்கள் கற்றல் பாதையை திட்டமிட
- எதிர்கால மேம்பாடுகளுக்கான கருத்துகள் மற்றும் பரிந்துரைகளை வழங்க

## பதிப்பு வரலாறு

### [v3.22.0] - 2026-06-16

#### ஆரம்ப நிலை இடைவெளி-நிரப்பம் #2: டெம்ப்ளேட் உருவாக்கம், Dev Containers, Pulumi, Azure DevOps, சேவை பிரதிநிதிகள் மற்றும் மேல்
**இந்த பதிப்பு azd-coverage பகுப்பாய்வால் வெளிப்படுத்தப்பட்ட மீதி இடைநிலைக் குறைகளை மூடுகிறது: உங்கள் சொந்த டெம்ப்ளேட்டை எப்படி உருவாக்கி வெளியிடுவது, மீள்வூட்டக்கூடிய dev-container/Codespaces சூழல்கள், Pulumi பணிபுரியும் வழங்குநர், Azure DevOps CI/CD நடைமுறை, சேவை-பிரதிநிதி அங்கீகாரம், ஹோஸ்ட்-தேர்வு வழிகாட்டுதல் (AKS/Spring Apps), `azd restore`/`azd package` விளக்கங்கள், ஹுக் பிழை-கையாளுதல், மற்றும் குழு/பகிர்ந்தும்-சுற்றுச்சூழல் நடைமுறைகள்.**

#### சேர்க்கப்பட்டது
- **🧱 புதிய அத்தியாயம் 4 பாடம்** `docs/chapter-04-infrastructure/custom-templates.md` — உங்கள் சொந்த azd டெம்ப்ளேட்டை உருவாக்குதல்: தேவையான கட்டமைப்பு (`azure.yaml`, `infra/`, `src/`), `metadata.template` படField, `uniqueString()` resource token மற்றும் `azd-env-name` டேக் மூலம் உட்பொருளாக்கம், `azd init --template <local-path>` மூலம் உள்ளூரில் சோதனை செய்வது, GitHubக்கு வெளியிடுதல் மற்றும் Awesome AZD காட்சியகத்திற்கு சமர்ப்பு செய்தல்
- **📦 புதிய அத்தியாயம் 1 பாடம்** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers மற்றும் GitHub Codespaces மூலம் மீள்வடிவாக்கம் செய்யக்கூடிய azd சூழல்கள்: அதிகாரப்பூர்வ `ghcr.io/azure/azure-dev/azd` அம்சத்தை பயன்படுத்தும் குறைந்தபட்ச `.devcontainer/devcontainer.json`, மொழி-சார்ந்த அம்சங்கள், கூண்டைகளுக்கான ஹோஸ்ட்-களுக்கு `docker-in-docker`, மற்றும் தொலைநிலையிலான சைன்-இனிற்கு `azd auth login --use-device-code`
- **🧩 Pulumi உடன் azd** பகுதி `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi கோப்புறை அமைப்பு, azd சூழல்களுக்கு மேப் செய்யப்பட்ட ஸ்டாக்கள், தேவையான வெளியீடுகள்/டேக்கிங், மற்றும் ஒரே மாதிரியான `azd up` / `azd down` வேலைப்ப جریان
- **🎯 ஹோஸ்ட்-தேர்வு வழிகாட்டுதல்** `docs/chapter-04-infrastructure/provisioning.md` — ஆரம்பநிலை பயனுள்ள `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, மற்றும் `springapp` ஒப்பீடு, AKS அல்லது Azure Spring Apps தேர்ந்தெடுக்க வேண்டிய நேரம் பற்றிய வழிகாட்டல்
- **🛠️ Azure DevOps CI/CD நடைமுறை** `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, workload identity federation (OIDC) உடன் சேவை இணைப்பு, உருவாக்கப்படும் `azure-dev.yml`, மற்றும் variable-group அமைப்பு
- **🔑 சேவை பிரதிநிதிகள் (Pattern 4)** `docs/chapter-03-configuration/authsecurity.md` இல் சேர் செய்யப்பட்டன — `az ad sp create-for-rbac`, non-interactive `azd auth login` client secret வைத்திருக்கை எதிராக federated/OIDC அங்கீகாரங்கள், எப்பொழுது பயன்படுத்துவது, மற்றும் பாதுகாப்பான கடவுச் செய்முறை சேமிப்பு
- **🪝 ஹுக் பிழை-கையாளுதல்** துணைப்பிரிவு `docs/chapter-04-infrastructure/deployment-guide.md` — வெளியேறும் குறியீடுகள் மற்றும் `set -e`, `continueOnError`, `azd hooks run` மூலம் தனித்தன்மையில் ஹூக்களை சோதித்தல், OS-சார்ந்த ஷெல்ல்கள், மற்றும் `--debug`
- **👥 குழு / பகிரப்பட்ட சூழல்கள்** பகுதி `docs/chapter-03-configuration/configuration.md` — `.azure/` இல் என்ன வாழ்கிறது, என்ன gitignore செய்ய வேண்டும், per-developer சூழல்கள், `azd env list`/`select`, மற்றும் CI/CD இல் சூழல் மதிப்புகளை வழங்குவது
- **🧰 `azd restore` மற்றும் விரிவடைந்த `azd package`** விளக்கங்கள் `resources/cheat-sheet.md` — சார்புகளை மீட்டெடுத்து deploy செய்யாமல் deploy செய்யக்கூடிய கட்டிடத்தை உருவாக்குவது

#### மாற்றம்
- **🧭 அத்தியாயம் 4 பாடங்கள் அட்டவணை** புதிய "Authoring Your Own Template" பாடத்தை (பாடமை 3) சேர்ப்பதற்காக புதுப்பிக்கப்பட்டது
- **🧭 அத்தியாயம் 1 பாடங்கள் அட்டவணை** புதிய "Dev Containers & Codespaces" பாடத்தை (பாடமை 5) சேர்ப்பதற்காக புதுப்பிக்கப்பட்டது; navigation கால்பாடுகள் `bring-your-own-app.md` மற்றும் `dev-containers.md` இடையே இணைக்கப்பட்டன

### [v3.21.0] - 2026-06-16

#### ஆரம்ப நிலை இடைவெளி-நிரப்பம்: கைமுறையில் பல-ஏஜென்ட் பாடம், "உங்கள் சொந்த பயன்பாட்டை கொண்டு வா", Terraform, மற்றும் CI/CD நடைமுறை
**இந்த பதிப்பு முழுமையான தொடக்கக்காரர் வழிகாட்டலுக்கான மிகப்பெரிய இடைவெளிகளை மூடுகிறது மற்றும் இரண்டு புதிய கைமுறை பாடங்கள் (deploy செய்யக்கூடிய multi-agent நடைமுறை மற்றும் ஏற்கனவே உள்ள பயன்பாட்டிற்கு azd சேர்ப்பது), ஆரம்பநிலை நண்பரான ஹூக்ஸ் அறிமுகம், azd உடன் Terraform பகுதி, படிப்படியாக GitHub Actions பயிலரங்குக் குழப்பம், புதிய முன்னோட்ட நீட்சிகளுக்கான விளக்கம், மற்றும் வெளிப்படையான deploy-சத்தியப்படுத்தல் சரிபார்ப்பு பட்டியலைச் சேர்க்கிறது.**

#### சேர்க்கப்பட்டது
- **🤝 புதிய அத்தியாயம் 5 பாடம்** `docs/chapter-05-multi-agent/multi-agent-basics.md` — முழுமையாக கைமுறையான, deploy செய்யக்கூடிய இரண்டு-ஏஜென்ட் நடைமுறை (orchestrator + specialists) ஒரு உண்மையான டெம்ப்ளேட் (`contoso-creative-writer`) உபயோகித்து, எப்போது multi-agent பயன்படுத்துவது, `azd up` வேலைசெயல், deploy செய்யப்பட்ட வளங்களைப் புரிந்து கொள்வது, குறுக்கு-ஏஜென்ட் கருத்தரங்கம், தனிப்பயனாக்கம், மற்றும் கிளீன்அப்
- **📦 புதிய அத்தியாயம் 1 பாடம்** `docs/chapter-01-foundation/bring-your-own-app.md` — `azd init` மூலம் ஏற்கனவே உள்ள திட்டத்தில் azd சேர்ப்பது ("use code in the current directory"), `azure.yaml` மற்றும் `infra/` புரிதல், `azd infra generate`, ஹோஸ்ட் கண்டறிதல், மற்றும் `azd up` மூலம் deploy செய்வது
- **🌐 azd உடன் Terraform** பகுதி `docs/chapter-04-infrastructure/provisioning.md` இல் சேர்க்கப்பட்டது — `infra.provider: terraform` கட்டமைப்பு, `.tf` கோப்புறை அமைப்பு, தேவையான `AZURE_*` வெளியீடுகள் மற்றும் `azd-env-name` டேக்கிங், மற்றும் ஒரே மாதிரியான `azd up` / `azd down` வேலைப்ப جریان (Terraform ஆதரவு குறிப்பிடப்பட்டு இருந்த ஆனால் Bicep மட்டும் காண்பிக்கப்பட்ட இடையைக் மூடுகிறது)
- **⚙️ படிப்படையான GitHub Actions நடைமுறை** `docs/chapter-08-production/production-ai-practices.md` — GitHub ரெப்போரிடிருந்து தானியங்கி deploy களுக்கு: `azd pipeline config`, OIDC federated credentials (சேமிப்புக்குரிய ரகசியங்கள் தேவையில்லை), உருவாக்கப்படும் `azure-dev.yml`, மற்றும் ரகசியங்கள்-vs-மாறிகள் வழிகாட்டுதல்
- **🪝 ஆரம்பநிலை "ஹூக்ஸுக்கு புதியவரா?" அறிமுகம்** `docs/chapter-04-infrastructure/deployment-guide.md` — ஹுக் என்பது என்ன, ஹுக்-அறைகளின் அட்டவணை, குறைந்தபட்ச முதல் ஹுக், மற்றும் `azd hooks run` மூலம் ஹூக்களை கைமுறையில் இயக்குதல்
- **✅ "உங்கள் Deploy ஐ சத்தியப்படுத்துக" சரிபார்ப்பு பட்டியல்** `docs/chapter-01-foundation/first-project.md` இன் படி 5 இல் சேர்க்கப்பட்டது — புகைத் சோதனை, உட்புகு-endpoint சரிபார்ப்பு, மற்றும் தற்போதைய வெற்றிக் காம் குறியீடுகள்
- **🧩 புதிய முன்னோட்ட நீட்சிகளுக்கான விளக்கம்** `azure.ai.skills` மற்றும் `azure.ai.connections` (அவை என்ன மற்றும் அவற்றை எப்போது பயன்படுத்துவது) `docs/chapter-08-production/production-ai-practices.md` இல்

#### மாற்றம்
- **🧭 அத்தியாயம் 5 பாடங்கள் அட்டவணை** சரி செய்யப்பட்டது: `multi-agent-basics.md` இப்போது பாடம் 1 (ஒற்றை முழுமையாக கைமுறை பாடம்), பாடம் 2 அத்தியாயம் 6 இல் இருப்பதாக நேர்மையான அடையாளமிடல் மற்றும் Retail சன்னைக்காட்சி ஒரு கட்டமைப்பு வரைபடம் மற்றும் ஒரே-கட்டளை டெம்ப்ளேட் அல்ல என்பதை தெளிவுபடுத்தல்
- **🧭 அத்தியாயம் 1 பாடங்கள் அட்டவணை** இப்போது புதிய "Bring Your Own App" பாடத்தை (பாடம் 4) கொண்டுள்ளது
- **🔗 வழிசெலுத்தல் கால்பாடுகள்** புதுப்பிக்கப்பட்டவை: `first-project.md` இப்போது `bring-your-own-app.md` க்கு முன்னோக்கி இணைப்பை வழங்குகிறது

#### சரி செய்யப்பட்டது
- **🧱 "கூறப்பட்ட ஆனால் இல்லை" Terraform இடைவெளியை மூடு** — முன்னர் படிப்பு Terraform ஆதரவை குறிப்பிடினாலும் அதை காட்டவில்லை
- **🔀 தவறான Chapter 5 குறுக்க இணைப்புகளைச் சரி செய்தது** வெறுமனே கட்டமைப்பு வரைபடம் மட்டுமே இருந்தபோது முழு multi-agent நடைமுறை இருந்தது என்று தவறாகக் குறிப்பிட்டவை

#### புதுப்பிக்கப்பட்ட கோப்புகள்
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(புது)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(புது)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 புதுப்பிப்பு, முழுமையான ஏஜன் வாழ்நாள் கட்டளைகள் & Aspire பெயர்பெயர் மாற்றம்
**இந்த பதிப்பு `azd` `1.25.6` (ஜூன் 2026) மற்றும் `azure.ai.agents` `0.1.40-preview` நீட்சிக்கு எதிராக படிப்பை மறுபரிசோதிக்கிறது, AI வழிகாட்டுதலை "ஏஜன்டைப் படைத்தல்" இருந்து முழு ஏஜன் வாழ்நாள் (சோதனை → மதிப்பீடு → மேம்படுத்து → ஆய்வு → நீக்கு) வரை விரிவாக்குகிறது, புதிய `azure.ai.skills` மற்றும் `azure.ai.connections` முன்னோட்ட நீட்சிகளை வெளிப்படுத்துகிறது, மற்றும் ".NET Aspire" → "Aspire" தயாரிப்புப் பெயர் மாற்றத்தை குறிப்பதாகக் குறிப்பிடுகிறது.**

#### சேர்க்கப்பட்டது
- **🔁 தொடக்கக்காரர்கள் மற்றும் AI பொறியியலாளர்களுக்கான முழு ஏஜன் வாழ்நாள் பாதுகாப்பு** ஆவணங்களில்:
  - `docs/chapter-01-foundation/azd-basics.md` — Extensions மற்றும் AI கட்டளைகள் பிரிவில் வாழ்நாள் அட்டவணை (scaffold → test → measure → improve → inspect → clean up) சேர்க்கப்பட்டது
  - `docs/chapter-08-production/production-ai-practices.md` — `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, மற்றும் `delete --force` ஐ உள்ளடக்கிய புதிய "Managing the Agent Lifecycle" பகுதி
  - `resources/cheat-sheet.md` — `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, மற்றும் `delete --force` உடனான விரிவடைந்த AI ஏஜன் கட்டளைகள்
- **🧩 புதிய முன்னோட்ட நீட்சிகள்** ஆவணப்படுத்தப்பட்டன: மறுபயன்படுத்தக்கூடிய ஏஜன் திறன்களுக்கான `azure.ai.skills` மற்றும் Foundry இணைப்புகளுக்கான `azure.ai.connections` நீட்சிகள் அட்டவணையிலும் cheat sheet இலும் சேர்க்கப்பட்டன
- **⏱️ பதில்-நேர வழிகாட்டுதல்** — `azd ai agent invoke` உதாரணங்கள் இப்போது மொத்த தாமதமும் time-to-first-byte ஐ அச்சிடுவதை குறிக்கின்றன
- **📌 பதிப்பு வான்** வேர்த் README இல் கற்றலாளர்களுக்கு `azd version` மற்றும் `azd upgrade` நோக்கி வழிகாட்டும் பேனர்

#### மாற்றம்
- **✅ சரிபார்ப்பு அடிப்படை மேம்படுத்தப்பட்டது** `azd 1.23.12` (மார்ச் 2026) இருந்து `azd 1.25.6` (ஜூன் 2026) ஆக அனைத்து அத்தியாய README களிலும் மற்றும் பணியக ஆவணங்களில்
- **🤖 Chapter 2 நீட்சிக் குறிப்பு** `azure.ai.agents` `0.1.18-preview` இருந்து `0.1.40-preview` ஆக புதுப்பிக்கப்பட்டது
- **🧪 பயிலரங்கு சரிபார்ப்பு உதாரணம்** (`azd version` வெளியீடு) `1.25.6` ஆக புதுப்பிக்கப்பட்டது
- **🧭 README "azd இல் இன்று என்ன புதியது"** அத்தியாயம் முழு ஏஜன் வாழ்நாள், புதிய AI நீட்சிகள் மற்றும் சமீபத்திய வாழ்க்கை-தரம் அக்கறைகள் (`azd init` idempotency, `azd auth login` stale-token அழிப்பு, `azd tool` முதல் ஓட்டம் prompt) ஆகியவற்றைக் குறிப்பிடுவதற்காக சீரமைக்கப்பட்டது
- **📖 Chapter 2 agents.md (Option 4)** இப்போது கற்றலாளர்களை post-deploy வாழ்நாள் கட்டளைகள் நோக்கிச் செல்லும் வழியில் வழிநடத்துகிறது, `azd up` இல் நிறைய நிறுத்தாமல்

#### சரி செய்யப்பட்டது
- **🏷️ தயாரிப்பு பெயரிடுதல்** — Aspire பெயர்பெயர் மாற்ற குறிப்பு சேர்க்கப்பட்டது (".NET Aspire" இப்போது எளிதில் "Aspire"); azd இன் Aspire ஆதரவு மாறவில்லை
- **🔎 நேரடி வெளியீட்டு சரிபார்ப்பு** Azure Developer CLI வெளியீட்டு ஊட்டத்திற்கு எதிராக உறுதி செய்யப்பட்டது: நிலையான CLI `1.25.6` (2026-06-12) மற்றும் `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### புதுப்பிக்கப்பட்ட கோப்புகள்
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
#### தொடக்க நிலை பயன்முறை தெளிவாக்கம், அமைப்பு செல்லுபடியாக்தல் & இறுதி AZD கட்டளையின் சீரமைப்பு
**இந்த பதிப்பு AZD 1.23 சரிபார்ப்பு ஓரங்கம் பின் வந்ததாகும் மற்றும் தொடக்க நிலை பயனர்களுக்கான ஆவணங்களை மேம்படுத்துகிறது: இது AZD-முதலில் அங்கீகரிப்பு வழிகாட்டுதலை தெளிவுபடுத்துகிறது, உள்ளூர் அமைப்பு சரிபார்க்கும் ஸ்கிரிப்டுகளை சேர்க்கிறது, முக்கியக் கட்டளைகள் நேரடியாக AZD CLI-வில் சோதிக்கப்பட்டுள்ளன, மற்றும் மாற்றப்பத்திரிகை தவிர கடைசியாக மீதியாக இருந்த பழைய ஆங்கில மூல கட்டளை குறிப்புகளை அகற்றுகிறது.**

#### Added
- **🧪 தொடக்க நிலை அமைப்பு சரிபார்ப்பு ஸ்கிரிப்டுகள்** `validate-setup.ps1` மற்றும் `validate-setup.sh` உடன், பயிலாளர்கள் Chapter 1 தொடங்குவதற்கு முன் தேவையுள்ள கருவிகள் உள்ளனவா என்பதை உறுதி செய்ய முடியும்
- **✅ முன்குறிப்பு அமைப்பு சரிபார்ப்பு படிகள்** root README மற்றும் Chapter 1 README இல், ஆகையால் தேவைமிக்க முந்தைய நிபந்தனைகள் `azd up` முன் பிடிக்கப்படுகின்றன

#### Changed
- **🔐 தொடக்க நிலை அங்கீகரிப்பு வழிகாட்டுதல்** இப்போது `azd auth login` ஐ AZD பணிகள் үшін முதன்மை பாதையாக சீர்முறையாக扱ப்படுத்துகிறது, `az login` ஐ நேரடியாக Azure CLI கட்டளைகள் பயன்படுத்தப்படின் மட்டுமே விருப்பமாக குறிப்பிட்டுள்ளது
- **📚 Chapter 1 அணுகுமுறை** இனிமேல் பயிலாளர்களை நிறுவுதல், அங்கீகரிப்பு மற்றும் முதற்பார்வை நட்டையைச் செய்வதற்கு முந்தைய உள்ளூர் அமைப்பை சரிபார்க்கவென வழிநடத்துகிறது
- **🛠️ சரிபார்த்தல் செய்திச் செய்திகள்** AZD- மட்டும் தொடக்க பாதையில் தடுக்கும் தேவைகளைக் வெவ்வேறு விதமாக மற்றும் விருப்பமான Azure CLI எச்சரிக்கைகளை பிரித்துக் காட்டுவது தெளிவாக செய்துள்ளது
- **📖 கட்டமைப்பு, பிழைதிருத்தல் மற்றும் உதாரண ஆவணங்கள்** இப்போது தேவையான AZD அங்கீகரிப்பையும், சூழல் உள்ளடக்கத்தில் தெளிவுபடுத்தாமல் இருந்த Azure CLI கையொப்பத்தை விருப்பமானதாகவே பிரித்துச் சொல்கின்றன

#### Fixed
- **📋 மீதமுள்ள ஆங்கில மூல கட்டளை குறிப்புகள்** தற்போதைய AZD வடிவங்களாக புதுப்பிக்கப்பட்டன, தோற்ற பட்டியலில் `azd config show` உட்பட மற்றும் Azure போர்டல் மேம்பட்ட காட்சிக்குக் குறிக்கப்படும்போது `azd monitor --overview` உட்பட
- **🧭 Chapter 1 இல் தொடக்கக்க் குறிப்பாக்கண்டமை** அனைத்து டெம்ப்ளேட்ட்களுக்கும் மற்றும் Azure வளங்களுக்கும் across-error அல்லது rollback உத்தரவாதத்தை அதிகமாகக் கூறுவதைத் தவிர்த்துக்கொள்ள மென்மையாக்கப்பட்டது
- **🔎 நேரடி CLI சரிபார்ப்பு** தற்போது `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, மற்றும் `azd down --force --purge` ஆகியவற்றிற்கு ஆதரவு இருப்பது உறுதிசெய்யப்பட்டது

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

#### AZD 1.23.12 சரிபார்ப்பு, பணிமனை சூழல் விரிவாக்கம் & AI மாதிரி புதுப்பிப்பு
**இந்த பதிப்பு `azd` `1.23.12` உடன் ஆவணங்கள் சரிபார்க்கப்படுவதைக் குறிப்பிடுகிறது, பழங்கால AZD கட்டளை உதாரணங்களை புதுப்பிக்கிறது, AI மாதிரி வழிகாட்டுதலை தற்போதைய இயல்புகளுக்காக சீரமைக்கிறது, மற்றும் பயிற்சி வழிகாட்டிகளை GitHub Codespaces மட்டுமின்றி dev container-கள் மற்றும் உள்ளூர் கிளோன்களுக்கும் ஆதரவளிக்கத் தீர்மானிக்கிறது.**

#### Added
- **✅ மைய அத்தியாயங்களிலும் பணிமனை ஆவணங்களிலும் சரிபார்ப்பு குறிப்புகள்** பயிலாளர்கள் புதிய அல்லது பழைய CLI builds பயன்படுத்தினால் எந்த AZD அடிப்படைச் சோதிக்கப்பட்டது என்பதை வெளிப்படையாகக் குறிப்பிடுகின்றன
- **⏱️ நீண்டநாள் AI செயலிகளுக்கான அச்சுமை நேரம் வழிகாட்டுதல்** `azd deploy --timeout 1800` பயன்படுத்தும்போது
- **🔎 நீட்சிகள் பரிசீலனை படிகள்** AI 워크்ஃப்ளோ ஆவணங்களில் `azd extension show azure.ai.agents` உடன்
- **🌐 விரிவான பணிமனை சூழல் வழிகாட்டுதல்** GitHub Codespaces, dev container-கள் மற்றும் உள்ளூர் கிளோன்களுடன் MkDocs பயன்படுத்துவதற்கான வழிகாட்டுதல்களை உள்ளடக்கியது

#### Changed
- **📚 அத்தியாய அறிமுக README-கள்** இப்போது foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, மற்றும் production பிரிவுகளில் `azd 1.23.12` மீது சரிபார்ப்பு செய்யப்பட்டதென தொடர்ந்து குறிப்பிடுகின்றன
- **🛠️ AZD கட்டளை குறிப்புகள்** ஆவணங்களில் தற்போதைய வடிவங்களுக்கு புதுப்பிக்கப்பட்டன:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` அல்லது `azd env get-value(s)` பொருத்தமான சூழ்நிலைக்கு ஏற்ப
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → Application Insights மேற்பார்வை நோக்கம் இருந்தபோது `azd monitor --overview`
- **🧪 Provision preview உதாரணங்கள்** தற்போதைய ஆதரவு பயன்பாட்டிற்கு எளிமைப்படுத்தப்பட்டுள்ளன, உதாரணமாக `azd provision --preview` மற்றும் `azd provision --preview -e production`
- **🧭 பணிமனை கலவரம்** பயிலாளர்கள் Codespaces, dev container, அல்லது உள்ளூர் கிளோனில் லேப்டுகளை முடிக்க முடியும் என புதுப்பிக்கப்பட்டது (Codespaces-ஐ மட்டும் கருதாமல்)
- **🔐 அங்கீகரிப்பு வழிகாட்டுதல்** AZD பணிகளுக்கு `azd auth login` ஐ முன்னுரிமை அளிக்கிறது, Azure CLI கட்டளைகள் நேரடியாக பயன்படுத்தப்பட்டால் `az login` விருப்பமானதாகக் குறிப்பிடப்பட்டுள்ளது

#### Fixed
- **🪟 Windows நிறுவல் கட்டளைகள்** installation guide இல் தற்போது `winget` package எழுத்துப்பிரிவு சீரமைக்கப்பட்டது
- **🐧 Linux நிறுவல் வழிகாட்டுதல்** distro-சார்ந்த ஆதரிக்காத `azd` package மேலாளரைக் குறிக்கும் வழிகளைத் தவிர்த்து, பொருத்தமான release asset-களை குறிக்க திருத்தப்பட்டது
- **📦 AI மாதிரி உதாரணங்கள்** பழைய இயல்புகளைப் போலியிருந்த `gpt-35-turbo` மற்றும் `text-embedding-ada-002` போன்றவற்றிலிருந்து `gpt-4.1-mini`, `gpt-4.1`, மற்றும் `text-embedding-3-large` போன்ற தற்போதைய உதாரணங்களுக்கு புதுப்பிக்கப்பட்டன
- **📋 நடைமுறை மற்றும் டயக்னோஸ்டிக்ஸ் துண்டுகள்** கடைசிக்கான சூழல் மற்றும் நிலை கட்டளைகளை உள்ளடக்குவதற்கு திருத்தப்பட்டன
- **⚙️ GitHub Actions வழிகாட்டுதல்** `Azure/setup-azd@v1.0.0` → `Azure/setup-azd@v2` என்று புதுப்பிக்கப்பட்டது
- **🤖 MCP/Copilot அனுமதி வழிகாட்டுதல்** `azd mcp consent` இருந்து `azd copilot consent list` ஆக புதுப்பிக்கப்பட்டது

#### Improved
- **🧠 AI அத்தியாய வழிகாட்டுதல்** இப்போது preview-பொறுப்பான `azd ai` நடத்தைகள், டெனன்ட்-நிர்ணயமான லாக்அவுட், தற்போதைய நீட்சிகள் பயன்பாடு, மற்றும் மாதிரி தயாரிப்பு பரிந்துரைகள் பற்றிய விளக்கத்தை சிறப்பாகச் வழங்குகிறது
- **🧪 பணிமனை வழிகாட்டுதல்கள்** லேப்களுக்கு மிகவும் الواقிகமான பதிப்பு உதாரணங்கள் மற்றும் தெளிவான சூழல் அமைப்பு மொழியைப் பயன்படுத்துகின்றன
- **📈 உற்பத்தி மற்றும் பிழைதிருத்த ஆவணங்கள்** இப்போது மானிட்டரிங், பேக்-அப் மாதிரி, மற்றும் செலவு நிலைகள் உதாரணங்களுடன் நவீனமடைந்துள்ளன

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

#### AZD AI CLI கட்டளைகள், உள்ளடக்க சரிபார்ப்பு & டெம்ப்ளேட் விரிவாக்கம்
**இந்த பதிப்பு `azd ai`, `azd extension`, மற்றும் `azd mcp` கட்டளைகளைக் அனைத்து AI தொடர்பான அத்தியாயங்களிலும் சேர்க்கிறது, agents.md இல் மாறிய இணைப்புக்களை சரி செய்கிறது மற்றும் பழுதடைந்த குறியீடுகளை திருத்துகிறது, cheat sheet-ஐ புதுப்பிக்கிறது, மற்றும் உதாரண டெம்ப்ளேட்டுகள் பகுதியை சரிபார்க்கப்பட்ட விளக்கங்களோடும் புதிய Azure AI AZD டெம்ப்ளேட்டுகளோடும் முழுமையாக மறுசீரமைக்கிறது.**

#### Added
- **🤖 AZD AI CLI உருவாக்கம்** 7 கோப்புகளில் பூர்த்தியாகச் சேர்க்கப்பட்டது (முந்தையதாக Chapter 8 மட்டும்):
  - `docs/chapter-01-foundation/azd-basics.md` — புதிய "Extensions and AI Commands" பிரிவு, `azd extension`, `azd ai agent init`, மற்றும் `azd mcp` அறிமுகப்படுத்துகிறது
  - `docs/chapter-02-ai-development/agents.md` — விருப்பம் 4: `azd ai agent init` மற்றும் டெம்ப்ளேட் vs மானிபெஸ்ட் அணுகுமுறை ஒப்பீடு அட்டவணை
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" மற்றும் "Agent-First Deployment" துணைப்பிரிவுகள்
  - `docs/chapter-05-multi-agent/README.md` — Quick Start இப்போது டெம்ப்ளேட் மற்றும் மானிபெஸ்ட்-அடிப்படையிலான deployment பாதைகளை காட்டுகிறது
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy பகுதி இப்போது `azd ai agent init` விருப்பத்துடனும்
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" துணைப்பிரிவு
  - `resources/cheat-sheet.md` — புதிய "AI & Extensions Commands" பிரிவு `azd extension`, `azd ai agent init`, `azd mcp`, மற்றும் `azd infra generate` ஆகியவற்றுடன்
- **📦 புதிய AZD AI உதாரண டெம்ப்ளேட்டுகள்** `microsoft-foundry-integration.md` இல்:
  - **azure-search-openai-demo-csharp** — .NET RAG chat Blazor WebAssembly, Semantic Kernel, மற்றும் voice chat ஆதரவு கொண்டது
  - **azure-search-openai-demo-java** — Langchain4J பயன்படுத்தி Java RAG chat ACA/AKS deployment விருப்பங்களுடன்
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, மற்றும் Prompty கொண்டு பல-ஜன சாதன எழுத்து செயலி
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB உடன் serverless RAG, Ollama உள்ளூர் dev ஆதரவு கொண்டது
  - **chat-with-your-data-solution-accelerator** — நிர்வாக போர்டல், Teams ஒருங்கிணைப்பு, மற்றும் PostgreSQL/Cosmos DB விருப்பங்களைக் கொண்ட நிறுவன RAG ஆக்சலரேட்டர்
  - **azure-ai-travel-agents** — .NET, Python, Java, மற்றும் TypeScript-இல் சேவக்களைக் கொண்ட பல-அந்தஸ்து MCP ஒருங்கிணைப்பு குறிப்பு செயலி
  - **azd-ai-starter** — குறைந்தபட்ச Azure AI கட்டமைப்பு Bicep starter டெம்ப்ளேட்
  - **🔗 Awesome AZD AI Gallery link** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ டெம்ப்ளேட்டுகள்) என்ற குறிப்புக்கு தொடர்பு

#### Fixed
- **🔗 agents.md வழிசெலுத்தல்**: Previous/Next இணைப்புகள் இப்போது Chapter 2 README பாட வரிசையைப் பொருத்தமாக சென்று கொள்கின்றன (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md போதுமில்லாத இணைப்புகள்**: `production-ai-practices.md` ஐ `../chapter-08-production/production-ai-practices.md` என்று சரிசெய்தது (3 இடங்களில்)
- **📦 agents.md பழைய குறியீடு**: `opencensus` ஐ `azure-monitor-opentelemetry` + OpenTelemetry SDK என மாற்றியது
- **🐛 agents.md தவறான API**: `max_tokens` ஐ `create_agent()` இருந்து `create_run()`க்கு `max_completion_tokens` என நகர்த்தியது
- **🔢 agents.md டோக்கன் எண்ணிக்கை**: வாயமாய் இருந்த `len//4` மதிப்பீட்டை `tiktoken.encoding_for_model()` உடன் மாற்றியது
- **azure-search-openai-demo**: சேவைகள் வர்ணனையை "Cognitive Search + App Service" என்பதிலிருந்து "Azure AI Search + Azure Container Apps" ஆக திருத்தியது (இயல்பு ஹோஸ்ட் அக்டோபர் 2024-இல் மாற்றப்பட்டது)
- **contoso-chat**: விளக்கத்தை Azure AI Foundry + Prompty-ஐ குறிப்பிடுவதற்கு புதுப்பித்தது, இது repo-வின் உண்மையான தலைப்பு மற்றும் தொழில்நுட்ப ஸ்டேக்கை பொருந்தும்

#### Removed
- **ai-document-processing**: செயலிழந்த டெம்ப்ளேட் குறிப்பு நீக்கப்பட்டது (repo பொதுமக்களுக்கு கிடைப்பதல்ல)

#### Improved
- **📝 agents.md பயிற்சிகள்**: பயிற்சி 1 இப்போது எதிர்பார்க்கப்படும் வெளியீட்டு மற்றும் `azd monitor` படியை காட்டுகிறது; பயிற்சி 2 முழு `FunctionTool` பதிவு குறியீட்டை கொண்டுள்ளது; பயிற்சி 3 மங்கலான வழிகாட்டுதலை `prepdocs.py` கட்டளைகளால் மாற்றியது
- **📚 agents.md வளங்கள்**: ஆவண இணைப்புகளை தற்போதைய Azure AI Agent Service ஆவணங்கள் மற்றும் குவிக்ஸ்டார்ட்-க்கு புதுப்பித்தது
- **📋 agents.md Next Steps அட்டவணை**: முழுமையான அத்தியாயக் கவர்அவண்டும் AI Workshop Lab இணைப்பைச் சேர்த்தது

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
#### பாடநெறி வழிசெலுத்தல் மேம்பாடு
**இந்த பதிப்பு README.md அத்தியாய வழிசெலுத்தலை அதிகமாகச் சரிசெய்து, மேம்படுத்தப்பட்ட அட்டவணை வடிவத்தைச் சேர்க்கிறது.**

#### மாற்றப்பட்டது
- **பாடநெறி வரைபட அட்டவணை**: நேரடி பாட இணைப்புகள், கால அளவைக் கணக்கீடுகள் மற்றும் சிக்கலான தன்மை மதிப்பீடுகளுடன் மேம்படுத்தப்பட்டது
- **கோப்பு அடைவுகள் சுத்தம்**: தேவையற்ற பழைய அடைவுகள் (deployment/, getting-started/, pre-deployment/, troubleshooting/) நீக்கப்பட்டன
- **இணைப்பு மதிப்பீடு**: பாடநெறி வரைபட அட்டவணையில் உள்ள 21+ உள்ளக இணைப்புகள் அனைத்தும் சரிபர்க்கப்பட்டன

### [v3.16.0] - 2026-02-05

#### தயாரிப்பு பெயர் புதுப்பிப்புகள்
**இந்த பதிப்பு தயாரிப்பு குறிப்புகளை தற்போதைய Microsoft பிராண்டிங் படி புதுப்பிக்கிறது.**

#### மாற்றப்பட்டது
- **Microsoft Foundry → Microsoft Foundry**: மொழிபெயர்ப்பு செய்யப்படாத கோப்புகளில் அனைத்து குறிப்புகளும் புதுப்பிக்கப்பட்டன
- **Azure AI Agent Service → Foundry Agents**: சேவை பெயர் தற்போது பிராண்டிங் பிரதிபலிக்க மாற்றப்பட்டுள்ளது

#### கோப்புகள் புதுப்பிக்கப்பட்டன
- `README.md` - முதன்மை பாடநெறி தொடக்கப் பக்கம்
- `changelog.md` - பதிப்பு வரலாறு
- `course-outline.md` - பாடநெறி அமைப்பு
- `docs/chapter-02-ai-development/agents.md` - AI ஏஜென்டுகள் வழிகாட்டி
- `examples/README.md` - உதாரணங்கள் ஆவணம்
- `workshop/README.md` - பணிமனை தொடக்கப் பக்கம்
- `workshop/docs/index.md` - பணிமனை குறிப்பு
- `workshop/docs/instructions/*.md` - அனைத்து பணிமனை வழிமுறைக் கோப்புகளும்

---

### [v3.15.0] - 2026-02-05

#### முக்கிய நிரல்தள மறமைப்பு: அத்தியாய அடிப்படையிலான அடைவு பெயர்கள்
**இந்த பதிப்பு ஆவணத்தை தெளிவான வழிசெலுத்தலுக்கு ஒதுக்கப்பட்ட அத்தியாய அடைவுகளாக மறமைக்கிறது.**

#### அடைவு பெயர்கள் மாற்றப்பட்டன
பழைய அடைவுகள் அத்தியாய-எண் அடைவுகளால் மாற்றப்பட்டன:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| File | From | To |
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
- **📚 அத்தியாய README கோப்புகள்**: ஒவ்வொரு அத்தியாய அடைவிலும் README.md உருவாக்கப்பட்டது, இதில்:
  - கற்றல் இலக்குகள் மற்றும் காலம்
  - விளக்கங்களுடன் பாட அட்டவணை
  - விரைவான தொடக்கம் கட்டளைகள்
  - பிற அத்தியாயங்களுக்கு வழிசெலுத்தல்

#### மாற்றப்பட்டது
- **🔗 அனைத்து உள்ளக இணைப்புகளும் புதுப்பிக்கப்பட்டன**: 78+ பாதைகள் அனைத்து ஆவண கோப்புகளிலும் புதுப்பிக்கப்பட்டன
- **🗺️ முதன்மை README.md**: புதிய அத்தியாய அமைப்புடன் பாடநெறி வரைபடம் புதுப்பிக்கப்பட்டது
- **📝 examples/README.md**: அத்தியாய அடைவுகளுக்கு குறுக்கு-சுட்டுகள் புதுப்பிக்கப்பட்டன

#### நீக்கப்பட்டது
- பழைய அடைவு அமைப்பு (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### நிரல்தள மறமைப்பு: அத்தியாய வழிசெலுத்தல்
**இந்த பதிப்பு அத்தியாய வழிசெலுத்தல் README கோப்புகளைச் சேர்த்தது (v3.15.0 மூலம் ஒத்திசைக்கப்பட்டது).**

---

### [v3.13.0] - 2026-02-05

#### புதிய AI ஏஜென்டுகள் வழிகாட்டி
**இந்த பதிப்பு Azure Developer CLI-ஐப் பயன்படுத்தி AI ஏஜென்டுகளை அமைப்பதற்கான விரிவான வழிகாட்டியைக் கூட்டுகிறது.**

#### சேர்க்கப்பட்டது
- **🤖 docs/microsoft-foundry/agents.md**: இதன் முழுமையான வழிகாட்டி இதில் உள்ளடக்கப்படுகின்றன:
  - AI ஏஜென்ட்கள் என்ன என்பதையும் அவை சாட்பாட்களிலிருந்து எப்படி வேறுபடுகின்றன என்பதையும்
  - மூன்று விரைவான தொடக்கம் ஏஜென்ட் வார்ப்புருக்கள் (Foundry Agents, Prompty, RAG)
  - ஏஜென்ட் நெறியியல் வடிவமைப்பு முறைமைகள் (ஒரே ஏஜென்ட், RAG, பல-ஏஜென்ட்)
  - கருவி அமைப்பும் தனிப்பயனாக்கமும்
  - கண்காணிப்பு மற்றும் அளவுகோல் கண்காணித்தல்
  - செலவு பற்றிய பரிசீலனைகள் மற்றும் சிறப்பாக்கம்
  - பொதுவான பிழை தீர்க்கும் நிலைமைகள்
  - வெற்றிக்கான மதிப்பீடுகளுடன் மூன்று கைமுறை பயிற்சிகள்

#### உள்ளடக்க அமைப்பு
- **அறிமுகம்**: தொடக்க நிலை பயிலாளர்களுக்கான ஏஜென்ட் கருத்துக்கள்
- **விரைவு தொடக்கம்**: `azd init --template get-started-with-ai-agents` மூலம் ஏஜென்டுகளை நிறுவவும்
- **வடிவமைப்பு முறைமைகள்**: ஏஜென்ட் முறைமைகளின் காட்சி வரைபடங்கள்
- **அமைப்பு**: கருவி அமைப்பும் சுற்றுச்சூழல் மாறிலிகளும்
- **கண்காணிப்பு**: Application Insights ஒருங்கிணைப்பு
- **பயிற்சிகள்**: முறையாக முன்னேறும் கைமுறை கற்றல் (ஒவ்வொன்றும் 20-45 நிமிடம்)

---

### [v3.12.0] - 2026-02-05

#### DevContainer சுற்றுச்சூழல் புதுப்பிப்பு
**இந்த பதிப்பு AZD கற்கும் அனுபவத்திற்காக நவீன கருவிகள் மற்றும் சிறந்த இயல்புகளுடன் DevContainer கட்டமைப்பை புதுப்பிக்கிறது.**

#### மாற்றப்பட்டது
- **🐳 அடிப்படை படிமம்**: Updated from `python:3.12-bullseye` to `python:3.12-bookworm` (latest Debian stable)
- **📛 கன்டெய்னர் பெயர்**: தெளிவுக்காக "Python 3" என்பதிலிருந்து "AZD for Beginners" ஆக பெயரிடப்பட்டது

#### சேர்க்கப்பட்டது
- **🔧 புதிய Dev Container அம்சங்கள்**:
  - `azure-cli` Bicep ஆதரவு செயல்படுத்தப்பட்டுள்ளது
  - `node:20` (AZD வார்ப்புருக்களுக்கு LTS பதிப்பு)
  - `github-cli` வார்ப்புரு மேலாண்மைக்காக
  - `docker-in-docker` கன்டெய்னர் செயலி பரவலாக்கங்களுக்கு

- **🔌 போர்ட் முன்னமைப்பு**: பொதுவான வளர்ச்சிக்கான முன்கட்டமைக்கப்பட்ட போர்ட்கள்:
  - 8000 (MkDocs முன்னோட்டம்)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 புதிய VS Code நீட்டிப்புகள்**:
  - `ms-python.vscode-pylance` - மேம்படுத்திய Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions ஆதரவு
  - `ms-azuretools.vscode-docker` - Docker ஆதரவு
  - `ms-azuretools.vscode-bicep` - Bicep மொழி ஆதரவு
  - `ms-azure-devtools.azure-resource-groups` - Azure வள நிர்வாகம்
  - `yzhang.markdown-all-in-one` - Markdown தொகுத்தல்
  - `DavidAnson.vscode-markdownlint` - Markdown பிழை சரிபார்ப்பு
  - `bierner.markdown-mermaid` - Mermaid வரைபட ஆதரவு
  - `redhat.vscode-yaml` - YAML ஆதரவு (azure.yaml க்கு)
  - `eamodio.gitlens` - Git காட்சி
  - `mhutchie.git-graph` - Git வரலாறு

- **⚙️ VS Code அமைப்புகள்**: Python interpreter, சேமிக்கும்போது வடிவமைப்பு, மற்றும் வெற்று இடங்களை அகற்றுவது போன்ற முன்னிடை அமைப்புகள் சேர்த்தன

- **📦 requirements-dev.txt புதுப்பிக்கப்பட்டது**:
  - MkDocs minify plugin சேர்க்கப்பட்டது
  - code quality க்கான pre-commit சேர்க்கப்பட்டது
  - Azure SDK பக்கேஜ்கள் சேர்க்கப்பட்டன (azure-identity, azure-mgmt-resource)

#### திருத்தப்பட்டது
- **Post-Create கட்டளை**: இனி கன்டெய்னர் தொடக்கத்தில் AZD மற்றும் Azure CLI நிறுவல் சரிபார்க்கிறது

---

### [v3.11.0] - 2026-02-05

#### ஆரம்ப நிலை பயனர்களுக்கான README முழுமையாக்கம்
**இந்த பதிப்பு README.md ஐ ஆரம்ப நிலை பயனர்களுக்கு எளிதாக அணுகக்கூடியதாக பெரிதாக மேம்படுத்துகிறது மற்றும் AI டெவலப்பர்களுக்கான முக்கிய வளங்களை சேர்க்கிறது.**

#### சேர்க்கப்பட்டது
- **🆚 Azure CLI vs AZD ஒப்பீடு**: ஒவ்வொரு கருவியையும் எப்போது பயன்படுத்த வேண்டும் என்பதற்கான தெளிவான விளக்கம் மற்றும் நடைமுறை உதாரணங்கள்
- **🌟 அருமையான AZD இணைப்புகள்**: சமுதாய வார்ப்புரு காட்சிப்பக்கம் மற்றும் பங்களிப்பு வளங்களுக்கு நேரடி இணைப்புகள்:
  - [அற்புத AZD கேலரி](https://azure.github.io/awesome-azd/) - 200+ உடன் உடனேயே நிறுவக்கூடிய வார்ப்புருக்கள்
  - [ஒரு வார்ப்புரு சமர்ப்பிக்கவும்](https://github.com/Azure/awesome-azd/issues) - சமுதாய பங்களிப்பு
- **🎯 விரைவு தொடக்கக் கையேடு**: எளிமைப்படுத்தப்பட்ட 3 படி தொடக்க பகுதி (Install → Login → Deploy)
- **📊 அனுபவம்தொடர்பான வழிசெலுத்தல் அட்டவணை**: டெவலப்பரின் அனுபவத்தின் அடிப்படையில் எங்கே தொடங்குவது என்பதைப் பற்றிய தெளிவான வழிகாட்டு

#### மாற்றம்
- **README அமைப்பு**: படிப்படியாக வெளியிடுவதற்காக மறுசீரமைக்கப்பட்டது - முக்கிய தகவல்கள் முதலில்
- **அறிமுக பகுதி**: முழு ஆரம்பர்களுக்காக "The Magic of `azd up`" ஐ விளக்குவதற்காக மறுஅடி எழுதப்பட்டது
- **பிரதி உள்ளடக்கம் நீக்கப்பட்டது**: பிரதிபலிக்கும் பிழை தீர்க்கும் பகுதியை நீக்கியது
- **பிழை தீர்க்கும் கட்டளைகள்**: தவறான `azd logs` குறிப்பு சரியான `azd monitor --logs`-ஐ பயன்படுத்த하도록 திருத்தப்பட்டது

#### திருத்தப்பட்டது
- **🔐 அங்கீகார கட்டளைகள்**: `azd auth login` மற்றும் `azd auth logout` cheat-sheet.md இல் சேர்க்கப்பட்டன
- **தவறான கட்டளை குறிப்புகள்**: README பிழைத் தண்டு பகுதியில் உள்ள மீதமுள்ள `azd logs` நீக்கப்பட்டது

#### குறிப்பு
- **Scope**: Changes applied to main README.md and resources/cheat-sheet.md
- **Target Audience**: Improvements specifically aimed at developers new to AZD

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI கட்டளை துல்லியத் திருத்தம்
**இந்த பதிப்பு ஆவணங்களில் காணப்படும் இல்லாத AZD கட்டளைகளை திருத்துகிறது, மற்றும் அனைத்து குறியீடு உதாரணங்களும் செல்லுபடியான Azure Developer CLI இலக்கணத்தைப் பயன்படுத்துவதை உறுதி செய்கிறது.**

#### திருத்தப்பட்டது
- **🔧 காணப்படாத AZD கட்டளைகள் நீக்கப்பட்டன**: செல்லாத கட்டளைகள் குறித்து முழுமையான ஆய்வு மற்றும் திருத்தம்:
  - `azd logs` (இல்லை) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (don't exist) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (don't exist) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → removed
  - `azd provision --what-if/--rollback` flags (don't exist) → updated to use `--preview`
  - `azd config validate` (doesn't exist) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (don't exist) → removed

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

#### மாற்றம்
- **Rollback Strategies**: Updated documentation to use Git-based rollback (AZD doesn't have native rollback)
- **Log Viewing**: Replaced `azd logs` references with `azd monitor --logs`, `azd monitor --live`, and Azure CLI commands
- **Performance Section**: Removed non-existent parallel/incremental deployment flags, provided valid alternatives

#### தொழில்நுட்ப விவரங்கள்
- **செயல்படும் AZD கட்டளைகள்**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **செல்லுபடியான azd monitor கொடிகள்**: `--live`, `--logs`, `--overview`
- **நீக்கப்பட்ட அம்சங்கள்**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### குறிப்புகள்
- **சரிபார்ப்பு**: Commands validated against Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### பணிமனை நிறைவு மற்றும் ஆவண தரம் மேம்பாடு
**இந்த பதிப்பு இடைமுகமான பணிமனை தொகுதிகளை நிறைவு செய்து, உடைந்த அனைத்து ஆவண இணைப்புகளையும் சரி செய்து, Microsoft AZD பயன்படுத்தும் AI டெவலப்பர்களுக்கான மொத்த உள்ளடக்கத் தரத்தை மேம்படுத்துகிறது.**

#### சேர்க்கப்பட்டது
- **📝 CONTRIBUTING.md**: புதிய பங்களிப்பு வழிகாட்டுதல்களை உள்ளடக்கிய ஆவணம்:
  - பிரச்சினைகள் அறிக்கையிடுவதற்கு மற்றும் மாற்றங்களை பரிந்துரைக்க தெளிவான வழிமுறைகள்
  - புதிய உள்ளடக்கத்திற்கான ஆவணத் தரநிலைகள்
  - குறியீட்டு உதாரணம் வழிகாட்டுதல்கள் மற்றும் கமிட் செய்தி ஒழுங்குகள்
  - சமூக நலனில் பங்கேற்பு தகவல்

#### முடிக்கப்பட்டவை
- **🎯 Workshop Module 7 (Wrap-up)**: முழுமையாக முடிக்கப்பட்ட புக்கோல் தொகுப்புடன்:
  - பணிமுறை உபதேசங்களின் விரிவான சுருக்கம்
  - AZD, டெம்ப்ளேட் மற்றும் Microsoft Foundry பற்றிய கற்றுக்கொண்ட முக்கியக் கருத்துகள் பகுதி
  - கற்பியல் பயணத்தை தொடரும் பரிந்துரைகள்
  - அலுவலக சவால் பயிற்சிகள் மற்றும் கடினத்தன்மை மதிப்பீடுகள்
  - சமூகப் பின்னூட்டம் மற்றும் ஆதரவு லிங்குகள்

- **📚 Workshop Module 3 (Deconstruct)**: கற்றல் இலக்குகளை புதுப்பிக்கப்பட்டது:
  - GitHub Copilot உடன் MCP சர்வர்கள் செயல்படுத்துவதற்கான வழிகாட்டு
  - AZD டெம்ப்ளேட் கோப்புறை அமைப்பின் பண்புகளைப் புரிந்துகொள்வது
  - இன்ஃப்ராஸ்ட்ரக்சர்-எஸ்-கோட் (Bicep) அமைப்பு முறைமைகள்
  - கைமுறை பயிற்சி வழிமுறைகள்

- **🔧 Workshop Module 6 (Teardown)**: முடிக்கப்பட்டது:
  - வளங்கள் களைத்தல் மற்றும் செலவு மேலாண்மை இலக்குகள்
  - பாதுகாப்பான இன்ஃப்ராஸ்ட்ரக்சர் அகற்றலுக்கு `azd down` பயன்படுத்துதல்
  - மென்மையாக நீக்கப்பட்ட cognitive services களை மீட்டெடுக்கும் வழிகாட்டுதல்
  - GitHub Copilot மற்றும் Azure Portal என்பதற்கான கூடுதல் ஆய்வு உத்தேசங்கள்

#### சரி செய்யப்பட்டவை
- **🔗 உடைந்த லிங்குகள் சரி செய்யப்பட்டன**: 15+ உடைந்த உள்ளக ஆவண இணைப்புகளை தீர்வு செய்தது:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md க்கு பாதைகளை சரி செய்தது
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md மற்றும் production-ai-practices.md பாதைகளை சரி செய்தது
  - `docs/getting-started/first-project.md`: இல்லாத cicd-integration.md ஐ deployment-guide.md உடன் பூர்த்தி செய்தது
  - `examples/retail-scenario.md`: FAQ மற்றும் troubleshooting கையேடு பாதைகளை சரி செய்தது
  - `examples/container-app/microservices/README.md`: பாடக்கோப்பு வீடு மற்றும் deployment கையேடு பாதைகளை சரி செய்தது
  - `resources/faq.md` மற்றும் `resources/glossary.md`: AI அத்தியாயத்தின் மேற்குறிப்புகளை புதுப்பித்தது
  - `course-outline.md`: பயிற்சி கோர் கையேடு மற்றும் AI பணிச்சாலைக் குறிப்பு தொடர்புகளை சரி செய்தது

- **📅 பணிமுறை நிலை பலகை**: "Under Construction" இருந்து செயலில் உள்ள பணிமுறை நிலைக்கு புதுப்பிக்கப்பட்டது, February 2026 தேதி குறிப்பிடப்பட்டுள்ளது

- **🔗 பணிமுறை வழிசெலுத்தல்**: workshop README.md இல் lab-1-azd-basics கோப்புறையைக் குறிப்பிட்டு இருந்து காணாதுள்ள இழைப்புகளை சரி செய்தது

#### மாற்றங்கள்
- **Workshop Presentation**: "under construction" எச்சரிப்பை நீக்கி, பணிமுறை இப்போது முடிந்து, பயன்படத் தயாராக உள்ளதாக செய்தது
- **Navigation Consistency**: அனைத்து பணிமுறை தொகுதிகளுக்கும் சரியான தொகுதிகள் மத்தியில் வழிசெலுத்தலை உறுதிப்படுத்தியது
- **Learning Path References**: அத்தியாய கடாத்து குறிப்பு microsoft-foundry பாதைகளை பயன்படுத்துமாறு புதுப்பிக்கப்பட்டது

#### சரிபார்த்தவை
- ✅ அனைத்து ஆங்கில Markdown கோப்புகளுக்கும் உள்ளக இணைப்புகள் செல்லுபடியானவை
- ✅ பணிமுறை தொகுதிகள் 0-7 வரை கற்றல் இலக்குகளுடன் முழுமையாக இருக்கின்றன
- ✅ அத்தியாயங்கள் மற்றும் தொகுதிகள் மத்தியில் வழிசெலுத்தல் சரியாக செயல்படுகின்றது
- ✅ உள்ளடக்கம் Microsoft AZD ஐப் பயன்படுத்தும் AI டெவலப்பர்களுக்கு பொருத்தமானது
- ✅ ஆரம்ப நிலை பயனாளர்களுக்கான மென்மையான மொழி மற்றும் அமைப்பு பராமரிக்கப்பட்டுள்ளது
- ✅ CONTRIBUTING.md சமூக பங்களிப்பாளர்களுக்கு தெளிவான வழிமுறைகளை வழங்குகிறது

#### தொழில்நுட்ப அமல்படுத்தல்
- **Link Validation**: தானியங்கி PowerShell ஸ்கிரிப்ட் அனைத்து .md உள்ளக இணைப்புகளையும் சரிபார்த்தது
- **Content Audit**: பணிமுறை முழுமை மற்றும் ஆரம்பப் பொருத்தத்தை மனித ரீதியிலான பரிசீலனை செய்தது
- **Navigation System**: அத்தியாயங்கள் மற்றும் தொகுதிகள் மத்தியில் நெறிமுறை இணைப்பு அமைப்புகள் ஒன்றுபடுத்தப்பட்டன

#### குறிப்புகள்
- **பரிமாணம்**: மாற்றங்கள் ஆங்கில ஆவணத்தில் மட்டுமே பொருந்தும்
- **மொழிபெயர்ப்புகள்**: மொழிபெயர்ப்பு கோப்புறை புதுப்பிப்புகள் இந்நிருப்பத்தில்லা (தானியங்க மொழிபெயர்ப்பு பின்னர் ஒத்திசைவாக_sync_ செய்யும்)
- **பணிமுறை காலம்**: முழு பணிமுறை இப்போது 3-4 மணித்தியால தொலைவிலான கைமுறை கற்றலை வழங்குகிறது

---

### [v3.8.0] - 2025-11-19

#### மேம்பட்ட ஆவணங்கள்: கண்காணித்தல், பாதுகாப்பு மற்றும் பல-ஏஜென்ட் வடிவமைப்புக்கள்
**இந்த வெளியீடு Application Insights ஒருங்கிணைப்பு, அங்கீகாரப் படிகள் மற்றும் உற்பத்திப் பரிமாற்றங்களுக்கு பல-ஏஜென்ட் ஒருங்கிணைப்பு பற்றி விரிவான உயர்தரம் பாடங்களைச் சேர்க்கின்றது.**

#### சேர்க்கப்பட்டது
- **📊 Application Insights ஒருங்கிணைப்பு பாடம்**: `docs/pre-deployment/application-insights.md`ல்:
  - தானாக வளங்களை provision செய்வதுடன் AZD-பார்வையிடப்பட்ட விநியோகம்
  - Application Insights + Log Analytics க்கான முழு Bicep டெம்ப்ளேட்டுகள்
  - தனிப்பட்ட டெலிமெட்ரி உடைய இயங்கும் Python பயன்பாடுகள் (1,200+ வரிகள்)
  - AI/LLM கண்காணிப்பு வடிவங்கள் (Microsoft Foundry Models டோக்கன்/செலவு கண்காணிப்பு)
  - 6 Mermaid வரைபடங்கள் (வடிவமைப்பு, விநியோக்கமான தடயமிடுதல், டெலிமெட்ரி ஓட்டம்)
  - 3 கைமுறை பயிற்சிகள் (அலெர்டுகள், டாஷ்போர்டுகள், AI கண்காணிப்பு)
  - Kusto வினாவியல் உதாரணங்கள் மற்றும் செலவுத் தாழ்த்தும் மூலோபாயங்கள்
  - நேரடி மெர்றிக் ஸ்ட்ரீமிங் மற்றும் நேரடி டீபக்கிங்
  - தயாரிப்பு-தகுதியான வடிவங்களுடன் 40-50 நிமிடக் கற்றல்நேரம்

- **🔐 அங்கீகாரம் & பாதுகாப்பு வடிவங்கள் பாடம்**: `docs/getting-started/authsecurity.md`ல்:
  - 3 அங்கீகாரம் வடிவங்கள் (connection strings, Key Vault, managed identity)
  - பாதுகாப்பான விரிவாக்கங்களுக்கு முழு Bicep அமைப்புக் டெம்ப்ளேட்டுகள்
  - Node.js பயன்பாடு குறியீடு Azure SDK ஒருங்கிணைப்புடன்
  - 3 முழுமையான பயிற்சிகள் (managed identity இயக்கம், user-assigned identity, Key Vault ரோடேஷன்)
  - பாதுகாப்பு சிறந்த நடைமுறைகள் மற்றும் RBAC அமைப்புகள்
  - சிக்கல் தீர்க்கும் வழிகாட்டு மற்றும் செலவு பகுப்பாய்வு
  - தயாரிப்பு-தகுதி passwordless அங்கீகாரம் வடிவங்கள்

- **🤖 பல-ஏஜென்ட் ஒருங்கிணைப்பு வடிவங்கள் பாடம்**: `docs/pre-deployment/coordination-patterns.md`ல்:
  - 5 ஒருங்கிணைப்பு வடிவங்கள் (தொடரியல், இணை, மரபமைப்பு, நிகழ்வு-இயங்கும், ஒப்புக்கொள்வுக் கருத்து)
  - முழுமையான orchestrator சேவை அமுலாக்கம் (Python/Flask, 1,500+ வரிகள்)
  - 3 சிறப்பு ஏஜென்ட் செயலாக்கங்கள் (Research, Writer, Editor)
  - Service Bus இல் செய்தி வரிசைப்படுத்தல் ஒருங்கிணைப்பு
  - பகிர்ந்துமீட்டும் அமைப்புகளுக்கான Cosmos DB நிலை மேலாண்மை
  - ஏஜென்ட் தொடர்புகளை காண்பிக்கும் 6 Mermaid வரைபடங்கள்
  - 3 மேம்பட்ட பயிற்சிகள் (டைம்அவுட் கையாள்தல், மீண்டும் முயற்சி منطிகம், சுற்று-டைமரியல்)
  - செலவு உட்படியல் ($240-565/மாதம்) மற்றும் சுருக்க மூலோபாயங்கள்
  - கண்காணிக்க Application Insights ஒருங்கிணைப்பு

#### வலுப்படுத்தப்பட்டுள்ளது
- **Pre-deployment அத்தியாயம்**: இப்போது விரிவான கண்காணிப்பு மற்றும் ஒருங்கிணைப்பு வடிவங்களை உட்புகுத்துகிறது
- **Getting Started அத்தியாயம்**: தொழில்முறை அங்கீகாரம் வடிவங்களுடன் மேம்படுத்தப்பட்டது
- **உற்பத்தி-தகுதியான உருவாக்கம்**: பாதுகாப்பு முதல் கண்காணிப்பு வரை முழுமையான கவர்
- **பாடத்திட்டச் சுருக்கம்**: புதிய பாடங்கள் அத்தியாயங்கள் 3 மற்றும் 6 இல் குறிக்கப்பட்டுள்ளன

#### மாற்றம்
- **கற்றல் தொடர்ச்சி**: பாதுகாப்பு மற்றும் கண்காணிப்பு முழுநேரமாக பாடத்திட்டத்தில் இனைத்தல்
- **ஆவண தரம்**: புதிய பாடங்களில் ஒரே மாதிரியான உயர்தர தரங்கள் (95-97%)
- **உற்பத்தி வடிவங்கள்**: நிறுவன பரிமாற்றங்களுக்கு முழுமையான தொடிற்கான கவர்

#### மேம்படுத்தப்பட்டது
- **டெவலப்பர் அனுபவம்**: அபிவிருத்தியில் இருந்து உற்பத்தி கண்காணிப்புக்கான தெளிவான பாதை
- **பாதுகாப்பு தரநிலைகள்**: அங்கீகாரம் மற்றும் ரகசிய மேலாண்மைக்கு தொழில்முறை நடைமுறைகள்
- **கண்காணித்தல்**: AZD உடன் முழுமையான Application Insights ஒருங்கிணைப்பு
- **AI பணிகள்**: Microsoft Foundry Models மற்றும் பல-ஏஜென்ட் அமைப்புகளுக்கான சிறப்பான கண்காணிப்பு

#### சரிபார்க்கப்பட்டது
- ✅ அனைத்து பாடங்களும் முழுமையான செயல்பாட்டு குறியீட்டை (சிற்றுப்பிரமுகங்களல்ல) உள்ளடக்கியவை
- ✅ கற்றலுக்கான காட்டு வரைபடங்கள் (மொத்தம் 19, 3 பாடங்களில்)
- ✅ பயிற்சி வழிமுறைகளுடன் கைமுறை பயிற்சிகள் (மொத்தம் 9)
- ✅ தயாரிப்பு-தகுதி Bicep டெம்ப்ளேட்டுகள் `azd up` மூலம் டெப்லோ செய்யக்கூடியவை
- ✅ செலவு பகுப்பாய்வு மற்றும் சுருக்க மூலோபாயங்கள்
- ✅ சிக்கல் தீர்க்கும் வழிகாட்டிகள் மற்றும் சிறந்த நடைமுறைகள்
- ✅ சரிபார்ப்பு கட்டுப்புள்ளிகள் மற்றும் சரிபார்க்கும் கட்டளைகள்

#### ஆவண மதிப்பீடு முடிவுகள்
- **docs/pre-deployment/application-insights.md**: - விரிவான கண்காணிப்பு வழிகாட்டு
- **docs/getting-started/authsecurity.md**: - தொழில்முறை பாதுகாப்பு முறைமை
- **docs/pre-deployment/coordination-patterns.md**: - மேம்பட்ட பல-ஏஜென்ட் கட்டமைப்புகள்
- **அனைத்து புதிய உள்ளடக்கம்**: - ஒரே மாதிரியான உயர் தரமான நிலைகள்

#### தொழில்நுட்ப அமல்படுத்தல்
- **Application Insights**: Log Analytics + தனிப்பயன் டெலிமெட்ரி + பிரிக்கப்பட்ட தடயமிடுதல்
- **அங்கீகாரம்**: Managed Identity + Key Vault + RBAC வடிவங்கள்
- **பல-ஏஜென்ட்**: Service Bus + Cosmos DB + Container Apps + ஒర్కெஸ்ட்ரேஷன்
- **கண்காணித்தல்**: நேரடி மெர்றிக்ஸ் + Kusto வினாக்கள் + அலெர்டுகள் + டாஷ்போர்டுகள்
- **செலவு மேலாண்மை**: மாதிரியிடை, தக்கவைக்கக் கொள்கைகள், பொருட்களின் கட்டுப்பாடு

### [v3.7.0] - 2025-11-19

#### ஆவண தர மேம்பாடுகள் மற்றும் புதிய Microsoft Foundry Models உதாரணம்
**இந்த வெளியீடு கையெழுத்து ஆவண தரத்தை மேம்படுத்துகிறது மற்றும் gpt-4.1 உரையாடல் இடைமுகத்துடன் Microsoft Foundry Models முழு டெப்லாய்மெண்ட் உதாரணத்தை சேர்க்கிறது.**

#### சேர்க்கப்பட்டது
- **🤖 Microsoft Foundry Models உரையாடல் உதாரணம்**: `examples/azure-openai-chat/` இல் வேலை செய்வதற்கான gpt-4.1 டெப்லாய்மெண்ட்:
  - Microsoft Foundry Models இன் முழுமையான அடித்தள அமைப்பு (gpt-4.1 மாதிரி டெப்லாய்மெண்ட்)
  - உரையாடல் வரலாறுடன் Python கட்டளை வரிசை உரையாடல் இடைமுகம்
  - API விசை பாதுகாப்பிற்காக Key Vault ஒருங்கிணைப்பு
  - டோக்கன் பயன்பாடு கண்காணிப்பு மற்றும் செலவு கணக்கீடு
  - ரேட் அல்மிதி மற்றும் பிழை கையாள்தல்
  - 35-45 நிமிட பேர் டெப்லாய்மெண்ட் கையேடு உடைய விரிவான README
  - 11 தயாரிப்பு-தகுதி கோப்புகள் (Bicep டெம்ப்ளேட்டுகள், Python செயலி, கட்டமைப்பு கோப்புகள்)
- **📚 ஆவண பயிற்சிகள்**: கட்டமைப்பு கையேட்டிற்கு கைமுறை பயிற்சி பயிற்சிகள் சேர்க்கப்பட்டன:
  - பயிற்சி 1: பல-சூழல் கட்டமைப்பு (15 நிமிடம்)
  - பயிற்சி 2: ரகசிய மேலாண்மை பயிற்சி (10 நிமிடம்)
  - தெளிவான வெற்றி критерிகள் மற்றும் சரிபார்ப்பு படிகள்
- **✅ டெப்லாய்மெண்ட் சரிபார்ப்பு**: டெப்லாய்மெண்ட் கையேட்டிற்கு சரிபார்ப்பு பகுதி சேர்க்கப்பட்டது:
  - சுகாதாரச் சோதனை நடைமுறைகள்
  - வெற்றி критерி சரிபார்ப்பு பட்டியல்
  - அனைத்து டெப்லாய்மெண்ட் கட்டளைகளுக்கும் எதிர்பார்த்த வெளியீடுகள்
  - விரைவு சிக்கல் தீர்க்கும் குறிப்புகள்

#### வலுப்படுத்தப்பட்டது
- **examples/README.md**: A-தரத்துக்கு (93%) புதுப்பிக்கப்பட்டது:
  - azure-openai-chat ஐ அனைத்து பொருத்தமான бөлімங்களிலும் சேர்த்தது
  - உள்ளூர் உதாரணக் கணக்கை 3 இல் இருந்து 4 ஆக புதுப்பித்தது
  - AI பயன்பாட்டு உதாரணங்களின் அட்டவணையில் சேர்க்கப்பட்டது
  - இடைநிலை பயனாளர்களுக்கான Quick Start இல் ஒருங்கிணைத்தது
  - Microsoft Foundry டெம்ப்ளேட்ஸ் பகுதிக்கு சேர்த்தது
  - ஒப்பீட்டு அட்டவணை மற்றும் தொழில்நுட்ப கண்டுபிடிப்பு பகுதிகளை புதுப்பித்தது
- **ஆவண தரம்**: docs கோப்பகத்தில் B+ (87%) → A- (92%) காக மேம்படுத்தப்பட்டது:
  - முக்கிய கட்டளைகளுக்கான எதிர்பார்த்த வெளியீடுகளைச் சேர்த்தது
  - கட்டமைப்பு மாற்றங்களுக்கு சரிபார்ப்பு படிகளைச் சேர்த்தது
  - நடைமுறை படிப்பில் பயிற்சி செயல்களை மேம்படுத்தியது

#### மாற்றப்பட்டது
- **கற்றல் தொடர்ச்சி**: இடைநிலை கற்றுக்கொள்ளுவோருக்கு AI உதாரணங்களை சிறப்பாக இணைத்தல்
- **ஆவண அமைப்பு**: தெளிவான முடிவுகளுடன் மேலதிக நடைமுறைகள்
- **சரிபார்ப்பு செயல்முறை**: முக்கிய பணிகளுக்கு தெளிவான வெற்றி критерிகள் சேர்க்கப்பட்டன

#### மேம்படுத்தியது
- **டெவலப்பர் அனுபவம்**: Microsoft Foundry Models டெப்லாய்மெண்ட் தற்போது 35-45 நிமிடங்களில் முடிகிறது (சிக்கலான மாற்றுகளுக்கு 60-90 நிமிடங்களைவிட)
- **செலவு தெளிவுத்தன்மை**: Microsoft Foundry Models உதாரணத்திற்கு தெளிவான செலவு மதிப்பீடுகள் ($50-200/மாதம்)
- **கற்றல் பாதை**: azure-openai-chat மூலம் AI டெவலப்பர்களுக்கு தெளிவு வாய்ந்த நுழைவாயில்
- **ஆவண தரநிலைகள்**: எதிர்பார்க்கப்பட்ட வெளியீடுகள் மற்றும் சரிபார்ப்பு படிகள் ஒருமை

#### சரிபார்க்கப்பட்டது
- ✅ Microsoft Foundry Models உதாரணம் `azd up` உடனுடன் முழுமையாக செயல்படக்கூடியது
- ✅ 11 அமல் கோப்புகள் அனைத்தும் சொந்தமான எச்சத்திரம் சரிபார்க்கப்பட்டவை
- ✅ README அறிவுறுத்தல்கள் உண்மையான டெப்லாய்மெண்ட் அனுபவத்தைப் பொருந்துகின்றன
- ✅ ஆவண இணைப்புகள் 8+ இடங்களில் புதுப்பிக்கப்பட்டன
- ✅ உதாரணங்கள் குறியீடு 4 உள்ளூர் உதாரணங்களை துல்லியமாக பிரதிபலிக்கின்றன
- ✅ அட்டவணைகளில் வேறு நகல் வெளி இணைப்புகள் இல்லை
- ✅ அனைத்து வழிசெலுத்தல் குறிப்பு சரியானவை

#### தொழில்நுட்ப அமல்படுத்தல்
- **Microsoft Foundry Models கட்டமைப்பு**: gpt-4.1 + Key Vault + Container Apps முறை
- **பாதுகாப்பு**: Managed Identity தயார், ரகசியங்கள் Key Vault இல்
- **கண்காணித்தல்**: Application Insights ஒருங்கிணைப்பு
- **செலவு மேலாண்மை**: டோக்கன் கண்காணிப்பு மற்றும் பயன்பாடு சீராக்கம்
- **டெப்லாய்மெண்டு**: முழுமையான அமைப்பிற்கு ஒரு `azd up` கட்டளையை பயன்படுத்துதல்

### [v3.6.0] - 2025-11-19

#### முக்கிய புதுப்பிப்பு: Container App டெப்லாய்மெண்ட் உதாரணங்கள்
**இந்த வெளியீடு Azure Developer CLI (AZD) பயன்படுத்தி தயாரிப்பு-தகுதி கன்டெய்னர் செயலி டெப்லாய்மெண்ட் உதாரணங்களை அறிமுகப்படுத்துகிறது, முழு ஆவணம் மற்றும் கற்றல் பாதையில் ஒருங்கிணைப்பு உடன்.**

#### சேர்க்கப்பட்டது
- **🚀 Container App உதாரணங்கள்**: புதிய உள்ளூர் உதாரணங்கள் `examples/container-app/` இல்:
  - [மாஸ்டர் கையேடு](examples/container-app/README.md): கன்டெய்னர் செய்யப்பட்ட டெப்லாய்மெண்ட்களின் முழு கண்ணோட்டம், விரைவு தொடக்கம், தயாரிப்பு மற்றும் மேம்பட்ட வடிவங்கள்
  - [எளிய Flask API](../../examples/container-app/simple-flask-api): ஆரம்பநிலை நட்பு REST API கட்டமைப்பு, scale-to-zero, ஹெல்த் ப்ரோப்கள், கண்காணித்தல் மற்றும் சிக்கல் தீர்வு
  - [மைக்ரோசெர்வீசஸ் கட்டமைப்பு](../../examples/container-app/microservices): தயாரிப்பு-தகுதி பன்மை சேவை டெப்லாய்மெண்ட் (API கேட்வே, Product, Order, User, Notification), அசிங்க் செய்தி பரிமாற்றம், Service Bus, Cosmos DB, Azure SQL, பிரிக்கப்பட்ட தடயமிடுதல், blue-green/canary டெப்லாய்மெண்ட்
- **சிறந்த நடைமுறைகள்**: கன்டெய்னர் பணிகளுக்கான பாதுகாப்பு, கண்காணித்தல், செலவு சீராக்கம் மற்றும் CI/CD வழிகாட்டுதல்கள்
- **குறியீடு உதாரணங்கள்**: முழுமையான `azure.yaml`, Bicep டெம்ப்ளேட்டுகள் மற்றும் பல மொழி சேவை செயலாக்கம் (Python, Node.js, C#, Go)
- **சோதனை & சிக்கல் தீர்வு**: முடிவிலான சோதனை காட்சிகள், கண்காணிப்பு கட்டளைகள், சிக்கல் தீர்க்கும் வழிகாட்டுதல்

#### மாற்றப்பட்டது
- **README.md**: புதிய கன்டெய்னர் செயலி உதாரணங்களை "Local Examples - Container Applications" பகுதியில் குறிப்பிட்டு புதுப்பித்தது
- **examples/README.md**: கன்டெய்னர் உதாரணங்களை மெய்ப்பிக்கும் வகையில் புதுப்பித்து ஒப்புமை அட்டவணை உள்ளீடுகளைச் சேர்த்தது மற்றும் தொழில்நுட்ப/வாஞ்சனைக் குறிப்புகளை புதுப்பித்தது
- **பாடத் திட்டம் & பயிற்சி கையேடு**: தொடர்புடைய அத்தியாயங்களில் கன்டெய்னர் உதாரணங்கள் மற்றும் டெப்லாய்மெண்ட் வடிவங்களை குறிப்பிடுமாறு புதுப்பித்தது

#### சரிபார்க்கப்பட்டது
- ✅ அனைத்து புதிய உதாரணங்களும் `azd up` மூலம் டெப்லோ செய்யக்கூடியவையாக உள்ளன மற்றும் சிறந்த நடைமுறைகளை பின்பற்றுகின்றன
- ✅ ஆவண குறிச்சொற்கள் மற்றும் வழிசெலுத்தல்கள் புதுப்பிக்கப்பட்டுள்ளன
- ✅ உதாரணங்கள் ஆரம்பநிலை முதல் மேம்பட்ட பகுதிக்கு வரை உள்ள காட்சிகளைக் கொண்டு உள்ளன, தயாரிப்பு மைக்ரோசெர்வீஸ்களை உள்ளடக்கியவை

#### குறிப்பு
- **பரிமாணம்**: ஆங்கில ஆவணம் மற்றும் உதாரணங்கள் மட்டுமே
- **அடுத்த படிகள்**: எதிர்கால வெளியீடுகளில் மேலதிக மேம்பட்ட கன்டெய்னர் வடிவங்கள் மற்றும் CI/CD தானாக்கூட்டல்களை விரிவுபடுத்துவது

### [v3.5.0] - 2025-11-19

#### தயாரிப்பு பெயர் மாற்றம்: Microsoft Foundry
**இந்த வெளியீடு "Microsoft Foundry" என்ற தயாரிப்பு பெயரை அனைத்து ஆங்கில ஆவணங்களில் ஒருங்கிணைந்த முறையில் புதுப்பிக்கிறது, Microsoft இன் அதிகாரப்பூர்வ மறுபெயர்ப்பை பிரதிபலிக்கிறது.**

#### மாற்றம்
- **🔄 தயாரிப்பு பெயர் புதுப்பிப்பு**: முழுமையான பெயர் மாற்றம் "Microsoft Foundry" -> "Microsoft Foundry"
  - ஆங்கில ஆவணங்களில் உள்ள அனைத்து குறிப்புகளையும் புதுப்பித்தது `docs/` கோப்புறையில்
  - கோப்புரை பெயர் மாற்றம்: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - கோப்பு பெயர் மாற்றப்பட்டது: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - மொத்தம்: 23 உள்ளடக்க குறிப்புகள் 7 ஆவண கோப்புகளில் புதுப்பிக்கப்பட்டன

- **📁 கோப்புறை அமைப்பு மாற்றங்கள்**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - அனைத்து குறுக்குபுற குறிப்புகளும் புதிய கோப்புறை அமைப்பை பிரதிபலிக்கும் வகையில் புதுப்பிக்கப்பட்டன
  - நவிகேஷன் இணைப்புகள் அனைத்து ஆவணங்களிலும் சரிபார்க்கப்பட்டன

- **📄 கோப்பு பெயர் மாற்றங்கள்**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - அனைத்து உள்ளக இணைப்புகளும் புதிய கோப்பு பெயரைக் குறிக்க மாற்றப்பட்டன

#### புதுப்பிக்கப்பட்ட கோப்புகள்
- **அத்தியாய ஆவணம்** (7 கோப்புகள்):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 நெவிகேஷன் இணைப்பு புதுப்பிப்புகள்
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 தயாரிப்பு பெயர் குறிப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - ஏற்கனவே Microsoft Foundry ஐப் பயன்படுத்துகிறது (முந்தைய புதுப்பிப்புகள் மூலம்)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 குறிப்புகள் புதுப்பிக்கப்பட்டன (Обзор, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 4 குறுக்குச் சுட்டி இணைப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/getting-started/first-project.md` - 2 அத்தியாய நெவிகேஷன் இணைப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/getting-started/installation.md` - 2 அடுத்த அத்தியாய இணைப்புகள் புதுப்பிக்கப்பட்டன
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 குறிப்புகள் புதுப்பிக்கப்பட்டன (நெவிகேஷன், Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 நெவிகேஷன் இணைப்பு புதுப்பிக்கப்பட்டது
  - `docs/troubleshooting/debugging.md` - 1 நெவிகேஷன் இணைப்பு புதுப்பிக்கப்பட்டது

- **பாடத்திட்ட கட்டமைப்பு கோப்புகள்** (2 கோப்புகள்):
  - `README.md` - 17 குறிப்புகள் புதுப்பிக்கப்பட்டன (பாடநெறி கண்ணோட்டம், அத்தியாய தலைப்புகள், மாதிரிகள் பகுதி, community insights)
  - `course-outline.md` - 14 குறிப்புகள் புதுப்பிக்கப்பட்டன (கண்ணோட்டம், கற்றல் நோக்கங்கள், அத்தியாய வளங்கள்)

#### சரிபார்க்கப்பட்டது
- ✅ ஆங்கில ஆவணங்களில் 'ai-foundry' கோப்புறை பாதை குறிப்புகள் இனங்கூட இல்லை
- ✅ ஆங்கில ஆவணங்களில் 'Microsoft Foundry' தயாரிப்பு பெயர் குறிப்பிடல்கள் இனங்கூட இல்லை
- ✅ புதிய கோப்புறை அமைப்புடன் அனைத்து நெவிகேஷன் இணைப்புகளும் செயல்படுகின்றன
- ✅ கோப்பு மற்றும் கோப்புறை பெயர் மாற்றங்கள் வெற்றிகரமாக நிறைவேற்றப்பட்டன
- ✅ அத்தியாயங்களுக்கிடையிலான குறுக்குத் தொடர்புகள் சரிபார்க்கப்பட்டன

#### குறிப்புகள்
- **களம்**: மாற்றங்கள் `docs/` கோப்புறை உள்ள ஆங்கில ஆவணங்களுக்கு மட்டுமே பொருந்தும்
- **மொழிபெயர்ப்புகள்**: மொழிபெயர்ப்பு கோப்புறைகள் (`translations/`) இந்த பதிப்பில் புதுப்பிக்கப்படவில்லை
- **பயிற்சி**: பயிற்சி பொருட்கள் (`workshop/`) இந்த பதிப்பில் புதுப்பிக்கப்படவில்லை
- **உதாரணங்கள்**: உதாரண கோப்புகள் இன்னும் பழைய பெயரீடுகளை குறிக்கலாம் (வருங்காலப் புதுப்பிப்பில் தீர்க்கப்படும்)
- **வெளிப்புற இணைப்புகள்**: வெளிப்புற URL களும் GitHub சேமிப்பக குறிப்புகளும் மாற்றமின்றி உள்ளன

#### பங்களிப்பாளர்களுக்கான மைக்ரேஷன் கையேடு
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### அடித்தள முன்னோட்டம் மற்றும் சரிபார்ப்பு மேம்பாடுகள்
**இந்த பதிப்பு புதிய Azure Developer CLI முன்னோட்ட அம்சத்திற்கு முழுமையான ஆதரவையும் பயிற்சி பயனர் அனுபவத்தை மேம்படுத்துவதையும் அறிமுகப்படுத்துகிறது.**

#### சேர்க்கப்பட்டது
- **🧪 azd provision --preview அம்ச ஆவணம்**: புதிய அடித்தள முன்னோட்ட திறனைப் பற்றிய முழுமையான கவரேஜ்
  - Cheat sheet இல் கட்டளை சான்று மற்றும் பயன்பாட்டு உதாரணங்கள்
  - வழங்கல் வழிகாட்டியில் ஒருங்கிணைப்பு, பயன்பாட்டு வழக்குகள் மற்றும் நன்மைகள்
  - முன்னணி-அறிக்கைப் சோதனை ஒருங்கிணைப்பு பாதுகாப்பான நிலைக்கு முன் சரிபார்ப்பு
  - பாதுகாப்பு-முதன்மை வழங்கல் நடைமுறைகளுடன் தொடங்குதல் வழிகாட்டி புதுப்பிப்புகள்
- **🚧 பயிற்சி நிலை பட்டை**: பயிற்சி வளர்ச்சி நிலையை குறிக்கும் தொழிற்முறை HTML பட்டை
  - தெளிவான பயனர் தகவலுக்காக கிரேடியன்டு வடிவமைப்பு மற்றும் கட்டுமான குறிகாட்டிகள்
  - வெளிப்படைக்கான கடைசியாக புதுப்பிக்கப்பட்ட காலஅடையாளம்
  - அனைத்து கருவிகளுக்கும் mobiele பதில் வடிவமைப்பு

#### மேம்படுத்தப்பட்டது
- **அடித்தள பாதுகாப்பு**: முன்வெளியீட்டு செயல்பாடு வழங்கல் ஆவணமொட்டில் ஒருங்கிணைக்கப்பட்டது
- **வழங்கלפின்னர் சரிபார்ப்பு**: தானியங்கி ஸ்கிரிப்டுகள் இப்போது அடித்தள முன்னோட்ட சோதனைகளை உள்ளடக்கியுள்ளன
- **டெவலப்பர் வேலையாற்றல்**: சிறந்த நடைமுறையாக preview ஐச் சேர்த்த கட்டளை வரிசைகள் புதுப்பிக்கப்பட்டன
- **பயிற்சி அனுபவம்**: உள்ளடக்க வளர்ச்சியைப் பற்றி பயனாளர்களுக்கு தெளிவான எதிர்பார்ப்புகள் வழங்கப்பட்டன

#### மாற்றப்பட்டது
- **வழங்கல் சிறந்த நடைமுறைகள்**: preview-முதலான வேலைநடைப now பரிந்துரைக்கப்படும் அணுகுமுறை
- **ஆவணப் பிரவேசம்**: கற்றல் செயல்முறையில் அடித்தள சரிபார்ப்பு முன்னதாக நுழைக்கப்பட்டது
- **பயிற்சி வழங்கல்**: தொழிற்முறையான நிலை தகவல்தொடர்பு மற்றும் தெளிவான வளர்ச்சி காலக்கெடு

#### மேம்பட்டவை
- **பாதுகாப்பு-முதன்மை அணுகுமுறை**: வழங்கலுக்கு முன் அடித்தள மாற்றங்களை சரிபார்க்க முடியும்
- **அணி ஒத்துழைப்பு**: விமர்சனம் மற்றும் அங்கீகாரத்திற்காக preview முடிவுகளை பகிரலாம்
- **கட்டண அறிவு**: வழங்குவதற்கு முன் வள செலவுகளை சிறந்த புரிதல்
- **ஆபத்து குறைப்பாடு**: முன்னணி சரிபார்ப்பின் மூலம் வழங்கல் தோல்விகளை குறைத்தல்

#### தொழில்நுட்ப செயல்படுத்தல்
- **பல- ஆவண ஒருங்கிணைப்பு**: preview அம்சம் 4 முக்கிய கோப்புகளில் ஆவணப்படுத்தப்பட்டது
- **கட்டளை மாதிரிகள்**: ஆவணங்களில் ஒற்றுமையான தொழில் இயல் மற்றும் உதாரணங்கள்
- **சிறந்த நடைமுறை ஒருங்கிணைப்பு**: சரிபார்ப்பு பணிகளிலும் ஸ்கிரிப்ட்களிலும் preview உட்படுத்தப்பட்டது
- **காட்சிப்படுத்திய குறியீடுகள்**: புதிய அம்சம் கண்டறிய எளிதாக்கும் CLEAR NEW குறிச்சொற்கள்

#### பயிற்சி அடிப்படை அமைப்பு
- **நிலை தகவல்தொடர்பு**: கிரேடியன் ஸ்டைல்டுடன் தொழிற்முறை HTML பட்டை
- **பயனர் அனுபவம்**: தெளிவான வளர்ச்சி நிலை பயனரை குழப்பத்திலிருந்து காத்திருக்கும்
- **தொழிற்முறை பிரசாரம்அமைப்பு**: விவரக்கூறுகளை காட்டியாக்குவதுடன் கிடைக்கும் நம்பிக்கையை பராமரிக்கிறது
- **காலக்கட்ட வெளிப்படைமைப்பு**: பொறுப்புணர்விற்காக October 2025 கடைசியாக புதுப்பிக்கப்பட்ட காலஅடையாளம்

### [v3.3.0] - 2025-09-24

#### மேம்படுத்தப்பட்ட பயிற்சி பொருட்கள் மற்றும் இணையதள-அடிப்படையிலான இடைமுகக் கற்றல் அனுபவம்
**இந்த பதிப்பு உலாவி-அடிப்படையிலான பயிற்சி வழிகாட்டிகள் மற்றும் கட்டமைக்கப்பட்ட கற்றல் பாதைகளுடன் கூடிய முழுமையான பயிற்சி பொருட்களை அறிமுகப்படுத்துகிறது.**

#### சேர்க்கப்பட்டது
- **🎥 இணையதள-அடிப்படைக் பயிற்சி வழிகாட்டி**: MkDocs முன்னோட்ட திறனுடன் உலாவியில் இயங்கும் பயிற்சி அனுபவம்
- **📝 கட்டமைக்கப்பட்ட பயிற்சி அறிவுறுத்தல்கள்**: கண்டுபிடிப்பிலிருந்து தனிப்பயனாக்கம் வரை 7 படிகள் வழிகாட்டப்பட்ட கற்றல் பாதை
  - 0-Introduction: பயிற்சி கண்ணோட்டம் மற்றும் சாளரம் அமைப்பு
  - 1-Select-AI-Template: மாதிரி கண்டுபிடிப்பு மற்றும் தேர்வு செயல்முறை
  - 2-Validate-AI-Template: வழங்கல் மற்றும் சரிபார்ப்பு நடைமுறைகள்
  - 3-Deconstruct-AI-Template: மாதிரி கட்டமைப்பைப் புரிந்துகொள்வது
  - 4-Configure-AI-Template: கட்டமைப்பு மற்றும் தனிப்பயனாக்கம்
  - 5-Customize-AI-Template: மேம்பட்ட மாற்றங்கள் மற்றும் திருத்தங்கள்
  - 6-Teardown-Infrastructure: சுத்தப்படுத்தல் மற்றும் வள மேலாண்மை
  - 7-Wrap-up: சுருக்கம் மற்றும் அடுத்த படிகள்
- **🛠️ பயிற்சி கருவிகள்**: மேற்பரப்பு கருவறை (Material theme) உடன் MkDocs அமைப்பு மேம்பட்ட கற்றல் அனுபவத்திற்கு
- **🎯 கை-பணிப் பயிற்சி பாதை**: 3-படி செயல்முறை (கண்டுபிடித்தல் → வழங்கல் → தனிப்பயனாக்கம்)
- **📱 GitHub Codespaces ஒருங்கிணைப்பு**: தொடர்ச்சியான மேம்பாடு சூழலை எளிதில் அமைக்க

#### மேம்படுத்தப்பட்டது
- **AI பயிற்சி லேபு**: விரிவான 2-3 மணி நேர கட்டமைக்கப்பட்ட கற்றல் அனுபவத்துடன் நீட்டிக்கப்பட்டது
- **பயிற்சி ஆவணம்**: வழிசெலுத்தல் மற்றும் காட்சி உதவிகளுடன் தொழிற்முறை வடிவமைப்பு
- **கற்றல் முன்னேற்றம்**: மாதிரி தேர்வு முதல் உற்பத்தி வழங்கலுக்கு தெளிவான கட்ட-தொடர்ச்சி வழிகாட்டுதல்
- **டெவலப்பர் அனுபவம்**: ஒருங்கிணைந்த கருவிகள் மூலம் வேலையை எளிமைப்படுத்தல்

#### மேம்பட்டவை
- **யாவும் பயன்பாடாக்கும்**: தேடல், நகலெடு செயல்முறை மற்றும் தீம் மாறுதல் கொண்ட உலாவி-அடிப்படை இடைமுகம்
- **தன்னிச்சையான கற்றல்**: வேறுபட்ட கற்றல் வேகங்களுக்கு உரிய கூறு அமைப்பு
- **நிகழ்திறன்முறை பயன்பாடு**: உண்மையான AI மாதிரி வழங்கல் சூழ்நிலைகளுக்கான நடைமுறைகள்
- **கம்யூனிட்டி ஒருங்கிணைவு**: பயிற்சி ஆதரவு மற்றும் ஒத்துழைப்பிற்கு Discord ஒருங்கிணைப்பு

#### பயிற்சி அம்சங்கள்
- **உள்ளமைந்த தேடல்**: முக்கிய சொல் மற்றும் பாடத்தைக் கண்டுபிடிப்பது விரைவில்
- **கோட் பலகைகள் நகலெடு**: அனைத்து கோட் உதாரணங்களுக்கும் மவுஸ் ஓவரில் நகலெடுக்க வசதி
- **தீம் மாறு**: இருண்ட/ஒளிஉடைமை ஆதரவு
- **காட்சி சொத்துகள்**: மேம்பட்ட புரிதலுக்கு ஸ்கிரீன்‌ஷாட்கள் மற்றும் வரைபடங்கள்
- **உதவி ஒருங்கிணைவு**: சமூக ஆதரவுக்கான நேரடி Discord அணுகல்

### [v3.2.0] - 2025-09-17

#### முக்கிய நெவிகேஷன் மறுசீரமைப்பு மற்றும் அத்தியாய-அடிப்படைக் கற்றல் முறைப் அமைப்பு
**இந்த பதிப்பு முழு தொகுப்பை 8 முன்னேற்றமான கற்றல் அத்தியாயங்களில் மறுசீரமைக்கிறது மற்றும் முழுத்தளம் முழுவதும் மேம்பட்ட நெவிகேஷன் அறிமுகப்படுத்துகிறது.**

#### சேர்க்கப்பட்டது
- **📚 அத்தியாய-அடிப்படைக் கற்றல் முறை**: முழு பாடநெறி 8 முன்னேற்ற அத்தியாயங்களாக மறுசீரமைக்கப்பட்டது
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 முழுமையான நெவிகேஷன் அமைப்பு**: அனைத்து ஆவணங்களிலும் ஒரே மாதிரி தலைப்பு மற்றும் அடிப்பு நெவிகேஷன்
- **🎯 முன்னேற்ற கண்காணிப்பு**: பாடம் முடித்தல் சரிபார்ப்பு பட்டியல் மற்றும் கற்றல் உறுதிப்படுத்தல் முறைமை
- **🗺️ கற்றல் பாதை வழிகாட்டல்**: வெவ்வேறு அனுபவ நிலைகளுக்கும் குறிக்கோள்களுக்கும் தெளிவான நுழைவு புள்ளிகள்
- **🔗 குறுக்குச் சுட்டி நெவிகேஷன்**: தொடர்புடைய அத்தியாயங்கள் மற்றும் முன்னோக்குத் தொடர்புகள் தெளிவாக இணைக்கப்பட்டன

#### மேம்படுத்தப்பட்டது
- **README அமைப்பு**: அத்தியாய-அடிப்படைக் கட்டமைப்புடன் கட்டமைக்கப்பட்ட கற்று தளமாக மாற்றப்பட்டது
- **ஆவண நெவிகேஷன்**: ஒவ்வொரு பக்கமும் இப்போது அத்தியாயக் குரிய நோக்கமும் முன்னேற்ற முறைமையும் காட்டுகிறது
- **மாதிரி ஒழுங்கு**: உதாரணங்கள் மற்றும் மாதிரிகள் பொருத்தமான அத்தியாயங்களுக்கு ஒதுக்கப்பட்டன
- **வள ஒருங்கிணைவு**: Cheat sheets, FAQs மற்றும் படிப்பு வழிகாட்டிகள் தொடர்புடைய அத்தியாயங்களுடன் இணைக்கப்பட்டன
- **பயிற்சி ஒருங்கிணைவு**: கை-பணிப் ஆய்வறைகள் பல அத்தியாயக் கற்றல் நோக்கங்களுடன் ஒப்புமை செய்யப்பட்டன

#### மாற்றப்பட்டது
- **கற்றல் முன்னேற்றம்**: நேரடைந்த ஆவணமிருந்து நெகிழ்வான அத்தியாய-அடிப்படைக் கற்றலுக்கு மாற்றம்
- **கட்டமைப்பு இடம்**: கட்டமைப்பு வழிகாட்டி சிறந்த கற்றல் தரவரிசைக்காக Chapter 3 ஆக நகர்த்தப்பட்டது
- **AI உள்ளடக்கம் ஒருங்கிணைவு**: கற்றல் பயணமொட்டில் AI-சார்ந்த உள்ளடக்கங்களை சிறந்த முறையில் ஒருங்கிணைத்தல்
- **உற்பத்தி உள்ளடக்கம்**: மேம்பட்ட நுட்பங்கள் நிறுவுநடைகளுக்காக Chapter 8 இல் ஒருங்கிணைக்கப்பட்டன

#### மேம்பட்டவை
- **பயனர் அனுபவம்**: தெளிவான நெவிகேஷன் breadcrumbs மற்றும் அத்தியாய முன்னேற்ற குறியீட்டுகள்
- **எல்லாமும் அணுகக்கூடியது**: எளிதில் பயணிக்கக்கூடிய ஒரே மாதிரி நெவிகேஷன்
- **தொழிற்முறை வெளிப்பாடு**: கல்வி மற்றும் நிறுவன பயிற்சிக்கு ஏற்ற பல்கலைக்கழக முறைப்பயன்பாடு
- **கற்றல் திறன்**: மேம்பட்ட ஒழுங்குபடுத்தலால் தொடர்புடைய உள்ளடக்கத்தை தேட சிறுகாலம்

#### தொழில்நுட்ப செயல்படுத்தல்
- **தலைப்பு நெவிகேஷன்**: 40+ ஆவண கோப்புகளில் ஒரே மாதிரி அத்தியாய நெவிகேஷன்
- **அடிக்கோவிய நெவிகேஷன்**: ஒற்றுமையான முன்னேற்ற வழிகாட்டல் மற்றும் அத்தியாய முடிவு குறியீடுகள்
- **குறுக்கெழுத்து இணைப்பு**: தொடர்புடைய கான்செப்டுகளை இணைக்கும் விரிவான உள்ளக இணைப்பு முறை
- **அத்தியாய வரைபடம்**: மாதிரிகள் மற்றும் உதாரணங்கள் கற்றல் நோக்கங்களுடன் தெளிவாக கூடி உள்ளன

#### படிப்பு கையேடு மேம்பாடு
- **📚 முழுமையான கற்றல் நோக்கங்கள்**: 8-அத்தியாய முறைப்போக்குடன் ஒத்திசைக்கப்பட்ட படிப்பு கையேடு மறுசீரமைப்பு
- **🎯 அத்தியாய-அடிப்படைக் மதிப்பீடு**: ஒவ்வொரு அத்தியாயத்திற்கும் குறிப்பிட்ட கற்றல் நோக்கங்கள் மற்றும் நிகழ்ச்சித் பயிற்சிகள்
- **📋 முன்னேற்ற கண்காணிப்பு**: அளவிடக்கூடிய முடிவுகள் மற்றும் நிறைவு சரிபார்ப்புடன் வாராந்திர கற்றல் அட்டவணை
- **❓ மதிப்பீடு கேள்விகள்**: ஒவ்வொரு அத்தியாயத்திற்குமான அறிவு சரிபார்ப்பு கேள்விகள் தொழிற்முறை முடிவுகளுடன்
- **🛠️ நடைமுறைப் பயிற்சிகள்**: உண்மையான வழங்கல் சூழ்நிலைகளுடன் கை-பணிகள்
- **📊 திறன் முன்னேற்றம்**: அடிப்படை கருத்துக்களிலிருந்து நிறுவன அளவுக்கு முன்னேற்றம் மற்றும் தொழில்முன்னேற்றத் திட்டம்
- **🎓 சான்றிதழ் அமைப்பு**: தொழில்முறை வளர்ச்சி முடிவுகள் மற்றும் சமூக அங்கீகாரம்
- **⏱️ காலஅமைப்பு நிர்வாகம்**: மைல்கல்லியல் சரிபார்ப்புகளுடன் கட்டமைக்கப்பட்ட 10-வாரம் கற்றல் திட்டம்

### [v3.1.0] - 2025-09-17

#### மேம்படுத்தப்பட்ட பல-நிகழ் AI தீர்வுகள்
**இந்த பதிப்பு பல-எஜென்ட் சில்லறை தீர்வை எஜென்ட் பெயரிடலை சிறப்பாக்கி ஆவணங்களை மேம்படுத்துகிறது.**

#### மாற்றப்பட்டது
- **Multi-Agent Terminology**: "Cora agent" என்கிற பெயரை retail multi-agent தீர்வில் தெளிவாக விளக்க "Customer agent" ஆக மாற்றப்பட்டது
- **Agent Architecture**: அனைத்து ஆவணங்கள், ARM மாதிரிகள் மற்றும் குறியீடு உதாரணங்கள் ஒரே மாதிரியான "Customer agent" பெயரிடலைப் பயன்படுத்தும் வகையில் புதுப்பிக்கப்பட்டன
- **Configuration Examples**: சரிகையாளன் கட்டமைப்பு மாதிரிகள் நவீனமடைந்து புதிய பெயரிடல் நடைமுறைகளுடன் வழங்கப்பட்டன
- **Documentation Consistency**: அனைத்து குறிப்புகளும் தொழிற்முறை மற்றும் விளக்கமான எஜென்ட் பெயர்களைப் பயன்படுத்துவதில் ஒருமைப்படுத்தப்பட்டன

#### மேம்படுத்தப்பட்டது
- **ARM Template Package**: retail-multiagent-arm-template இல் Customer agent குறிப்புகள் புதுப்பிக்கப்பட்டன
- **Architecture Diagrams**: Mermaid வரைபடங்கள் புதுப்பிக்கப்பட்ட எஜென்ட் பெயரிடலுடன்
- **Code Examples**: Python வகுப்புகள் மற்றும் செயலாக்க உதாரணங்கள் இப்போது CustomerAgent பெயரிடலைப் பயன்படுத்துகின்றன
- **Environment Variables**: அனைத்து வழங்கல் ஸ்கிரிப்டுகளும் CUSTOMER_AGENT_NAME நடைமுறைகளைப் பயன்படுத்த புதுப்பிக்கப்பட்டன

#### மேம்பட்டவை
- **டெவலப்பர் அனுபவம்**: ஆவணங்களில் எஜென்ட் பங்கு மற்றும் பொறுப்புகள் தெளிவாகக் காட்டப்பட்டன
- **உற்பத்தி தயார் நிலை**: நிறுவன நிலை பெயரிடலுடன் சிறந்த ஒத்திசைவு
- **கற்றல் பொருட்கள்**: கல்விப்பயன்பாட்டிற்கு சிறப்பான, மீமோரை அதிகரிக்கும் பெயரிடல்
- **மாதிரி பயன்பாடு**: எஜென்ட் செயல்பாடுகள் மற்றும் வழங்கல் மாதிரிகளை எளிதாக்கியது

#### தொழில்நுட்ப விவரங்கள்
- Mermaid கட்டமைப்பு வரைபடங்களில் CustomerAgent குறிப்புகள் புதுப்பிக்கப்பட்டன
- Python உதாரணங்களில் CoraAgent வகுப்பு பெயர்கள் CustomerAgent ஆக மாற்றப்பட்டன
- ARM மாதிரி JSON கட்டமைப்புகள் "customer" எஜென்ட் வகையைப் பயன்படுத்துமாறு மாற்றப்பட்டன
- மEnvironment மாறிகள் CORA_AGENT_* இருந்து CUSTOMER_AGENT_* முறைமைகளாக மாற்றப்பட்டன
- அனைத்து வழங்கல் கட்டளைகளும் மற்றும் கண்டெய்னர் கட்டமைப்புகளும் புதுப்பிக்கப்பட்டன

### [v3.0.0] - 2025-09-12

#### முக்கிய மாற்றங்கள் - AI டெவலப்பர் கவனம் மற்றும் Microsoft Foundry ஒருங்கிணைவு
**இந்த பதிப்பு கையடக்கக் கோப்பகத்தை முழுமையான AI-கவனம்கூட்டிய கற்றல் வளமாக மாற்றி Microsoft Foundry ஒருங்கிணைப்பைச் சேர்க்கிறது.**

#### சேர்க்கப்பட்டது
- **🤖 AI-முதலில் கற்றல் பாதை**: AI டெவலப்பர்கள் மற்றும் இன்ஜினியர்களுக்கு முன்னுரிமை அளிக்கும் முழுமையான மறுசீரமைப்பு
- **Microsoft Foundry ஒருங்கிணைவு கையேடு**: AZD ஐ Microsoft Foundry சேவைகளுடன் இணைக்கும் வகையில் விரிவான ஆவணங்கள்
- **AI மாடல் வழங்கல் மாதிரிகள்**: மாடல் தேர்வு, கட்டமைப்பு மற்றும் உற்பத்தி வழங்கல் அணுகுமுறைகளை கடந்து விளக்கும் விரிவான வழிகாட்டி
- **AI பணிமனை**: 2-3 மணி நேர கைத்தொழில் பட்டறை, AI பயன்பாடுகளை AZD-இல் deploy செய்யக்கூடிய தீர்வுகளாக மாற்றுவதற்கான பயிற்சி
- **உற்பத்தி AI சிறந்த நடைமுறைகள்**: AI வேலைப்பாடுகளை அளவிடுதல், கண்காணித்தல் மற்றும் பாதுகாக்குவதற்கான நிறுவன-தயார் மாதிரிகள்
- **AI-குறித்த பிழைத் தீர்வு வழிகாட்டி**: Microsoft Foundry மாதிரிகள், Cognitive Services மற்றும் AI ஒப்படைப்பு பிரச்சனைகளுக்கான விரிவான பிழைத் தீர்வு
- **AI வார்ப்புரு கலெக்ஷன்**: கடினத்தன்மை மதிப்பீடுகளுடன் Microsoft Foundry வார்ப்புருக்கள் தேர்ந்தெடுக்கப்பட்ட தொகுப்பு
- **பட்டறை வளங்கள்**: முழுமையான பட்டறை அமைப்பு, கையால் செய்யும் பயிற்சி கூடங்கள் மற்றும் குறிப்பு விளக்கங்கள்

#### மேம்படுத்தப்பட்டது
- **README அமைப்பு**: AI டெவலப்பர்களுக்காக கவனிக்கப்பட்டது; Microsoft Foundry Discord-இலில் இருந்து 45% சமூக ஆர்வத் தரவைக் கருத்தில் கொண்டது
- **கற்றல் பாதைகள்**: மாணவர்கள் மற்றும் DevOps பொறியாளர்களுக்கான பாரம்பரிய பாதைகளுடன் இணைந்து அர்ப்பணிக்கப்பட்ட AI டெவலப்பர் பயணம்
- **வார்ப்புரு பரிந்துரைகள்**: azure-search-openai-demo, contoso-chat, மற்றும் openai-chat-app-quickstart உட்பட தேர்ந்தெடுக்கப்பட்ட AI வார்ப்புருக்கள்
- **சமூக ஒருங்கிணைப்பு**: AI-குறித்த சேனல்களும் விவாதங்களும் கொண்ட மேம்பட்ட Discord சமூக ஆதரவு

#### பாதுகாப்பு & உற்பத்தி மையம்
- **மேலாண்மை அடையாள முறைமைகள்**: AI-குறித்த அங்கீகார மற்றும் பாதுகாப்பு கட்டமைப்புகள்
- **செலவுச் சீரமைப்பு**: AI வேலைப்பாடுகளுக்கான டோக்கன் பயன்பாடு கண்காணிப்பு மற்றும் பட்ஜெட் கட்டுப்பாடுகள்
- **பல பிராந்திய ஒப்படைப்பு**: உலகளாவிய AI பயன்பாட்டை ஒப்படைப்பதற்கான நடைமுறைகள்
- **செயல்திறன் கண்காணித்தல்**: AI-குறித்த மீட்ரிக்ஸ் மற்றும் Application Insights ஒருங்கிணைப்பு

#### ஆவணத் தரம்
- **வரிசையான பாட கட்டமைப்பு**: தொடக்க நிலை முதல் மேம்பட்ட AI ஒப்படைப்பு மாதிரிகள் வரை தர்க்கபூர்வ முன்னேற்றம்
- **சரிபார்க்கப்பட்ட URLகள்**: அனைத்து வெளிப்புற களஞ்சிய இணைப்புகளும் சரிபார்க்கப்பட்டவை மற்றும் அணுகக்கூடியவை
- **முழுமையான குறிப்பு**: அனைத்து உள்ளக ஆவண இணைப்புகளும் சரிபார்க்கப்பட்டு செயல்படும்
- **உற்பத்திக்கு தயாராகும்**: உண்மையான உலக உதாரணங்களுடன் நிறுவன ஒப்படைப்பு மாதிரிகள்

### [v2.0.0] - 2025-09-09

#### முக்கிய மாற்றங்கள் - களஞ்சிய மறுசீரமைப்பு மற்றும் தொழில்முறை மேம்பாடு
**இந்த பதிப்பு களஞ்சிய அமைப்பின் மற்றும் உள்ளடக்க வழங்கலின் குறிப்பிடத்தக்க மறுசீரமைப்பைக் குறிக்கிறது.**

#### சேர்க்கப்பட்டது
- **வரிசையாக அமைந்த கற்றல் கட்டமைப்பு**: அனைத்து ஆவணப் பக்கங்களிலும் இப்போது அறிமுகம், கற்றல் நோக்கங்கள் மற்றும் கற்றல் முடிவுகள் பிரிவுகள் உள்ளன
- **நெவிகேஷன் முறை**: வழிகாட்டும் கற்றல் முன்னேற்றத்திற்காக அனைத்து ஆவணங்களிலும் முந்தைய/அடுத்த பாட இணைப்புகள் சேர்க்கப்பட்டன
- **பயிற்சி வழிகாட்டி**: கற்றல் இலக்குகள், பயிற்சி பயிற்சிகள் மற்றும் மதிப்பீட்டு வளங்களுடன் முழுமையான study-guide.md
- **தொழில்முறை வழங்கல்**: மேம்பட்ட அணுகல் மற்றும் தொழில்முறை தோற்றத்திற்காக அனைத்து எமோஜி ஐகான்களும் அகற்றப்பட்டன
- **மேம்பட்ட உள்ளடக்க கட்டமைப்பு**: கற்றல் வளங்களின் அமைப்பு மற்றும் ஓட்டம் மேம்படுத்தப்பட்டது

#### மாற்றப்பட்டது
- **ஆவண வடிவம்**: ஒரே மாதிரியான கற்றல்-கவனமான கட்டமைப்புடன் அனைத்து ஆவணங்களும் தரநிலையாக்கப்பட்டன
- **நெவிகேஷன் ஓட்டம்**: அனைத்து கற்றல் வளங்களிலும் தர்க்கபூர்வ முன்னேற்றம் அமலாக்கப்பட்டது
- **உள்ளடக்க வழங்கல்**: தெளிவான, தொழில்முறை வடிவமைப்புக்காக அலங்கார கூறுகள் நீக்கப்பட்டன
- **இணைப்பு அமைப்பு**: புதிய நெவிகேஷன் முறைமைக்கு ஆதரவாக அனைத்து உள்ளக இணைப்புகளும் புதுப்பிக்கப்பட்டன

#### மேம்படுத்தப்பட்டது
- **அணுகல் திறன்**: திரை வாசிப்பாளர் இணக்கத்திற்கு எமோஜி சார்புகள் நீக்கப்பட்டன
- **தொழில்முறை தோற்றம்**: நிறுவன கற்றலுக்கு பொருத்தமான சுத்தமான, அகாடமிக் பாணி வழங்கல்
- **கற்றல் அனுபவம்**: ஒவ்வொரு பாடத்திற்கும் தெளிவான இலக்குகள் மற்றும் முடிவுகளுடன் கட்டமைக்கப்பட்ட அணுகுமுறை
- **உள்ளடக்க அமைப்பு**: தொடர்புடைய தலைப்புகளின் இடையே சிறந்த தர்க்கபூர்வ ஓட்டம் மற்றும் இணைப்பு

### [v1.0.0] - 2025-09-09

#### ஆரம்ப வெளியீடு - முழுமையான AZD கற்றல் களஞ்சியம்

#### சேர்க்கப்பட்டது
- **முக்கிய ஆவண அமைப்பு**
  - முழுமையான getting-started கையேடு தொடர்
  - முழுமையான ஒப்படைப்பு மற்றும் வழங்கல் ஆவணங்கள்
  - விரிவான பிழைத் தீர்வு வளங்கள் மற்றும் டீபகிங் வழிகாட்டிகள்
  - ஒப்படைப்பு முன் சரிபார்ப்பு கருவிகள் மற்றும் நடைமுறைகள்

- **தொடக்கம் தொகுதி**
  - AZD அடிப்படைகள்: முக்கிய கருத்து மற்றும் பெயர்ச்சொற்கள்
  - நிறுவல் கையேடு: தளம்-சார்ந்த அமைப்பு அறிவுறுத்தல்கள்
  - கட்டமைப்பு கையேடு: சுற்றுச்சூழல் அமைப்பு மற்றும் அங்கீகாரம்
  - முதல் திட்டப் பயிற்சி: அடுக்கடியாக கைத்தொழில் கற்றல்

- **ஒப்படைப்பு மற்றும் வழங்கல் தொகுதி**
  - ஒப்படைப்பு கையேடு: முழுமையான வேலைப்பாட்டு ஆவணங்கள்
  - வழங்கல் கையேடு: Bicep உடன் Infrastructure as Code
  - உற்பத்தி ஒப்படைப்புகளுக்கான சிறந்த நடைமுறைகள்
  - பல சேவை கட்டமைப்பு மாதிரிகள்

- **ஒப்படைப்பு-முன் சரிபார்ப்பு தொகுதி**
  - திறன் திட்டமிடல்: Azure வளங்களின் கிடைக்குமை சரிபார்ப்பு
  - SKU தேர்வு: சேவை தர நிலைகளுக்கான விரிவான வழிகாட்டி
  - முன்-பரிசோதனை சோதனைகள்: தானியங்கி சரிபார்ப்பு ஸ்கிரிப்டுகள் (PowerShell மற்றும் Bash)
  - செலவு மதிப்பீடு மற்றும் பட்ஜெட் திட்டமிடல் கருவிகள்

- **பிழைத் தீர்வு தொகுதி**
  - பொதுப் பிரச்சனைகள்: அடிக்கடி எதிர்கொள்ளும் பிரச்சனைகள் மற்றும் தீர்வுகள்
  - டீபக் கையேடு: முறைப்படியான பிழைத் தீர்வு முறைமைகள்
  - மேம்பட்ட நோக்குணர்வு முறைகள் மற்றும் கருவிகள்
  - செயல்திறன் கண்காணித்தல் மற்றும் சீரமைப்பு

- **வளங்கள் மற்றும் குறிப்புகள்**
  - கட்டளை சுருக்கப் பட்டியல்: அத்தியாவசிய கட்டளைகளுக்கான விரைவு குறிப்பு
  - ஒகரியம்: விரிவான பெயர்ச்சொற்கள் மற்றும் சுருக்கமொழி வரையறைகள்
  - FAQ: பொதுத் கேள்விகளுக்கான விரிவான பதில்கள்
  - வெளிப்புற வள இணைப்புகள் மற்றும் சமூக இணைவுகள்

- **உதாரணங்கள் மற்றும் வார்ப்புருக்கள்**
  - எளிய இணைய பயன்பாட்டு உதாரணம்
  - நிரந்தர இணையதளம் ஒப்படைப்பு வார்ப்புரு
  - கொண்டெய்னர் பயன்பாட்டு கட்டமைப்பு
  - தரவுத்தளம் ஒருங்கிணைப்பு மாதிரிகள்
  - மைக்ரோசேவைகள் கட்டமைப்பு உதாரணங்கள்
  - சேவையற்ற செயல்பாடுகள் நடைமுறை அமலாக்கங்கள்

#### அம்சங்கள்
- **பல-தளம் ஆதரவு**: Windows, macOS மற்றும் Linux இற்கான நிறுவல் மற்றும் கட்டமைப்பு கையேடுகள்
- **பல திறன் நிலைகள்**: மாணவர்களிலிருந்து தொழில்முறை டெவலப்பர்களுக்கான உள்ளடக்கம்
- **நடைமுறை நோக்கம்**: கைத்தொழில் உதாரணங்கள் மற்றும் உண்மை உலக நிலைச் சூழ்நிலைகள்
- **முழுமையான கவனம்**: அடிப்படை கருத்துக்களிலிருந்து மேம்பட்ட நிறுவனர் மாதிரிகள் வரை
- **பாதுகாப்பு முதன்மை அணுகுமுறை**: பாதுகாப்பு சிறந்த நடைமுறைகள் முழுவதும் ஒருங்கிணைக்கப்பட்டுள்ளன
- **செலவு சீரமைப்பு**: செலவுசார் பயனுள்ள ஒப்படைப்புகள் மற்றும் வள மேலாண்மைக்கான வழிகாட்டி

#### ஆவணத் தரம்
- **விரிவான குறியீட்டு உதாரணங்கள்**: நடைமுறை, சோதிக்கப்பட்ட குறியீடு மாதிரிகள்
- **அடுக்கு அடுக்கான அறிவுறுத்தல்கள்**: தெளிவான, செயற்படுத்தக்கூடிய வழிகாட்டி
- **விரிவான பிழைக் கையாளுதல்**: பொதுப் பிரச்சனைகளுக்கான பிழைத் தீர்வு
- **சிறந்த நடைமுறைகள் ஒருங்கிணைவு**: தொழில் நுட்ப நிலைகள் மற்றும் பரிந்துரைகள்
- **பதிப்பு இணக்கத்தன்மை**: சமீபத்திய Azure சேவைகள் மற்றும் azd அம்சங்களுடன் புதுப்பிக்கப்பட்டது

## எதிர்பார்க்கப்படும் எதிர்கால மேம்பாடுகள்

### பதிப்பு 3.1.0 (திட்டமிடப்பட்டது)
#### AI தளம் விரிவு
- **பன்மாதிரி ஆதரவு**: Hugging Face, Azure Machine Learning மற்றும் தனிப்பயன் மாதிரிகளுக்கான ஒருங்கிணைப்பு மாதிரிகள்
- **AI ஏஜண்ட் கட்டமைப்புகள்**: LangChain, Semantic Kernel மற்றும் AutoGen ஒப்படைப்புகளுக்கான வார்ப்புருக்கள்
- **மேம்பட்ட RAG மாதிரிகள்**: Azure AI Search-ஐ மீறி வெக்டர் தரவுத் தள விருப்பங்கள் (Pinecone, Weaviate, மற்றும் பிற)
- **AI கவனிப்புத்தன்மை**: மாதிரி செயல்திறன், டோக்கன் பயன்பாடு மற்றும் பதில் தரத்திற்கான மேம்பட்ட கண்காணிப்பு

#### டெவலப்பர் அனுபவம்
- **VS Code நீட்டிப்பு**: ஒருங்கிணைந்த AZD + Microsoft Foundry வளர்ச்சி அனுபவம்
- **GitHub Copilot ஒருங்கிணைவு**: AI உதவியுடன் AZD வார்ப்புரு உருவாக்கம்
- **இணையோக்கிய பயிற்சிகள்**: AI சூழ்நிலைகளுக்கான தானியங்கி சரிபார்ப்புடன் கைத்தொழில் கோடிங் பயிற்சிகள்
- **வீடியோ உள்ளடக்கம்**: AI ஒப்படைப்புகளுக்கு கவனமாலான பார்வை படிக்கும் பயனர்களுக்கான கூடுதல் வீடியோ பயிற்சிகள்

### பதிப்பு 4.0.0 (திட்டமிடப்பட்டது)
#### நிறுவன AI மாதிரிகள்
- **ஆளுகை கட்டமைப்பு**: AI மாதிரி ஆளுமை, ஒழுங்குபத்தி மற்றும் ஆடிட் பதிவுகள்
- **பல-கூடப்பட்டு AI**: தனித்த AI சேவைகளுடன் பல வாடிக்கையாளர்களுக்கு சேவை வழங்கும் மாதிரிகள்
- **எட்ஜ் AI ஒப்படைப்பு**: Azure IoT Edge மற்றும் container instance-களுடன் ஒருங்கிணைவு
- **இணை மேகம் AI**: பல-மேகம் மற்றும் ஹைபிரிட் ஒப்படைப்பு மாதிரிகள் AI வேலைப்பாடுகளுக்கு

#### மேம்பட்ட அம்சங்கள்
- **AI குழு தானியக்கமூலம்**: Azure Machine Learning குழுக்களுடன் MLOps ஒருங்கிணைவு
- **மேம்பட்ட பாதுகாப்பு**: Zero-trust முறைமைகள், தனியார் எண்ட்பாயின்டுகள் மற்றும் மேம்பட்ட மிரட்டல் பாதுகாப்பு
- **செயல்திறன் சீரமைப்பு**: உயர்-வினியோக AI பயன்பாடுகளுக்கான மேம்பட்ட நுணுக்கம் மற்றும் அளவீட்டு யுக்திகள்
- **உலகளாவிய பகிர்தல்**: AI பயன்பாடுகளுக்கான உள்ளடக்கம் விநியோகம் மற்றும் எட்ஜ் கேச்சிங் மாதிரிகள்

### பதிப்பு 3.0.0 (திட்டமிடப்பட்டது) - தற்போதைய வெளியீட்டால் மாற்றப்பட்டது
#### பரிந்துரைக்கப்பட்ட சேர்ப்புகள் - இப்போது v3.0.0 இல் அமல்படுத்தப்பட்டவை
- ✅ **AI-மையமிட்ட உள்ளடக்கம்**: விரிவான Microsoft Foundry ஒருங்கிணைவு (முடிந்தது)
- ✅ **இணையோக்கிய பயிற்சிகள்**: கைத்தொழில் AI பட்டறை (முடிந்தது)
- ✅ **மேம்பட்ட பாதுகாப்பு தொகுதி**: AI-குறித்த பாதுகாப்பு மாதிரிகள் (முடிந்தது)
- ✅ **செயல்திறன் சீரமைப்பு**: AI வேலைப்பாடு துலக்குதல் யுக்திகள் (முடிந்தது)

### பதிப்பு 2.1.0 (திட்டமிடப்பட்டது) - பகுதி v3.0.0 இல் அமல்படுத்தப்பட்டது
#### சிறிய மேம்பாடுகள் - சில தற்போதைய வெளியீட்டில் முடிக்கப்பட்டன
- ✅ **கூடுதல் உதாரணங்கள்**: AI-மையமான ஒப்படைப்பு சூழ்நிலைகள் (முடிந்தது)
- ✅ **விரிவான FAQ**: AI-குறித்த கேள்விகள் மற்றும் பிழைத் தீர்வு (முடிந்தது)
- **கருவி ஒருங்கிணைவு**: மேம்பட்ட IDE மற்றும் எடிட்டர் ஒருங்கிணைவு வழிகாட்டிகள்
- ✅ **கண்காணிப்பு விரிவாக்கம்**: AI-குறித்த கண்காணிப்பு மற்றும் எச்சரிக்கை மாதிரிகள் (முடிந்தது)

#### இன்னும் எதிர்கால வெளியீட்டிற்கு திட்டமிடப்பட்டுள்ளது
- **மொபைல்-நட்பான ஆவணங்கள்**: மொபைல் கற்றலுக்கான பதிலளிக்கும் வடிவமைப்பு
- **ஆஃப்லைன் அணுகல்**: பதிவிறக்கக்கூடிய ஆவணப் பேக்கேஜ்கள்
- **மேம்பட்ட IDE ஒருங்கிணைவு**: AZD + AI வேலைநிலைகளுக்கான VS Code நீட்டிப்பு
- **சமூக டாஷ்போர்டு**: நேரடி சமூக அளவுகள் மற்றும் பங்களிப்பு கண்காணிப்பு

## மாற்றப் பதிவில் பங்களிப்பு செய்வது

### மாற்றங்களை அறிக்கை செய்பது
இந்த களஞ்சியத்திற்கு பங்களிக்கும்போது, changelog பதிவுகள் கீழ்காணும் விவரங்களை உள்ளடக்கியதாக இருப்பதை உறுதிசெய்யவும்:

1. **பதிப்பு எண்**: அர்த்தமுள்ள பதிப்பு முறையை பின்பற்றுவது (major.minor.patch)
2. **தேதி**: வெளியீடு அல்லது புதுப்பிப்பு தேதி YYYY-MM-DD வடிவில்
3. **வகை**: சேர்க்கப்பட்டது, மாற்றப்பட்டது, பழையதாக அறிவிக்கப்பட்டவை, நீக்கப்பட்டது, திருத்தப்பட்டது, பாதுகாப்பு
4. **தெளிவான விளக்கம்**: என்ன மாற்றம் ஏற்பட்டது என்பதை சுருக்கமாக விளக்குதல்
5. **பாதிப்பு மதிப்பீடு**: மாற்றங்கள் தற்போதைய பயனாளர்களுக்கு எவ்வாறு பாதிக்கின்றன

### மாற்ற வகைகள்

#### சேர்க்கப்பட்டது
- புதிய அம்சங்கள், ஆவண பிரிவுகள் அல்லது திறன்கள்
- புதிய உதாரணங்கள், வார்ப்புருக்கள் அல்லது கற்றல் வளங்கள்
- கூடுதல் கருவிகள், ஸ்கிரிப்டுகள் அல்லது யூட்டிலிடிகள்

#### மாற்றம்
- உள்ளமைவிலுள்ள செயல்பாடு அல்லது ஆவணத்தில் செய்யப்பட்ட மாற்றங்கள்
- தெளிவு அல்லது துல்லியம் மேம்படுத்தும் புதுப்பிப்புகள்
- உள்ளடக்கத்தின் அல்லது அமைப்பின் மறுசீரமைப்பு

#### பழையதாக அறிவிக்கப்பட்டவை
- படிப்படியாக நீக்கப்பட உள்ள அம்சங்கள் அல்லது அணுகுமுறைகள்
- நீக்கத்திற்காக திட்டமிடப்பட்ட ஆவணப் பிரிவுகள்
- சிறந்த மாற்றுகள் உள்ள முறைகள்

#### நீக்கப்பட்டது
- இனி பொருத்தமில்லாத அம்சங்கள், ஆவணங்கள் அல்லது உதாரணங்கள்
- காலாவதியான தகவல்கள் அல்லது பழையதாக அறிவிக்கப்பட்ட அணுகுமுறைகள்
- மறுகூடுதலான அல்லது ஒருங்கிணைக்கப்பட்ட உள்ளடக்கம்

#### திருத்தப்பட்டது
- ஆவணங்களில் அல்லது குறியீட்டில் உள்ள பிழைகளுக்கான திருத்தங்கள்
- அறிக்கையிடப்பட்ட பிரச்சனைகள் அல்லது சிக்கல்களுக்கு தீர்வு
- துல்லியம் அல்லது செயல்திறனை மேம்படுத்துதல்

#### பாதுகாப்பு
- பாதுகாப்பு தொடர்பான மேம்பாடுகள் அல்லது திருத்தங்கள்
- பாதுகாப்பு சிறந்த நடைமுறைகள் தொடர்பான புதுப்பிப்புகள்
- பாதுகாப்பு பாதுக்காப்பு சிக்கல்களின் தீர்வு

### அர்த்தமுள்ள பதிப்பு வழிகாட்டிகள்

#### பெரிய பதிப்பு (X.0.0)
- பயனரின் நடவடிக்கையை தேவைப்படுத்தும் துணிப்பு மாற்றங்கள்
- உள்ளடக்கம் அல்லது அமைப்பின் முக்கிய மறுசீரமைப்பு
- அடிப்படை அணுகுமுறை அல்லது முறைவிதியை மாற்றும் மாற்றங்கள்

#### சிறிய பதிப்பு (X.Y.0)
- புதிய அம்சங்கள் அல்லது உள்ளடக்கச் சேர்க்கைகள்
- பின்னூர்வ இணக்கத்தன்மையை பராமரிக்கும் மேம்பாடுகள்
- கூடுதல் உதாரணங்கள், கருவிகள் அல்லது வளங்கள்

#### பேட்ச் பதிப்பு (X.Y.Z)
- பிழை திருத்தங்கள் மற்றும் சரிசெய்தல்கள்
- தற்போதைய உள்ளடக்கத்திற்கு சிறு மேம்பாடுகள்
- தெளிவுபடுத்தல்கள் மற்றும் சிறு மேம்பாடுகள்

## சமூகம் கருத்து மற்றும் பரிந்துரைகள்

நாங்கள் இந்த கற்றல் வளத்தை மேம்படுத்த சமூக கருத்துக்களை ஊக்குவிக்கின்றோம்:

### கருத்து வழங்குவது எப்படி
- **GitHub Issues**: பிரச்சனைகளை அறிக்கை செய்யவும் அல்லது மேம்பாடுகளை பரிந்துரைக்கவும் (AI-குறித்த பிரச்சனைகள் வரவேற்கப்படுகின்றன)
- **Discord விவாதங்கள்**: யோசனைகள் பகிரவும் மற்றும் Microsoft Foundry சமூகத்துடன் ஈடுபடவும்
- **Pull Requests**: உள்ளடக்கத்திற்கு நேரடியாக மேம்பாடுகளை வழங்கவும், குறிப்பாக AI வார்ப்புருக்கள் மற்றும் வழிகாட்டிகள்
- **Microsoft Foundry Discord**: AZD + AI விவாதங்களுக்கு #Azure சேனலில் பங்கெடுக்கவும்
- **சமூக பலகைகள்**: பரந்த Azure டெவலப்பர் விவாதங்களில் பங்கு பெறவும்

### கருத்து வகைகள்
- **AI உள்ளடக்கத் துல்லியம்**: AI சேவை ஒருங்கிணைவு மற்றும் ஒப்படைப்பு தகவல்களின் திருத்தங்கள்
- **கற்றல் அனுபவம்**: AI டெவலப்பர் கற்றல் ஓட்டத்தை மேம்படுத்தும் பரிந்துரைகள்
- **காணாமல் போன AI உள்ளடக்கம்**: கூடுதல் AI வார்ப்புருக்கள், மாதிரிகள் அல்லது உதாரணங்களுக்கு கோரிக்கைகள்
- **அணுகல் திறன்**: பல்வேறு கற்றல் தேவைகளுக்கான மேம்பாடுகள்
- **AI கருவி ஒருங்கிணைவு**: சிறந்த AI வளர்ச்சி வேலைப்பாடு ஒருங்கிணைப்புக்கான பரிந்துரைகள்
- **உற்பத்தி AI மாதிரிகள்**: நிறுவன AI ஒப்படைப்பு மாதிரிகளுக்கான கோரிக்கைகள்

### பதிலளிப்பு உறுதிமொழி
- **பிரச்சனை பதில்கள்**: அறிக்கை செய்யப்பட்ட பிரச்சனைகளுக்கு 48 மணி நேரத்திற்குள்
- **அம்ச கோரிக்கைகள்**: ஒரு வாரத்திற்குள் மதிப்பீடு
- **சமூக பங்களிப்புகள்**: ஒரு வாரத்திற்குள் மதிப்பாய்வு
- **பாதுகாப்பு பிரச்சனைகள்**: உடனடி முன்னுரிமை மற்றும் விரைவு பதிலளிப்பு

## பராமரிப்பு அட்டவணை

### வழக்கமான புதுப்பிப்புகள்
- **மாதாந்திர மதிப்பீடுகள்**: உள்ளடக்கத் துல்லியம் மற்றும் இணைப்பு சரிபார்ப்பு
- **காலாண்டு புதுப்பிப்புகள்**: முக்கிய உள்ளடக்கச் சேர்ப்புகள் மற்றும் மேம்பாடுகள்
- **அரை-ஆண்டு மதிப்பீடுகள்**: முழுமையான மறுசீரமைப்பு மற்றும் மேம்பாடு
- **ஆண்டு வெளியீடுகள்**: முக்கிய பதிப்பு புதுப்பிப்புகள் மற்றும் குறிப்பிடத்தக்க மேம்பாடுகள்

### கண்காணிப்பு மற்றும் தரநிலை உறுதி
- **தானியங்கி சோதனை**: குறியீட்டு உதாரணங்கள் மற்றும் இணைப்புகளின் வழக்கமான சரிபார்ப்பு
- **சமூக கருத்து ஒருங்கிணைவு**: பயனர் பரிந்துரைகளின் வழக்கமான சேர்க்கை
- **தொழில்நுட்ப புதுப்பிப்புகள்**: சமீபத்திய Azure சேவைகள் மற்றும் azd வெளியீடுகளுடன் இணக்கம்
- **அணுகல் திறன் ஆய்வுகள்**: உட்புகு வடிவமைப்பு கொள்கைகளுக்கான வழக்கமான மதிப்பாய்வு

## பதிப்பு ஆதரவு கொள்கை

### தற்போதைய பதிப்பு ஆதரவு
- **சமீபத்திய பெரிய பதிப்பு**: வழக்கமான புதுப்பிப்புகளுடன் முழுமையான ஆதரவு
- **முந்தைய பெரிய பதிப்பு**: 12 மாதங்களுக்கு பாதுகாப்பு புதுப்பிப்புகள் மற்றும் முக்கிய திருத்தங்கள்
- **பழைய பதிப்புகள்**: சமூக ஆதரவு மட்டுமே, அதிகாரபூர்வ புதுப்பிப்புகள் இல்லை

### மாற்று வழிகாட்டி
பெரிய பதிப்புகள் வெளியிடப்படும்போது, நாம் வழங்குகிறோம்:
- **மாற்று வழிகாட்டிகள்**: அடுக்கடியாக மாற்று அறிவுறுத்தல்கள்
- **இணக்கத்தன்மை குறிப்பு**: உடைக்கும் மாற்றங்கள் பற்றிய விவரங்கள்
- **கருவி ஆதரவு**: மாற்றத்திற்கு உதவும் ஸ்கிரிப்டுகள் அல்லது கருவிகள்
- **சமூக ஆதரவு**: மாற்று கேள்விகளுக்கான அர்ப்பணிக்கப்பட்ட பலகைகள்

---

**Navigation**
- **முந்தைய பாடம்**: [பயிற்சி வழிகாட்டி](resources/study-guide.md)
- **அடுத்த பாடம்**: திரும்பவும் [முதன்மை README](README.md)

**மேம்படுத்திக்கொள்ளுங்கள்**: புதிய வெளியீடுகள் மற்றும் கற்றல் வளங்களின் முக்கிய புதுப்பிப்புகள் பற்றிய அறிவிப்புகளைப் பெற இந்த களஞ்சியத்தை கவனிக்கவும்.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
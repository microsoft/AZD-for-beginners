# 4. ഒരു ടെംപ്ലേറ്റ് ക്രമീകരിക്കുക

!!! tip "ഈ മോട്യൂളിന്റെ അവസാനം നിങ്ങൾക്ക് സാധ്യമാകുന്നത്"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. യഥാർത്ഥ ടെംപ്ലേറ്റിൽ നിന്ന് തുടങ്ങുക

നിങ്ങൾ ആരംഭിച്ച റിപ്പോസിറ്ററിയിൽ [`azure.yaml` in Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) തുറക്കുക. അപ്പ്സ്ട്രീം ടെംപ്ലേറ്റ് ഈ വർക്ക്‌ഷോപ്പിൽ നിന്ന് സ്വതന്ത്രമായി മാറാം. താഴെയുള്ള **അവലംബം** നവംബർ 4, 2026-ന് പരിശോധിച്ചതാണ്; ഇത് ത completos ഫയലിന് പകരം അല്ല:

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

- `name` AZD പ്രോജക്ട് തിരിച്ചറിയുന്നു; `metadata.template` ടെംപ്ലേറ്റ് പതിപ്പ് രേഖപ്പെടുത്തുന്നു.
- `requiredVersions.azd` ടെംപ്ലേറ്റിന്റെ കുറഞ്ഞതെല്ലാണ്, പഴയ CLI-യിൽ തുടരാനുള്ള ശിപാർശയല്ല. നിലവിലുള്ള പിന്തുണയുള്ള AZD റിലീസ് ഉപയോഗിക്കുക.
- `services` ആപ്ലിക്കേഷൻ ഡിപ്പ്ലോയ്‌മെന്റ് ലക്ഷ്യങ്ങൾ നിർവചിക്കുന്നു. ഈ ടെംപ്ലേറ്റ് അതിന്റെ Python APIയും ഫ്രണ്ട്‌എണ്ടും ഒരു Container Apps സേവനമായി വിന്യസിക്കുന്നു.
- `project` `azure.yaml`-നോട് салыച്ചുള്ളതാണ്.
- `remoteBuild` ഒരു റിമോട്ട് കണ്ടെയ്‌നർ ബിൽഡ് അഭ്യർത്ഥിക്കുന്നു. നിങ്ങളുടെ ഐഡന്റിറ്റി ഇപ്പോഴും ആവശ്യമായ Azure അനുമതികൾക്ക് അർഹമായിരിക്കണം.

ടെംപ്ലേറ്റിലെ Bicep ഫയലുകൾ `infra/`-അടിസ്ഥിതമാണ്, ഇത് മാത്രം അല്ല `services` പട്ടിക, Microsoft Foundry, മോഡൽ ഡിപ്പ്ലോയ്‌മെന്റുകൾ, സ്റ്റോറേജ്, പോലും ഐ Search ല്‍ അടങ്ങിയ വിഭവങ്ങൾ പ്രഖ്യാപിക്കുന്നു.

## 2. ലൈഫ്‌സൈകിൽ ഹുക്കുകൾ മനസ്സിലാക്കുക

ടെംപ്ലേറ്റ് പ്രവർത്തിപ്പിക്കുന്നതിന് മുമ്പ് `hooks` വകുപ്പും അതിൽ സൂചിപ്പിച്ച സ്ക്രിപ്റ്റുകളും പരിശോധിക്കുക. പരിശോധിച്ച പതിപ്പിൽ ഉൾപ്പെടുന്നു:

| ഹുക്ക് | ഉദ്ദേശ്യം | പ്രധാന പെരുമാറ്റം |
|------|---------|--------------------|
| `preup` | ടെംപ്ലേറ്റ് പരിസ്ഥിതി ഇൻപുട്ടുകൾ ശരിയെന്ന് പരിശോധിക്കുക `up` പ്രവൃത്തിപദ്ധതിക്ക് മുമ്പ് | പ്ലാറ്റ്ഫോം-സ്പെസിഫിക് ഷെൽ സ്ക്രിപ്റ്റുകൾ പരാജയം ആണെങ്കിൽ പ്രവൃത്തിപദ്ധതി നിർത്താം |
| `postdeploy` | ആപ്ലിക്കേഷൻ ഡിപ്പ്ലോയ്മെന്റ് കഴിഞ്ഞപ്പോൾ ടെംപ്ലേറ്റ്-സ്പെസിഫിക് സെറ്റപ്പ് നടത്തുക | `continueOnError`യും സ്ക്രിപ്റ്റ് ഔട്ട്പുട്ടും പരിശോധിക്കുക; വിജയകരമായ ഡിപ്പ്ലോയ്‌മെന്റ് എല്ലാ സെറ്റപ്പ് ടാസ്കുകളും വിജയിച്ചതായി ഗ്യാരന്റി അല്ല |

Թ്իս վերսണ դոս **not** կոنتայն տհե ඔլդեռ `postprovision` / `write_env` hook շown ին եառլիեր workshop material. Do not copy hook references to scripts that no longer exist.  

ഹുക്ക് കീകൾ ലൈഫ്‌സൈക്കിള്‍ ഇവന്റുകൾ തിരഞ്ഞെടുക്കുന്നു; `posix`, `windows` പ്ലാറ്റ്ഫോം ഇംപ്ലിമെന്റേഷനുകൾ തിരഞ്ഞെടുക്കുന്നു. `shell`, `run`, `interactive`, மற்றும் `continueOnError` എക്സിക്യൂഷൻ നിയന്ത്രിക്കുന്നു. ഇവ നിങ്ങളുടെ അനുമതികളോടെ പ്രവർത്തിക്കുന്ന എക്സിക്യൂട്ടബിൾ സ്ക്രിപ്റ്റുകളാണ്, അതിനാൽ ഇവയെ അപ്ലിക്കേഷൻ കോഡ് പോലെ തന്നെ പരിശോധിക്കുക.

പൂര്‍ണ്ണമായ ലൈഫ്‌സൈക്കിളിനായി [AZD ഹുക്ക് ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) കാണുക.

## 3. പരിസ്ഥിതി ഇൻപുട്ടുകൾ ഇൻഫ്രാസ്ട്രക്ചറിലേക്ക് ട്രേസ് ചെയ്യുക

Initialized ചെയ്ത സാമ്പിൾ റീപോസിറ്ററിയിൽ നിന്ന് ഈ കമാൻഡുകൾ-run ചെയ്യുക:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

ടെംപ്ലേറ്റ് മിക്കവാറും ഉപയോഗించే പരിസ്ഥിതി വ്യത്യാസങ്ങൾ തിരിച്ചറിയാൻ `infra/main.parameters.json` പരിശോധിക്കുക. `azd env set` ഉപയോഗിച്ച് ആകസ്മികമായി ഒരു പേര് സജ്ജമാക്കുന്നത് ഒരു Azure വിഭവം സ്വയം മാറ്റുന്നതല്ല.

അവലോകനം ചെയ്ത ഡിഫോൾട്ടുകൾ ഉൾപ്പെടുത്തിയിരിക്കുന്നു:

| ഇൻപുട്ട് | ഡിഫോൾട്ട് / ഉദ്ദേശ്യം |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; കൊട്ടേഷൻ യൂണിറ്റുകൾ മോഡലിന്റെയും ഡിപ്പ്ലോയ്മെന്റ് തരം അനുസരിച്ചാണ് |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; ഡേറ്റാ കൈകാര്യം പരിശോധിച്ചിട്ടില്ലെങ്കിൽ അപ്രാപ്തമാക്കി വയ്ക്കുക |

ഇവ സാമ്പിള്‍-പ്രത്യേകമായ ഇന്‍പുര്‍ട്ട് എടുക്കലുകളാണ്, ഗ്ലോബല്‍ AZD ക്രമീകരണങ്ങള്‍ അല്ല. ഒരു മോഡല്‍, SKU, ശേഷി, അല്ലെങ്കില്‍ ലൊക്കേഷന്‍ തിരഞ്ഞെടുക്കുന്നതിന് മുമ്പ് [മോഡല്‍ ഗ അധിഷ്ഠിതമായ പ്രദേശ പിന്തുണ ഡോക്യുമെന്റേഷന്‍](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) եւ നിങ്ങളുടെ സബ്‌സ് ക്രിപ്ഷന്റെ ക്വോട്ട പരിശോധിക്കുക. എല്ലാ ശേഷി ഘടകത്തെയും 1,000 ടോക്കന്‍സ് പ്രതിമിനിറ്റ് എന്ന് വ്യാഖ്യാനിക്കരുത്.

ഒരു വ്യത്യസ്ത ചാറ്റ് മോഡല്‍ തിരഞ്ഞെടുക്കാന്‍, അതിന്റെ പൊരുത്തപ്പെട്ട **പേര്, പതിപ്പ്, ഫോര്‍മാറ്റ്, SKU, ശേഷി ഒരുമിച്ച്** പുതുക്കുക, [സാമ്പിളിന്റെ കസ്റ്റമൈസേഷന്‍ ഗൈഡ്](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md) അനുസരിച്ച്. പേര് മാത്രം മാറ്റിയാൽ പൊരുത്തക്കേടുള്ള പതിപ്പോ വിന്യാസ തരംമോ പുറിപ്പിക്കാം.

## 4. ലാബ്: اختیارമുള്ള തിരയൽ, ട്രേസിംഗ് പ്രവർത്തനം സജീവമാക്കുക

!!! warning "ഈ ക്രമീകരണങ്ങള്‍ ബില്ലാകുന്ന വിഭവങ്ങൾ കൂട്ടിച്ചേർക്കാം"

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

അടിസ്ഥാന സൗകര്യങ്ങളിലെ മാറ്റങ്ങള്‍ പ്രൊവിഷനിംഗ് ആവശ്യമാണ്; `azd deploy` മാത്രം അപ്ലിക്കേഷൻ സേവനങ്ങൾ വിന്യസിക്കുന്നു. തിരയൽ ഇൻഡക്സിംഗ്, പിന്തുണയുള്ള രീക്കവലികൾക്കായി [AI Search ഗൈഡ്](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) പിന്തുടരുക. നിരീക്ഷണത്തിനായി [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md) പിന്തുടരുക.

ആവശ്യമായ സമ്മതം, ആക്സസ് നിയന്ത്രണങ്ങൾ, സൂക്ഷിക്കൽ നയം, എഡിറ്റിംഗ് ഇല്ലാതെ യഥാർത്ഥ ഉപഭോക്തൃ ഡാറ്റയിൽ പ്രമ്പ്റ്റ്/റസ്പോൺസ് ഉള്ളടക്ക പിടുത്തം സജീവമാക്കരുത്.

## 5. നിലവിലുള്ള വിഭവങ്ങളും CI/CD

ഒരു Foundry പ്രോജക്റ്റ് പുനঃഉപയോഗിക്കാൻ, സാമ്പിളിന്റെ [നിലവിലുള്ള-സാധന നിർദ്ദേശങ്ങൾ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) അനുസരിക്കുക. `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` സജ്ജമാക്കുന്നത് വിന്യാസപാത മാറ്റം വരുത്തും; ആ സാഹചര്യത്തിൽ, ടെംപ്ലേറ്റ് നിങ്ങൾക്കായി അപ്ലിക്കേഷൻ ഇൻസൈറ്റുകൾ അല്ലെങ്കിൽ AI സെർച്ച് സൃഷ്ടിക്കുന്നില്ല. ആശ്രിതങ്ങൾ, റോളുകൾ, മോഡൽ വിന്യാസങ്ങൾ എന്നിവ വ്യക്തമാക്കിക്കാണുക.

ഒരു ജനറേറ്റഡ് പൈപ്പ്‍ലൈനിലേക്ക് കടത്തുന്ന മൂല്യങ്ങളെ `pipeline.variables` വിഭാഗം നിയന്ത്രിക്കുന്നു; ഇത് ഒരു രഹസ്യ സംഭരണശാലയല്ലയും ആസ്യൂർ സ്രോതസ്സ് സൃഷ്ടിക്കുന്നതുമല്ല. ആപ്പിൽ മാനേജുചെയ്ത അ Aalഎന്റിറ്റി OIDC ഉപയോഗിച്ച് CI/CD ല് അടിസ്ഥാനമായി ഉപയോഗിക്കുക. AZD പരിസര ഫയലുകൾ വെളിച്ചരൂപത്തിലുള്ളവയാണ്, അവ കമിറ്റ് ചെയ്യരുത്.

AZD വിശ്വാസമുള്ള, പ്രാദേശികമായി തയ്യാറാക്കിയ ഡോട്ട്env ഫയൽ ഇറക്കുമതി ചെയ്യുന്നതിന് പിന്തുണ നൽകുന്നു:

```bash
azd env set --file .env
```

ഇറക്കുമതി ചെയ്യുന്നതിന് മുൻപ് ആ ഫയൽ പരിശോധിക്കുക, രഹസ്യം അടങ്ങിയ പരിസര ഫയലുകൾ പങ്കിടുന്ന ടെർമിനലുകളിൽ അല്ലെങ്കിൽ CI ലോഗുകളിൽ അച്ചടിക്കരുത്.

## 6. നിങ്ങളുടെ മനസ്സിലാക്കലിനെ പരിശോധിക്കുക

- ആപ്ലിക്കേഷൻ വിന്യസിക്കുന്ന `azure.yaml` സേവനം ഏതാണ്?
- നിങ്ങൾ മാറ്റിയ മൂല്യങ്ങളെ ഓരോ ഇൻഫ്രാസ്ട്രക്ചർ പാരാമീറ്ററും എങ്ങനെ ഉപയോഗിക്കുന്നു?
- ഏതെങ്കിലും മാറ്റങ്ങൾക്ക് വിന്യാസം മാത്രം അല്ലാതെ പ്രൊവിഷണിങ്ങും വേണ്ടാതിരുന്നോ?
- തിരഞ്ഞെടുക്കപ്പെട്ട പ്രദേശവും സബ്സ്ക്രിപ്ഷനും മോഡലും ക്വോട്ടയും പിന്തുണച്ചോയി?
- എല്ലാ സെറ്റപ്പ് ഹുക്കുകളും വിജയിച്ചോയി, വിന്യസിച്ച ആപ്ലിക്കേഷനിലെ പെരുമാറ്റം പരിശോധിക്കാൻ കഴിയുന്നുണ്ടോ?

തുടരെ [ഒരു ടെംപ്ലേറ്റ് സ്വീകാര്യമാക്കുക](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# മേധാവിയായ AZD ഡിപ്ലോയ്മെന്റുകൾ - ഡിപ്ലോയ്മെന്റ് ഗൈഡ്

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 4 - ഇൻഫ്രാസ്ട്രക്ചർ എറ്റ് കോഡ് & ഡിപ്ലോയ്മെന്റ്
- **⬅️ മുൻ‌വട്ട അധ്യായം**: [അധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)
- **➡️ അടുത്തത്**: [Provisioning Resources](provisioning.md)
- **🧩 ഇതേ അധ്യായത്തിലുമുണ്ട്**: [നിന്റെ സ്വന്തം ടെംപ്ലേറ്റ് രചന](custom-templates.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 5: മൾട്ടി-ഏജന്റ് AI പരിഹാരങ്ങൾ](../../examples/retail-scenario.md)

## പരിചയം

Azure Developer CLI ഉപയോഗിച്ചുള്ള അപേക്ഷകളുടെ ഡിപ്ലോയ്മെൻറ് അടിസ്ഥാന സിംഗിൾ-കമാൻഡ് ഡിപ്ലോയ്മെന്റുകളിൽ നിന്ന് കസ്റ്റം ഹുക്കുകൾ, ബഹുമുഖ പരിസ്ഥിതികൾ, CI/CD സംയോജനം എന്നിവയുള്ള പുരോഗമന പ്രൊഡക്ഷൻ പരിസരങ്ങളിൽ വരെ നിങ്ങൾ അറിയേണ്ട മുഴുവൻ കാര്യങ്ങളും ഈ സമഗ്ര ഗൈഡ് ഉൾക്കൊള്ളുന്നു. പ്രായോഗിക ഉദാഹരണങ്ങളും മികച്ച പ്രവൃത്തികളും ഉപയോഗിച്ച് ഡിപ്ലോയ്മെന്റ് ജീവിതചക്രം കൈകാര്യം ചെയ്യാൻ വിദഗ്ദ്ധത നേടുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കിയാൽ, നിങ്ങൾക്കുണ്ടാകും:
- Azure Developer CLI ഡിപ്ലോയ്മെന്റ് കമാൻഡുകളും വർക്ക്ഫ്ലോകളും പൂർണ്ണമായി കൈകാര്യം ചെയ്യാൻ
- പ്രൊവിഷനിംഗ് മുതൽ നിരീക്ഷണ വരെയായി പൂർണ ഡിപ്ലോയ്മെന്റ് ജീവിതചക്രം മനസ്സിലാക്കാൻ
- ഡിപ്ലോയ്മെന്റിന് മുമ്പും കഴിഞ്ഞും ഓട്ടോമേഷൻ ഹുക്കുകൾ നടപ്പിലാക്കാൻ
- പരിസ്ഥിതി-പ്രത്യേക പാരാമീറ്ററുകളോടെയുള്ള ബഹു-പരിസ്ഥിതികൾ ക്രമീകരിക്കാൻ
- ബ്ലൂ-ഗ്രീൻ, ക്യാനറി ഡിപ്ലോയ്മെന്റുകൾ ഉൾപ്പെടെയുള്ള പുരോഗമന ഡിപ്ലോയ്മെന്റ് തന്ത്രങ്ങൾ സജ്ജമാക്കാൻ
- azd ഡിപ്ലോയ്മെന്റുകൾ CI/CD പൈപ്പ്ലൈനുകളുമായും ഡെവ്ഓപ്സ് വർക്ക്ഫ്ലോകളുമായും സംയോജിപ്പിക്കാൻ

## പഠന ഫലങ്ങൾ

പൂർത്തിയാക്കിയാൽ, നിങ്ങൾക്ക് കഴിയും:
- azd ഡിപ്ലോയ്മെന്റ് വർക്ക്ഫ്ലോകളെ സ്വതന്ത്രമായി പ്രവർത്തിപ്പിക്കാനും പിഴവ് പരിഹരിക്കാനും
- ഹുക്ക് ഉപയോഗിച്ച് കസ്റ്റം ഡിപ്ലോയ്മെന്റ് ഓട്ടോമേഷൻ ഡിസൈൻ ചെയ്യാനും നടപ്പിലാക്കാനും
- സംരക്ഷണവും നിരീക്ഷണവും ചേരുന്ന പ്രൊഡക്ഷൻ റൊഡി ഡിപ്ലോയ്മെന്റുകൾ ക്രമീകരിക്കാൻ
- സ 복잡മായ മൾട്ടി-പരിസ്ഥിതി ഡിപ്ലോയ്മെന്റ് സേനാരിയോകൾ കൈകാര്യം ചെയ്യാൻ
- ഡിപ്ലോയ്മെന്റ് പ്രകടനം മെച്ചപ്പെടുത്താനും റോള്ബാക്ക് തന്ത്രങ്ങൾ നടപ്പിലാക്കാനും
- azd ഡിപ്ലോയ്മെന്റുകൾ എന്റർപ്രൈസ് ഡെവ്ഓപ്സ് പ്രാക്ടീസുകളിലേക്ക് സംയോജിപ്പിക്കാൻ

## ഡിപ്ലോയ്മെന്റ് അവലോകനം

Azure Developer CLI പല ഡിപ്ലോയ്മെന്റ് കമാൻഡുകളും നൽകുന്നു:
- `azd up` - പൂർണ്ണ വർക്ക്ഫ്ലോ (പ്രൊവിഷൻ + ഡിപ്ലോയ്മെന്റ്)
- `azd provision` - ആസ്യൂർ റിസോഴ്‌സുകൾ സൃഷ്‌ടിക്കൽ/അപ്പ്‌ഡേറ്റ് ചെയ്യുക മാത്രം
- `azd deploy` - അപേക്ഷ കോഡ് മാത്രമേ ഡിപ്ലോയ്മെന്റ് ചെയ്യൂ
- `azd package` - അപേക്ഷകൾ നിർമ്മിച്ച് പാക്കേജ് ചെയ്യുക

## അടിസ്ഥാന ഡിപ്ലോയ്മെന്റ് വർക്ക്ഫ്ലോകൾ

### പൂർണ്ണ ഡിപ്ലോയ്മെന്റ് (azd up)
പുതിയ പ്രോജക്ടുകൾക്ക് ഏറ്റവും സാധാരണമായ വർക്ക്ഫ്ലോ:
```bash
# മുഴുവനും പുതിയതായി വിന്യസിക്കുക
azd up

# പ്രത്യേക അന്തരീക്ഷത്തോടെ വിന്യസിക്കുക
azd up --environment production

# പ്രത്യേക പാരാമീറ്ററുകളുമായി വിന്യസിക്കുക
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ഇൻഫ്രാസ്ട്രക്ചർ മാത്രം ഡിപ്ലോയ്മെന്റ്
നിങ്ങൾക്ക് ആസ്യൂർ റിസോഴ്‌സുകൾ മാത്രമേ അപ്ഡേറ്റ് ചെയ്യേണ്ടത് ഉള്ളപ്പോൾ:
```bash
# ഇൻഫ്രാസ്ട്രക്ചർ സജ്ജമാക്കുക/അപ്‌ഡേറ്റുചെയ്യുക
azd provision

# മാറ്റങ്ങൾ മുൻകൂട്ടി കാണാനായി ഡ്രൈ-റൺ ഉപയോഗിച്ച് സജ്ജമാക്കുക
azd provision --preview

# പ്രത്യേക സേവനങ്ങൾ സജ്ജമാക്കുക
azd provision --service database
```

### കോഡ് മാത്രം ഡിപ്ലോയ്മെന്റ്
വേഗത്തിൽ അപേക്ഷ അപ്ഡേറ്റ് ചെയ്യാൻ:
```bash
# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd deploy

# പ്രതീക്ഷിക്കപ്പെടുന്ന ഔട്ട്പുട്ട്:
# സേവനങ്ങൾ വിന്യസിക്കുന്നു (azd deploy)
# - വെബ്: വിന്യസിക്കുന്നു... 완료
# - API: വിന്യസിക്കുന്നു... 완료
# വിജയം: നിങ്ങളുടെ വിന്യസം 2 മിനിറ്റ് 15 സെക്കൻഡിൽ പൂർത്തിയായി

# നിശ്ചിത സേവനം വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# കസ്റ്റം ബിൽഡ്Arguments ഉപയോഗിച്ച് വിന്യസിക്കുക
azd deploy --service api --build-arg NODE_ENV=production

# വിന്യസം സ്ഥിരീകരിക്കുക
azd show --output json | jq '.services'
```

### ✅ ഡിപ്ലോയ്മെന്റ് പരിശോധന

ഏതെങ്കിലും ഡിപ്ലോയ്മെന്റ് കഴിഞ്ഞ് വിജയത്തിനെ സ്ഥിരീകരിക്കുക:

```bash
# എല്ലാ സർവീസുകളും പ്രവർത്തനക്ഷമമാണോയെന്ന് പരിശോധിക്കുക
azd show

# ഹെൽത്ത് എന്റ്പോയിന്റുകൾ പരിശോധന നടത്തുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# പിശകുകൾ നിരീക്ഷിക്കുക (ഡിഫാൾട്ട് ആയി ബ്രൗസറിൽ തുറക്കും)
azd monitor --logs
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- ✅ എല്ലാ സേവനങ്ങളും "Running" നിലയിലാണെന്ന് കാണിക്കുക
- ✅ ഹെൽത്ത് എണ്ഡ്പോയിന്റുകൾ HTTP 200 തിരിച്ചുനൽകുന്നു
- ✅ കഴിഞ്ഞ 5 മിനിറ്റിലൊരുവരും പിഴവ് ലോഗുകൾ ഇല്ല
- ✅ അപേക്ഷ ടെസ്റ്റ് പ طلبലികൾക്ക് പ്രതികരിക്കുന്നു

## 🏗️ ഡിപ്ലോയ്മെന്റ് പ്രക്രിയ മനസ്സിലാക്കൽ

### ഹുക്കുകൾ പുതിയവരെ? ഇവിടെ തുടങ്ങൂ

**ഹുക്ക്** എന്നാൽ azd, ഡിപ്ലോയ്മെന്റ് പ്രക്രിയയിലുള്ള ഒരു പ്രത്യേക ഘട്ടത്തിൽ—പ്രൊവിഷണിന് മുമ്പും ശേഷവുമോ, കോഡ് ഡിപ്ലോയ്മെന്റിന് മുമ്പും ശേഷവുമോ—സ്വയം പ്രവർത്തിപ്പിക്കുന്ന ഒരു കമാൻഡ് ആണ്. ഈ ഹുക്കുകൾ ഡിപ്ലോയ്മെന്റിനൊപ്പം എപ്പോഴും ഉണ്ടാകുന്ന ചെറിയ ജോലികൾ ഓട്ടോമേഷൻ ചെയ്യാൻ സഹായിക്കുന്നു: ഡാറ്റാബേസ് സീഡ് ചെയ്യൽ, മൈഗ്രേഷനുകൾ നടത്തൽ, ആസറ്റുകൾ നിർമ്മിക്കൽ, ആപ്ലിക്കേഷൻ ലൈവ് പരീക്ഷണം.

| ഹുക്ക് | പ്രവർത്തിക്കുന്നത് എപ്പോൾ | പൊതു ഉപയോഗം |
|------|-----------------|--------------|
| `preprovision` | റിസോഴ്‌സുകൾ സൃഷ്‌ടിക്കുന്നതിന് മുമ്പ് | മുൻ‌അനുബന്ധങ്ങൾ പരിശോധിക്കൽ, റജിസ്ട്രിയിലേക്ക് ലോഗിൻ ചെയ്യുക |
| `postprovision` | റിസോഴ്‌സുകൾ സൃഷ്ടിച്ചതിനു ശേഷം | റിസോഴ്‌സുകൾ ക്രമീകരിക്കൽ, ഡാറ്റാബേസ് സജ്ജമാക്കൽ |
| `predeploy` | കോഡ് ഡിപ്ലോയ്മെന്റിന് മുമ്പ് | ഫ്രണ്ട്-എൻഡ് ആസറ്റുകൾ നിർമ്മിക്കൽ, യൂണിറ്റ് ടെസ്റ്റുകൾ നടത്തുക |
| `postdeploy` | കോഡ് ലൈവായതിന് ശേഷം | ഡാറ്റാബേസ് മൈഗ്രേഷനുകൾ, എന്ത്യ്പോയിന്റ് സ്മോക് ടെസ്റ്റ് നടത്തുക |

ഹുക്കുകൾ നിങ്ങളുടെ `azure.yaml` ൽ സഞ്ചരിക്കുന്നു. ഏറ്റവും ചെറുതായ ഉദാഹരണം ഇതാ—ഡിപ്ലോയ്മെന്റിന് ശേഷം ഒരു സന്ദേശം മാത്രം പ്രിന്റ് ചെയ്യുന്നു:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

അതിനാൽ അടുത്ത തവണ `azd up` ഓടിക്കുമ്പോൾ, സന്ദേശം സ്വയം പ്രിന്റ് ചെയ്യും. ഹുക്ക് മാത്രം തന്നെ, പൂർണ്ണ ഡിപ്ലോയ്മെൻറ് കൂടാതെ, ഓടിക്കാനുമാകും, ഇത് ടെസ്റ്റിംഗിനു മേലുള്ള മികച്ച വിധം ആണ്:

```bash
azd hooks run postdeploy
```

താഴെയുള്ള ഘട്ടങ്ങൾ ഓരോ ഘട്ടത്തിനും യഥാർത്ഥ ഹുക്കുകൾ (മൈഗ്രേഷനുകൾ, ടെസ്റ്റുകൾ, സ്ഥിരീകരണം) കാണിക്കുന്നു.

### ഘട്ടം 1: പ്രീ-പ്രൊവിഷൻ ഹുക്കുകൾ
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### ഘട്ടം 2: ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ്
- ഇൻഫ്രാസ്ട്രകചർ ടെംപ്ലേറ്റുകൾ വായിക്കുക (Bicep/Terraform)
- ആസ്യൂർ റിസോഴ്‌സുകൾ സൃഷ്ടിക്കുക അല്ലെങ്കിൽ അപ്ഡേറ്റ് ചെയ്യുക
- നെറ്റ്‌വർക്ക് സജ്ജീകരണവും സുരക്ഷയും ക്രമീകരിക്കുക
- നിരീക്ഷണവും ലോഗിംഗും സജ്ജമാക്കുക

### ഘട്ടം 3: പോസ്റ്റ്-പ്രൊവിഷൻ ഹുക്കുകൾ
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### ഘട്ടം 4: ആപ്ലിക്കേഷൻ പാക്കേജിംഗ്
- അപേക്ഷ കോഡ് നിർമ്മിക്കുക
- ഡിപ്ലോയ്മെന്റ് ആർട്ടിഫാക്റ്റുകൾ സൃഷ്ടിക്കുക
- ലക്ഷ്യ പ്ലാറ്റ്‌ഫോം (കമ്പാർട്ട്മെന്റുകൾ, ZIP ഫയലുകൾ എന്നിവ) പാക്കേജ് ചെയ്യുക

### ഘട്ടം 5: പ്രീ-ഡിപ്ലോയ്മെന്റ് ഹുക്കുകൾ
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### ഘട്ടം 6: ആപ്ലിക്കേഷൻ ഡിപ്ലോയ്മെന്റ്
- ആസ്യൂർ സേവനങ്ങളിലേക്ക് പാക്കേജുചെയ്‌ത അപേക്ഷകൾ ഡിപ്ലോയ്മെന്റ് ചെയ്യുക
- കോൺഫിഗറേഷൻ സെറ്റിംഗ്‌സ് അപ്ഡേറ്റ് ചെയ്യുക
- സേവനങ്ങൾ ആരംഭിക്കുക / പുനരാരംഭിക്കുക

### ഘട്ടം 7: പോസ്റ്റ്-ഡിപ്ലോയ്മെന്റ് ഹുക്കുകൾ
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

### ഹുക്ക് പിഴവുകൾ കൈകാര്യം ചെയ്യൽ

ഡിഫാൾട്ട് പ്രകാരം, **ഒരു ഹുക്ക് കമാൻഡ് നോൺ-സിറോ കോഡോടെ പുറത്തുവരുമ്പോൾ, azd മുഴുവൻ പ്രവർത്തനം നിർത്തും.** സാധാരണയായി ഇത് നിങ്ങൾക്ക് ആവശ്യമായിരിക്കും—തകരാറുണ്ടായ മൈഗ്രേഷൻ ഡിപ്ലോയ്മെന്റ് തടയണം, തകർന്ന ആപ്പ് അയയ്ക്കരുത്. എന്നാൽ അതിനാൽ ഹുക്കുകൾ ശ്രദ്ധയോടെ എഴുതേണ്ടതാണ്.

**1. പരാജയങ്ങളെ ശക്തവും ഉദ്ദേശപൂർണ്ണവും ആക്കൂ.** ഒരു ഹുക്ക് പരാജയപ്പെടുന്നത് അതിന്റെ അവസാന കമാന്റ് നോൺ-സിറോ എക്സിറ്റ് കോഡ് തിരികെ നൽകുമ്പോഴാണ്. ഷെൽ സ്ക്രിപ്റ്റുകളിൽ, ഹുക്ക് ആദ്യ പരാജയ കമാൻഡിൽ തന്നെ നിർത്താൻ `set -e` ചേർക്കൂ:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. ഹുക്ക് പരാജയപ്പെട്ടാൽ ആസിഡ് നിർത്താതെ തുടരാൻ അനുവദിക്കുക.** നിർബന്ധമല്ലാത്ത ഘട്ടങ്ങൾക്ക് (ഐച്ചിക ക്യാഷ് വോം-അപ്പ്, മികച്ച ശ്രമത്തിൽ അറിയിപ്പ്), `continueOnError: true` സെറ്റ് ചെയ്യുക. azd പരാജയവും ലോഗ് ചെയ്യുകയും തുടരുകയും ചെയ്യും:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. പൂർണ്ണ റണ്ണിനു മുൻപായി ഹുക്കുകൾ വേർതിരിച്ച് ടെസ്റ്റ് ചെയ്യുക.** ഹുക്ക് ഡിബഗ് ചെയ്യാൻ `azd up` ഓടിക്കേണ്ടതില്ല—അതിനെ സങ്കലിതമാക്കാതെ പ്രത്യേകമായി ഓടിച്ച് പെട്ടെന്ന് തിരുത്താം:

```bash
azd hooks run predeploy          # പ്രീഡിപ്ലോയ് ഹുക്ക് മാത്രം 실행 ചെയ്യുന്നു
azd hooks run postdeploy --service api
```

**4. ഓ എസ്-പ്രത്യേക ഷെൽസിന് ശ്രദ്ധിക്കുക.** `shell: pwsh` ഉപയോഗിച്ച ഹുക്ക് ഓടിക്കാൻ പവർഷെൽ ഇൻസ്റ്റാൾ ചെയ്തിരിക്കണം (CI ഏജന്റുകളടക്കം). കൂടുതൽ പോർട്ടബിൾ ആയതിനാൽ `shell: sh` ഉപയോഗിക്കുക, അല്ലെങ്കിൽ `windows`വും `posix`വും ഉൾക്കൊള്ളിച്ച വേറിട്ട വേർഷനുകൾ നൽകുക:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **ഡിബഗ്ഗിംഗ് ടിപ്പ്:** ഏതെങ്കിലും azd കമാൻഡ് `--debug` ഓപ്ഷനുമായി ഓടിച്ച് ആ ഹൂക്കിന്റെ കമാൻഡ് ലൈൻ സൂക്ഷ്മമായി കാണുക, എല്ലാം ഉൾപ്പെടെ ഔട്ട്‌പുട്ടിനെയും — ഹുക്ക് ലൊക്കലിൽ പ്രവർത്തിക്കുന്നതും CI-യിൽ പരാജയപ്പെടുന്നതുമായപ്പോൾ വിലമേറിയതാണ്.

## 🎛️ ഡിപ്ലോയ്മെന്റ് കോൺഫിഗറേഷൻ

### സർവീസ്-പ്രത്യേക ഡിപ്ലോയ്മെന്റ് ക്രമീകരണങ്ങൾ
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### പരിസ്ഥിതി-പ്രത്യേക കോൺഫിഗറേഷൻ
```bash
# വികസന പരിസ്ഥിതി
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# സ്റ്റേജിംഗ് പരിസ്ഥിതി
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ഉത്പാദന പരിസ്ഥിതി
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 പുരോഗമിച്ച ഡിപ്ലോയ്മെന്റ് സേനാരിയോകൾ

### മൾട്ടി-സർവീസ് ആപ്ലിക്കേഷനുകൾ
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### ബ്ലൂ-ഗ്രീൻ ഡിപ്ലോയ്മെന്റുകൾ
```bash
# നീല പരിസരം സൃഷ്ടിക്കുക
azd env new production-blue
azd up --environment production-blue

# നീല പരിസരം പരിശോധന നടത്തുക
./scripts/test-environment.sh production-blue

# ട്രാഫിക് നീലത്തിൽ മാറ്റുക (മാനുവൽ DNS/ലോഡ് ബാലൻസർ അപ്‌ഡേറ്റ്)
./scripts/switch-traffic.sh production-blue

# പച്ച പരിസരം ശുചീകരിക്കുക
azd env select production-green
azd down --force
```

### ക്യാനറി ഡിപ്ലോയ്മെന്റുകൾ
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### സ്റ്റേജ്ഡ് ഡിപ്ലോയ്മെന്റുകൾ
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 കണ്ടെയ്നർ ഡിപ്ലോയ്മെന്റുകൾ

### കണ്ടെയ്നർ ആപ്പ് ഡിപ്ലോയ്മെന്റുകൾ
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### മൾട്ടി-സ്റ്റേജ് ഡോക്കർഫയൽ തരംതിരിക്കൽ
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ പ്രകടനം മെച്ചപ്പെടുത്തൽ

### സർവീസ്-പ്രത്യേക ഡിപ്ലോയ്മെന്റുകൾ
```bash
# വേഗത്തിൽ പുനരാവൃത്തിക്ക് ഒരു പ്രത്യേക സേവനം വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd deploy
```

### ബിൽഡ് ക്യാഷിംഗ്
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### കാര്യക്ഷമ കോഡ് ഡിപ്ലോയ്മെന്റുകൾ
```bash
# കോഡ്-മാത്രം മാറ്റങ്ങൾക്ക് azd deploy (azd up അല്ല) ഉപയോഗിക്കുക
# ഇത് ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് ഒഴിവാക്കുകയും വളരെ വേഗം ആയിരിക്കുകയും ചെയ്യുന്നു
azd deploy

# ഏറ്റവും വേഗമുള്ള പുനരാവൃത്തി വേണ്ടി പ്രത്യേക സേവനം വിന്യസിക്കുക
azd deploy --service api
```

## 🔍 ഡിപ്ലോയ്മെന്റ് നിരീക്ഷണം

### റിയൽ-ടൈം ഡിപ്ലോയ്മെന്റ് നിരീക്ഷണം
```bash
# പ്രയോഗത്തെ യഥാർത്ഥ സമയത്തിൽ നിരീക്ഷിക്കുക
azd monitor --live

# പ്രയോഗ ലോഗുകൾ കാണുക
azd monitor --logs

# വിന്യാസ നില പരിശോധിക്കുക
azd show
```

### ഹെൽത്ത് പരിശോധനകൾ
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### പോസ്റ്റ്-ഡിപ്ലോയ്മെന്റ് സ്ഥിരീകരണം
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# അപേക്ഷയുടെ ആരോഗ്യത്തെ പരിശോധിക്കുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 സുരക്ഷാ പരിഗണനകൾ

### സിക്രെറ്റ്സ് മാനേജ്മെന്റ്
```bash
# രഹസ്യങ്ങൾ സുരക്ഷിതമായി സൂക്ഷിക്കുക
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ൽ രഹസ്യങ്ങളെ റഫറൻസ് ചെയ്യുക
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### നെറ്റ്‌വ്‌ർക്ക് സുരക്ഷ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ഐഡന്റിറ്റി ആൻഡ് ആക്‌സസ് മാനേജ്‌മെന്റ്
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 റോള്ബാക്ക് തന്ത്രങ്ങൾ

### വേഗം റോള്ബാക്ക്
```bash
# AZDയ്ക്ക് ഇൻബിൽറ്റ് റോള്ബാക്ക് ഇല്ല. ശിപാർശചെയ്ത സമീപനങ്ങൾ:

# ഓപ്ഷൻ 1: Git-യിൽ നിന്ന് വീണ്ടും ഡിപ്ലോയ് ചെയ്യുക (ശിപാർത്ഥിച്ചത്)
git revert HEAD  # പ്രശ്നകാരി കമിറ്റ് തിരിച്ചെടുക്കുക
git push
azd deploy

# ഓപ്ഷൻ 2: പ്രത്യേക കമിറ്റ് വീണ്ടും ഡിപ്ലോയ് ചെയ്യുക
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ഇൻഫ്രാസ്ട്രക്ചർ റോള്ബാക്ക്
```bash
# പ്രയോഗിക്കുന്നതിന് മുമ്പ് ഇൻഫ്രാസ്‌ട്രക്ചർ മാറ്റങ്ങൾ പുര്വദർശനം ചെയ്യുക
azd provision --preview

# ഇൻഫ്രാസ്‌ട്രക്ചർ റോള്ബാക്കിനായി, വേർഷൻ കൺട്രോൾ ഉപയോഗിക്കുക:
git revert HEAD  # ഇൻഫ്രാസ്‌ട്രക്ചർ മാറ്റങ്ങൾ പിൻവലിക്കുക
azd provision    # മുൻ ഇൻഫ്രാസ്‌ട്രക്ചർ അവസ്ഥ പ്രയോഗിക്കുക
```

### ഡാറ്റാബേസ് മൈഗ്രേഷൻ റോള്ബാക്ക്
```bash
#!/bin/bash
# scripts/റോള്ബാക്ക്-ഡാറ്റാബേസ്.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ഡിപ്ലോയ്മെന്റ് മെറ്റ്രിക്‌സുകൾ

### ഡിപ്ലോയ്മെന്റ് പ്രകടനം ട്രാക്ക് ചെയ്യുക
```bash
# ഇപ്പോഴുള്ള വിന്യാസത്തിന്റെ നില കാണുക
azd show

# ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സിനൊപ്പം ആപ്ലിക്കേഷൻ നിരീക്ഷിക്കുക
azd monitor --overview

# സജീവമായ മീറ്ററുകൾ കാണുക
azd monitor --live
```

### കസ്റ്റം മെറ്റ്രിക്‌സുകൾ ശേഖരണം
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 മികച്ച പ്രാക്ടീസുകൾ

### 1. പരിസ്ഥിതി സമരൂപത
```bash
# സ്ഥിരം നാമക്രമം ഉപയോഗിക്കുക
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# പരിസ്ഥിതി സമാനത നിലനിര്‍ത്തുക
./scripts/sync-environments.sh
```

### 2. ഇൻഫ്രാസ്ട്രക്ചർ സ്ഥിരീകരണം
```bash
# കൊണ്ടുപോകുന്നതിന് മുൻപ് അടിസ്ഥാനഘടന മാറ്റങ്ങൾ മുൻകൂർ കാണുക
azd provision --preview

# ARM/Bicep ലിൻറ്റിംഗ് ഉപയോഗിക്കുക
az bicep lint --file infra/main.bicep

# Bicep സിന്താക്സ് ശരിയാണെന്ന് പരിശോധന നടത്തുക
az bicep build --file infra/main.bicep
```

### 3. ടെസ്റ്റിംഗ് സംയോജനം
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. ഡോക്യുമെന്റേഷൻ & ലോഗ്മെന്റ്
```bash
# പ്രയോഗ പ്രക്രിയകൾ രേഖപ്പെടുത്തുക
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## അടുത്ത കാര്യങ്ങൾ

- [Provisioning Resources](provisioning.md) - ഇൻഫ്രാസ്ട്രക്ചർ മാനേജ്മെന്റിൽ ആഴത്തിലുള്ള അവലോകനം
- [പിർ-ഡിപ്ലോയ്മെന്റ് പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md) - നിങ്ങളുടെ ഡിപ്ലോയ്മെന്റ് തന്ത്രം പദ്ധതിയിടുക
- [സാധാരണ പ്രശ്നങ്ങൾ](../chapter-07-troubleshooting/common-issues.md) - ഡിപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- [മികച്ച പ്രാക്ടീസുകൾ](../chapter-07-troubleshooting/debugging.md) - പ്രൊഡക്ഷൻ റെഡി ഡിപ്ലോയ്മെന്റ് തന്ത്രങ്ങൾ

## 🎯 ഹാൻഡ്‌സ്-ഓൺ ഡിപ്ലോയ്മെന്റ് അഭ്യസനങ്ങൾ

### അഭ്യസനം 1: ഇൻക്രീമെന്റൽ ഡിപ്ലോയ്മെന്റ് വർക്ക്ഫ്ലോ (20 മിനിറ്റ്)
**ലക്ഷ്യം**: പൂർണ്ണവും ഇൻക്രീമെന്റലും ഡിപ്ലോയ്മെന്റുകളുടെ വ്യത്യാസം കൈകാര്യം ചെയ്യുക

```bash
# ആദ്യം മെഴുകുതിരി
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ആദ്യം മെഴുകുതിരി കാലം റെക്കോർഡ് ചെയ്യുക
echo "Full deployment: $(date)" > deployment-log.txt

# ഒരു കോഡ് മാറ്റം ചെയ്യുക
echo "// Updated $(date)" >> src/api/src/server.js

# കോഡ് മാത്രം പരസ്യപ്പെടുത്തുക (വേഗം)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# സമയങ്ങൾ താരതമ്യം ചെയ്യുക
cat deployment-log.txt

# ശുചീകരണം
azd down --force --purge
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] പൂർണ്ണ ഡിപ്ലോയ്‌മെന്റ് 5-15 മിനിറ്റ് എടുത്ത് പൂർത്തിയാക്കുക
- [ ] കോഡ് മാത്രം ഡിപ്ലോയ്മെന്റ് 2-5 മിനിറ്റ് മാത്രം ചെലവാകണം
- [ ] കോഡ് മാറ്റങ്ങൾ ഡിപ്ലോയ്മെന്റ് ചെയ്യപ്പെട്ട ആപ്പിൽ പ്രകടിപ്പിക്കുക
- [ ] `azd deploy` നടത്തുമ്പോൾ ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റം വേണം ഇല്ല

**പഠന ഫലം**: കോഡ് മാറ്റങ്ങൾക്ക് `azd deploy`, `azd up` നേക്കാൾ 50-70% വേഗത്തിലാണ്

### അഭ്യസനം 2: കസ്റ്റം ഡിപ്ലോയ്മെന്റ് ഹുക്കുകൾ (30 മിനിറ്റ്)
**ലക്ഷ്യം**: പ്രീ-ഡിപ്ലോയ്മെന്റ് & പോസ്റ്റ്-ഡിപ്ലോയ്മെന്റ് ഓട്ടോമേഷൻ നടപ്പാക്കുക

```bash
# പ്രീ-ഡിപ്ലോയ്മെന്റ് വാലിഡേഷൻ സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ടെസ്റ്റുകൾ വിജയിച്ചുവോ എന്ന് പരിശോധിക്കുക
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# അൺകമ്മിറ്റഡ് മാറ്റങ്ങൾ പരിശോധന ചെയ്യുക
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# പോസ്റ്റ്-ഡിപ്ലോയ്മെന്റ് സ്മോക്ക് ടെസ്റ്റ് സൃഷ്ടിക്കുക
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# hooks azure.yaml-ലേക്ക് ചേർക്കുക
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hooks ഉപയോഗിച്ച് ഡിപ്ലോയ്മെന്റ് പരിശോധന നടത്തുക
azd deploy
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] പ്രീ-ഡിപ്ലോയ്മെന്റ് സ്ക്രിപ്റ്റ് ഡിപ്ലോയ്മെന്റിന് മുമ്പ് ഓടുന്നു
- [ ] ടെസ്റ്റുകൾ പരാജയപ്പെട്ടാൽ ഡിപ്ലോയ്മെന്റ് അവസാനിപ്പിക്കും
- [ ] പോസ്റ്റ്-ഡിപ്ലോയ്മെന്റ് സ്മോക് ടെസ്റ്റ് ഹെൽത്ത് സ്ഥിരീകരിക്കുന്നു
- [ ] ഹുക്കുകൾ ശരിയായ ക്രമത്തിൽ നടക്കുന്നു

### അഭ്യസനം 3: മൾട്ടി-പരിസ്ഥിതി ഡിപ്ലോയ്മെന്റ് തന്ത്രം (45 മിനിറ്റ്)
**ലക്ഷ്യം**: സ്റ്റേജ്ഡ് ഡിപ്ലോയ്മെന്റ് വർക്ക്ഫ്ലോ (dev → staging → production) നടപ്പാക്കുക

```bash
# ഡിസ്പ്ലോയ്മെന്റ് സ്‌ക്രിപ്റ്റ് സൃഷ്‌ടിക്കുക
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# പടി 1: ഡെവ്-ലേക്ക് ഡിപ്ലോയ് ചെയ്യുക
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# പടി 2: സ്റ്റേജിങ്ങിലേക്ക് ഡിപ്ലോയ് ചെയ്യുക
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# പടി 3: പ്രൊഡക്ഷൻ‌ക്കായി മാനുവൽ അംഗീകാരം
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# പരിസ്ഥിതികളുണ്ടാക്കുക
azd env new dev
azd env new staging
azd env new production

# സ്റ്റേജ്ഡ് ഡിപ്ലോയ്മെന്റ് പ്രവർത്തിപ്പിക്കുക
./deploy-staged.sh
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] ഡെവ് പരിസ്ഥിതി വിജയകരമായ ഡിപ്ലോയ്മെന്റ്
- [ ] സ്റ്റേജിംഗ് പരിസ്ഥിതി വിജയകരമായ ഡിപ്ലോയ്മെന്റ്
- [ ] പ്രൊഡക്ഷൻക്ക് മാൻവൽ അംഗീകാരം ആവശ്യമാണ്
- [ ] എല്ലാ പരിസ്ഥിതികളിലും ഹെൽത്ത് പരിശോധനകൾ പ്രവർത്തിക്കുന്നു
- [ ] ആവശ്യം കൂടുമ്പോൾ റോള്ബാക്ക് ചെയ്യാനും കഴിയും

### അഭ്യസനം 4: റോള്ബാക്ക് തന്ത്രം (25 മിനിറ്റ്)
**ലക്ഷ്യം**: Git ഉപയോഗിച്ച് ഡിപ്ലോയ്മെന്റ് റോള്ബാക്ക് നടപ്പാക്കുക; ടെസ്റ്റ് ചെയ്യുക

```bash
# വേർഷൻ 1 വിന്യസിക്കുക
azd env set APP_VERSION "1.0.0"
azd up

# വേർഷൻ 1 കമിറ്റ് ഹാഷ് സേവ് ചെയ്യുക
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ഇപ്പോൾ വേർഷൻ 2 ബ്രേക്കിംഗ് മാറ്റത്തോടെ വിന്യസിക്കുക
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# പരാജയം കണ്ടെത്തി റോള്ബാക്ക് ചെയ്യുക
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # ഗിറ്റ് ഉപയോഗിച്ച് റോള്ബാക്ക് ചെയ്യുക
    git revert HEAD --no-edit
    
    # പരിസ്ഥിതിയിലേക്ക് റോള്ബാക്ക് ചെയ്യുക
    azd env set APP_VERSION "1.0.0"
    
    # വീണ്ടും വേർഷൻ 1 വിന്യസിക്കുക
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] ഡിപ്ലോയ്മെന്റ് പരാജയങ്ങൾ കണ്ടെത്താൻ കഴിയും
- [ ] റോള്ബാക്ക് സ്ക്രിപ്റ്റ് സ്വയം പ്രവർത്തിക്കുന്നു
- [ ] അപേക്ഷ പ്രവർത്തനക്ഷമ അവസ്ഥയിലേക്ക് മടങ്ങുന്നു
- [ ] റോള്ബാക്ക് കഴിഞ്ഞ് ഹെൽത്ത് പരിശോധനകൾ കടന്നുപോകുന്നു

## 📊 ഡിപ്ലോയ്മെന്റ് മെറ്റ്രിക്‌സ് ട്രാക്കിംഗ്

### ഡിപ്ലോയ്മെന്റ് പ്രകടനം ട്രാക്ക് ചെയ്യുക

```bash
# ഡിപ്ലോയ്മെന്റ് മെട്രിക്‌സ് സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# ഫയലിലേക്ക് ലോഗ് ചെയ്യുക
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ഇത് ഉപയോഗിക്കുക
./track-deployment.sh
```

**നിങ്ങളുടെ മെറ്റ്രിക്‌സ് വിശകലനം ചെയ്യുക:**
```bash
# വിനിയോഗം ചരിത്രം കാണുക
cat deployment-metrics.csv

# ശരാശരി വിനിയോഗ സമയം കണക്കാക്കുക
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## അധിക സ്രോതസ്സുകൾ

- [Azure Developer CLI ഡിപ്ലോയ്മെന്റ് റഫറൻസ്](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure ആപ്പ് സർവീസ് ഡിപ്ലോയ്മെന്റ്](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure കണ്ടെയ്നർ ആപ്പുകൾ ഡിപ്ലോയ്മെന്റ്](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure ഫങ്ഷനുകൾ ഡിപ്ലോയ്മെന്റ്](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ അധ്യായം**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](../chapter-01-foundation/first-project.md)
- **അടുത്ത അധ്യായം**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
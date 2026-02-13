# റീട്ടെയിൽ മൾട്ടി-ഏജന്റ് സൊല്യൂഷൻ - ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റ്

**അധ്യായം 5: പ്രൊഡക്ഷൻ ഡിപ്ലോയ്മെന്റ് പാക്കേജ്**
- **📚 കോഴ്സ് ഹോം**: [AZD ഫോർ ബിഗിന്നേഴ്സ്](../../README.md)
- **📖 ബന്ധപ്പെട്ട അധ്യായം**: [അധ്യായം 5: മൾട്ടി-ഏജന്റ് AI സൊല്യൂഷൻസ്](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 സീനാരിയോ ഗൈഡ്**: [പൂർണ്ണ ആർക്കിടെക്ചർ](../retail-scenario.md)
- **🎯 ക്വിക്ക് ഡിപ്ലോയ്**: [വൺ-ക്ലിക്ക് ഡിപ്ലോയ്മെന്റ്](../../../../examples/retail-multiagent-arm-template)

> **⚠️ ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റ് മാത്രം**  
> ഈ ARM ടെംപ്ലേറ്റ് **Azure റിസോഴ്സുകൾ** ഒരു മൾട്ടി-ഏജന്റ് സിസ്റ്റത്തിനായി ഡിപ്ലോയ് ചെയ്യുന്നു.  
>  
> **ഡിപ്ലോയ് ചെയ്യുന്നതെന്ത് (15-25 മിനിറ്റ്):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, മൂന്ന് റീജിയനുകളിൽ embeddings)
> - ✅ AI സെർച്ച് സർവീസ് (ശൂന്യം, ഇൻഡക്സ് ക്രിയേഷൻക്ക് തയ്യാറാണ്)
> - ✅ കണ്ടെയ്‌നർ ആപ്പുകൾ (placeholder ഇമേജുകൾ, നിങ്ങളുടെ കോഡിന് തയ്യാറാണ്)
> - ✅ സ്റ്റോറേജ്, Cosmos DB, Key Vault, Application Insights
>  
> **ഡിപ്ലോയ് ചെയ്യാത്തത് (ഡെവലപ്മെന്റ് ആവശ്യമാണ്):**
> - ❌ ഏജന്റ് ഇംപ്ലിമെന്റേഷൻ കോഡ് (Customer Agent, Inventory Agent)
> - ❌ റൂട്ടിംഗ് ലജിക്, API എൻഡ്പോയിന്റുകൾ
> - ❌ ഫ്രണ്ട്‌എൻഡ് ചാറ്റ് UI
> - ❌ സെർച്ച് ഇൻഡക്സ് സ്കീമകളും ഡാറ്റ പൈപ്പ്‌ലൈൻസും
> - ❌ **അനുമാനിച്ച ഡെവലപ്മെന്റ് ശ്രമം: 80-120 മണിക്കൂർ**
>  
> **ഈ ടെംപ്ലേറ്റ് ഉപയോഗിക്കുക, നിങ്ങൾ:**
> - ✅ മൾട്ടി-ഏജന്റ് പ്രോജക്റ്റിനായി Azure ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷൻ ചെയ്യാൻ ആഗ്രഹിക്കുന്നു
> - ✅ ഏജന്റ് ഇംപ്ലിമെന്റേഷൻ വേർതിരിച്ച് ഡെവലപ് ചെയ്യാൻ പദ്ധതിയിടുന്നു
> - ✅ പ്രൊഡക്ഷൻ-റെഡി ഇൻഫ്രാസ്ട്രക്ചർ ബേസ്ലൈൻ ആവശ്യമാണ്
>  
> **ഉപയോഗിക്കരുത്, നിങ്ങൾ:**
> - ❌ ഉടൻ പ്രവർത്തനക്ഷമമായ മൾട്ടി-ഏജന്റ് ഡെമോ പ്രതീക്ഷിക്കുന്നു
> - ❌ പൂർണ്ണമായ ആപ്ലിക്കേഷൻ കോഡ് ഉദാഹരണങ്ങൾ അന്വേഷിക്കുന്നു

## അവലോകനം

ഈ ഡയറക്ടറിയിൽ ഒരു മൾട്ടി-ഏജന്റ് കസ്റ്റമർ സപ്പോർട്ട് സിസ്റ്റത്തിന്റെ **ഇൻഫ്രാസ്ട്രക്ചർ ഫൗണ്ടേഷൻ** ഡിപ്ലോയ് ചെയ്യുന്നതിനുള്ള സമഗ്രമായ Azure Resource Manager (ARM) ടെംപ്ലേറ്റ് അടങ്ങിയിരിക്കുന്നു. ടെംപ്ലേറ്റ് ആവശ്യമായ എല്ലാ Azure സേവനങ്ങളും ശരിയായി കോൺഫിഗർ ചെയ്ത് പരസ്പരം ബന്ധിപ്പിച്ച് പ്രൊവിഷൻ ചെയ്യുന്നു, നിങ്ങളുടെ ആപ്ലിക്കേഷൻ ഡെവലപ്മെന്റിന് തയ്യാറാണ്.

**ഡിപ്ലോയ്‌മെന്റിന് ശേഷം നിങ്ങൾക്ക് ലഭ്യമാകുന്നത്:** പ്രൊഡക്ഷൻ-റെഡി Azure ഇൻഫ്രാസ്ട്രക്ചർ  
**സിസ്റ്റം പൂർത്തിയാക്കാൻ നിങ്ങൾക്ക് ആവശ്യമുള്ളത്:** ഏജന്റ് കോഡ്, ഫ്രണ്ട്‌എൻഡ് UI, ഡാറ്റ കോൺഫിഗറേഷൻ (കാണുക [ആർക്കിടെക്ചർ ഗൈഡ്](../retail-scenario.md))

## 🎯 ഡിപ്ലോയ് ചെയ്യുന്നതെന്ത്

### കോർ ഇൻഫ്രാസ്ട്രക്ചർ (ഡിപ്ലോയ്‌മെന്റിന് ശേഷം നില)

✅ **Azure OpenAI സേവനങ്ങൾ** (API കോൾസിന് തയ്യാറാണ്)
  - പ്രൈമറി റീജിയൻ: GPT-4o ഡിപ്ലോയ്‌മെന്റ് (20K TPM ശേഷി)
  - സെക്കൻഡറി റീജിയൻ: GPT-4o-mini ഡിപ്ലോയ്‌മെന്റ് (10K TPM ശേഷി)
  - ടെർഷ്യറി റീജിയൻ: ടെക്സ്റ്റ് എംബെഡിംഗ്സ് മോഡൽ (30K TPM ശേഷി)
  - എവാലുവേഷൻ റീജിയൻ: GPT-4o ഗ്രേഡർ മോഡൽ (15K TPM ശേഷി)
  - **നില:** പൂർണ്ണമായും പ്രവർത്തനക്ഷമം - ഉടൻ API കോൾസ് നടത്താം

✅ **Azure AI സെർച്ച്** (ശൂന്യം - കോൺഫിഗറേഷനിന് തയ്യാറാണ്)
  - വെക്ടർ സെർച്ച് ശേഷി സജ്ജീകരിച്ചിരിക്കുന്നു
  - സ്റ്റാൻഡേർഡ് ടയർ 1 പാർട്ടിഷൻ, 1 റെപ്ലിക്ക
  - **നില:** സർവീസ് പ്രവർത്തിക്കുന്നു, എന്നാൽ ഇൻഡക്സ് ക്രിയേഷൻ ആവശ്യമാണ്
  - **ആവശ്യമായ പ്രവർത്തനം:** നിങ്ങളുടെ സ്കീമ ഉപയോഗിച്ച് സെർച്ച് ഇൻഡക്സ് സൃഷ്ടിക്കുക

✅ **Azure സ്റ്റോറേജ് അക്കൗണ്ട്** (ശൂന്യം - അപ്ലോഡുകൾക്ക് തയ്യാറാണ്)
  - ബ്ലോബ് കണ്ടെയ്‌നുകൾ: `documents`, `uploads`
  - സുരക്ഷിത കോൺഫിഗറേഷൻ (HTTPS മാത്രം, പബ്ലിക് ആക്സസ് ഇല്ല)
  - **നില:** ഫയലുകൾ സ്വീകരിക്കാൻ തയ്യാറാണ്
  - **ആവശ്യമായ പ്രവർത്തനം:** നിങ്ങളുടെ ഉൽപ്പന്ന ഡാറ്റയും ഡോക്യുമെന്റുകളും അപ്ലോഡ് ചെയ്യുക

⚠️ **കണ്ടെയ്‌നർ ആപ്പുകൾ പരിസ്ഥിതി** (Placeholder ഇമേജുകൾ ഡിപ്ലോയ് ചെയ്തു)
  - ഏജന്റ് റൂട്ടർ ആപ്പ് (nginx ഡിഫോൾട്ട് ഇമേജ്)
  - ഫ്രണ്ട്‌എൻഡ് ആപ്പ് (nginx ഡിഫോൾട്ട് ഇമേജ്)
  - ഓട്ടോ-സ്കെയിലിംഗ് കോൺഫിഗർ ചെയ്തു (0-10 ഇൻസ്റ്റൻസുകൾ)
  - **നില:** Placeholder കണ്ടെയ്‌നറുകൾ പ്രവർത്തിക്കുന്നു
  - **ആവശ്യമായ പ്രവർത്തനം:** നിങ്ങളുടെ ഏജന്റ് ആപ്ലിക്കേഷനുകൾ നിർമ്മിച്ച് ഡിപ്ലോയ് ചെയ്യുക

✅ **Azure Cosmos DB** (ശൂന്യം - ഡാറ്റയ്ക്ക് തയ്യാറാണ്)
  - ഡാറ്റാബേസ്, കണ്ടെയ്‌നർ പ്രീ-കോൺഫിഗർ ചെയ്തു
  - കുറഞ്ഞ-ലാറ്റൻസി പ്രവർത്തനങ്ങൾക്ക് ഓപ്റ്റിമൈസ് ചെയ്തു
  - TTL സജ്ജീകരിച്ചിരിക്കുന്നു ഓട്ടോമാറ്റിക് ക്ലീനപ്പിനായി
  - **നില:** ചാറ്റ് ചരിത്രം സംഭരിക്കാൻ തയ്യാറാണ്

✅ **Azure Key Vault** (ഓപ്ഷണൽ - സീക്രെറ്റുകൾക്ക് തയ്യാറാണ്)
  - സോഫ്റ്റ് ഡിലീറ്റ് സജ്ജീകരിച്ചിരിക്കുന്നു
  - RBAC മാനേജ്ഡ് ഐഡന്റിറ്റികൾക്കായി കോൺഫിഗർ ചെയ്തു
  - **നില:** API കീകളും കണക്ഷൻ സ്ട്രിംഗുകളും സംഭരിക്കാൻ തയ്യാറാണ്

✅ **ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്** (ഓപ്ഷണൽ - മോണിറ്ററിംഗ് സജീവമാണ്)
  - ലോഗ് അനലിറ്റിക്സ് വർക്ക്‌സ്പേസുമായി കണക്റ്റ് ചെയ്തു
  - കസ്റ്റം മെട്രിക്കുകളും അലർട്ടുകളും സജ്ജീകരിച്ചു
  - **നില:** നിങ്ങളുടെ ആപ്പുകളിൽ നിന്ന് ടെലിമെട്രി സ്വീകരിക്കാൻ തയ്യാറാണ്

✅ **ഡോക്യുമെന്റ് ഇന്റലിജൻസ്** (API കോൾസിന് തയ്യാറാണ്)
  - S0 ടയർ പ്രൊഡക്ഷൻ വർക്ക്‌ലോഡുകൾക്കായി
  - **നില:** അപ്ലോഡ് ചെയ്ത ഡോക്യുമെന്റുകൾ പ്രോസസ് ചെയ്യാൻ തയ്യാറാണ്

✅ **ബിംഗ് സെർച്ച് API** (API കോൾസിന് തയ്യാറാണ്)
  - S1 ടയർ റിയൽ-ടൈം സെർച്ചുകൾക്കായി
  - **നില:** വെബ് സെർച്ച് ക്വെറികൾക്കായി തയ്യാറാണ്

### ഡിപ്ലോയ്‌മെന്റ് മോഡുകൾ

| മോഡ് | OpenAI ശേഷി | കണ്ടെയ്‌നർ ഇൻസ്റ്റൻസുകൾ | സെർച്ച് ടയർ | സ്റ്റോറേജ് റെഡണ്ടൻസി | ഏറ്റവും അനുയോജ്യം |
|------|-----------------|---------------------|-------------|-------------------|----------|
| **മിനിമൽ** | 10K-20K TPM | 0-2 റെപ്ലിക്കകൾ | ബേസിക് | LRS (ലോകൽ) | ഡെവ്/ടെസ്റ്റ്, പഠനം, പ്രൂഫ്-ഓഫ്-കോൺസെപ്റ്റ് |
| **സ്റ്റാൻഡേർഡ്** | 30K-60K TPM | 2-5 റെപ്ലിക്കകൾ | സ്റ്റാൻഡേർഡ് | ZRS (സോൺ) | പ്രൊഡക്ഷൻ, മിതമായ ട്രാഫിക് (<10K ഉപയോക്താക്കൾ) |
| **പ്രീമിയം** | 80K-150K TPM | 5-10 റെപ്ലിക്കകൾ, സോൺ-റെഡണ്ടൻറ് | പ്രീമിയം | GRS (ജിയോ) | എന്റർപ്രൈസ്, ഉയർന്ന ട്രാഫിക് (>10K ഉപയോക്താക്കൾ), 99.99% SLA |

**ചെലവിന്റെ സ്വാധീനം:**
- **മിനിമൽ → സ്റ്റാൻഡേർഡ്:** ~4x ചെലവ് വർദ്ധനവ് ($100-370/മാസം → $420-1,450/മാസം)
- **സ്റ്റാൻഡേർഡ് → പ്രീമിയം:** ~3x ചെലവ് വർദ്ധനവ് ($420-1,450/മാസം → $1,150-3,500/മാസം)
- **തിരഞ്ഞെടുക്കുക അടിസ്ഥാനമാക്കി:** പ്രതീക്ഷിക്കുന്ന ലോഡ്, SLA ആവശ്യകതകൾ, ബജറ്റ് നിയന്ത്രണങ്ങൾ

**ശേഷി പ്ലാനിംഗ്:**
- **TPM (Tokens Per Minute):** എല്ലാ മോഡൽ ഡിപ്ലോയ്‌മെന്റുകളിലെയും മൊത്തം
- **കണ്ടെയ്‌നർ ഇൻസ്റ്റൻസുകൾ:** ഓട്ടോ-സ്കെയിലിംഗ് പരിധി (മിനിമം-മാക്സിമം റെപ്ലിക്കകൾ)
- **സെർച്ച് ടയർ:** ക്വെറി പ്രകടനത്തെയും ഇൻഡക്സ് വലുപ്പ പരിധികളെയും ബാധിക്കുന്നു

## 📋 മുൻ‌വശങ്ങൾ

### ആവശ്യമായ ഉപകരണങ്ങൾ
1. **Azure CLI** (പതിപ്പ് 2.50.0 അല്ലെങ്കിൽ അതിനുമുകളിൽ)
   ```bash
   az --version  # പതിപ്പ് പരിശോധിക്കുക
   az login      # പ്രാമാണീകരിക്കുക
   ```

2. **സജീവ Azure സബ്സ്ക്രിപ്ഷൻ** ഉടമ അല്ലെങ്കിൽ കോൺട്രിബ്യൂട്ടർ ആക്സസോടെ
   ```bash
   az account show  # സബ്സ്ക്രിപ്ഷൻ സ്ഥിരീകരിക്കുക
   ```

### ആവശ്യമായ Azure ക്വോട്ടകൾ

ഡിപ്ലോയ്‌മെന്റിന് മുമ്പ്, നിങ്ങളുടെ ലക്ഷ്യ റീജിയനുകളിൽ മതിയായ ക്വോട്ടുകൾ ഉറപ്പാക്കുക:

```bash
# നിങ്ങളുടെ പ്രദേശത്ത് Azure OpenAI ലഭ്യത പരിശോധിക്കുക
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# OpenAI ക്വോട്ട പരിശോധിക്കുക (ഉദാഹരണം gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# കണ്ടെയ്നർ ആപ്പുകളുടെ ക്വോട്ട പരിശോധിക്കുക
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**മിനിമം ആവശ്യമായ ക്വോട്ടുകൾ:**
- **Azure OpenAI:** 3-4 മോഡൽ ഡിപ്ലോയ്‌മെന്റുകൾ റീജിയനുകളിൽ
  - GPT-4o: 20K TPM (Tokens Per Minute)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **കുറിപ്പ്:** ചില റീജിയനുകളിൽ GPT-4o വെയിറ്റ്‌ലിസ്റ്റിൽ ഉണ്ടാകാം - [മോഡൽ ലഭ്യത](https://learn.microsoft.com/azure/ai-services/openai/concepts/models) പരിശോധിക്കുക
- **കണ്ടെയ്‌നർ ആപ്പുകൾ:** മാനേജ്ഡ് പരിസ്ഥിതി + 2-10 കണ്ടെയ്‌നർ ഇൻസ്റ്റൻസുകൾ
- **AI സെർച്ച്:** സ്റ്റാൻഡേർഡ് ടയർ (വെക്ടർ സെർച്ചിന് ബേസിക് പര്യാപ്തമല്ല)
- **Cosmos DB:** സ്റ്റാൻഡേർഡ് പ്രൊവിഷൻഡ് ത്രൂപുട്ട്

**ക്വോട്ടുകൾ പര്യാപ്തമല്ലെങ്കിൽ:**
1. Azure പോർട്ടൽ → Quotas → വർദ്ധനവ് അഭ്യർത്ഥിക്കുക
2. അല്ലെങ്കിൽ Azure CLI ഉപയോഗിക്കുക:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. ലഭ്യതയുള്ള മറ്റ് റീജിയനുകൾ പരിഗണിക്കുക

## 🚀 ക്വിക്ക് ഡിപ്ലോയ്‌മെന്റ്

### ഓപ്ഷൻ 1: Azure CLI ഉപയോഗിച്ച്

```bash
# ടെംപ്ലേറ്റ് ഫയലുകൾ ക്ലോൺ ചെയ്യുക അല്ലെങ്കിൽ ഡൗൺലോഡ് ചെയ്യുക
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# ഡിപ്ലോയ്‌മെന്റ് സ്ക്രിപ്റ്റ് എക്സിക്യൂട്ടബിൾ ആക്കുക
chmod +x deploy.sh

# ഡിഫോൾട്ട് ക്രമീകരണങ്ങളോടെ ഡിപ്ലോയ് ചെയ്യുക
./deploy.sh -g myResourceGroup

# പ്രീമിയം സവിശേഷതകളോടെ പ്രൊഡക്ഷൻ ഡിപ്ലോയ് ചെയ്യുക
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### ഓപ്ഷൻ 2: Azure പോർട്ടൽ ഉപയോഗിച്ച്

[![Azure-ലേക്ക് ഡിപ്ലോയ് ചെയ്യുക](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### ഓപ്ഷൻ 3: നേരിട്ട് Azure CLI ഉപയോഗിച്ച്

```bash
# റിസോഴ്‌സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കുക
az group create --name myResourceGroup --location eastus2

# ടെംപ്ലേറ്റ് വിന്യസിക്കുക
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ ഡിപ്ലോയ്‌മെന്റ് ടൈംലൈൻ

### പ്രതീക്ഷിക്കേണ്ടത്

| ഘട്ടം | ദൈർഘ്യം | എന്താണ് സംഭവിക്കുന്നത് |
|-------|----------|--------------||
| **ടെംപ്ലേറ്റ് വാലിഡേഷൻ** | 30-60 സെക്കൻഡ് | Azure ARM ടെംപ്ലേറ്റ് സിന്റാക്സ്, പാരാമീറ്ററുകൾ പരിശോധിക്കുന്നു |
| **റിസോഴ്സ് ഗ്രൂപ്പ് സജ്ജീകരണം** | 10-20 സെക്കൻഡ് | റിസോഴ്സ് ഗ്രൂപ്പ് സൃഷ്ടിക്കുന്നു (ആവശ്യമെങ്കിൽ) |
| **OpenAI പ്രൊവിഷനിംഗ്** | 5-8 മിനിറ്റ് | 3-4 OpenAI അക്കൗണ്ടുകളും മോഡലുകളും ഡിപ്ലോയ് ചെയ്യുന്നു |
| **കണ്ടെയ്‌നർ ആപ്പുകൾ** | 3-5 മിനിറ്റ് | പരിസ്ഥിതി സൃഷ്ടിച്ച് placeholder കണ്ടെയ്‌നറുകൾ ഡിപ്ലോയ് ചെയ്യുന്നു |
| **സെർച്ച് & സ്റ്റോറേജ്** | 2-4 മിനിറ്റ് | AI സെർച്ച് സർവീസും സ്റ്റോറേജ് അക്കൗണ്ടുകളും പ്രൊവിഷൻ ചെയ്യുന്നു |
| **Cosmos DB** | 2-3 മിനിറ്റ് | ഡാറ്റാബേസ് സൃഷ്ടിച്ച് കണ്ടെയ്‌നറുകൾ കോൺഫിഗർ ചെയ്യുന്നു |
| **മോണിറ്ററിംഗ് സജ്ജീകരണം** | 2-3 മിനിറ്റ് | ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സും ലോഗ് അനലിറ്റിക്സും സജ്ജീകരിക്കുന്നു |
| **RBAC കോൺഫിഗറേഷൻ** | 1-2 മിനിറ്റ് | മാനേജ്ഡ് ഐഡന്റിറ്റികൾക്കും അനുമതികൾക്കും കോൺഫിഗർ ചെയ്യുന്നു |
| **മൊത്തം ഡിപ്ലോയ്‌മെന്റ്** | **15-25 മിനിറ്റ്** | പൂർണ്ണ ഇൻഫ്രാസ്ട്രക്ചർ തയ്യാറാണ് |

**ഡിപ്ലോയ്‌മെന്റിന് ശേഷം:**
- ✅ **ഇൻഫ്രാസ്ട്രക്ചർ റെഡി:** എല്ലാ Azure സേവനങ്ങളും പ്രൊവിഷൻ ചെയ്ത് പ്രവർത്തിക്കുന്നു
- ⏱️ **ആപ്ലിക്കേഷൻ ഡെവലപ്മെന്റ്:** 80-120 മണിക്കൂർ (നിങ്ങളുടെ ഉത്തരവാദിത്തം)
- ⏱️ **ഇൻഡക്സ് കോൺഫിഗറേഷൻ:** 15-30 മിനിറ്റ് (നിങ്ങളുടെ സ്കീമ ആവശ്യമാണ്)
- ⏱️ **ഡാറ്റ അപ്ലോഡ്:** ഡാറ്റാസെറ്റ് വലുപ്പം അനുസരിച്ച് വ്യത്യാസപ്പെടുന്നു
- ⏱️ **ടെസ്റ്റിംഗ് & വാലിഡേഷൻ:** 2-4 മണിക്കൂർ

---

## ✅ ഡിപ്ലോയ്‌മെന്റ് വിജയം സ്ഥിരീകരിക്കുക

### ഘട്ടം 1: റിസോഴ്സ് പ്രൊവിഷനിംഗ് പരിശോധിക്കുക (2 മിനിറ്റ്)

```bash
# എല്ലാ വിഭവങ്ങളും വിജയകരമായി വിന്യസിച്ചിട്ടുണ്ടെന്ന് സ്ഥിരീകരിക്കുക
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**പ്രതീക്ഷിക്കുന്നത്:** ശൂന്യ പട്ടിക (എല്ലാ റിസോഴ്സുകളും "Succeeded" നില കാണിക്കുന്നു)

### ഘട്ടം 2: Azure OpenAI ഡിപ്ലോയ്‌മെന്റുകൾ പരിശോധിക്കുക (3 മിനിറ്റ്)

```bash
# എല്ലാ OpenAI അക്കൗണ്ടുകളും പട്ടികയിടുക
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# പ്രാഥമിക പ്രദേശത്തിനുള്ള മോഡൽ വിന്യാസങ്ങൾ പരിശോധിക്കുക
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**പ്രതീക്ഷിക്കുന്നത്:** 
- 3-4 OpenAI അക്കൗണ്ടുകൾ (പ്രൈമറി, സെക്കൻഡറി, ടെർഷ്യറി, എവാലുവേഷൻ റീജിയനുകൾ)
- ഓരോ അക്കൗണ്ടിലും 1-2 മോഡൽ ഡിപ്ലോയ്‌മെന്റുകൾ (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### ഘട്ടം 3: ഇൻഫ്രാസ്ട്രക്ചർ എൻഡ്പോയിന്റുകൾ പരിശോധിക്കുക (5 മിനിറ്റ്)

```bash
# കണ്ടെയ്നർ ആപ്പ് URLകൾ നേടുക
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# റൗട്ടർ എൻഡ്പോയിന്റ് പരീക്ഷിക്കുക (പ്ലേസ്‌ഹോൾഡർ ചിത്രം പ്രതികരിക്കും)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**പ്രതീക്ഷിക്കുന്നത്:** 
- കണ്ടെയ്‌നർ ആപ്പുകൾ "Running" നില കാണിക്കുന്നു
- Placeholder nginx HTTP 200 അല്ലെങ്കിൽ 404 (ആപ്ലിക്കേഷൻ കോഡ് ഇല്ല)

### ഘട്ടം 4: Azure OpenAI API ആക്സസ് പരിശോധിക്കുക (3 മിനിറ്റ്)

```bash
# OpenAI എൻഡ്പോയിന്റും കീയും നേടുക
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# GPT-4o ഡിപ്ലോയ്മെന്റ് പരീക്ഷിക്കുക
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**പ്രതീക്ഷിക്കുന്നത്:** JSON പ്രതികരണം ചാറ്റ് പൂർത്തീകരണത്തോടെ (OpenAI പ്രവർത്തനക്ഷമമാണെന്ന് സ്ഥിരീകരിക്കുന്നു)

### എന്താണ് പ്രവർത്തിക്കുന്നത്, എന്താണ് പ്രവർത്തിക്കാത്തത്

**✅ ഡിപ്ലോയ്‌മെന്റിന് ശേഷം പ്രവർത്തിക്കുന്നവ:**
- Azure OpenAI മോഡലുകൾ ഡിപ്ലോയ് ചെയ്ത് API കോൾസ് സ്വീകരിക്കുന്നു
- AI സെർച്ച് സർവീസ് പ്രവർത്തിക്കുന്നു (ശൂന്യം, ഇൻഡക്സ് ഇല്ല)
- കണ്ടെയ്‌നർ ആപ്പുകൾ placeholder nginx ഇമേജുകളോടെ പ്രവർത്തിക്കുന്നു
- സ്റ്റോറേജ് അക്കൗണ്ടുകൾ അപ്ലോഡുകൾക്ക് സജ്ജമാണ്
- Cosmos DB ഡാറ്റ ഓപ്പറേഷനുകൾക്കായി തയ്യാറാണ്
- ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇൻഫ
> **📝 പ്രധാനപ്പെട്ടത്:** ഇൻഫ്രാസ്ട്രക്ചർ ഡിപ്ലോയ് ചെയ്തിട്ടുണ്ട്, എന്നാൽ നിങ്ങൾക്ക് ആപ്ലിക്കേഷൻ കോഡ് വികസിപ്പിച്ച് ഡിപ്ലോയ് ചെയ്യേണ്ടതുണ്ട്.

### ഘട്ടം 1: ഏജന്റ് ആപ്ലിക്കേഷനുകൾ വികസിപ്പിക്കുക (നിങ്ങളുടെ ഉത്തരവാദിത്വം)

ARM ടെംപ്ലേറ്റ് **ശൂന്യമായ കണ്ടെയിനർ ആപ്സ്** സൃഷ്ടിക്കുന്നു,_placeholder_ nginx ഇമേജുകൾ ഉപയോഗിച്ച്. നിങ്ങൾക്ക് ചെയ്യേണ്ടത്:

**ആവശ്യമായ വികസനം:**
1. **ഏജന്റ് ഇംപ്ലിമെന്റേഷൻ** (30-40 മണിക്കൂർ)
   - GPT-4o ഇന്റഗ്രേഷൻ ഉപയോഗിച്ച് കസ്റ്റമർ സർവീസ് ഏജന്റ്
   - GPT-4o-mini ഇന്റഗ്രേഷൻ ഉപയോഗിച്ച് ഇൻവെന്ററി ഏജന്റ്
   - ഏജന്റ് റൂട്ടിംഗ് ലജിക്

2. **ഫ്രണ്ട്‌എൻഡ് വികസനം** (20-30 മണിക്കൂർ)
   - ചാറ്റ് ഇന്റർഫേസ് UI (React/Vue/Angular)
   - ഫയൽ അപ്ലോഡ് ഫംഗ്ഷണാലിറ്റി
   - റെസ്പോൺസ് റെൻഡറിംഗ്, ഫോർമാറ്റിംഗ്

3. **ബാക്ക്‌എൻഡ് സർവീസുകൾ** (12-16 മണിക്കൂർ)
   - FastAPI അല്ലെങ്കിൽ Express റൗട്ടർ
   - ഓതന്റിക്കേഷൻ മിഡിൽവെയർ
   - ടെലിമെട്രി ഇന്റഗ്രേഷൻ

**കാണുക:** [ആർക്കിടെക്ചർ ഗൈഡ്](../retail-scenario.md) വിശദമായ ഇംപ്ലിമെന്റേഷൻ പാറ്റേണുകളും കോഡ് ഉദാഹരണങ്ങളും

### ഘട്ടം 2: AI സെർച്ച് ഇൻഡക്സ് കോൺഫിഗർ ചെയ്യുക (15-30 മിനിറ്റ്)

നിങ്ങളുടെ ഡാറ്റ മോഡലുമായി പൊരുത്തപ്പെടുന്ന ഒരു സെർച്ച് ഇൻഡക്സ് സൃഷ്ടിക്കുക:

```bash
# തിരയൽ സേവനത്തിന്റെ വിശദാംശങ്ങൾ നേടുക
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# നിങ്ങളുടെ സ്കീമ ഉപയോഗിച്ച് ഇൻഡക്സ് സൃഷ്ടിക്കുക (ഉദാഹരണം)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**വിഭവങ്ങൾ:**
- [AI സെർച്ച് ഇൻഡക്സ് സ്കീമ ഡിസൈൻ](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [വെക്ടർ സെർച്ച് കോൺഫിഗറേഷൻ](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### ഘട്ടം 3: നിങ്ങളുടെ ഡാറ്റ അപ്ലോഡ് ചെയ്യുക (സമയം വ്യത്യാസപ്പെടുന്നു)

നിങ്ങൾക്ക് ഉൽപ്പന്ന ഡാറ്റയും ഡോക്യുമെന്റുകളും ലഭിച്ചാൽ:

```bash
# സ്റ്റോറേജ് അക്കൗണ്ട് വിശദാംശങ്ങൾ നേടുക
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# നിങ്ങളുടെ ഡോക്യുമെന്റുകൾ അപ്ലോഡ് ചെയ്യുക
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# ഉദാഹരണം: ഒറ്റ ഫയൽ അപ്ലോഡ് ചെയ്യുക
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### ഘട്ടം 4: നിങ്ങളുടെ ആപ്ലിക്കേഷനുകൾ നിർമ്മിച്ച് ഡിപ്ലോയ് ചെയ്യുക (8-12 മണിക്കൂർ)

നിങ്ങൾ ഏജന്റ് കോഡ് വികസിപ്പിച്ച ശേഷം:

```bash
# 1. ആവശ്യമെങ്കിൽ Azure Container Registry സൃഷ്ടിക്കുക
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. ഏജന്റ് റൗട്ടർ ഇമേജ് നിർമ്മിച്ച് പുഷ് ചെയ്യുക
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. ഫ്രണ്ട്‌എൻഡ് ഇമേജ് നിർമ്മിച്ച് പുഷ് ചെയ്യുക
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. നിങ്ങളുടെ ഇമേജുകളുമായി കണ്ടെയ്നർ ആപ്പുകൾ അപ്ഡേറ്റ് ചെയ്യുക
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. പരിസ്ഥിതി ചോദ്യങ്ങൾ ക്രമീകരിക്കുക
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### ഘട്ടം 5: നിങ്ങളുടെ ആപ്ലിക്കേഷൻ ടെസ്റ്റ് ചെയ്യുക (2-4 മണിക്കൂർ)

```bash
# നിങ്ങളുടെ ആപ്ലിക്കേഷൻ URL നേടുക
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# ഏജന്റ് എൻഡ്പോയിന്റ് പരീക്ഷിക്കുക (താങ്കളുടെ കോഡ് ഡിപ്ലോയ് ചെയ്ത ശേഷം)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# ആപ്ലിക്കേഷൻ ലോഗുകൾ പരിശോധിക്കുക
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### ഇംപ്ലിമെന്റേഷൻ വിഭവങ്ങൾ

**ആർക്കിടെക്ചർ & ഡിസൈൻ:**
- 📖 [സമ്പൂർണ്ണ ആർക്കിടെക്ചർ ഗൈഡ്](../retail-scenario.md) - വിശദമായ ഇംപ്ലിമെന്റേഷൻ പാറ്റേണുകൾ
- 📖 [മൾട്ടി-ഏജന്റ് ഡിസൈൻ പാറ്റേണുകൾ](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**കോഡ് ഉദാഹരണങ്ങൾ:**
- 🔗 [Azure OpenAI ചാറ്റ് സാംപിൾ](https://github.com/Azure-Samples/azure-search-openai-demo) - RAG പാറ്റേൺ
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - ഏജന്റ് ഫ്രെയിംവർക്കുകൾ (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - ഏജന്റ് ഓർക്കസ്ട്രേഷൻ (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - മൾട്ടി-ഏജന്റ് സംഭാഷണങ്ങൾ

**അനുമാനിച്ച മൊത്തം ശ്രമം:**
- ഇൻഫ്രാസ്ട്രക്ചർ ഡിപ്ലോയ്‌മെന്റ്: 15-25 മിനിറ്റ് (✅ പൂർത്തിയായി)
- ആപ്ലിക്കേഷൻ വികസനം: 80-120 മണിക്കൂർ (🔨 നിങ്ങളുടെ ജോലി)
- ടെസ്റ്റിംഗ്, ഓപ്റ്റിമൈസേഷൻ: 15-25 മണിക്കൂർ (🔨 നിങ്ങളുടെ ജോലി)

## 🛠️ പ്രശ്നങ്ങൾ പരിഹരിക്കൽ

### സാധാരണ പ്രശ്നങ്ങൾ

#### 1. Azure OpenAI ക്വോട്ടാ മിച്ചം

```bash
# നിലവിലെ ക്വോട്ട ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list --location eastus2

# ക്വോട്ട വർദ്ധനവിനായി അപേക്ഷിക്കുക
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. കണ്ടെയിനർ ആപ്സ് ഡിപ്ലോയ്‌മെന്റ് പരാജയപ്പെട്ടു

```bash
# കണ്ടെയ്നർ ആപ്പ് ലോഗുകൾ പരിശോധിക്കുക
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# കണ്ടെയ്നർ ആപ്പ് പുനരാരംഭിക്കുക
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. സെർച്ച് സർവീസ് ഇൻിഷ്യലൈസേഷൻ

```bash
# തിരയൽ സേവനത്തിന്റെ നില പരിശോധിക്കുക
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# തിരയൽ സേവനത്തിന്റെ ബന്ധം പരിശോധിക്കുക
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### ഡിപ്ലോയ്‌മെന്റ് വാലിഡേഷൻ

```bash
# എല്ലാ വിഭവങ്ങളും സൃഷ്ടിക്കപ്പെട്ടിട്ടുണ്ടെന്ന് സ്ഥിരീകരിക്കുക
az resource list \
  --resource-group myResourceGroup \
  --output table

# വിഭവത്തിന്റെ ആരോഗ്യസ്ഥിതി പരിശോധിക്കുക
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 സുരക്ഷാ പരിഗണനകൾ

### കീ മാനേജ്മെന്റ്
- എല്ലാ രഹസ്യങ്ങളും Azure Key Vault-ൽ സൂക്ഷിക്കുന്നു (എനേബിൾ ചെയ്താൽ)
- കണ്ടെയിനർ ആപ്സ് ഓതന്റിക്കേഷനായി മാനേജ്ഡ് ഐഡന്റിറ്റി ഉപയോഗിക്കുന്നു
- സ്റ്റോറേജ് അക്കൗണ്ടുകൾ സുരക്ഷിത ഡീഫോൾട്ടുകൾ (HTTPS മാത്രം, പബ്ലിക് ബ്ലോബ് ആക്സസ് ഇല്ല) ഉപയോഗിക്കുന്നു

### നെറ്റ്‌വർക്കിംഗ് സുരക്ഷ
- കണ്ടെയിനർ ആപ്സ് സാധ്യമായിടത്ത് ഇന്റേണൽ നെറ്റ്‌വർക്കിംഗ് ഉപയോഗിക്കുന്നു
- സെർച്ച് സർവീസ് പ്രൈവറ്റ് എൻഡ്പോയിന്റ് ഓപ്ഷൻ ഉപയോഗിച്ച് കോൺഫിഗർ ചെയ്തിരിക്കുന്നു
- Cosmos DB ആവശ്യമായ കുറഞ്ഞ അനുമതികളോടെ കോൺഫിഗർ ചെയ്തിരിക്കുന്നു

### RBAC കോൺഫിഗറേഷൻ
```bash
# മാനേജുചെയ്യുന്ന ഐഡന്റിറ്റിക്ക് ആവശ്യമായ റോളുകൾ നൽകുക
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 ചെലവ് ഓപ്റ്റിമൈസേഷൻ

### ചെലവ് അനുമാനങ്ങൾ (മാസം, USD)

| മോഡ് | OpenAI | കണ്ടെയിനർ ആപ്സ് | സെർച്ച് | സ്റ്റോറേജ് | മൊത്തം അനുമാനം |
|------|--------|----------------|--------|---------|------------|
| മിനിമൽ | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| സ്റ്റാൻഡേർഡ് | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| പ്രീമിയം | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### ചെലവ് നിരീക്ഷണം

```bash
# ബജറ്റ് അലർട്ടുകൾ സജ്ജമാക്കുക
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 അപ്ഡേറ്റുകൾ, മെയിന്റനൻസ്

### ടെംപ്ലേറ്റ് അപ്ഡേറ്റുകൾ
- ARM ടെംപ്ലേറ്റ് ഫയലുകൾ വേർഷൻ കൺട്രോൾ ചെയ്യുക
- ഡെവലപ്മെന്റ് എൻവയോൺമെന്റിൽ മാറ്റങ്ങൾ ആദ്യം ടെസ്റ്റ് ചെയ്യുക
- അപ്ഡേറ്റുകൾക്കായി ഇൻക്രിമെന്റൽ ഡിപ്ലോയ്‌മെന്റ് മോഡ് ഉപയോഗിക്കുക

### വിഭവ അപ്ഡേറ്റുകൾ
```bash
# പുതിയ പാരാമീറ്ററുകൾ ഉപയോഗിച്ച് അപ്ഡേറ്റ് ചെയ്യുക
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### ബാക്കപ്പ്, റിക്കവറി
- Cosmos DB ഓട്ടോമാറ്റിക് ബാക്കപ്പ് എനേബിൾ ചെയ്തിരിക്കുന്നു
- Key Vault സോഫ്റ്റ് ഡിലീറ്റ് എനേബിൾ ചെയ്തിരിക്കുന്നു
- കണ്ടെയിനർ ആപ്സ് റിവിഷനുകൾ റോള്ബാക്കിനായി നിലനിർത്തുന്നു

## 📞 പിന്തുണ

- **ടെംപ്ലേറ്റ് പ്രശ്നങ്ങൾ:** [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Azure പിന്തുണ:** [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **കമ്മ്യൂണിറ്റി:** [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ നിങ്ങളുടെ മൾട്ടി-ഏജന്റ് സൊല്യൂഷൻ ഡിപ്ലോയ് ചെയ്യാൻ തയ്യാറാണോ?**

ആരംഭിക്കുക: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ പ്രമാണം AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. പ്രമാണത്തിന്റെ മാതൃഭാഷയിലുള്ള യഥാർത്ഥ പതിപ്പ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
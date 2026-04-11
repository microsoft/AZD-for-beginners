# Chapter 2: AI-First Development

**📚 കോഴ്‌സ്**: [AZD For Beginners](../../README.md) | **⏱️ ദൈര്‍ഘ്യം**: 1-2 മണിക്കൂര്‍ | **⭐ സങ്കീർണ്ണത**: മധ्यम

---

## അവലോകനം

ഈ അധ്യായം Azure Developer CLI-ഉം Microsoft Foundry സേവനങ്ങളും ഉപയോഗിച്ചുള്ള AI-ശേഷിയുള്ള ആപ്ലിക്കേഷനുകളുടെ വിന്യാസ പ്രക്രിയയിലാണ് കേന്ദ്രീകരിക്കുന്നത്. ലളിതമായ AI ചാറ്റ് ആപ്പുകൾ മുതൽ ഉപകരണങ്ങളോടുകൂടിയ ബുദ്ധിമുട്ടുള്ള ഏജന്റുകളിലേക്കാണ് ഇത്.

> **പരിശോധന കുറിപ്പ് (2026-03-25):** ഈ അധ്യായത്തിലെ കമാൻഡ് ഫ്ലോയും വിപുലീകരണ മാർഗ്ഗനിർദ്ദേശവും `azd` `1.23.12` നും നിലവിലുള്ള പ്രിവ്യൂ AI ഏജന്റ് വിപുലീകരണം `azure.ai.agents` `0.1.18-preview` നും എതിരായും അവലോകനം ചെയ്തിരിക്കുന്നു. പഴയ AZD ബിൽഡിൽ ആണെങ്കിൽ ആദ്യം അപ്ഡേറ്റ് ചെയ്ത് തുടർന്ന് അഭ്യാസങ്ങൾ തുടരുക.

## പഠനലക്ഷ്യങ്ങൾ

ഈ അധ്യായം പൂര്‍ത്തീകരിച്ചാൽ, നിങ്ങൾക്ക്:
- മുൻകൂർ നിർമിത AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് AI ആപ്ലിക്കേഷനുകൾ വിന്യസിപ്പിക്കാൻ
- AZD-യുമായി Microsoft Foundry സംയോജനം മനസിലാക്കാൻ
- ഉപകരണങ്ങളോടുകൂടെ AI ഏജന്റുകൾ ക്രമീകരിക്കുകയും ഇഷ്‌ടാനുസൃതമാക്കുകയും ചെയ്യാൻ
- RAG (Retrieval-Augmented Generation) ആപ്ലിക്കേഷനുകൾ വിന്യാസിപ്പിക്കാൻ കഴിയും

---

## 📚 പാഠങ്ങൾ

| # | പാഠം | വിവരണം | സമയം |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD-നെ Foundry സേവനങ്ങളുമായി ബന്ധിപ്പിക്കുക | 30 മിനിറ്റ് |
| 2 | [AI Agents Guide](agents.md) | ഉപകരണങ്ങളോടുകൂടെ ബുദ്ധിമുട്ടുള്ള ഏജന്റുകൾ വിന്യസിപ്പിക്കുക | 45 മിനിറ്റ് |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI മോഡലുകൾ വിന്യാസപ്പെടുത്തി ക്രമീകരിക്കുക | 30 മിനിറ്റ് |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | പ്രായോഗിക: നിങ്ങളുടെ AI പരിഹാരത്തെ AZD-സജ്ജമാക്കുക | 60 മിനിറ്റ് |

---

## 🚀 വേഗത്തിലുള്ള തുടക്കം

```bash
# ഓപ്ഷൻ 1: RAG ചാറ്റ് അപ്ലിക്കേഷൻ
azd init --template azure-search-openai-demo
azd up

# ഓപ്ഷൻ 2: AI ഏജന്റുകൾ
azd init --template get-started-with-ai-agents
azd up

# ഓപ്ഷൻ 3: വേഗം ചാറ്റ് അപ്ലിക്കേഷൻ
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 പ്രശസ്ത AI ടെംപ്ലേറ്റുകൾ

| ടെംപ്ലേറ്റ് | വിവരണം | സേവനങ്ങൾ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ഉദ്ധരണികളോടെയുള്ള RAG ചാറ്റ് | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ഉപകരണങ്ങളോടുള്ള AI ഏജന്റ് | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | അടിസ്ഥാന AI ചാറ്റ് | OpenAI + Container Apps |

---

## 💰 ചെലവ് മനസ്സിലാക്കല്‍

| പരിസ്ഥിതി | പ്രതിമാസത്തിനെച്ചൊലിച്ച് മാത്രം കണക്കാക്കിയ ചെലവ് |
|-------------|----------------------|
| ഡെവലപ്പ്മെന്റ് | $80-150 |
| സ്റ്റേജിംഗ് | $150-300 |
| പ്രൊഡക്ഷൻ | $300-3,500+ |

**ടിപ്പ്:** പരീക്ഷണത്തിന് ശേഷം ചാർജ് ഒഴിവാക്കാൻ `azd down` ഓടിക്കുക.

---

## 🔗 നാവിഗേഷൻ

| ദിശ | അധ്യായം |
|-----------|---------|
| **മുമ്പ്** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **അടുത്തത്** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **താഴിൽ ചെന്ന്** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 ബന്ധപ്പെട്ട വമ്പിച്ച വിഭവങ്ങൾ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസൂയാപത്രിക**:  
ഈ രേഖ [Co-op Translator](https://github.com/Azure/co-op-translator) എന്ന AI പരിഭാഷാ സേവനം ഉപയോഗിച്ച് പരിഭാഷ ചെയ്യപ്പെട്ടതാണ്. നമുക്ക് ശരിയാക്കലിനായി ശ്രമിക്കുമ്പോഴും, യന്ത്രപരിഭാഷകളിൽ പിഴവുകളും വ്യത്യാസങ്ങളും ഉണ്ടാകാമെന്നു ജാഗ്രത പാലിക്കുക. സാമ്ബത്തിക താളിലും, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ പ്രധാനമാണെന്ന് കരുതുക. ഈ പരിഭാഷ ഉപയോഗിച്ചതിനാൽ സംഭവിക്കുന്ന തെറ്റുപറയലുകൾക്കും തെറ്റിപറയലുകളുടെയും ഉത്തരവാദിത്തം ഞങ്ങൾ ഏറ്റുകയില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Chapter 2: AI-First Development

**📚 കോഴ്‌സ്**: [AZD For Beginners](../../README.md) | **⏱️ ദൈർഘ്യം**: 1-2 മണിക്കൂറുകൾ | **⭐ സങ്കീർണ്ണത**: ഇടക്കാല

---

## അവലോകനം

ഈ അധ്യായം Azure Developer CLI और Microsoft Foundry സേവനങ്ങൾ ഉപയോഗിച്ച് AI-ചാലിതമായി പ്രവർത്തിക്കുന്ന അപ്ലിക്കേഷനുകൾ ഡിപ്പ്ലോയ് ചെയ്യുന്നതിൽ ശ്രദ്ധ കേന്ദ്രീകരിക്കുന്നു. ലളിതമായ AI ചാറ്റ് അപ്ലിക്കേഷനുകളിൽ നിന്നു ഉപകരണങ്ങളുള്ള ബുദ്ധിമുട്ടുള്ള ഏജന്റുകളിലേക്കും.

> **സൂക്ഷ്മ പരിശോധന കുറിപ്പ് (2026-06-15):** ഈ അധ്യായത്തിൽ കമാൻഡ് ഫ്ലോയും എക്സ്റ്റൻഷൻ മാർഗനിർദ്ദേശവും `azd` `1.25.6` ഇലവേഷനും നിലവിലെ പ്രിവ്യൂ AI ഏജന്റ് എക്സ്റ്റെൻഷൻ റിലീസ് `azure.ai.agents` `0.1.40-preview` ഉം അനുസരിച്ച് പരിശോധിച്ചിട്ടുണ്ട്. നിങ്ങൾ പഴയ AZD ബിൽഡിൽ ആണെങ്കിൽ, ആദ്യം അപ്ഡേറ്റ് ചെയ്ത് പിന്നീട് അഭ്യാസങ്ങൾ തുടരുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ അധ്യായം പൂർത്തിയാക്കിയാൽ, നിങ്ങൾക്ക്:
- മുൻനിർമ്മിച്ച AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് AI അപ്ലിക്കേഷനുകൾ ഡിപ്പ്ലോയ് ചെയ്യാൻ കഴിയും
- AZD ഉപയോഗിച്ച് Microsoft Foundry സംയോജനത്തെ മനസിലാക്കാം
- ഉപകരണങ്ങളോടുകൂടിയ AI ഏജന്റുകളെ കോൺഫിഗർ ചെയ്ത് ഇഷ്‌ടാനുസൃതമാക്കാം
- RAG (Retrieval-Augmented Generation) അപ്ലിക്കേഷനുകൾ ഡിപ്പ്ലോയ് ചെയ്യാം

---

## 📚 പാഠങ്ങൾ

| # | പാഠം | വിവരണം | സമയം |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD നും Foundry സേവനങ്ങൾക്കും ബന്ധപ്പെടുത്തുക | 30 മിനിറ്റ് |
| 2 | [AI Agents Guide](agents.md) | ഉപകരണങ്ങളോടുകൂടിയ ബുദ്ധിമുട്ടുള്ള ഏജന്റ്മാരെ ഡിപ്പ്ലോയ് ചെയ്യുക | 45 മിനിറ്റ് |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI മോഡലുകൾ ഡിപ്പ്ലോയ് ചെയ്ത് കോൺഫിഗർ ചെയ്യുക | 30 മിനിറ്റ് |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | കൈപഠനത്തിലൂടെ: നിങ്ങളുടെ AI പരിഹാരത്തെ AZD-യ്ക്ക് അനുയോജ്യമാക്കുക | 60 മിനിറ്റ് |

---

## 🚀 ദ്രുത आरंभം

```bash
# ഓപ്ഷൻ 1: RAG ചാറ്റ് അപ്ലിക്കേഷൻ
azd init --template azure-search-openai-demo
azd up

# ഓപ്ഷൻ 2: AI ഏജന്റുകൾ
azd init --template get-started-with-ai-agents
azd up

# ഓപ്ഷൻ 3: ക്വിക്ക് ചാറ്റ് ആപ്പ്
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 ശ്രദ്ധേയമായ AI ടെംപ്ലേറ്റുകൾ

| ടെംപ്ലേറ്റ് | വിവരണം | സേവനങ്ങൾ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ഉദ്ധരണികളോടുകൂടിയ RAG ചാറ്റ് | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ഉപകരണങ്ങളോടുകൂടിയ AI ഏജന്റ് | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | അടിസ്ഥാന AI ചാറ്റ് | OpenAI + Container Apps |

---

## 💰 ചെലവ് ബോധവൽക്കരണം

| പരിസ്ഥിതി | പ്രതിമാസം കണക്കാക്കിയ ചെലവ് |
|-------------|----------------------|
| ഡെവലപ്പ്മെന്റ് | $80-150 |
| സ്റ്റേജിംഗ് | $150-300 |
| പ്രൊഡക്ഷൻ | $300-3,500+ |

**ടിപ്പ്:** ചാർജുകൾ ഒഴിവാക്കാൻ പരിശോധന കഴിഞ്ഞ ശേഷം `azd down` ഓടിക്കുക.

---

## 🔗 നാഉവീഗേഷൻ

| ദിശ | അധ്യായം |
|-----------|---------|
| **മുമ്പത്തേത്** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **അടുത്തത്** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **ഉപരി ചാടുക** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 ബന്ധപ്പെട്ട വിഭവങ്ങൾ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
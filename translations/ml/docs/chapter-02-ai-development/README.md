# അധ്യായം 2: AI-ഫസ്റ്റ് ഡവലപ്‌മെന്റ്

**📚 കോഴ്‌സ്**: [AZD For Beginners](../../README.md) | **⏱️ ദൈർഘ്യം**: 1-2 മണിക്കൂർ | **⭐ സങ്കീർണത**: ഇടത്തു തടവിലുള്ളത്

---

## അവലോകനം

ഈ അധ്യായം Azure Developer CLI සහ Microsoft Foundry സേവനങ്ങൾ ഉപയോഗിച്ച് AI-പവർഡ് ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ്മെന്റ് ചെയ്യുന്നതിൽ കേന്ദ്രീകരിക്കുന്നു. ലളിതമായ AI ചാറ്റ് ആപ്പുകളിൽ നിന്നും ടൂളുകൾ ഉപയോഗിക്കുന്ന ബുദ്ധിമുട്ടുള്ള ഏജന്റുകളിലേക്ക്.

> **സ്ഥിരീകരണ കുറിപ്പ് (2026-07-13):** ഈ അധ്യായത്തിലെ കമാൻഡ് ഫ്ലോയും എക്സ്റ്റൻഷൻ ഗൈഡൻസ് `azd` `1.27.1` ഉം നിലവിലെ പ്രിവ്യൂ AI ഏജന്റ് എക്സ്റ്റൻഷൻ റിലീസ് `azure.ai.agents` `1.0.0-beta.5` ഉം നേരെ പരിശോധിച്ചിട്ടുണ്ട്. പഴയ AZD ബിൽഡ് ഉപയോഗിക്കുകയാണെങ്കിൽ, ആദ്യം അപ്‌ഡേറ്റ് ചെയ്ത് ശേഷം വ്യായാമങ്ങൾ തുടരുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ അധ്യായം പൂർത്തിയാക്കി നിങ്ങൾക്ക്:
- മുൻകൂട്ടി നിർമ്മിച്ച AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് AI ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ്ചെയ്‌യ്യുക
- AZD-യുമായി Microsoft Foundry സംയോജനം മനസ്സിലാക്കുക
- ടൂളുകളുമായി AI ഏജന്റുകൾ കോൺഫിഗർ ചെയ്യുകയും ഇഷ്ടാനുസൃതമാക്കുകയും ചെയ്യുക
- RAG (Retrieval-Augmented Generation) ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ്മെന്റ് ചെയ്യുക

---

## 📚 പാഠങ്ങൾ

| # | പാഠം | വിവരണം | സമയം |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD-യെ Foundry സേവനങ്ങളുമായി കണക്ട് ചെയ്യുക | 30 മിനിറ്റ് |
| 2 | [AI Agents Guide](agents.md) | ടൂളുകളോടു കൂടി ബുദ്ധിമുട്ടുള്ള ഏജന്റുകൾ ഡിപ്ലോയ്മെന്റ് ചെയ്യുക | 45 മിനിറ്റ് |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI മോഡലുകൾ ഡിപ്ലോയും കോൺഫിഗർ ചെയ്യുക | 30 മിനിറ്റ് |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | കൈയിൽ ഉപരിതലം: നിങ്ങളുടെ AI പരിഹാരം AZD-സജ്ജമാക്കുക | 60 മിനിറ്റ് |

---

## 🚀 ചുരുങ്ങിയ തുടക്കം

```bash
# ഓപ്ഷൻ 1: RAG ചാറ്റ് അപ്ലിക്കേഷൻ
azd init --template azure-search-openai-demo
azd up

# ഓപ്ഷൻ 2: എഐ എജന്റുകൾ
azd init --template get-started-with-ai-agents
azd up

# ഓപ്ഷൻ 3: ക്വിക്ക് ചാറ്റ് ആപ്പ്
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 പ്രധാനം ചെയ്‌ത AI ടെംപ്ലേറ്റുകൾ

| ടെംപ്ലേറ്റ് | വിവരണം | സേവനങ്ങൾ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | സൂചനകളോടുള്ള RAG ചാറ്റ് | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ടൂളുകളോടുള്ള AI ഏജന്റ് | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | അടിസ്ഥാന AI ചാറ്റ് | OpenAI + Container Apps |

---

## 💰 ചെലവ് ബോധവൽക്കരണം

| പരിസ്ഥിതി | اندازارنة മാസം ചെലവ് |
|-------------|----------------------|
| ഡവലപ്പ്മെന്റ് | $80-150 |
| സ്റ്റേജിംഗ് | $150-300 |
| പ്രൊഡക്ഷൻ | $300-3,500+ |

**സംവാതനം:** പരീക്ഷണത്തിനു ശേഷം `azd down` റണ്‍ ചെയ്യുക ചെലവുകൾ ഒഴിവാക്കാൻ.

---

## 🔗 നാവിഗേഷൻ

| ദിശ | അധ്യായം |
|-----------|---------|
| **മുമ്പത്തെ** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **അടുത്തത്** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **പ്രവേശിക്കുക** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

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
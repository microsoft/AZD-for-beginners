# അദ്ധ്യായം 2: AI-ഫസ്റ്റ് ഡെവലപ്‌മെന്റ്

**📚 Course**: [AZD തുടക്കക്കാർക്ക്](../../README.md) | **⏱️ ദൈർഘ്യം**: 1-2 മണിക്കൂർ | **⭐ സങ്കീർണത**: മധ്യസ്ഥ

---

## അവലോകനം

ഈ അദ്ധ്യായം Azure Developer CLI ഉപയോഗിച്ച് Microsoft Foundry സേവനങ്ങൾ ഉപയോഗപ്പെടുത്തി AI-ബലമുള്ള ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ് ചെയ്യുന്നതിൽ കേന്ദ്രീകരിക്കുന്നു. ലഘുവായ AI ചാറ്റ് ആപ്പുകൾ മുതൽ ഉപകരണങ്ങളുള്ള ബുദ്ധിസമ്പന്ന ഏജന്റുകളുവരെ.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ അദ്ധ്യായം പൂർത്തിയാക്കിയാൽ, നിങ്ങൾ:
- മുൻകൂട്ടി നിർമ്മിച്ച AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് AI ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ് ചെയ്യുക
- AZD-യുമായുള്ള Microsoft Foundry സംയോജനത്തെ മനസ്സിലാക്കുക
- ഉപകരണങ്ങളോടുകൂടി AI ഏജന്റുകൾ ക്രമീകരിക്കുകയും ഇഷ്ടാനുസൃതമാക്കുകയും ചെയ്യുക
- RAG (Retrieval-Augmented Generation) ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ് ചെയ്യുക

---

## 📚 പാഠങ്ങൾ

| # | പാഠം | വിവരണം | സമയം |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry സംയോജനം](microsoft-foundry-integration.md) | AZD-നെ Foundry സേവനങ്ങളുമായി ബന്ധിപ്പിക്കുക | 30 മിനിറ്റ് |
| 2 | [AI ഏജന്റുകൾ ഗൈഡ്](agents.md) | ഉപകരണങ്ങളോടുകൂടിയ ബുദ്ധിസമ്പന്ന ഏജന്റുകൾ ഡിപ്ലോയ് ചെയ്യുക | 45 മിനിറ്റ് |
| 3 | [AI മോഡൽ ഡിപ്ലോയ്‌മെന്റ്](ai-model-deployment.md) | AI മോഡലുകൾ ഡിപ്ലോയ് ചെയ്ത് ക്രമീകരിക്കുക | 30 മിനിറ്റ് |
| 4 | [AI വർക്ക്‌ഷോപ്പ് ലാബ്](ai-workshop-lab.md) | പ്രായോഗിക പരിശീലനം: നിങ്ങളുടെ AI പരിഹാരത്തെ AZD-സജ്ജമാക്കുക | 60 മിനിറ്റ് |

---

## 🚀 ത്വരിതമായ ആരംഭം

```bash
# ഓപ്ഷൻ 1: RAG ചാറ്റ് ആപ്പ്ലിക്കേഷൻ
azd init --template azure-search-openai-demo
azd up

# ഓപ്ഷൻ 2: എഐ ഏജന്റുകൾ
azd init --template get-started-with-ai-agents
azd up

# ഓപ്ഷൻ 3: ക്വിക്ക് ചാറ്റ് ആപ്പ്
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 പ്രധാന AI ടെംപ്ലേറ്റുകൾ

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ഉദ്ധരണികളോടുകൂടിയ RAG ചാറ്റ് | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ഉപകരണങ്ങളോടുകൂടിയ AI ഏജന്റ് | AI ഏജന്റ് സേവനം |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | പ്രാഥമിക AI ചാറ്റ് | OpenAI + Container Apps |

---

## 💰 ചിലവ് അവബോധം

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**ടിപ്പ്:** പരീക്ഷണത്തിന് ശേഷം ചാർജുകൾ ഒഴിവാക്കാൻ `azd down` പ്രവർത്തിപ്പിക്കുക.

---

## 🔗 നാവിഗേഷൻ

| ദിശ | അദ്ധ്യായം |
|-----------|---------|
| **മുൻപത്തെ** | [അദ്ധ്യായം 1: അടിസ്ഥാനങ്ങൾ](../chapter-01-foundation/README.md) |
| **അടുത്തത്** | [അദ്ധ്യായം 3: ക്രമീകരണം](../chapter-03-configuration/README.md) |
| **സ്കിപ് ചെയ്യുക** | [അദ്ധ്യായം 8: ഉത്പാദന മാതൃകകൾ](../chapter-08-production/README.md) |

---

## 📖 ബന്ധപ്പെട്ട റിസോഴ്സുകൾ

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്ക്ലെയിംർ:
ഈ രേഖ AI-ആധാരത്തിലുള്ള വിവർത്തനസേവനായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. നാം കൃത്യതയ്ക്ക്努രിച്ചിരുന്നെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനത്തിൽ പിശകുകളും അസാധുതകളും ഉണ്ടാകാവുന്നതാണ് എന്ന് ദയവായി ശ്രദ്ധിക്കുക. മാതൃഭാഷയിലെ യഥാർത്ഥ രേഖയെ അധികാരപരമായ ഉറവിടമായി കണക്കാക്കുക. നിർണായകമായ വിവരങ്ങൾക്കായി പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണകൾക്കും തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കുമുള്ള ഉത്തരവാദിത്തം ഞങ്ങൾ ഏറ്റെടുക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->